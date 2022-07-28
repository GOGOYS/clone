package com.callor.score.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.callor.score.model.ScoreUpdateVO;
import com.callor.score.model.StudentVO;
import com.callor.score.service.ScoreService;
import com.callor.score.service.StudentService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping(value = "/score")
public class ScoreController {

	private final StudentService stService;
	private final ScoreService scService;

	
	
	public ScoreController(StudentService stService, ScoreService scService) {
		this.stService = stService;
		this.scService = scService;
	}

	@RequestMapping(value="/update",method=RequestMethod.GET)
	public String update(String st_num,Model Model) {
		StudentVO student = stService.findById(st_num);
		Model.addAttribute("STVO",student);
		return "score/input";
	}
	
	/*
	 * 한개의 form에 다수의 input가 존재할 경우 같은이름으로 존재할 경우
	 * 컨트롤러에서 문자열 배열로 데이터를 받는다
	 */
	@RequestMapping(value="/update",method=RequestMethod.POST)
	public String update(ScoreUpdateVO score) {
		log.debug(score.toString());
		
		scService.updateScore(score);
		return "redirect:/student/detail_st_num" +score.getSt_num();
	}
	
	
	
	
	public String update(String st_num, String [] sb_code, String [] sc_score) {
		
		for(int i = 0; i  < sb_code.length; i++) {
			log.debug("받은 것 {} {} {}",st_num, sb_code[i],sc_score[i]);
		}
		
		scService.updateScore(st_num, sb_code, sc_score);
		return "redirect:/student/detail?st_num=" +st_num;
	}

}
