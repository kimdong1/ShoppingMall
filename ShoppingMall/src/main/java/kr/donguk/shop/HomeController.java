package kr.donguk.shop;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.donguk.shop.service.CategoryService;
import kr.donguk.shop.vo.CategoryVO;

@Controller
public class HomeController {

	@Autowired
	private CategoryService categoryService;


	@RequestMapping(value = "/")
	public String home(Model model) {
		List<CategoryVO> list = categoryService.selectAll();
		model.addAttribute("categoryList",list);
		return "home";
	}
	
}
