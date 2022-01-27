package com.spring.project2_test.reviewList.service;

<<<<<<< HEAD
import java.util.Map;

public interface ReviewListService {

	public Map reviewListOdd() throws Exception;
	public Map reviewListEven() throws Exception;
=======
import java.util.List;
import java.util.Map;

import com.spring.project2_test.reviewList.vo.ReviewListVO;

public interface ReviewListService {

	public List<ReviewListVO> reviewListOdd() throws Exception;
	public List<ReviewListVO> reviewListEven() throws Exception;
>>>>>>> master

}
