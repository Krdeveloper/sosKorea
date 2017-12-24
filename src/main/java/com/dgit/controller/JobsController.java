package com.dgit.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dgit.domain.JobsVO;
import com.dgit.service.JobsService;

@Controller
@RequestMapping("/jobs/*")
public class JobsController {
	
	private static final Logger logger = LoggerFactory.getLogger(JobsController.class);
	
	@Autowired
	private JobsService service;
	
	@RequestMapping(value="/register", method=RequestMethod.GET)
	public void registGET(JobsVO jobs, Model model) throws Exception{
		logger.info("레지스트 get ......................");
	}
	
	@RequestMapping(value="/register", method=RequestMethod.POST)
	public String registPOST(JobsVO jobs, RedirectAttributes rttr) throws Exception{
		logger.info("레지스트 post ......................");
		logger.info(jobs.toString());
		
		service.regist(jobs);
		
		rttr.addFlashAttribute("msg", "SUCCESS");
		
		//return "/jobs/success";
		return "redirect:/jobs/listAll";
	}
	
	@RequestMapping(value="/listAll", method=RequestMethod.GET)
	public void listAll(Model model) throws Exception{
		logger.info("show all list.............................");
		model.addAttribute("list", service.listAll());
	}
	
	@RequestMapping(value="/read", method=RequestMethod.GET)
	public void read(@RequestParam("bno") int bno,  Model model) throws Exception{
		
		model.addAttribute(service.read(bno));
	}
	
	@RequestMapping(value="/remove", method=RequestMethod.POST)
	public String remove(@RequestParam("bno") int bno,  Model model,
					RedirectAttributes rttr) throws Exception{
		
		service.remove(bno);
		
		rttr.addFlashAttribute("msg", "SUCCESS");
		
		return "redirect:/jobs/listAll";
	}
	
	@RequestMapping(value="/modify", method=RequestMethod.GET)
	public void modifyGET(int bno, Model model) throws Exception{
		model.addAttribute(service.read(bno));
	}
	
	@RequestMapping(value="/modify", method=RequestMethod.POST)
	public String modifyPOST(JobsVO jobs, RedirectAttributes rttr) throws Exception{
		logger.info("mod post ......................");		
		
		service.modify(jobs);
		
		rttr.addFlashAttribute("msg", "SUCCESS");		
		
		return "redirect:/jobs/listAll";
	}
}
