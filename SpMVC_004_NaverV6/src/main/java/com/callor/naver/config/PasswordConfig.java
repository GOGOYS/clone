package com.callor.naver.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

/*
 * *-context.xml 파일 대신에 java class를 사용하여 bean 설정하기
 */
@Configuration
public class PasswordConfig {
	@Bean
	public PasswordEncoder passwordencoder() {
		PasswordEncoder encoder = new BCryptPasswordEncoder(4);
		return encoder;
	}
}
