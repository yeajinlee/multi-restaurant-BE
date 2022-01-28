package com.spring.project2_test.reviewList.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.spring.project2_test.reviewList.service.ReviewListService;

@Controller("reviewListController")
public class ReviewListControllerImpl implements ReviewListController {
	@Autowired
	private ReviewListService reviewListService;
	
	
	@Override
	@RequestMapping(value="/reviewList.do", method=RequestMethod.GET)
	public ModelAndView reviewList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		List reviewListOdd = reviewListService.reviewListOdd();
		List reviewListEven = reviewListService.reviewListEven();
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("reviewListlOdd", reviewListOdd);
		mav.addObject("reviewListlEven", reviewListEven);
		return mav;
	}
}