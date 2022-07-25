package com.callor.score.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.callor.score.model.ScoreVO;
import com.callor.score.model.StudentVO;
import com.callor.score.model.SubjectVO;
import com.callor.score.service.ScoreService;
import com.callor.score.service.StudentService;
import com.callor.score.service.SubjectService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping(value="/student")
public class StudentController {
	
	private final StudentService studentService;
	private final ScoreService scoreService;
	private final SubjectService subjectService; 
	
	public StudentController(StudentService studentService,ScoreService scoreService,SubjectService subjectService) {
		this.studentService = studentService;
		this.scoreService = scoreService;
		this.subjectService = subjectService;
	}
	

	@RequestMapping(value={"/",""},method=RequestMethod.GET)
	public String home(Model model) {
		
		List<StudentVO> List = studentService.selectAll();
		model.addAttribute("LIST",List);
		
		return "student/list";
	}
	
	@RequestMapping(value="/detail",method=RequestMethod.GET)
	public String detail(String st_num, Model model) {
		
		StudentVO stVO = studentService.findById(st_num);
		
		
		model.addAttribute("STVO",stVO);
		return "student/detail";
	}
	
	@RequestMapping(value="/update",method=RequestMethod.GET)
	public String update(String st_num, Model model) {
		StudentVO stVO = studentService.findById(st_num);
		
		model.addAttribute("STVO",stVO);
		return null;
	}
	
	@RequestMapping(value="/update",method=RequestMethod.POST)
	public String update(StudentVO stVO, Model model) {
		studentService.update(stVO);
		log.debug(stVO.getSt_addr());
		log.debug(stVO.getSt_num());
		
		return "redirect:/student";
	}
	
	//JSON Type으로 return
		// 학생 리스트를 return하기 위해 public List<StudentVO> home()   
	@ResponseBody
	@RequestMapping(value="/json",method=RequestMethod.GET)
	public List<StudentVO> home() {
			
		List<StudentVO> list = studentService.selectAll();
		
		return list;
	}
}
