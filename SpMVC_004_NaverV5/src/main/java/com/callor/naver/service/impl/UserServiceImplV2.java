package com.callor.naver.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.callor.naver.config.QualifierConfig;
import com.callor.naver.model.UserVO;

import lombok.extern.slf4j.Slf4j;


/*
 * 프로젝트 시작할때 오류가 발생하는 경우
 * No qualifying bean of type '..'
 * 
 * UserService 인터페이스를 사용하여 Bean을 주입받겠다하고 Controller에 선언했다
 * 	1.생성자를 통해서 주입받기
 *  2. Autowired를 사용하여 setter를 주입받기
 *  
 *  어디에도 해당하는 bean을 생성, 선언한 곳이 없을때 
 */

@Slf4j
@Service(QualifierConfig.SERVICE.USER_V2)
public class UserServiceImplV2 extends UserServiceImplV1{
	
	@Autowired
	protected PasswordEncoder passwordEncoder;
	
	@Override
	public int join(UserVO userVO) {
		
		List<UserVO> users = userDao.selectAll();
		if(users == null || users.size() <1) {
			userVO.setRole("ADMIN");
		}else {
			userVO.setRole("GUEST");
		}
		//password 를 암호화 하자
		String planPassword = userVO.getPassword();
		String encPassword = passwordEncoder.encode(planPassword);
		
		//암호화된 password를 다시 Vo에 setting
		userVO.setPassword(encPassword);
		
		//유저 정보를 인서트
		userDao.insert(userVO);
		return 0;
	}
	
	@Override
	public UserVO login(UserVO userVO) {
		String planPassword = userVO.getPassword();
		UserVO loginUser = userDao.findById(userVO.getUsername());
		String encPassword = loginUser.getPassword();
		
		if(passwordEncoder.matches(planPassword, encPassword)) {	
			return loginUser;
		}
		return null;
	}

	
	
}
