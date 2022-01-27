package com.spring.project2_test.reviewList.dao;

<<<<<<< HEAD
=======
import java.util.List;

>>>>>>> master
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
<<<<<<< HEAD
	public ReviewListVO selectAllReviewOdd() throws DataAccessException {
		ReviewListVO reviewListVO = sqlSession.selectOne("mappers.reivew.selectAllReviewOdd");
		return reviewListVO;
	}

	@Override
		public ReviewListVO selectAllReviewEven() throws DataAccessException {
		ReviewListVO reviewListVO = sqlSession.selectOne("mappers.reivew.selectAllReviewEven");
		return reviewListVO;
=======
	public List<ReviewListVO> selectAllReviewOdd() throws DataAccessException {
		List<ReviewListVO> reviewList = sqlSession.selectList("mappers.review.selectAllReviewOdd");
		return reviewList;
	}

	@Override
		public List selectAllReviewEven() throws DataAccessException {
		List<ReviewListVO> reviewList = sqlSession.selectList("mappers.review.selectAllReviewEven");
		return reviewList;
>>>>>>> master
		}
}
