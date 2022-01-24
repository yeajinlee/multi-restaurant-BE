package com.spring.project2_test.member.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.project2_test.member.service.MemberService;
import com.spring.project2_test.member.vo.MemberVO;

////form,main, RequestMapping 
@Controller("memberController")
public class MemberControllerImpl implements MemberController{

	@Autowired
	private MemberService memberService;
	@Autowired
	private MemberVO memberVO;

	@Override
	public ModelAndView login(@ModelAttribute("member") MemberVO member, RedirectAttributes rAttr, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
	ModelAndView mav = new ModelAndView();
	memberVO = memberService.login(member);
	if(memberVO !=null) {
		HttpSession session = request.getSession();
		session.setAttribute("member", memberVO);
		session.setAttribute("isLogOn", true);
		String action = (String) session.getAttribute("action");
		session.removeAttribute("action"); //왜 갑자기 remove ..뭐엿지 까먹음
		if(action!=null) {
			mav.setViewName("redirect"+action);
		}else {
			mav.setViewName("redirect:/갈곳 아마 메인?");
		}
	}else {
		rAttr.addAttribute("result","loginFailed");
		mav.setViewName("redirect:/다시 로그인form으로");
	}
		return mav;
	}


	@Override
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		session.removeAttribute("member");
		session.removeAttribute("isLogOn");
		ModelAndView mav = new ModelAndView ();
		mav.setViewName("redirect:/member/아마 메인?");
		return mav;
	}


	@Override
	public ModelAndView addMember(@ModelAttribute("member") MemberVO member, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setContentType("html/text;charset=utf-8");
		int result=0;
		result = memberService.addMember(member);
		ModelAndView mav= new ModelAndView("redirect/메안");
			
		return mav;
	}



}
