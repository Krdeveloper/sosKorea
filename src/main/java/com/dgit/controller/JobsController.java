package com.dgit.controller;

import java.io.File;
import java.io.FileInputStream;

import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dgit.domain.Criteria;
import com.dgit.domain.JobsVO;
import com.dgit.domain.PageMaker;
import com.dgit.domain.SearchCriteria;
import com.dgit.service.JobsService;
import com.dgit.util.MediaUtils;
import com.dgit.util.UploadFileUtils;

@Controller
@RequestMapping("/jobs/*")
public class JobsController {
	
	private static final Logger logger = LoggerFactory.getLogger(JobsController.class);
	
	@Autowired
	private JobsService service;
	
	@Resource(name="uploadPath")
	private String uploadPath;
	
	@RequestMapping(value="/register", method=RequestMethod.GET)
	public void registGET(JobsVO jobs, Model model) throws Exception{
		logger.info("레지스트 get ......................");
	}
	
	@RequestMapping(value="/register", method=RequestMethod.POST)
	public String registPOST(JobsVO jobs, RedirectAttributes rttr,
			List<MultipartFile> imgFiles) throws Exception{
		logger.info("레지스트 post ......................");
		logger.info(jobs.toString());
		
		ArrayList<String> list = new ArrayList<>();
		for(MultipartFile file : imgFiles){
			logger.info("=============!!!===========filename : " + file.getOriginalFilename());
			
			String thumb = UploadFileUtils.uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes());
			
			list.add(thumb);
		}		
		jobs.setFiles(list.toArray(new String[list.size()]));
		
		service.regist(jobs);
		
		rttr.addFlashAttribute("msg", "SUCCESS");
		System.out.println("==============================regi======================");
		
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
						RedirectAttributes rttr,
						List<MultipartFile> imgFiles) throws Exception{
		logger.info(cri.toString());		
		
		ArrayList<String> list = new ArrayList<>();
		for(MultipartFile file : imgFiles){
			logger.info("=============!!!===========filename : " + file.getOriginalFilename());
			
			String thumb = UploadFileUtils.uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes());
			
			list.add(thumb);
		}		
		jobs.setFiles(list.toArray(new String[list.size()]));
		
		
		
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
	
	@RequestMapping(value="/getAttach/{bno}")
	@ResponseBody
	public List<String> getAttach(@PathVariable("bno")Integer bno) throws Exception{
		return service.getAttach(bno);
	}
	
	@ResponseBody
	@RequestMapping(value="/uploadAjax", method=RequestMethod.POST,
					produces = "text/plain;charset=UTF-8")
	public ResponseEntity<String> uploadAjax(MultipartFile file) throws Exception{
		
		logger.info("originalName: " + file.getOriginalFilename());
		System.out.println("==============================uploadajax======================");
		return 
			new ResponseEntity<>(
				UploadFileUtils.uploadFile(uploadPath,
						file.getOriginalFilename(), 
						file.getBytes()),
				HttpStatus.CREATED);
	}
	
	@ResponseBody
	@RequestMapping(value="/displayFile") //displayFile?filename=boxing.jpg
	public ResponseEntity<byte[]> displayFile(String fileName) throws Exception{
		
		InputStream in = null;
		ResponseEntity<byte[]> entity = null;
		
		logger.info("--------displayFile : " + fileName);
		System.out.println("==============================display======================");
		try{
			String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
			MediaType mType = MediaUtils.getMediaType(formatName);
			HttpHeaders headers = new HttpHeaders();
			in = new FileInputStream(uploadPath +  fileName);
			
			if(mType!=null){
				headers.setContentType(mType);
			}else{
				fileName=fileName.substring(fileName.indexOf("_")+1);
				headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
				headers.add("Content-Disposition", "attachment; filename=\""+
				  new String(fileName.getBytes("UTF-8"), "ISO-8859-1")+"\"");
			}
				entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in),
						headers,
						HttpStatus.CREATED);				
			}catch(Exception e){
				e.printStackTrace();
				entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
			}finally{
				in.close();
			}		
				return entity;
	}
	
	@ResponseBody
	@RequestMapping(value="/deleteAllFiles", method=RequestMethod.POST)
	public ResponseEntity<String> deleteFile(@RequestParam("files[]") String[] files){
		
		logger.info("-----------------deleteAllFiles : " + files);
		
		if(files ==null || files.length ==0){
			return new ResponseEntity<String>("deleted", HttpStatus.OK);
		}
		
		for(String fileName : files){
			String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
			
			MediaType mType = MediaUtils.getMediaType(formatName);
			
			if(mType !=null){
				String front = fileName.substring(0, 12);
				String end = fileName.substring(14);
				new File(uploadPath + (front+end).replace('/', File.separatorChar)).delete();
			}
			new File(uploadPath + fileName.replace('/', File.separatorChar)).delete();
		}
		return new ResponseEntity<String>("deleted", HttpStatus.OK);
		
	}
}
