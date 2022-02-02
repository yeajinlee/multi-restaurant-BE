package com.spring.project2_test.detail.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.project2_test.detail.dao.DetailDAO;
import com.spring.project2_test.detail.vo.DetailVO;
import com.spring.project2_test.detail.vo.ReviewVO;

@Service("detailService")
public class DetailServiceImpl implements DetailService{
	@Autowired
	private DetailDAO detailDAO;
	
	@Override
	public Map detailContent(int rest_NO) throws Exception {
		Map detailMap = new HashMap();
		DetailVO detailVO = detailDAO.selectDetailContent(rest_NO);
		detailMap.put("detailVO", detailVO);
		return detailMap;
	}
	
	@Override
	public List detailImage(int rest_NO) throws Exception {
		List detailImgList = detailDAO.selectAllDetailImg(rest_NO);
		return detailImgList;
	}
	
	@Override
	public List<ReviewVO> reviewList(int rest_NO) throws Exception {
		List<ReviewVO> detailReviewList= detailDAO.selectAllReview(rest_NO);
		return detailReviewList;
	}
}
