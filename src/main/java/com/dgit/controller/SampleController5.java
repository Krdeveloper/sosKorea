package com.dgit.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dgit.domain.ProductVO;

@Controller
public class SampleController5 {

	
	@RequestMapping("/doJSON")
	public @ResponseBody ProductVO doJSON(){
			
		ProductVO vo = new ProductVO("샘플상품", 50000);
		return vo;
	}
	
	
}
