package com.callor.score.service;

import java.util.List;

import com.callor.score.model.ScoreVO;
import com.callor.score.persistance.ScoreDao;

public interface ScoreService extends ScoreDao{
	
	public int updateScore(String st_num, String[] sb_code, String[] sc_score);
}
