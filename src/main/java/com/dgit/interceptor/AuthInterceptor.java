package com.dgit.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AuthInterceptor extends HandlerInterceptorAdapter{
	
	private static final Logger logger = LoggerFactory.getLogger(AuthInterceptor.class);
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// TODO Auto-generated method stub
		
		HttpSession session = request.getSession();		
		
		if(session.getAttribute("login") == null){
			
			logger.info("current user is not logined");					
			
			saveDest(request);
			
			response.sendRedirect("/user/login");
			return false;
		}		
		return true;
	}
	
	// login화면으로 이동전에 command와 query를 기억해 둔다.
	private void saveDest(HttpServletRequest req){
		
		String uri = req.getRequestURI();
		String query = req.getQueryString(); // ?key = value
		
		if(query == null || query.equals("null")){
			query = "";
		}else{
			query = "?" + query;
		}	
		
		if(req.getMethod().equals("GET")){
			logger.info("dest: " + (uri+query));
			req.getSession().setAttribute("dest", uri + query);
		}
	}
	
	

}
