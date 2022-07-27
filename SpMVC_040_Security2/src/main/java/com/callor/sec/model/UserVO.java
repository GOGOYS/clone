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

	private String username;
	private String password;
	private boolean isAccountNonExpired;
	private boolean isAccountNotLocked;
	private boolean isCredentailsNonExpired;
	
	private Collection<? extends GrantedAuthority> authorites;

}
