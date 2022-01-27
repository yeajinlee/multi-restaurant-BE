package com.spring.project2_test.detail.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.spring.project2_test.detail.vo.DetailVO;

@Repository("detailDAO")
public class DetailDAOImpl implements DetailDAO{
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public DetailVO selectDetailContent(int rest_NO) throws DataAccessException {
		DetailVO detailVO = (DetailVO) sqlSession.selectOne("mappers.detail.selectDetailContent", rest_NO);
		return detailVO;
	}
}
