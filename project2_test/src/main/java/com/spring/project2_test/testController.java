package com.spring.project2_test;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class testController {
	@RequestMapping(value="/detail")
	public String detail() {
		return "detailPage";
	}
}
