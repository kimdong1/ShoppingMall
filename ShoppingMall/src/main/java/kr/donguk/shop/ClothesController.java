package kr.donguk.shop;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.donguk.shop.service.CategoryService;
import kr.donguk.shop.service.ProductService;
import kr.donguk.shop.vo.CategoryVO;
import kr.donguk.shop.vo.ProductFileVO;
import kr.donguk.shop.vo.ProductVO;

@Controller
public class ClothesController {
	/**
	 * Logger for this class
	 */
	private static final Logger logger = Logger.getLogger(ClothesController.class);
	
	@Autowired
	private ProductService productService;
	@Autowired
	private CategoryService categoryService;
	
	@RequestMapping(value="/{category}")
	public String list(Model model, @PathVariable String category ,@RequestParam(required=false) String product_smallDivision) {
		List<CategoryVO> list = categoryService.selectAll();
		model.addAttribute("categoryList",list);

		model.addAttribute("category",category);


		String product_division = category;
		List<ProductVO> clothes = productService.selectListByDivision(product_division);
		logger.info("product_division : " + product_division);
		logger.info("clothes : " + clothes);
		model.addAttribute("clothes",clothes);
		List<ProductFileVO> fileVO = productService.selectListFileByDivision(product_division);
		model.addAttribute("fileVO",fileVO);
		logger.info("fileVO : " + fileVO);
			/*for(int i = 0; i < SHOES.length; i++) {
				if(product_smallDivision.equals(SHOES[i])){
					List<ProductVO> clothes = productService.selectListByDivisionAndSmallDivision(product_division,product_smallDivision);
					model.addAttribute("clothes",clothes);
					List<ProductFileVO> fileVO = productService.selectListFileByDivisionAndSmallDivision(product_division,product_smallDivision);
					model.addAttribute("fileVO",fileVO);
					break;
				}
			}*/
		model.addAttribute("product_division",product_division);
		return "clothes/list";
	}

	@RequestMapping(value="/category/{product_division}/{product_smallDivision}/{product_name}")
	public String view(Model model,@PathVariable String product_division,@PathVariable String product_smallDivision, @PathVariable String product_name, @RequestParam String product_id) {
		ProductVO productVO = productService.selectListByProductName(product_name, product_id);
		model.addAttribute("productVO",productVO);
		ProductFileVO productFileVO = productService.selectListFileByProductId(product_id);
		model.addAttribute("productFileVO",productFileVO);
		return "clothes/view";
	}
	
}
