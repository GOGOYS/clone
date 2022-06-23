package com.callor.ems.service.author;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

/*
 * spring 3.x 이상부터 사용하는 xml을 대신하는 선언 클래스
 * @Configuration : context.xml을 java class로 선언한다 라는 의미
 */
@Configuration
public class AuthorServiceV1 {
	
	/*
	 * context.xml에서 <bean>으로 선언하는 문장을 대신한다
	 * 
	 * context.xml을 만드는 대신 이렇게 만들 java로 대신 만들 수도 있다.
	 */
	@Bean
	public PasswordEncoder passwordEncoder() {
		
		PasswordEncoder encoder = new BCryptPasswordEncoder(4);
		
		return encoder;
	}
}
