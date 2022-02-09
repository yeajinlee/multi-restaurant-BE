package com.spring.project2_test.newList.dao;

import java.util.List;

import com.spring.project2_test.newList.vo.NewListVO;


public interface NewListDAO {
	public List<NewListVO> selectNewList() throws Exception;

	public List<NewListVO> defaultNewList() throws Exception;
}
