package com.spring.project2_test.detail.dao;

import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.spring.project2_test.detail.vo.DetailVO;

public interface DetailDAO {

	public DetailVO selectDetailContent(int rest_NO) throws DataAccessException;

}
