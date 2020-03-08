package kr.donguk.shop;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.donguk.shop.service.CategoryService;
import kr.donguk.shop.service.MemberService;
import kr.donguk.shop.vo.CategoryVO;
import kr.donguk.shop.vo.MemberVO;
@Controller
public class MemberController {
	private static final Logger logger = Logger.getLogger(MemberController.class);
	@Autowired
	private CategoryService categoryService;
	
	@Autowired
	private MemberService memberService;
	
	@RequestMapping(value = "/UKshop/join")
	public String join() {
		return "member/join";
	}
	
	@ResponseBody
	@RequestMapping(value = "/idCheck")
	public String idCheck(String member_userid) {
		logger.info("idCheck(String member_userid) - ajax : "+member_userid);
		return memberService.idCheck(member_userid);
	}
	
	@Transactional
	@RequestMapping(value = "/UKshop/joinOk",method=RequestMethod.POST)
	public String joinOkPOST(@ModelAttribute MemberVO memberVO, HttpServletResponse response) {
		int resultCode = memberService.join(memberVO);
		if(resultCode == 0) {
			return "redirect:/UKshop/login";
		}else {
			return "errorPage";
		}
	}
	
	@RequestMapping(value = "/UKshop/joinOk",method=RequestMethod.GET)
	public String joinOkGET() {
		return "errorPage";
	}
	@RequestMapping(value = "/UKshop/login")
	public String login(HttpServletRequest request, Model model) {
		Cookie[] cookies = request.getCookies();
		if(cookies[0].getName().equals("member_userid")) {
			model.addAttribute("member_userid",cookies[0].getValue());
		}
		return "member/login";
	} 
	
	@RequestMapping(value = "/UKshop/loginOk",method=RequestMethod.POST)
	public String loginOk(@RequestParam String member_userid,@RequestParam String member_password,
			HttpServletRequest request, HttpServletResponse response, @RequestParam(required=false) String remember) {
		
		int resultCode = memberService.login(member_userid, member_password);
		if(resultCode == 1) {
			MemberVO memberVO = memberService.selectById(member_userid);
			request.getSession().setAttribute("vo", memberVO); // session에 저장
			
			logger.info("loginOk - remember : " + remember); // null이랑 on
			if(remember != null && remember.equals("on")) {
				Cookie cookie = new Cookie("member_userid", member_userid);
				cookie.setMaxAge(60*60*24*3); // 3일 저장
				response.addCookie(cookie);
			}else {
				Cookie cookie = new Cookie("member_userid", "");
				cookie.setMaxAge(0);
				response.addCookie(cookie);
			}
			return "redirect:/";
		}else {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out;
			try {
				out = response.getWriter();
				out.println("<script>alert('로그인 정보를 확인해주세요.'); history.go(-1);</script>");
				out.flush(); 
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return "member/login";
	}

	@RequestMapping(value = "/UKshop/logout")
	public String logout(HttpServletRequest request) {
		request.getSession().removeAttribute("vo");
		return "redirect:/";
	} 
	@RequestMapping(value = "/UKshop/cart")
	public String cart(HttpServletRequest request,Model model) {
		MemberVO vo = (MemberVO) request.getSession().getAttribute("vo");
		if(vo!=null) {
			List<CategoryVO> list = categoryService.selectAll();
			model.addAttribute("categoryList",list);
			return "member/cart";
		}else {
			return "redirect:/";
		}
	} 
	
}
