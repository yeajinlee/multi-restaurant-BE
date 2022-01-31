package com.spring.project2_test.detail.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.spring.project2_test.detail.vo.DetailVO;
import com.spring.project2_test.detail.vo.ReviewVO;

public interface DetailDAO {

	public DetailVO selectDetailContent(int rest_NO) throws DataAccessException;

	public List selectAllDetailImg(int rest_NO) throws DataAccessException;

	public List selectAllReview(int rest_NO) throws DataAccessException;

}
