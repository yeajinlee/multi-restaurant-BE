package com.spring.project2_test.member.dao;

<<<<<<< HEAD
=======
import javax.servlet.http.HttpSession;

>>>>>>> master
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.spring.project2_test.member.vo.MemberVO;


@Repository("memberDAO")
public class MemberDAOImpl implements MemberDAO{

	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public MemberVO loginById(MemberVO memberVO) throws DataAccessException {
	MemberVO vo= sqlSession.selectOne("mapper.member.loginById",memberVO);
		return vo;
	}

	@Override
	public int insertMember(MemberVO memberVO) throws DataAccessException {
	int result = sqlSession.insert("mapper.member.imsertMember",memberVO);
		return result;
	}

<<<<<<< HEAD
=======
	@Override
	public String loginCheck(MemberVO vo) {
		return sqlSession.selectOne("member.login_check", vo);
	}

	
	
	

>>>>>>> master
}
