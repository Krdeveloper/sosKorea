package com.dgit.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dgit.domain.MemberVO;
import com.dgit.dto.LoginDTO;
import com.dgit.service.MemberService;

@Controller
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	private MemberService service;
	
	// /user/login
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public void loginGET(@ModelAttribute("dto") LoginDTO dto){
		
	}
	
	@RequestMapping(value="/loginPost", method=RequestMethod.POST)
	public void loginPOST(LoginDTO dto, HttpSession session, Model model) throws Exception{
		
		MemberVO vo = service.login(dto);
		
		if(vo==null){
			//회원가입을 한적이 없으면, memberVO키가 없음.
			//interceptor에서 memberVO키가 없으면 login화면으로 다시 가도록 처리
			System.out.println("회원없음");
			return;
		}
		System.out.println("회원있음");
		model.addAttribute("memberVO", vo);
	}
	
	@RequestMapping(value="/logout", method=RequestMethod.GET)
	public String logout(HttpSession session) throws Exception{
		session.removeAttribute("login");
		session.invalidate();
		String uri = "/";
		return "redirect:" + uri; 
	}
	
	@RequestMapping(value="/addMember", method=RequestMethod.GET)
	public void getLogin(){
		
	}
	
	@RequestMapping(value="/addMember", method=RequestMethod.POST)
	public String addMemPOST(MemberVO vo, RedirectAttributes rttr) throws Exception{
		service.addMember(vo);
		rttr.addFlashAttribute("addMem", "success");
		return "redirect:/user/login";
	}
}
