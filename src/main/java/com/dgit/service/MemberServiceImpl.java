package com.dgit.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dgit.domain.MemberVO;
import com.dgit.dto.LoginDTO;
import com.dgit.persistence.MemberDAO;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberDAO dao;	
	

	@Override
	public MemberVO login(LoginDTO dto) throws Exception {
		// TODO Auto-generated method stub
		return dao.login(dto);
	}


	@Override
	public void addMember(MemberVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.insertMember(vo);
	}

}
