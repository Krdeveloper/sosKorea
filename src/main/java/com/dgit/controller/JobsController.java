package com.dgit.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dgit.domain.Criteria;
import com.dgit.domain.JobsVO;
import com.dgit.domain.PageMaker;
import com.dgit.domain.SearchCriteria;
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
		return "redirect:/jobs/listPage";
	}
	
	@RequestMapping(value="/listAll", method=RequestMethod.GET)
	public void listAll(Model model) throws Exception{
		logger.info("show all list.............................");
		model.addAttribute("list", service.listAll());
	}
	
	@RequestMapping(value="/read", method=RequestMethod.GET)
	public void read(@RequestParam("bno") int bno, 
					@ModelAttribute("cri") SearchCriteria cri,
					Model model) throws Exception{
		
		model.addAttribute(service.read(bno));
	}
	
	@RequestMapping(value="/remove", method=RequestMethod.POST)
	public String remove(@RequestParam("bno") int bno, 
					SearchCriteria cri, 
					RedirectAttributes rttr) throws Exception{
		
		service.remove(bno);
		
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addAttribute("searchType", cri.getSearchType());
		rttr.addAttribute("keyword", cri.getKeyword());
		
		rttr.addFlashAttribute("msg", "SUCCESS");
		
		return "redirect:/jobs/listPage";
	}
	
	@RequestMapping(value="/modify", method=RequestMethod.GET)
	public void modifyGET(@RequestParam("bno") int bno, 
						@ModelAttribute("cri") SearchCriteria cri,
						Model model) throws Exception{
		model.addAttribute(service.read(bno));
	}
	
	@RequestMapping(value="/modify", method=RequestMethod.POST)
	public String modifyPOST(JobsVO jobs, 
						SearchCriteria cri, 
						RedirectAttributes rttr) throws Exception{
		logger.info(cri.toString());			
		
		service.modify(jobs);
		
		rttr.addAttribute("page", cri.getPage());	
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addAttribute("searchType", cri.getSearchType());	
		rttr.addAttribute("keyword", cri.getKeyword());	
		
		rttr.addFlashAttribute("msg", "SUCCESS");	
		
		logger.info(rttr.toString());
		
		return "redirect:/jobs/listPage";
	}
	
	@RequestMapping(value="/listPage", method=RequestMethod.GET)
	public void listPage(@ModelAttribute("cri")SearchCriteria cri, Model model) throws Exception{
		
		logger.info(cri.toString());
		
		//model.addAttribute("list", service.listCriteria(cri));
		model.addAttribute("list", service.listSearchCriteria(cri));
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		//pageMaker.setTotalCount(131);
		//pageMaker.setTotalCount(service.listCountCriteria(cri));
		pageMaker.setTotalCount(service.listSearchCount(cri));
		
		model.addAttribute("pageMaker", pageMaker);
	}
}
