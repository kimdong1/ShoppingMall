package kr.donguk.shop;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.donguk.shop.service.CategoryService;
import kr.donguk.shop.vo.CategoryVO;
import kr.donguk.shop.vo.MemberVO;

@Controller
public class CategoryController {
	
	@Autowired
	private CategoryService categoryService;
	
	private static final Logger logger = Logger.getLogger(CategoryController.class);
	
	@RequestMapping(value = "/UKshop/category")
	public String category(HttpServletRequest request, Model model) {
		MemberVO memberVO = (MemberVO) request.getSession().getAttribute("vo");
		if(memberVO.getMember_grade().equals("9")) {
			List<CategoryVO> list = categoryService.selectAll();
			model.addAttribute("categoryList",list);
			return "admin/category";
		}else {
			return "home";
		}
	}
	
	@Transactional
	@RequestMapping(value = "/UKshop/registOk", method=RequestMethod.POST)
	public String regist(CategoryVO categoryVO) {
		if (logger.isInfoEnabled()) {
			logger.info("regist(category_title) - category_title : "+categoryVO.getCategory_title() ); //$NON-NLS-1$
		}
		categoryVO.setCategory_lev(0);
		categoryVO.setCategory_grp(categoryService.selectMaxGrp()+1);
		int resultCode = categoryService.regist(categoryVO);
		logger.info("resultCode : " + resultCode);
		return resultCode == 1 ? "redirect:/UKshop/category" : "error";
	}
	
	@Transactional
	@RequestMapping(value = "/UKshop/deleteOk",method=RequestMethod.POST)
	public String deleteCategory(String category_idx) {
		logger.info("category_idx : " + category_idx);
		int resultCode = categoryService.deleteCategory(category_idx);
		return resultCode==1 ? "redirect:/UKshop/category" : "error";
	}
	
	@Transactional
	@RequestMapping(value = "/UKshop/categoryChildRegistOk",method=RequestMethod.POST)
	public String childRegist(String categoryChild_title,String category_grp) {
		logger.info("category_grp : " + category_grp + ", categoryChild_title : " + categoryChild_title);
		int resultCode = categoryService.childRegist(categoryChild_title, category_grp);
		return resultCode==1 ? "redirect:/UKshop/category" : "error";
	}
}
