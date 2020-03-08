package kr.donguk.shop.dao;

import java.util.HashMap;
import java.util.List;

import kr.donguk.shop.vo.CategoryVO;

public interface CategoryDAO {
	
	public void regist(HashMap<String, String> map);
	public int selectMaxGrp();
	public List<CategoryVO> selectAll();
	public void deleteCategory(HashMap<String, String> map);
	public void childRegist(HashMap<String, String> map);
	public List<CategoryVO> selectByGrp(HashMap<String, String> map);
}
