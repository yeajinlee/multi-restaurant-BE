package com.spring.project2_test.reviewList.dao;

<<<<<<< HEAD
=======
import java.util.List;

>>>>>>> master
import org.springframework.dao.DataAccessException;

import com.spring.project2_test.reviewList.vo.ReviewListVO;

public interface ReviewListDAO {

<<<<<<< HEAD
	public ReviewListVO selectAllReviewOdd() throws DataAccessException;

	public ReviewListVO selectAllReviewEven() throws DataAccessException;
=======
	public List<ReviewListVO> selectAllReviewOdd() throws DataAccessException;

	public List<ReviewListVO> selectAllReviewEven() throws DataAccessException;
>>>>>>> master

}
