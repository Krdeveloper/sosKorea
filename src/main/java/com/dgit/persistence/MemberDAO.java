package com.dgit.persistence;

import com.dgit.domain.MemberVO;
import com.dgit.dto.LoginDTO;

public interface MemberDAO {
	
	public String getTime();
	
	public void insertMember(MemberVO vo);
	
	public MemberVO readMember(String userid) throws Exception;
	
	public MemberVO readWithPW(String userid, String userpw) throws Exception;
	
	
	public MemberVO login(LoginDTO dto) throws Exception;
}
