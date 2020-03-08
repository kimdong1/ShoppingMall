package kr.donguk.shop.dao;

import java.util.HashMap;

import kr.donguk.shop.vo.MemberVO;

public interface MemberDAO {
	public void join(MemberVO memberVO);
	public int login(HashMap<String, String> map);
	public String passwordEncryption(HashMap<String, String> map);
	public MemberVO selectById(HashMap<String, String> map);
	public int idCheck(HashMap<String, String> map);
}
