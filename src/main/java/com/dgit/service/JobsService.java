package com.dgit.service;

import java.util.List;

import com.dgit.domain.JobsVO;


public interface JobsService {
	
	public void regist(JobsVO jobs) throws Exception;
	
	public JobsVO read(Integer bno) throws Exception;
	
	public void modify(JobsVO jobs) throws Exception;
	
	public void remove(Integer bno) throws Exception;
	
	public List<JobsVO> listAll() throws Exception;
	
	/*public List<JobsVO> listCriteria(Criteria cri) throws Exception;
	public int totalCount() throws Exception;
	public List<JobsVO> listSearch(SearchCriteria cri) throws Exception;
	public int searchCount(SearchCriteria cri) throws Exception;
	public int updateViewCnt(int bno) throws Exception;
	
	public List<String> getAttach(Integer bno) throws Exception;*/
}
