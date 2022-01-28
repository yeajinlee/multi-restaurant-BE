package com.spring.project2_test.detail.service;

import java.util.List;
import java.util.Map;

public interface DetailService {

	public Map detailContent(int rest_NO) throws Exception;

	public List detailImage(int rest_NO) throws Exception;

	public List reviewList(int rest_NO) throws Exception;

}
