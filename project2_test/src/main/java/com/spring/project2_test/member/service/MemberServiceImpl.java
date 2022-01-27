package com.spring.project2_test.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.spring.project2_test.member.dao.MemberDAO;
import com.spring.project2_test.member.vo.MemberVO;

@Service("memberService")
@Transactional(propagation=Propagation.REQUIRED)
public class MemberServiceImpl implements MemberService{

	@Autowired
	private MemberDAO memberDAO;
	
	
	@Override
	public int addMember(MemberVO memberVO) throws DataAccessException {
		memberDAO.insertMember(memberVO);
		return 0;
	}

	@Override
	public MemberVO login(MemberVO memberVO) throws Exception {
		return memberDAO.loginById(memberVO);
	
	}

}
