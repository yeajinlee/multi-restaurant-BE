package com.spring.project2_test.member.controller;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.project2_test.member.service.MemberService;
import com.spring.project2_test.member.vo.MemberVO;

////main, overlap
@Controller("memberController")
public class MemberControllerImpl implements MemberController{

	@Autowired
	private MemberService memberService;
	@Autowired
	private MemberVO memberVO;

	@Override
	@RequestMapping(value="/login.do", method= RequestMethod.POST)
	public ModelAndView login(@ModelAttribute("member") MemberVO member, RedirectAttributes rAttr, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
	ModelAndView mav = new ModelAndView();
	memberVO = memberService.login(member);
	if(memberVO !=null) {
		HttpSession session = request.getSession();
		session.setAttribute("member", memberVO);
		session.setAttribute("isLogOn", true);
		String action = (String) session.getAttribute("action");
		session.removeAttribute("action"); //�� ���ڱ� remove ..������ �����
		if(action!=null) {
			mav.setViewName("redirect"+action);
		}else {
			mav.setViewName("redirect:/home.do");
		}
	}else {
		rAttr.addAttribute("result","loginFailed");
		mav.setViewName("redirect:/login.do");
	}
		return mav;
	}


	@Override
	@RequestMapping(value = "/logout.do", method =  RequestMethod.GET)
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		session.removeAttribute("member");
		session.removeAttribute("isLogOn");
		ModelAndView mav = new ModelAndView ();
		mav.setViewName("redirect:/home.do");
		return mav;
	}


	@Override
	@RequestMapping(value="/addMember.do" ,method = RequestMethod.POST)
	public ModelAndView addMember(@ModelAttribute("member") MemberVO member, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setContentType("html/text;charset=utf-8");
		int result=0;
		result = memberService.addMember(member);
		ModelAndView mav= new ModelAndView("redirect:/home.do");
			
		return mav;
	}

	@RequestMapping(value = "/project2_test/*Form.do", method =  RequestMethod.GET)
	private ModelAndView form(@RequestParam(value= "result", required=false) String result,
							  @RequestParam(value= "action", required=false) String action,
						       HttpServletRequest request, 
						       HttpServletResponse response) throws Exception {
		String viewName = (String)request.getAttribute("viewName");
		HttpSession session = request.getSession();
		session.setAttribute("action", action);  
		ModelAndView mav = new ModelAndView();
		mav.addObject("result",result);
		mav.setViewName(viewName);
		return mav;
	}

}
