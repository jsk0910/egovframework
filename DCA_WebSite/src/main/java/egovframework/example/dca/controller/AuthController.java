package egovframework.example.dca.controller;

import org.springframework.stereotype.Controller;
import org.springframework.beans.factory.annotation.*;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import egovframework.example.dca.service.*;
import egovframework.example.dca.session.SessionConst;
import egovframework.example.dca.vo.*;

@Controller
@RequestMapping(value="/oauth")
public class AuthController {
	
	@Autowired
	private OAuthService oauthService;
	
	@Autowired
	private MemberService memberService;
	
	@RequestMapping(value="/signup.do")
	public ModelAndView oauthSignupPage(Model model,
			@RequestParam(value="result", required=true) List<String> result,
			@ModelAttribute("memberVO") MemberVO memberVO,
			HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ModelAndView mav = null;
		
		mav = new ModelAndView("OAuth/signup");
		
		List<MemberVO> list = new ArrayList<MemberVO>();
		memberVO.setName(result.get(0).split("=")[1]);
		memberVO.setEmail(result.get(1).split("=")[1]);
		
		list.add(memberVO);
		
		model.addAttribute("list", list);
		mav.addObject("result", list);
		return mav;
	}
	
	@RequestMapping(value="/signup/idcheck.do", method=RequestMethod.POST)
	@ResponseBody
	public String idCheck(@RequestParam(value="userid", required=true) String userid) throws Exception {
		int cnt = memberService.selectIdCheck(userid);
		
		return String.valueOf(cnt);
	}
	
	@RequestMapping(value="/signupf.do", method=RequestMethod.POST)
	public String regist(Model model,
			@ModelAttribute("memberVO") MemberVO member,
			// @RequestParam(value="data[]", required=true) List<String> data,
			HttpServletRequest request,
			HttpServletResponse response,
			RedirectAttributes rttr) throws Exception {
	
		member.setRole("user");
		member.setSnsid("kakao");
		/*
		member.setUserid(data.get(0));
		member.setUserpw(data.get(1));
		member.setUsername(data.get(2));
		member.setUseremail(data.get(3));
		member.setUserphone(data.get(4));
		member.setUsercodeNumber(data.get(5));
		*/
		
		System.out.println(member);
		
		memberService.insertNewMember(member);
		
		return "redirect:/login";
	}
	
	//@ResponseBody
	@RequestMapping(value="/kakaoRe.do")
	public String kakaoCallback(Model model,
			@RequestParam(value="code", required = false) String code,
			@ModelAttribute("memberVO") MemberVO memberVO,
			HttpServletRequest request, HttpServletResponse response,
			HttpSession session,
			RedirectAttributes rttr) throws Exception {
		
		// getting Access Token from Kakao API
		String access_Token = oauthService.getKakaoAccessToken(code);
		
		// getting User Information with Access Token
		HashMap<String, Object> result = oauthService.getKakaoUserInfo(access_Token);
		
		// changing User Information(HashMap -> String)
		String res = result.get("MemberObject").toString();
		res = res.replace("{", "");
		res = res.replace("}", "");
		
		// changing User Information(String -> ArrayList)
		List<String> list = new ArrayList<String>();
		
		for(int i = 0; i < res.toString().split(" ").length; i++) {
			list.add(res.toString().split(" ")[i]);
		}
		
		// redirect
		if(result.get("isExist").toString().equals("false")) {
			// Redirect Attribute
			rttr.addAttribute("result", list);
			
			return "redirect:signup.do";
		} 
		else if(result.get("isExist").toString().equals("true")){
			rttr.addAttribute("list", list);
			return "redirect:login.do";
		} else {
			return "redirect:/";
		}
	}
	
	@RequestMapping("/login.do")
	public String login(@Valid @ModelAttribute MemberVO member,
			@RequestParam(value="list", required = false)List<String> list,
			BindingResult bindingResult, 
			HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		member.setId(list.get(0));
		member.setName(list.get(1));
		member.setCodeNumber(list.get(2));
		member.setEmail(list.get(3));
		member.setPhone(list.get(4));
		member.setRole(list.get(5));
		
		System.out.println(member.toString());
		
		if(bindingResult.hasErrors()) {
			return "OAuth.do";
		}
		
		if(member == null) {
			return "OAuth.do";
		}
		
		HttpSession session = request.getSession();
		session.setAttribute(SessionConst.LOGIN_MEMBER, member);
		
		return "redirect:/main.do";
	}
	
	@RequestMapping("/logout")
	public String logout(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession(false);
		if(session != null) {
			session.invalidate();
		}
		
		return "redirect:/";
	}
	
}
