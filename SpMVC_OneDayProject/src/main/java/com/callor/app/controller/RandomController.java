package com.callor.app.controller;

import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.callor.app.Service.MemoService;
import com.callor.app.model.MemoVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping(value="/random")
public class RandomController {
	
	@Autowired
	private MemoService memoService;
	
	
	@RequestMapping(value={"","/"}, method=RequestMethod.GET)
	public String random(Model model) {
		
		List<MemoVO> memoVO = memoService.selectAll();
		
		Collections.shuffle(memoVO);
		
		model.addAttribute("MEMO",memoVO.get(0));
		
		System.out.println("랜덤"+memoVO.get(0));
		return "/choice";
	}
	
	@RequestMapping(value = "/delete/{m_seq}", method = RequestMethod.GET)
	public String delete(@PathVariable int m_seq) {
		
		memoService.delete(m_seq);
		return "redirect:/";
	}
	
}
