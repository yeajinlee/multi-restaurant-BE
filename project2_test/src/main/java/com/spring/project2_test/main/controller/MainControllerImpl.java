package com.spring.project2_test.main.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.spring.project2_test.main.service.MainService;


@Controller("mainController")
public class MainControllerImpl implements MainController{
	@Autowired
	public MainService mainService;
	
	@RequestMapping(value="/main.do", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView main(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		List restList = mainService.restList();
//		List imageList = mainService.imageList(); // main.xml에서 오류생겨서 일단 지움
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("restList", restList);
//		mav.addObject("imageList", imageList);   
		return mav;
	}
}
