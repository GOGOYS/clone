package com.callor.todo.model;

import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
@ToString
@Builder
public class UserVO {
	
	private String username;
	private String password;
	private boolean enabled;
	private boolean accountNonExpored;
	private boolean accountNonLocked;
	private boolean creadentailsNonExired;
	
	private Collection<? extends GrantedAuthority> authorities;
	
	private String email;
	private String tel;
	private String realname;
	private String nickname;
}
