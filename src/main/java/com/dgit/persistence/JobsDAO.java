package com.dgit.persistence;

import java.util.List;

import com.dgit.domain.JobsVO;

public interface JobsDAO {
	
	public void create(JobsVO vo) throws Exception;
	
	public JobsVO read(Integer bno) throws Exception;
	
	public void update(JobsVO vo) throws Exception;
	
	public void delete(Integer bno) throws Exception;
	
	public List<JobsVO> listAll() throws Exception;
}
