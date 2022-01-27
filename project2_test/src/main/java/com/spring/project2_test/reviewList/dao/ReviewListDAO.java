package com.spring.project2_test.reviewList.dao;

import org.springframework.dao.DataAccessException;

import com.spring.project2_test.reviewList.vo.ReviewListVO;

public interface ReviewListDAO {

	public ReviewListVO selectAllReviewOdd() throws DataAccessException;

	public ReviewListVO selectAllReviewEven() throws DataAccessException;

}
