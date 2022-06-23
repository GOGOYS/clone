package com.callor.ems.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.callor.ems.model.UserVO;
import com.callor.ems.service.QualifyConfig;
import com.callor.ems.service.SendMailService;
import com.callor.ems.service.UserService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping(value="/user")
public class UserController {
	
	@Autowired
	@Qualifier(QualifyConfig.SERVICE.MAIL_V2)
	private SendMailService xMail;
	
	@Autowired
	private UserService userService;
	
	/*
	 * UserVO를 ModelAttribute로 생성하여 join.jsp에게 보내기
	 * UserVO userVO = new UserVO();를 코드를 대신 실행한다.
	 * 
	 * ModelAttribute로 생성된 userVO는
	 * SessionAttributes에 추가되어 보관된다.
	 */
	@RequestMapping(value="/join",method=RequestMethod.GET)
	public String join(@ModelAttribute("userVO") UserVO userVO, Model model) {
		model.addAttribute("userVO", userVO);
		return null;
	}
	
	@RequestMapping(value="/join",method=RequestMethod.POST)
	public String join(@ModelAttribute("userVO") UserVO userVO) {
		userService.join(userVO);
		return "/user/join_email";
	}
	
	@RequestMapping(value="email_ok")
	public String email_ok() {
	
		return "user/join_email";	
	}
	@RequestMapping(value="email_ok/{email:.*}")
	public String email_ok(@PathVariable("email")String email,
						   @ModelAttribute("userVO") UserVO userVO) {
		
		UserVO emailUserVO = userService.findById(email);
		
		if(emailUserVO == null) {
			return "redirect:/user/join?error=error";
		}
		
		userVO.setUsername(null);
		userVO.setEmail(emailUserVO.getEmail());
		userVO.setPassword(null);
			
		
		log.debug(email);
		
		return "user/join_next";	
	}
	
	/*
	 * 어디선가 UserVo userVO 객체가 필요하면 자동으로 객체를 생성하여 return하는 코드가 실행된다.
	 */
	@ModelAttribute("userVO")
	private UserVO userVO() {
		return new UserVO();
	}
}
