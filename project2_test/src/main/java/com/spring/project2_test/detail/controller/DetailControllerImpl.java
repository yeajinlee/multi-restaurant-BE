package com.spring.project2_test.detail.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.spring.project2_test.detail.service.DetailService;
import com.spring.project2_test.detail.vo.DetailVO;

@Controller("detailController")
public class DetailControllerImpl implements DetailController {
	@Autowired
	private DetailService detailService;
	
	@Autowired
	private DetailVO detailVO;
	
	@Override
	@RequestMapping(value="/detail.do", method = RequestMethod.GET)
	public ModelAndView detailView(@RequestParam("rest_NO") int rest_NO, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		System.out.println(rest_NO);
//		HttpSession session = request.getSession();
		Map detailMap = detailService.detailContent(rest_NO);
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("detailMap", detailMap);
//		DetailVO detailVO = (DetailVO) detailMap.get("detailVO");
		List detailImg = detailService.detailImage(rest_NO);
		mav.addObject("detailImg", detailImg);
		List detailReviewList = detailService.reviewList(rest_NO);
		mav.addObject("detailReviewList", detailReviewList);
		return mav;
	}
		
	
}
