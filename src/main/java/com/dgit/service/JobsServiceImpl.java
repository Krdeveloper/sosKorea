package com.dgit.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dgit.domain.JobsVO;

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
		
		/*if(board.getFiles()==null) //보호처리
			return;
		
		for(String fullname : board.getFiles()){
			dao.addAttach(fullname);
		}*/
		
	}

	@Override
	public JobsVO read(Integer bno) throws Exception {
		// TODO Auto-generated method stub
		return dao.read(bno);
	}

	@Transactional
	@Override
	public void modify(JobsVO jobs) throws Exception {
		// TODO Auto-generated method stub
		dao.update(jobs);
		
		/*Integer bno = jobs.getBno();
		
		dao.deleteAttach(bno);
		
		String[] files = jobs.getFiles();
		
		if(files ==null){
			return;
		}
		
		for(String fileName : files){
			dao.replaceAttach(fileName, bno);
		}*/
	}

	@Override
	public void remove(Integer bno) throws Exception {
		// TODO Auto-generated method stub
		
		//dao.deleteAttach(bno);
		dao.delete(bno);
	}

	@Override
	public List<JobsVO> listAll() throws Exception {
		// TODO Auto-generated method stub
		return dao.listAll();
	}

	/*@Override
	public List<JobsVO> listCriteria(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return dao.listCriteria(cri);
	}

	@Override
	public int totalCount() throws Exception {
		// TODO Auto-generated method stub
		return dao.totalCount();
	}

	@Override
	public List<JobsVO> listSearch(SearchCriteria cri) throws Exception {
		// TODO Auto-generated method stub
		return dao.listSearch(cri);
	}

	@Override
	public int searchCount(SearchCriteria cri) throws Exception {
		// TODO Auto-generated method stub
		return dao.searchCount(cri);
	}

	@Override
	public int updateViewCnt(int bno) throws Exception {
		// TODO Auto-generated method stub
		return dao.updateViewCnt(bno);
	}

	@Override
	public List<String> getAttach(Integer bno) throws Exception {
		// TODO Auto-generated method stub
		return dao.getAttach(bno);
	}
*/
}