package com.spring.project2_test.newList.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;

public interface NewListController {

	public ModelAndView newList(HttpServletRequest request, HttpServletResponse response) throws Exception;
}
