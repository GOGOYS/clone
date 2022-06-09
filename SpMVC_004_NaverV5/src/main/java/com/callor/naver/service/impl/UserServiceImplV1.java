package com.callor.naver.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.expression.spel.ast.QualifiedIdentifier;
import org.springframework.stereotype.Service;

import com.callor.naver.config.QualifierConfig;
import com.callor.naver.model.UserVO;
import com.callor.naver.persistance.UserDao;
import com.callor.naver.service.UserService;

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
@Service(QualifierConfig.SERVICE.USER_V1)
public class UserServiceImplV1 implements UserService{
	
	@Autowired
	protected UserDao userDao;
	
	@Autowired
	@Override
	public void create_user_table() {
		// TODO Auto-generated method stub
		
		try {
			
			userDao.create_user_table();
			log.debug("USERTABLE OK");
		} catch (Exception e) {
			// TODO: handle exception
			log.debug("USERTABLE ERROR");
		}
	}

	@Override
	public List<UserVO> findByName(String name) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<UserVO> findByNickName(String nickName) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<UserVO> findByEmail(String email) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<UserVO> selectAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public UserVO findById(String id) {
		// TODO Auto-generated method stub
		
		return userDao.findById(id);
	}

	@Override
	public int insert(UserVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int update(UserVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(String id) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public UserVO login(UserVO userVO) {
		// TODO Auto-generated method stub
		UserVO loginUser = userDao.findById(userVO.getUsername());
		
		if(loginUser != null && loginUser.getPassword().equals((userVO.getPassword()))) {
				return loginUser;
		}
		return null;
	}

	/*
	 * 최초로 회원가입을 하는 유저는 어드민 권한을 부여하고
	 * 그 외에는 유저권한을 부여하겠다.
	 */
	@Override
	public int join(UserVO userVO) {
		/*
		 * 가입 요청한 정보가 최초인지 검사하여 최초로 가입 요청을
		 * 한 것이면, 현재 사용자의 role 정보를 ADMIN으로 설정한다.
		 */
		
		List<UserVO> users = userDao.selectAll();
		
		if(users == null || users.size()<1) {
			userVO.setRole("ADMIN");
		}else {
			userVO.setRole("GUEST");
		}
		
		int ret= userDao.insert(userVO);
		return ret;
		
	}

	
}
