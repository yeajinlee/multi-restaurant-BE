package com.spring.project2_test.detail.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.spring.project2_test.detail.vo.DetailReviewVO;
import com.spring.project2_test.detail.vo.DetailVO;
import com.spring.project2_test.detail.vo.ImageVO;
import com.spring.project2_test.detail.vo.ReviewVO;

public interface DetailDAO {

	public DetailVO selectDetailContent(int rest_NO) throws DataAccessException;

	public List selectAllDetailImg(int rest_NO) throws DataAccessException;

	public List selectAllReview(int rest_NO) throws DataAccessException;
	
	public int countReview(int rest_NO) throws DataAccessException;

	public List selectSideList() throws DataAccessException;

	public int insertNewReview(Map reviewMap) throws DataAccessException;

	public void insertNewImage(Map reviewMap) throws DataAccessException;

//	public int selectRestNO() throws DataAccessException;

	public void deleteReview(int review_NO) throws DataAccessException;

	public void updateReview(Map reviewMap) throws DataAccessException;

	

}
