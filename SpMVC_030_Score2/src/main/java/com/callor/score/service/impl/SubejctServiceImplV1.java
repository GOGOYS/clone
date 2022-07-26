package com.callor.score.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.callor.score.model.SubjectVO;
import com.callor.score.persistance.SubjectDao;
import com.callor.score.service.SubjectService;

@Service
public class SubejctServiceImplV1 implements SubjectService{
	
	private SubjectDao subjectDao;
	
	public SubejctServiceImplV1(SubjectDao subjectDao) {
		this.subjectDao = subjectDao;
		// TODO Auto-generated constructor stub
	}

	@Override
	public List<SubjectVO> selectAll() {
		// TODO Auto-generated method stub
		return subjectDao.selectAll();
	}

	@Override
	public SubjectVO findById(String id) {
		// TODO Auto-generated method stub
		return subjectDao.findById(id);
	}

	@Override
	public int insert(SubjectVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int update(SubjectVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(String id) {
		// TODO Auto-generated method stub
		return 0;
	}
	

}
