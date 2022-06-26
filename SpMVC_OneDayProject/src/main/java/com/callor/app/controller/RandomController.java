package com.callor.app.controller;

import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.callor.app.Service.MemoService;
import com.callor.app.model.MemoVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class RandomController {
	
	@Autowired
	private MemoService memoService;
	
	
	@RequestMapping(value="/random", method=RequestMethod.GET)
	public String random() {
		
		List<MemoVO> memoVO = memoService.selectAll();
		
		Collections.shuffle(memoVO);
		
		System.out.println("랜덤"+memoVO.get(0));
		return "home";
	}
}
