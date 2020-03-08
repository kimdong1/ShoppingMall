package kr.donguk.shop.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.donguk.shop.dao.ProductDAO;
import kr.donguk.shop.dao.ProductFileDAO;
import kr.donguk.shop.vo.ProductFileVO;
import kr.donguk.shop.vo.ProductVO;

@Service
public class ProductService {

	@Autowired
	private ProductDAO productDAO;
	@Autowired
	private ProductFileDAO productFileDAO;

	public int productRegist(ProductVO productVO, ProductFileVO productFileVO) {
		if (productVO != null) {
			int maxIdx = 0;
			maxIdx = Integer.parseInt(productFileDAO.maxIdx() == null ? "0" : productFileDAO.maxIdx()) + 1;
			productFileVO.setProduct_idx(maxIdx);
			productDAO.productRegist(productVO);
			productFileDAO.productFileRegist(productFileVO);
			System.out.println("서비스 : "+productFileVO);
			return 1;
		} else {
			return 0;
		}

	}
	
	public List<ProductVO> selectListByDivision(String product_division){
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("product_division", product_division);
		return productDAO.selectListByDivision(map);
	}
	public List<ProductFileVO> selectListFileByDivision(String product_division){
		System.out.println("product_division:"+product_division);
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("product_division", product_division);
		return productFileDAO.selectListFileByDivision(map);
	}

	public ProductVO selectListByProductName(String product_name,String product_id){
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("product_name", product_name);
		map.put("product_id", product_id);
		return productDAO.selectListByProductName(map);
	}
	public ProductFileVO selectListFileByProductId(String product_id){
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("product_id", product_id);
		return productFileDAO.selectListFileByProductId(map);
	}

}
