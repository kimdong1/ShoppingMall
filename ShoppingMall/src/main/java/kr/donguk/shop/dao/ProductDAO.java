package kr.donguk.shop.dao;

import java.util.HashMap;
import java.util.List;

import kr.donguk.shop.vo.ProductVO;

public interface ProductDAO {
	public void productRegist(ProductVO productVO);
	public List<ProductVO> selectListByDivision(HashMap<String, String> map);
	public ProductVO selectListByProductName(HashMap<String, String> map);
}
