package com.dgit.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dgit.domain.Criteria;
import com.dgit.domain.JobsVO;
import com.dgit.domain.SearchCriteria;

@Repository
public class JobsDAOImpl implements JobsDAO {
	
	@Autowired
	private SqlSession session;
	
	private static final String namespace = "com.dgit.persistence.JobsDAO";
	
	@Override
	public void create(JobsVO vo) throws Exception {
		// TODO Auto-generated method stub
		session.insert(namespace + ".create", vo);
	}

	@Override
	public JobsVO read(Integer bno) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(namespace + ".read", bno);
	}

	@Override
	public void update(JobsVO vo) throws Exception {
		// TODO Auto-generated method stub
		session.update(namespace + ".update", vo);
	}

	@Override
	public void delete(Integer bno) throws Exception {
		// TODO Auto-generated method stub
		session.delete(namespace + ".delete", bno);
	}

	@Override
	public List<JobsVO> listAll() throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(namespace + ".listAll");
	}

	@Override
	public List<JobsVO> listPage(int page) throws Exception {
		// TODO Auto-generated method stub
		if( page <= 0){
			page=1;
		}
		
		page=(page-1) * 10;
		
		return session.selectList(namespace + ".listPage", page);
	}

	@Override
	public List<JobsVO> listCriteria(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(namespace + ".listCriteria", cri);
	}

	@Override
	public int countPaging(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(namespace + ".countPaging", cri);
	}

	@Override
	public List<JobsVO> listSearch(SearchCriteria cri) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(namespace + ".listSearch", cri);
	}

	@Override
	public int listSearchCount(SearchCriteria cri) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(namespace + ".listSearchCount", cri);
	}

	@Override
	public void updateReplyCnt(Integer bno, int amount) throws Exception {
		// TODO Auto-generated method stub
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("bno", bno);
		paramMap.put("amount", amount);
		session.update(namespace + ".updateReplyCnt", paramMap);
	}

	@Override
	public void updateViewCnt(Integer bno) throws Exception {
		// TODO Auto-generated method stub
		session.update(namespace+".updateViewCnt", bno);
	}

	@Override
	public void addAttach(String fullName) throws Exception {
		// TODO Auto-generated method stub
		session.insert(namespace + ".addAttach", fullName);
	}

	@Override
	public List<String> getAttach(Integer bno) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(namespace + ".getAttach", bno);
	}

	@Override
	public void deleteAttach(Integer bno) throws Exception {
		// TODO Auto-generated method stub
		session.delete(namespace + ".deleteAttach", bno);
	}

	@Override
	public void replaceAttach(String fullName, Integer bno) throws Exception {
		// TODO Auto-generated method stub
		Map<String, Object> paramMap = new HashMap<String, Object>();
		
		paramMap.put("bno", bno);
		paramMap.put("fullName", fullName);
		
		session.insert(namespace+".replaceAttach", paramMap);
	}

	@Override
	public List<JobsVO> listTopThree() throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(namespace + ".listTopThree");
	}

}
