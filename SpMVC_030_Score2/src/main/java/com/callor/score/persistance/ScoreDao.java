package com.callor.score.persistance;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.callor.score.model.ScoreUpdateVO;
import com.callor.score.model.ScoreVO;

public interface ScoreDao extends GenericDao<ScoreVO, String>{
	
	public List<ScoreVO> findByStNum(String st_num);
	
	
	//다수의 데이터를 내려보낼때는 @param("변수이름")
	public int updateScoreArray(
			@Param("st_num") String st_num, 
			@Param("sb_code")String sb_code,
			@Param("sc_score")String sc_score);

	public int updateScore(ScoreUpdateVO score);
	
	
}
