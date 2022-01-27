package com.spring.project2_test.detail.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.project2_test.detail.dao.DetailDAO;
import com.spring.project2_test.detail.vo.DetailVO;

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
}
