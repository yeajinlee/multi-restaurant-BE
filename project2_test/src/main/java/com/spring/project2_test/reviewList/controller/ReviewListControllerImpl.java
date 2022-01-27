package com.spring.project2_test.reviewList.controller;

<<<<<<< HEAD
import java.util.Map;
=======
import java.util.List;
>>>>>>> master

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
<<<<<<< HEAD
=======
import org.springframework.web.bind.annotation.RequestMethod;
>>>>>>> master
import org.springframework.web.servlet.ModelAndView;

import com.spring.project2_test.reviewList.service.ReviewListService;

@Controller("reviewListController")
public class ReviewListControllerImpl implements ReviewListController {
	@Autowired
	private ReviewListService reviewListService;
	
	
	@Override
<<<<<<< HEAD
	@RequestMapping(value="/reviewList.do")
	public ModelAndView reviewList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		Map reviewListMapOdd = reviewListService.reviewListOdd();
		Map reviewListMapEven = reviewListService.reviewListEven();
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("reviewListlMap", reviewListMapOdd);
		mav.addObject("reviewListlMap", reviewListMapEven);
=======
	@RequestMapping(value="/reviewList.do", method=RequestMethod.GET)
	public ModelAndView reviewList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		List reviewListOdd = reviewListService.reviewListOdd();
		List reviewListEven = reviewListService.reviewListEven();
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("reviewListlOdd", reviewListOdd);
		mav.addObject("reviewListlEven", reviewListEven);
>>>>>>> master
		return mav;
	}
}
