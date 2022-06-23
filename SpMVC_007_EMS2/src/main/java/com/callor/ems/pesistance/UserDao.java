package com.callor.ems.pesistance;

import com.callor.ems.model.UserVO;

/*
 * Generic type의 상속
 * Generic 인터페이스를 상속하면서 실제 사용할 type을 명시해 주면
 * 마치 새로운 코드를 복제하면서 type을 지정하는 효과를 발휘한다.
 */
public interface UserDao extends GenericDao<UserVO, String>{
	
	public void create_user_table();

}
