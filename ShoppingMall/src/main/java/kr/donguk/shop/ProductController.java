package kr.donguk.shop;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.donguk.shop.service.CategoryService;
import kr.donguk.shop.service.ProductService;
import kr.donguk.shop.vo.CategoryVO;
import kr.donguk.shop.vo.MemberVO;
import kr.donguk.shop.vo.ProductFileVO;
import kr.donguk.shop.vo.ProductVO;

@Controller
public class ProductController {

	private static final Logger logger = Logger.getLogger(ProductController.class);
	
	@Resource(name="uploadPath")
	private String uploadPath;
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private CategoryService categoryService;
	
	@RequestMapping(value = "/UKshop/product")
	public String product(Model model,HttpServletRequest request) {
		MemberVO memberVO = (MemberVO) request.getSession().getAttribute("vo");
		if(memberVO.getMember_grade().equals("9")) {
			List<CategoryVO> list = categoryService.selectAll();
			model.addAttribute("categoryList",list);
			return "admin/product";
		}else {
			return "home";
		}
	}
	
	@RequestMapping(value = "/childCategory",method=RequestMethod.POST)
	@ResponseBody
	public List<CategoryVO> childCategory(Model model,HttpServletRequest request,String category_grp) {
		logger.info("category_grp : " + category_grp);
		List<CategoryVO> childCategory_list = categoryService.selectByGrp(category_grp);
		return childCategory_list;
	}
	
	@Transactional
	@RequestMapping(value = "/UKshop/postingOk",method=RequestMethod.POST)
	public String postingOK(@ModelAttribute ProductVO productVO, String[] product_size, MultipartHttpServletRequest request, ProductFileVO productFileVO, String setProduct_division) {
		if(productVO!=null && product_size.length>0) {
			String size = "";
			for(int i = 0; i < product_size.length; i++) {
				if(i < product_size.length-1) {
					size += product_size[i]+",";
				}else {
					size += product_size[i];
				}
			}
			productVO.setProduct_division(setProduct_division);
			productFileVO.setProduct_division(setProduct_division);
			productVO.setProduct_size(size);
			
			List<MultipartFile> files = request.getFiles("product_file");
			@SuppressWarnings("deprecation")
			String realPath = request.getRealPath(uploadPath);
			logger.info("realPath : " + realPath);
			// 파일받기
			for(MultipartFile file : files) {
				if(file!=null && file.getSize()>0) {
					try {
						String savedName = uploadFile(realPath, file.getOriginalFilename(), file.getBytes());
						productFileVO.setProduct_ofile(file.getOriginalFilename());
						productFileVO.setProduct_sfile(savedName);
						if (logger.isInfoEnabled()) {
							logger.info("postingOK(ProductFileVO) : "+productFileVO); //$NON-NLS-1$
						}
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
			}
			int resultCode = productService.productRegist(productVO,productFileVO);
			if(resultCode == 1) {
				return "redirect:/UKshop/product";
			}else {
				return "errorPage";
			}
		}else {
			return "errorPage";
		}
	}
	
	// 업로드된 파일을 저장하는 함수
	private String uploadFile(String realPath, String originalName, byte[] fileData) throws IOException {
		UUID uid = UUID.randomUUID();
		String savedName = uid.toString() + "_" + originalName;
		File target = new File(realPath, savedName);
		FileCopyUtils.copy(fileData, target);
		return savedName;
	}
	
	
	
}
