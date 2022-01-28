package com.spring.project2_test.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import com.spring.project2_test.member.dao.MemberDAO;
import com.spring.project2_test.member.vo.MemberVO;

@Service("memberService")
public class MemberServiceImpl implements MemberService{

	
	@Override
	public int addMember(MemberVO memberVO) throws DataAccessException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public MemberVO login(MemberVO memberVO) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

}