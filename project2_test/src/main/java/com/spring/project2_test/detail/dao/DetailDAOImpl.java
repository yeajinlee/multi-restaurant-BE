package com.spring.project2_test.detail.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.spring.project2_test.detail.vo.DetailVO;
import com.spring.project2_test.detail.vo.ReviewVO;


@Repository("detailDAO")
public class DetailDAOImpl implements DetailDAO{
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public DetailVO selectDetailContent(int rest_NO) throws DataAccessException {
		DetailVO detailVO = (DetailVO) sqlSession.selectOne("mappers.detail.selectRestDetail", rest_NO);
		return detailVO;
	}
	@Override
	public List selectAllDetailImg(int rest_NO) throws DataAccessException {
		List detailImgList = sqlSession.selectList("mappers.detail.selectRestImg", rest_NO);
		return detailImgList;
	}
	
	@Override
	public List selectAllReview(int rest_NO) throws DataAccessException {
		List detailReviewList = sqlSession.selectList("mappers.detail.selectAllReview", rest_NO);
		return detailReviewList;
	}
}
