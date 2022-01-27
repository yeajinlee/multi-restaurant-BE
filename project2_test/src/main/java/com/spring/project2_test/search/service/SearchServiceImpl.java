package com.spring.project2_test.search.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.spring.project2_test.search.dao.SearchDAO;
import com.spring.project2_test.search.vo.SearchVO;

public class SearchServiceImpl implements SearchService {

	@Autowired
	private SearchDAO searchDAO;
	
	@Override
	public List<SearchVO> searchRest(String searchWord) throws Exception {
		List searchList=searchDAO.selectBySearchWord(searchWord);
		return searchList;
	}

	@Override
	public List<String> keywordSearch(String keyword) {
		List<String> list=searchDAO.selectKeywordSearch(keyword);
		return list;
	}

}
