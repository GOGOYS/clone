package com.callor.app.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.callor.app.Service.MemoService;
import com.callor.app.model.MemoVO;

import lombok.extern.slf4j.Slf4j;


@Slf4j
@Controller
public class HomeController {
	
	private final MemoService memoService;
	
	public HomeController(MemoService memoService) {
		this.memoService = memoService;
	}
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {
		
		List<MemoVO> memoList = memoService.selectAll();
		log.debug(memoList.toString());
		
		model.addAttribute("MEMO", memoList);
		
		return "home";
	}
	
}
