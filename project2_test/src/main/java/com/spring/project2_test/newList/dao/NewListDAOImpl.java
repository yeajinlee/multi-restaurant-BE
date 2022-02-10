package com.spring.project2_test.newList.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.project2_test.newList.vo.NewListVO;

@Repository("newListDAO")
public class NewListDAOImpl implements NewListDAO{
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<NewListVO> selectNewList() throws Exception {
		List<NewListVO> newList=sqlSession.selectList("mappers.newList.selectNewList");
		return newList;
	}
	@Override
	public List<NewListVO> defaultNewList() throws Exception {
		List<NewListVO> defaultList=sqlSession.selectList("mappers.newlist.defaultNewList");
		return defaultList;
	}
}
