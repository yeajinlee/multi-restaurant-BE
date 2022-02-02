package com.spring.project2_test.search.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.project2_test.search.dao.SearchDAO;
import com.spring.project2_test.search.vo.SearchVO;


@Service("searchService")
public class SearchServiceImpl implements SearchService {

	@Autowired
	private SearchDAO searchDAO;
	
	@Override
	public List<SearchVO> searchRest(String searchWord) throws Exception {
		List<SearchVO> restLists=searchDAO.selectBySearchWord(searchWord);
		System.out.println("여기옴 서비스");
		return restLists;
	}

	@Override
	public List<String> keywordSearch(String keyword) {
		List<String> list=searchDAO.selectKeywordSearch(keyword);
		return list;
	}

}
