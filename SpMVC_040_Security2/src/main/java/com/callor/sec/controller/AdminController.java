package com.callor.sec.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.callor.sec.model.UserVO;
import com.callor.sec.service.AdminService;
import com.callor.sec.service.UserService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping(value="/admin")
public class AdminController {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private AdminService adminService;
	
	@RequestMapping(value={",",""},method=RequestMethod.GET)
	public String adminPage(Model model) {
		
		List<UserVO> userList =userService.selectAll();
		
		model.addAttribute("USERLIST", userList);
		
		model.addAttribute("LAYOUT", "ADMINPAGE");
		return "home";
	}
	
	@RequestMapping(value="/userupdate",method=RequestMethod.GET)
	public String adminUpdate(String username,String error,Model model) {
		UserVO userVO = userService.findById(username);
		
		model.addAttribute("USER",userVO);
		model.addAttribute("error",error);
		model.addAttribute("LAYOUT","ADMINUPDATE");
		return "home";
	}
	
	@RequestMapping(value="/userupdate",method=RequestMethod.POST)
	public String userUpdate(UserVO userVO, Principal principal,  Model model) {
		/*
		 * Srping Security에서 로그인에 성공하면
		 * Principal이라는 class controller에서만 사용가능
		 * Principal.getName()를 실행하면 로그인한 사용자의 username을 추출가능
		 */
		String admin = principal.getName();
		log.debug("PR Name {}",admin);
		
		int ret = adminService.update(userVO, admin);
		if(ret < 0) {
			return String.format("redirect:/admin/userupdate?username=%s&error=ADMINPASSFAIL", userVO.getUsername());
		}
		
		return "redirect:/admin";
	}
}
