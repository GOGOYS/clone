package com.callor.app.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@RequestMapping(value="/user")
@Controller
public class UserController {
	
	@RequestMapping(value="/join", method=RequestMethod.GET)
	public String join() {
		//return "join";
		
		//views/user/join.jsp를 렌더링하여 사용자에게 응답하라
		return null;
	}
	
	/*
	 *@ResponseBody가 붙어 있으면 jsp파일을 열라는것이 아니라
	 *클라이언트에게 바로 데이터를 전송해랏!
	 *
	 * 일반적인 Controoler의 method에서 문자열 또는 null 값을
	 * return하면 *.jsp파일을 rendering하여 응답하는
	 * @ResponseBody가 부착된 controller의 method에서
	 * 문자열을 직접 클라이언트에게 전달하는 것.
	 */
	@ResponseBody
	@RequestMapping(value="/join",method=RequestMethod.POST)
	public String join(String username, String password) {
		
		return username;
	}
}
