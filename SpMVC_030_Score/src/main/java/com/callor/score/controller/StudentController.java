package com.callor.score.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.callor.score.model.StudentVO;
import com.callor.score.service.StudentService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping(value="/student")
public class StudentController {
	
	private StudentService studentService;
	
	public StudentController(StudentService studentService) {
		this.studentService = studentService;
	}
	

	@RequestMapping(value={"/",""},method=RequestMethod.GET)
	public String home(Model model) {
		
		List<StudentVO> List = studentService.selectAll();
		model.addAttribute("LIST",List);
		
		return "student/list";
	}
	
	@RequestMapping(value="/detail/{stnum}",method=RequestMethod.GET)
	public String detail(@PathVariable("stnum") String st_num, Model model) {
		
		StudentVO stVO = studentService.findById(st_num);
		
		model.addAttribute("STVO",stVO);
		return "student/detail";
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
