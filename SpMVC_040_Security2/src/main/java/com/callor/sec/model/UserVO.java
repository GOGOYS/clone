package com.callor.sec.model;

import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/*
 * Security에서 제공하는 사용자 정보를 담을 VO을 생성한다
 * 여기서 UserDatails 인터페이스를 상속받는다.
 */
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
@Builder
public class UserVO implements UserDetails{

	/**
	 * 
	 */
	private static final long serialVersionUID = -194516452377043730L;
	private String username;
	private String password;
	private boolean enabled;
	private boolean accountNonExpired;
	private boolean accountNonLocked;
	private boolean credentialsNonExpired;
	
	//GrantedAuthority라는 타입으로 List의 상위형인 Collection에 저장
	private Collection<? extends GrantedAuthority> authorities;
	private String email;
	private String tel;
	private String realname;
	private String nickname;




}
