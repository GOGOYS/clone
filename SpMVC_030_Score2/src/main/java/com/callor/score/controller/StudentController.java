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
		
		return "student/input";
	}
	
	/*
	 * student/update?st_num=S0001로 input form에서 
	 * 저장버튼을 클릭했을때 form에 action이 설정되어 있지 않기때문에
	 * POST 전송도 같은 주소로 요청이 된다.
	 * 이때, 주소창에 st_num=S0001이라는 주소가 설정되어 있기때문에
	 * form에 st_num항목을 설정하지 않아도 StudentVO의 st_num 항목이
	 * 자동으로 담기게 된다.
	 */
	@RequestMapping(value="/update",method=RequestMethod.POST)
	public String update(StudentVO stVO, Model model) {
		studentService.update(stVO);

		String retStr = String.format("redirect:/student/detail?st_num=%s", stVO.getSt_num());
		return retStr;
	}
	
	@RequestMapping(value="/update_score",method=RequestMethod.GET)
	public String updateScore(String st_num,Model model) {
		StudentVO stVO = studentService.findById(st_num);
		
		List<ScoreVO> scList = stVO.getScoreList();
		
		model.addAttribute("STVO",stVO);
		return "student/input_score";
	}
	@RequestMapping(value="/update_score",method=RequestMethod.POST)
	public String updateScore(String st_num,
			String kor,
			String db, 
			String art, 
			String soft, 
			String math, 
			String eng,
			String music,Model model) {
		
		StudentVO stVO = studentService.findById(st_num);
		List<ScoreVO> scList = stVO.getScoreList();
		
		scList.get(0).setSc_score(kor);
		scoreService.update(scList.get(0));
		scList.get(1).setSc_score(db);
		scoreService.update(scList.get(1));
		scList.get(2).setSc_score(art);
		scoreService.update(scList.get(2));
		scList.get(3).setSc_score(soft);
		scoreService.update(scList.get(3));
		scList.get(4).setSc_score(math);
		scoreService.update(scList.get(4));
		scList.get(5).setSc_score(eng);
		scoreService.update(scList.get(5));
		scList.get(6).setSc_score(music);
		scoreService.update(scList.get(6));

		
		model.addAttribute("STVO",stVO);
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
