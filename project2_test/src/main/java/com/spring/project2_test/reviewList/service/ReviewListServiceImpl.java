package com.spring.project2_test.reviewList.service;

import java.util.HashMap;
<<<<<<< HEAD
=======
import java.util.List;
>>>>>>> master
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.project2_test.reviewList.dao.ReviewListDAO;
import com.spring.project2_test.reviewList.vo.ReviewListVO;

@Service("reviewListService")
public class ReviewListServiceImpl implements ReviewListService{
	@Autowired
	private ReviewListDAO reviewListDAO;
	
	@Override
<<<<<<< HEAD
	public Map reviewListOdd() throws Exception {
		Map reviewListMap = new HashMap();
		ReviewListVO reviewListVO = reviewListDAO.selectAllReviewOdd();
		reviewListMap.put("reviewListVO", reviewListVO);
		return reviewListMap;
	}
	
	@Override
	public Map reviewListEven() throws Exception {
		Map reviewListMap = new HashMap();
		ReviewListVO reviewListVO = reviewListDAO.selectAllReviewEven();
		reviewListMap.put("reviewListVO", reviewListVO);
		return reviewListMap;
=======
	public List<ReviewListVO> reviewListOdd() throws Exception {
		List<ReviewListVO> reviewList = reviewListDAO.selectAllReviewOdd();
		return reviewList;
	}
	
	@Override
	public List<ReviewListVO> reviewListEven() throws Exception {
		List<ReviewListVO> reviewList = reviewListDAO.selectAllReviewEven();
		return reviewList;
>>>>>>> master
	}
}
