package com.spring.project2_test.item.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

public interface ItemController {
	
	
	public ModelAndView itemView(@RequestParam("rest_테마") int rest_테마, HttpServletRequest request, HttpServletResponse response) throws Exception;
	
}
