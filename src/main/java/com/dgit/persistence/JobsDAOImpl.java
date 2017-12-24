package com.dgit.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dgit.domain.JobsVO;

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

}
