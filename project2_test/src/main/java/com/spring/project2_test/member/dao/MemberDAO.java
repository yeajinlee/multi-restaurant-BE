package com.spring.project2_test.member.dao;

<<<<<<< HEAD
=======
import javax.servlet.http.HttpSession;

>>>>>>> master
import org.springframework.dao.DataAccessException;

import com.spring.project2_test.member.vo.MemberVO;



public interface MemberDAO {

	 public MemberVO loginById(MemberVO memberVO) throws DataAccessException;
	 public int insertMember(MemberVO memberVO) throws DataAccessException ;
<<<<<<< HEAD
=======
	 public String loginCheck(MemberVO vo)  throws DataAccessException;
>>>>>>> master
}
