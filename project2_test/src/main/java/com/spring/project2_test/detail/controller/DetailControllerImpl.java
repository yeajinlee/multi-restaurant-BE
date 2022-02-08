package com.spring.project2_test.detail.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.spring.project2_test.detail.service.DetailService;
import com.spring.project2_test.detail.vo.DetailReviewVO;
import com.spring.project2_test.detail.vo.DetailVO;
import com.spring.project2_test.detail.vo.ImageVO;
import com.spring.project2_test.member.vo.MemberVO;

@Controller("detailController")
public class DetailControllerImpl implements DetailController {
	private static final String REVIEW_IMG_REPO = "C:\\project\\multi_restaurant\\multi_restaurant\\project2_test\\src\\main\\webapp\\resources\\image";
	
	@Autowired
	private DetailService detailService;
	
	@Autowired
	private DetailVO detailVO;
	
	
	@Override
	@RequestMapping(value="/detail.do", method = RequestMethod.GET)
	public ModelAndView detailView(@RequestParam("rest_NO") int rest_NO, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		System.out.println(rest_NO);
		Map detailMap = detailService.detailContent(rest_NO);
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("detailMap", detailMap);
		List detailImg = detailService.detailImage(rest_NO);
		mav.addObject("detailImg", detailImg);
		List detailReviewList = detailService.reviewList(rest_NO);
		mav.addObject("detailReviewList", detailReviewList);
		List detailSideList = detailService.detailSideList();
		mav.addObject("detailSideList", detailSideList);
		int reviewCnt = detailService.reviewCount(rest_NO);
		mav.addObject("reviewCnt", reviewCnt);
		return mav;
	}
		
	
	@Override
	@RequestMapping(value="/addNewReview.do", method= {RequestMethod.POST, RequestMethod.GET}, headers = ("content-type=multipart/*"))
	@ResponseBody
	public ResponseEntity writeReview(MultipartHttpServletRequest multipartRequest, HttpServletResponse response)
			throws Exception {
		multipartRequest.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
//		int rest_NO = detailReviewVO.getRest_NO();
//		System.out.println(rest_NO);
		String msg = null;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=UTF-8");
		
		
		Map<String, Object> reviewMap = new HashMap<String, Object>();
		
		Enumeration en = multipartRequest.getParameterNames();
		while(en.hasMoreElements()) {
			String key = (String) en.nextElement();
			String value = multipartRequest.getParameter(key);
			reviewMap.put(key, value);
		}
		String img_FileName = addImages(multipartRequest);
		
//		HttpSession sess = multipartRequest.getSession();
//		MemberVO memberVO = (MemberVO) sess.getAttribute("member");
//		String user_ID = memberVO.getUser_ID();
//		reviewMap.put("user_ID", user_ID);
		reviewMap.put("img_FileName", img_FileName);
		
		
//		List<String> imgNameList = addImages(multipartRequest);
//		List<ImageVO> imgFileList = new ArrayList<ImageVO>();
//		if(imgNameList != null && imgNameList.size() != 0) {
//			for (String imgName : imgNameList) {
//				ImageVO imageVO = new ImageVO();
//				imageVO.setImg_FileName(imgName);
//				imgFileList.add(imageVO);
//			}
//			reviewMap.put("imgFileList", imgFileList);
//		}
		
//		int rest_NO = detailService.selectRestNO();
		try {
			int review_NO = detailService.writeReview(reviewMap);
			if(img_FileName != null && img_FileName.length() != 0) {
				File scrFile = new File(REVIEW_IMG_REPO + "\\" + "temp" + "\\" + img_FileName);
				File destDir = new File(REVIEW_IMG_REPO + "\\" + review_NO);
				FileUtils.moveFileToDirectory(scrFile, destDir, false);
			}
			msg = "<script>";
			msg += "alert('���� �ۼ� �Ϸ�');";
			msg += "location.href='" + multipartRequest.getContextPath() + "/detail.do?rest_NO=" + detailVO.getRest_NO() + "';";
//			msg += "history.go(-1)";
			msg += "</script>";
			resEnt = new ResponseEntity(msg, responseHeaders, HttpStatus.CREATED);
		} catch (Exception e) {
	
			File srcFile = new File(REVIEW_IMG_REPO + "\\" + "temp" + "\\" + img_FileName);
			srcFile.delete();
				
			msg = "<script>";
			msg += "alert('���� �������Դϴ�.')";
			msg += "location.href='" + multipartRequest.getContextPath() + "/detail.do?rest_NO=" + detailVO.getRest_NO() + "';";
//			msg += "history.go(-1)";
			msg += "</script>";
			resEnt = new ResponseEntity(msg, responseHeaders, HttpStatus.CREATED);
			e.printStackTrace();
		}
		
		return resEnt;
		
		
	}
		
	private String addImages(MultipartHttpServletRequest multipartRequest) throws Exception {
		String img_FileName = null;
		Iterator<String> imgNames = multipartRequest.getFileNames();
		while (imgNames.hasNext()) {
			String imgName = imgNames.next();
			MultipartFile mpf = multipartRequest.getFile(imgName);
			img_FileName = mpf.getOriginalFilename();
			File file = new File(REVIEW_IMG_REPO + "\\" + "temp" + "\\" + img_FileName);
			if (mpf.getSize() != 0) {
				if(!file.exists()) {
					mpf.transferTo(new File(REVIEW_IMG_REPO + "\\" + "temp" + "\\" + img_FileName));
				}
			}
		}
		return img_FileName;
	}


/*
	private List addImages(MultipartHttpServletRequest multipartRequest) throws Exception{
		List<String> imgFileList = new ArrayList<String>();
		Iterator<String> imgFileNames = multipartRequest.getFileNames();
		while (imgFileNames.hasNext()) {
			String imgFileName = imgFileNames.next();
			MultipartFile mpf = multipartRequest.getFile(imgFileName);
			String originalImgName = mpf.getOriginalFilename();
			imgFileList.add(originalImgName);
			File file = new File(REVIEW_IMG_REPO + "\\" + "temp" + "\\" + imgFileName);
			if(mpf.getSize() != 0 ) {
				if(!file.exists()) {
					mpf.transferTo(new File(REVIEW_IMG_REPO + "\\" + imgFileName));
				}
				
			}
		}
		return imgFileList;
	}
*/
	
	
	
	@Override
	@RequestMapping(value="/deleteReview.do", method= {RequestMethod.POST, RequestMethod.GET})
	@ResponseBody
	public ResponseEntity deleteReview(int review_NO, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		response.setContentType("text/html; charset=UTF-8");
		String msg;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		try {
			detailService.deleteReview(review_NO);
			File destDir = new File(REVIEW_IMG_REPO + "\\" + review_NO);
			FileUtils.deleteDirectory(destDir);
			
			msg = "<script>";
			msg += "alert('�� ����');";
			msg += "location.href='" + request.getContextPath() + "/detail.do?rest_NO=" + detailVO.getRest_NO() + "';";
			msg += "</script>";
			resEnt = new ResponseEntity(msg, responseHeaders, HttpStatus.CREATED);
		} catch (Exception e) {
			msg = "<script>";
			msg += "alert('�ٽ� �õ��ϼ���');";
			msg += "location.href='" + request.getContextPath() + "/detail.do?rest_NO=" + detailVO.getRest_NO() + "';";
			msg += "</script>";
			resEnt = new ResponseEntity(msg, responseHeaders, HttpStatus.CREATED);
			e.printStackTrace();
		}
		return resEnt;
	}
	
	@Override
	@RequestMapping(value="/updateReview.do", method={RequestMethod.POST, RequestMethod.GET})
	public ResponseEntity updateReview(MultipartHttpServletRequest multipartRequest, HttpServletResponse response) throws Exception {
		multipartRequest.setCharacterEncoding("utf-8");
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=UTF-8");
		String msg;
		Map<String, Object> reviewMap = new HashMap<String, Object>();
		Enumeration en = multipartRequest.getParameterNames();
		while(en.hasMoreElements()) {
			String name = (String) en.nextElement();
			String value = multipartRequest.getParameter(name);
			reviewMap.put(name, value);
		}
		
		String img_FileName = addImages(multipartRequest);
		reviewMap.put("img_FileName", img_FileName);
		int review_NO = (Integer) reviewMap.get("review_NO");
		
		try {
			detailService.updateReview(reviewMap);
			if(img_FileName != null && img_FileName.length() != 0) {
				File srcFile = new File(REVIEW_IMG_REPO + "\\" + "temp" + "\\" + img_FileName);
				File destDir = new File(REVIEW_IMG_REPO + "\\" + review_NO);
				FileUtils.moveToDirectory(srcFile, destDir, true);
				
			}
			msg = "<script>";
			msg += "alert('���� �Ϸ�');";
			msg += "location.href='" + multipartRequest.getContextPath() + "/detail.do?rest_NO=" + detailVO.getRest_NO() + "';";
			msg += "</script>";
			resEnt = new ResponseEntity(msg, responseHeaders, HttpStatus.CREATED);
		} catch (Exception e) {
			File src = new File(REVIEW_IMG_REPO + "\\" + "temp" + "\\" + img_FileName);
			src.delete();
				
			msg = "<script>";
			msg += "alert('���� �������Դϴ�.')";
			msg += "location.href='" + multipartRequest.getContextPath() + "/detail.do?rest_NO=" + detailVO.getRest_NO() + "';";
			msg += "</script>";
			resEnt = new ResponseEntity(msg, responseHeaders, HttpStatus.CREATED);
			e.printStackTrace();
		}
		
		return resEnt;
	}
	
}
