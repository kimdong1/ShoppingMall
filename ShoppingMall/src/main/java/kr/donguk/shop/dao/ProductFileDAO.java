package kr.donguk.shop.dao;


import java.util.HashMap;
import java.util.List;

import kr.donguk.shop.vo.ProductFileVO;

public interface ProductFileDAO {
	public void productFileRegist(ProductFileVO productFileVO);
	public String maxIdx();
	public List<ProductFileVO> selectListFileByDivision(HashMap<String, String> map);
	public ProductFileVO selectListFileByProductId(HashMap<String, String> map);
}
