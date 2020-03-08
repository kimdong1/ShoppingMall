package kr.donguk.shop.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.donguk.shop.dao.MemberDAO;
import kr.donguk.shop.vo.MemberVO;

@Service
public class MemberService {
	@Autowired
	private MemberDAO memberDAO;
	
	public int join(MemberVO memberVO) {
		if(memberVO != null && 
				memberVO.getMember_userid().trim().length()>0 && 
				memberVO.getMember_password().trim().length()>0 &&
				memberVO.getMember_name().trim().length()>0 &&
				memberVO.getMember_phone().trim().length()>0 &&
				memberVO.getMember_zipcode().trim().length()>0 &&
				memberVO.getMember_addr1().trim().length()>0 &&
				memberVO.getMember_addr2().trim().length()>0) {
			memberDAO.join(memberVO);
			return 0;
		}else {
			return -1;
		}
	}
	
	public int login(String member_userid,String member_password) {
		HashMap<String, String> map = new HashMap<String, String>();
		HashMap<String, String> map2 = new HashMap<String, String>();

		map2.put("member_password", member_password);
		map.put("member_userid", member_userid);
		String password = memberDAO.passwordEncryption(map2);
		map.put("member_password", password);
		
		return memberDAO.login(map);
	}
	
	public MemberVO selectById(String member_userid) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("member_userid", member_userid);
		return memberDAO.selectById(map);
	}
	
	public String idCheck(String member_userid) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("member_userid", member_userid);
		int resultCode = memberDAO.idCheck(map);
		return resultCode == 0 ? "0" : "1";
	}
}
