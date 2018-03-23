package com.dgit.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import com.dgit.domain.Criteria;
import com.dgit.domain.JobsVO;
import com.dgit.domain.SearchCriteria;
import com.dgit.persistence.JobsDAO;

@Service
public class JobsServiceImpl implements JobsService {
	
	@Autowired
	private JobsDAO dao;		
	
	@Transactional
	@Override
	public void regist(JobsVO jobs) throws Exception {
		// TODO Auto-generated method stub
		
		dao.create(jobs);
		System.out.println("1111111111111111111111111111111111111111");
		String[] files = jobs.getFiles();
		
		if(files==null){ //보호처리			
			return;
		}
		System.out.println("======="+jobs.getFiles().toString()+"==========");
		
		for(String fileName : files){
			
			dao.addAttach(fileName);
			System.out.println("mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm");
		}
		System.out.println("22222222222222222222222222222222222222");
	}
	
	@Transactional(isolation=Isolation.READ_COMMITTED)
	@Override
	public JobsVO read(Integer bno) throws Exception {
		// TODO Auto-generated method stub
		dao.updateViewCnt(bno);
		return dao.read(bno);
	}

	@Transactional
	@Override
	public void modify(JobsVO jobs) throws Exception {
		// TODO Auto-generated method stub
		dao.update(jobs);
		
		Integer bno = jobs.getBno();
		
		dao.deleteAttach(bno);
		
		String[] files = jobs.getFiles();
		
		if(files ==null){
			return;
		}
		
		for(String fileName : files){
			dao.replaceAttach(fileName, bno);
		}
	}
	
	@Transactional
	@Override
	public void remove(Integer bno) throws Exception {
		// TODO Auto-generated method stub
		
		dao.deleteAttach(bno);
		dao.delete(bno);
	}

	@Override
	public List<JobsVO> listAll() throws Exception {
		// TODO Auto-generated method stub
		return dao.listAll();
	}

	
	@Override
	public List<JobsVO> listCriteria(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return dao.listCriteria(cri);
	}
	
	@Override
	public int listCountCriteria(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return dao.countPaging(cri);
	}

	@Override
	public List<JobsVO> listSearchCriteria(SearchCriteria cri) throws Exception {
		// TODO Auto-generated method stub
		return dao.listSearch(cri);
	}

	@Override
	public int listSearchCount(SearchCriteria cri) throws Exception {
		// TODO Auto-generated method stub
		return dao.listSearchCount(cri);
	}

	@Override
	public List<String> getAttach(Integer bno) throws Exception {
		// TODO Auto-generated method stub
		return dao.getAttach(bno);
	}

	@Override
	public List<JobsVO> listTopThree() throws Exception {
		// TODO Auto-generated method stub
		return dao.listTopThree();
	}
	
	/*
	@Override
	public int totalCount() throws Exception {
		// TODO Auto-generated method stub
		return dao.totalCount();
	}	

	
*/

	
}
