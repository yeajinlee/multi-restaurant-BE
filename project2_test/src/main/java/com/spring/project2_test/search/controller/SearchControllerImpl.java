package com.spring.project2_test.search.controller;

import java.awt.print.Pageable;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;


import com.spring.project2_test.detail.vo.DetailVO;
import com.spring.project2_test.search.service.SearchService;
import com.spring.project2_test.search.vo.SearchVO;
@Controller("searchController")

public class SearchControllerImpl implements SearchController {
//sidesearch

	@Autowired
	private SearchService searchService;

	@Override
	@RequestMapping(value="/searchRest.do", method = RequestMethod.GET)
	public ModelAndView searchRest(@RequestParam("searchWord") String searchWord, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		System.out.println(searchWord);
		HttpSession session=request.getSession();
		String viewName = (String) request.getAttribute("viewName");
		List<SearchVO> restLists = searchService.searchRest(searchWord);
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("restLists", restLists);
		mav.addObject("searchWord", searchWord);
		System.out.println("controll"+restLists.toString());
		return mav;
	}

	@Override
	@RequestMapping(value="/keywordSearch.do", method=RequestMethod.GET, produces="application/text; charset=utf-8")
	public @ResponseBody String keywordSearch(@RequestParam("keyword") String keyword, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		response.setContentType("utf-8");
		response.setCharacterEncoding("utf-8");
		if (keyword == null || keyword.contentEquals("")) {
			return null;
		}
		keyword = keyword.toUpperCase();
		List keywordList = searchService.keywordSearch(keyword);
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("keyword", keywordList);
		String jsonInfo = jsonObject.toString();
		return jsonInfo;

	}
	public static void addGoodsInQuick(int rest_NO,DetailVO detailVO,HttpSession session){
		boolean already_existed=false;
		List<DetailVO> quickGoodsList; //최근 본 상품 저장 ArrayList
		quickGoodsList=(ArrayList<DetailVO>)session.getAttribute("quickGoodsList");
		
		if(quickGoodsList!=null){
			if(quickGoodsList.size() < 4){ //미리본 상품 리스트에 상품개수가 세개 이하인 경우
				for(int i=0; i<quickGoodsList.size();i++){
					DetailVO _goodsBean=(DetailVO)quickGoodsList.get(i);
					if(rest_NO==(_goodsBean.getRest_NO())){
						already_existed=true;
						break;
					}
				}
				if(already_existed==false){
					quickGoodsList.add(detailVO);
				}
			}
			
		}else{
			quickGoodsList =new ArrayList<DetailVO>();
			quickGoodsList.add(detailVO);
			
		}
		session.setAttribute("quickGoodsList",quickGoodsList);
		session.setAttribute("quickGoodsListNum", quickGoodsList.size());
	}
}
