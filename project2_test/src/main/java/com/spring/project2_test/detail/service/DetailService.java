package com.spring.project2_test.detail.service;

import java.util.List;
import java.util.Map;

import com.spring.project2_test.detail.vo.ReviewVO;

public interface DetailService {

	public Map detailContent(int rest_NO) throws Exception;

	public List detailImage(int rest_NO) throws Exception;

	public List<ReviewVO> reviewList(int rest_NO) throws Exception;

}
