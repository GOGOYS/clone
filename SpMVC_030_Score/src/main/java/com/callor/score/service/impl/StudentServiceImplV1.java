package com.callor.score.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.callor.score.model.StudentVO;
import com.callor.score.persistance.StudentDao;
import com.callor.score.service.StudentService;

@Service
public class StudentServiceImplV1 implements StudentService{
	
	private StudentDao studentDao;
	
	public StudentServiceImplV1(StudentDao studentDao) {
		this.studentDao = studentDao;
	}

	@Override
	public List<StudentVO> selectAll() {
		// TODO Auto-generated method stub
		return studentDao.selectAll();
	}

	@Override
	public StudentVO findById(String id) {
		// TODO Auto-generated method stub
		return studentDao.findById(id);
	}

	@Override
	public int insert(StudentVO vo) {
		// TODO Auto-generated method stub
		return studentDao.insert(vo);
	}

	@Override
	public int update(StudentVO vo) {
		// TODO Auto-generated method stub
		return studentDao.update(vo);
	}

	@Override
	public int delete(String id) {
		// TODO Auto-generated method stub
		return studentDao.delete(id);
	}

	@Override
	public StudentVO studentScore(String st_num) {
		// TODO Auto-generated method stub
		return studentDao.studentScore(st_num);
	}

}
