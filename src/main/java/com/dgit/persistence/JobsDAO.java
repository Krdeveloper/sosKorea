package com.dgit.persistence;

import java.util.List;

import com.dgit.domain.Criteria;
import com.dgit.domain.JobsVO;
import com.dgit.domain.SearchCriteria;

public interface JobsDAO {
	
	public void create(JobsVO vo) throws Exception;
	
	public JobsVO read(Integer bno) throws Exception;
	
	public void update(JobsVO vo) throws Exception;
	
	public void delete(Integer bno) throws Exception;
	
	public List<JobsVO> listAll() throws Exception;
	
	public List<JobsVO> listPage(int page) throws Exception;
	
	public List<JobsVO> listCriteria(Criteria cri) throws Exception;
	
	public int countPaging(Criteria cri) throws Exception;
	
	public List<JobsVO> listSearch(SearchCriteria cri) throws Exception;
	
	public int listSearchCount(SearchCriteria cri) throws Exception;
	
	public void updateReplyCnt(Integer bno, int amount) throws Exception;
	
	public void updateViewCnt(Integer bno) throws Exception;
	
	public void addAttach(String fullName) throws Exception;
	
	public List<String> getAttach(Integer bno) throws Exception;
	
	public void deleteAttach(Integer bno) throws Exception;
	
	public void replaceAttach(String fullName, Integer bno) throws Exception;
	
	
	public List<JobsVO> listTopThree() throws Exception;
}
