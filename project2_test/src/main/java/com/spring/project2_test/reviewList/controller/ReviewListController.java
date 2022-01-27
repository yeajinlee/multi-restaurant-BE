package com.spring.project2_test.reviewList.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;

public interface ReviewListController {
	public ModelAndView reviewList(HttpServletRequest request, HttpServletResponse response) throws Exception;
}
