package kr.donguk.shop.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.donguk.shop.dao.CategoryDAO;
import kr.donguk.shop.vo.CategoryVO;

@Service
public class CategoryService {
	@Autowired
	private CategoryDAO categoryDAO;
	
	public int regist(CategoryVO categoryVO) {
		if(categoryVO.getCategory_title() != null && categoryVO.getCategory_title().trim().length()>0) {
			HashMap<String, String> map = new HashMap<String, String>();
			map.put("category_title", categoryVO.getCategory_title());
			map.put("category_lev", categoryVO.getCategory_lev()+"");
			map.put("category_grp", categoryVO.getCategory_grp()+"");
			categoryDAO.regist(map);
			return 1;
		}else {
			return 0;
		}
	}
	
	public int selectMaxGrp() {
		return categoryDAO.selectMaxGrp();
	}
	
	public List<CategoryVO> selectAll(){
		List<CategoryVO> list = categoryDAO.selectAll();
		return list;
	}
	
	public int deleteCategory(String category_idx) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("category_idx", category_idx);
		if(category_idx != null) {
			categoryDAO.deleteCategory(map);
			return 1;
		}else {
			return 0;
		}
	}
	
	public int childRegist(String category_title,String category_grp) {
		if(category_title != null && category_title.trim().length()>0) {
			HashMap<String, String> map = new HashMap<String, String>();
			map.put("category_lev", "1");
			map.put("category_title", category_title);
			map.put("category_grp", category_grp+"");
			categoryDAO.regist(map);
			return 1;
		}else {
			return 0;
		}
	}
	
	public List<CategoryVO> selectByGrp(String category_grp){
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("category_grp", category_grp);
		List<CategoryVO> list = categoryDAO.selectByGrp(map);
		return list;
	}
}