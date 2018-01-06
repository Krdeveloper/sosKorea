package com.dgit.sosKorea;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.dgit.domain.Criteria;
import com.dgit.domain.JobsVO;
import com.dgit.domain.SearchCriteria;
import com.dgit.persistence.JobsDAO;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
public class JobsDAOTest {
	private Logger logger = LoggerFactory.getLogger(JobsDAOTest.class);//log로 찍고 싶으면
	
	@Autowired
	private JobsDAO dao;
	
	
	
	/*@Test
	public void testCreate() throws Exception{
		JobsVO vo = new JobsVO();
		vo.setTitle("새로운 title1111");
		vo.setContent("새로운 content11111111");
		vo.setUserid("id1");
		dao.create(vo);
	}*/
	/*@Test
	public void testRead() throws Exception{
		logger.info(dao.read(1).toString());
	}*/
	
	/*@Test
	public void tesetSelectAll() throws Exception{
		System.out.println(dao.listAll());
	}*/
	
	/*@Test
	public void testUpdate() throws Exception{
		JobsVO vo = new JobsVO();
		vo.setBno(1);
		vo.setTitle("수정된 글입니다.");
		vo.setContent("수정 content");
		dao.update(vo);
	}*/
	
	/*@Test
	public void testDelete()  throws Exception{
		dao.delete(2);
	}*/
	
	/*@Test
	public void testListPage() throws Exception{
		int page=3;
		List<JobsVO> list = dao.listPage(page);
		for(JobsVO vo : list){
			logger.info(vo.getBno()+ " : " + vo.getTitle());
		}
	}*/
	
	/*@Test
	public void testListCriteria() throws Exception{
		Criteria cri = new Criteria();
		cri.setPage(2);
		cri.setPerPageNum(20);
		
		List<JobsVO> list = dao.listCriteria(cri);
		
		for(JobsVO jobsVO : list){
			logger.info(jobsVO.getBno() + ":" + jobsVO.getTitle());
		}
	}*/
	
	@Test
	public void testDynamic1() throws Exception{
		SearchCriteria cri = new SearchCriteria();
		cri.setPage(1);
		cri.setKeyword("새로운");
		cri.setSearchType("c");
		
		logger.info("=======================================");
		
		List<JobsVO> list = dao.listSearch(cri);
		
		for(JobsVO vo : list){
			logger.info(vo.getBno() + ": " + vo.getTitle());
		}
		
		logger.info("========================================");
		
		logger.info("COUNT: " + dao.listSearchCount(cri));
	}
	
	
}
