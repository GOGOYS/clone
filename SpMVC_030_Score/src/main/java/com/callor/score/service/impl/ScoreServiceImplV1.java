package com.callor.score.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.callor.score.model.ScoreVO;
import com.callor.score.persistance.ScoreDao;
import com.callor.score.service.ScoreService;

@Service
public class ScoreServiceImplV1 implements ScoreService{
	
	private ScoreDao scoreDao;
	public ScoreServiceImplV1(ScoreDao scoreDao) {
		this.scoreDao = scoreDao;
	}
	
	@Override
	public List<ScoreVO> selectAll() {
		// TODO Auto-generated method stub
		return scoreDao.selectAll();
	}

	@Override
	public ScoreVO findById(String id) {
		// TODO Auto-generated method stub
		return scoreDao.findById(id);
	}

	@Override
	public int insert(ScoreVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int update(ScoreVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(String id) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<ScoreVO> findByStNum(String st_num) {
		// TODO Auto-generated method stub
		return scoreDao.findByStNum(st_num);
	}
	

}
