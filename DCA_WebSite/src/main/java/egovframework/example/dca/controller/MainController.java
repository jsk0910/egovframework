package egovframework.example.dca.controller;

import org.springframework.stereotype.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import egovframework.example.dca.service.*;
import egovframework.example.dca.session.SessionConst;
import egovframework.example.dca.vo.*;

@Controller
public class MainController {
	
	/*
	@Autowired
	private MemberService memberService;
	*/
	
	@Autowired
	private SessionManagerService sessionManagerService;
	
	@RequestMapping(value="/main.do")
	public String mainPage(
			@SessionAttribute(name=SessionConst.LOGIN_MEMBER, required=false)MemberVO loginMember,
			Model model,
			HttpServletRequest request,
			HttpServletResponse response) {
		
		System.out.println("main : " + loginMember);
		if(loginMember == null) {
			return "main";
		}
		model.addAttribute("member", loginMember);
		return "loginMain";
	}
	
	@RequestMapping(value="/OAuth.do")
	public String oauthPage() {
		return "/OAuth/main";
	}
}
