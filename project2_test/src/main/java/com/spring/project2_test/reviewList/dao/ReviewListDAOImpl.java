package com.spring.project2_test.reviewList.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.spring.project2_test.reviewList.vo.ReviewListVO;

@Repository("reviewListDAO")
public class ReviewListDAOImpl implements ReviewListDAO {
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public ReviewListVO selectAllReviewOdd() throws DataAccessException {
		ReviewListVO reviewListVO = sqlSession.selectOne("mappers.reivew.selectAllReviewOdd");
		return reviewListVO;
	}

	@Override
		public ReviewListVO selectAllReviewEven() throws DataAccessException {
		ReviewListVO reviewListVO = sqlSession.selectOne("mappers.reivew.selectAllReviewEven");
		return reviewListVO;
		}
}
