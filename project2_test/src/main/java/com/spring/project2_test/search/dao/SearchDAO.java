package com.spring.project2_test.search.dao;

import java.util.ArrayList;
import java.util.List;

import org.springframework.dao.DataAccessException;

import com.spring.project2_test.search.vo.SearchVO;



public interface SearchDAO {
	public List<String> selectKeywordSearch(String keyword) throws DataAccessException;
	public List<SearchVO> selectBySearchWord(String searchWord)throws DataAccessException;
	

}