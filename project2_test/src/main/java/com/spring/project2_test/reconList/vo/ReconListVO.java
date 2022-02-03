package com.spring.project2_test.reconList.vo;

import org.springframework.stereotype.Component;

@Component("reconListVO")
public class ReconListVO {

	private String rest_theme;
	/* private String rest_fileName; */
	
	
	public String getRest_theme() {
		return rest_theme;
	}
	public void setRest_theme(String rest_theme) {
		this.rest_theme = rest_theme;
	}

	/*
	 * public String getRest_fileName() { return rest_fileName; } public void
	 * setRest_fileName(String rest_fileName) { this.rest_fileName = rest_fileName};
	 */
	
	public ReconListVO() {
		// TODO Auto-generated constructor stub
	}
}
