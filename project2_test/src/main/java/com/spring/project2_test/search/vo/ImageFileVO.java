package com.spring.project2_test.search.vo;

import org.springframework.stereotype.Component;

@Component("imageFileVO")
public class ImageFileVO {
	private int rest_NO;
	private int image_id;
	private String fileName;
	private String fileType;
	private String reg_id;
	

	public ImageFileVO() {
		super();
	}


	public int getRest_NO() {
		return rest_NO;
	}




	public void setRest_NO(int rest_NO) {
		this.rest_NO = rest_NO;
	}




	public int getImage_id() {
		return image_id;
	}




	public void setImage_id(int image_id) {
		this.image_id = image_id;
	}




	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getFileType() {
		return fileType;
	}

	public void setFileType(String fileType) {
		this.fileType = fileType;
	}


	public String getReg_id() {
		return reg_id;
	}

	public void setReg_id(String reg_id) {
		this.reg_id = reg_id;
	}


	

}
