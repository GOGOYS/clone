package com.callor.todo.controller;

import java.security.Principal;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.callor.todo.model.UserVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping(value="/user")
public class UserController {
	
	@RequestMapping(value="/login",method=RequestMethod.GET)
	public String login() {
		return "/user/login";
	}
	
	@RequestMapping(value="/join",method=RequestMethod.GET)
	public String join() {
		return "/user/join";
	}
	
	@RequestMapping(value="/join",method=RequestMethod.POST)
	public String join(@ModelAttribute UserVO userVO) {
		
		log.debug("회원가입 : {} {}",userVO, userVO);
		log.debug("회원가입 : " + userVO.toString());
		
		return "/user/join";
	}
	
	@PreAuthorize("hasAnyRole(['ROLE_USER','ROLE_ADMIN'])")
	@RequestMapping(value="/mypage",method=RequestMethod.GET)
	public String mypage(Principal principal) {
		String username = principal.getName();
		return "/user/mypage";
	}	
}
