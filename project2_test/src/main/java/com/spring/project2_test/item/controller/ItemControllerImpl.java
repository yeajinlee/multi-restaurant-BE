package com.spring.project2_test.item.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.spring.project2_test.item.service.ItemService;
import com.spring.project2_test.item.vo.ItemVO;



public class ItemControllerImpl implements ItemController{
	
	
	@Autowired
	private ItemService itemService;
	@Autowired
	private ItemVO itemVO;
	
	
	
	@Override
	@RequestMapping(value="/item.do", method = RequestMethod.GET)
	public ModelAndView itemView(@RequestParam("rest_테마") int rest_테마, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		List itemList = itemService.findItem(rest_테마);
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("itemList", itemList);

		return mav;
	}
	
	
}
