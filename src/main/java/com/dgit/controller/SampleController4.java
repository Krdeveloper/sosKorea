package com.dgit.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dgit.domain.ProductVO;

@Controller
public class SampleController4 {
	private static final Logger logger = LoggerFactory.getLogger(SampleController.class);
	
	@RequestMapping("/doE")
	public String doD(RedirectAttributes rttr){
			
		logger.info("doE called but redirect to /doF.......");
		rttr.addFlashAttribute("msg", "message~~with redirected");
		return "redirect:/doF";
	}
	
	@RequestMapping("/doF")
	public void doF(@ModelAttribute String msg){
			
		logger.info("doE called ......." + msg);
		
	}
}
