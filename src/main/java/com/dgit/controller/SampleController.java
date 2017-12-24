package com.dgit.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dgit.domain.ProductVO;

@Controller
public class SampleController {
	private static final Logger logger = LoggerFactory.getLogger(SampleController.class);
	
	@RequestMapping("/doD")
	public String doD(Model model){
		ProductVO product = new ProductVO("sample product", 10000);
		
		logger.info("doD called...");
		model.addAttribute(product);
		return "productDetail";
	}
	@RequestMapping("doA")
	public void doB(){
		logger.info("doA called...");
	}
	
}
