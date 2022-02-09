package com.spring.project2_test.newList.service;

import java.util.List;

import com.spring.project2_test.newList.vo.NewListVO;


public interface NewListService {

	public List<NewListVO> newRest() throws Exception;

	public List<NewListVO> newDef() throws Exception;
}
