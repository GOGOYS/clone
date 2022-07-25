package com.callor.score.persistance;

import com.callor.score.model.StudentVO;

public interface StudentDao extends GenericDao<StudentVO, String>{
	
	public StudentVO studentScore(String st_num);
}
