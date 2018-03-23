package com.dgit.service;



import com.dgit.domain.MemberVO;
import com.dgit.dto.LoginDTO;


public interface MemberService {
	
	public MemberVO login(LoginDTO dto) throws Exception;
	
	public void addMember(MemberVO vo) throws Exception;
	
	/*public MemberVO member(String userid) throws Exception;
	
	public void modifyMember(MemberVO vo) throws Exception;
	
	public void removeMember(String userid) throws Exception;*/
	
	
}
