package com.callor.naver.persistance;

import java.util.List;

import com.callor.naver.model.UserVO;

public interface UserDao extends GenericDao<UserVO, String>{
	
	public List<UserVO> findByName(String name);
	public List<UserVO> findByNickName(String nickName);
	
	/*
	 * username, password찾기에서 email을 활용하는 경우가 많기 때문에
	 * Email 칼럼을 UNIQUE로 설정하는 경우가 많다
	 * DB 의 칼럼이 UNIQUE라면 칼럼을 조건으로 SELECT를 했을때
	 * LIST가 아닌 VO가 추출될 것이다.
	 * 그렇다면 굳이 method의 return type을  LIST<VO>할 필요 없다
	 */
	public List<UserVO> findByEmail(String email);
	
	public void create_user_table();
}
