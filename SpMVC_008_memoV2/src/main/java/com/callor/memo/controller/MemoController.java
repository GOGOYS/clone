package com.callor.memo.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.callor.memo.model.MemoDTO;
import com.callor.memo.service.MemoService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping(value="/memo")
public class MemoController {
	
	
	@Autowired
	private MemoService memoService;
	
	@RequestMapping(value="/insert",method=RequestMethod.GET)
	public String insert(@ModelAttribute("memo") MemoDTO memo, HttpSession httpSession) {
		
		String username = (String) httpSession.getAttribute("USERNAME");
		
		if(username == null) {
			return "redirect:/user/login";
		}
		
		memo.setM_author(username);
		return "memo/input";
	}
	
	
	/*
	 * 첨부파일이 있는 프로젝트에서 
	 * form의 file input box의 이름은 절대 VO, DTO에 선언된 이름을 사용하면 안된다.
	 * 타입이 달라서 400 오류가 뜬다.
	 */
	@RequestMapping(value="/insert",method=RequestMethod.POST)
	public String insert(MultipartFile file,@ModelAttribute("memo") MemoDTO memo, HttpSession httpSession) {
		
		//메모를 저장하기 전에 현재 session에 저장된 usename을 가져오기
		String username = (String)httpSession.getAttribute("USERNAME");
		//저장할 메모 정보에 username 세팅
		memo.setM_author(username);
		
		memoService.insertAndUpdate(memo, file);
		log.debug("메모 {}", memo.toString());
		log.debug("파일 {}", file.getOriginalFilename());
		
		return "redirect:/";
	}	
	
	@RequestMapping(value="/{seq}/detail", method=RequestMethod.GET)
	public String detail(@PathVariable("seq") String seq, @ModelAttribute("memo") MemoDTO memo, Model model) {
		
		long m_seq = Long.valueOf(seq);
		
		memo = memoService.findById(m_seq);
		model.addAttribute("MEMO", memo);
		return "memo/detail";
	}
	
	@RequestMapping(value="/{seq}/update", method=RequestMethod.GET)
	public String update(@PathVariable("seq") String seq, Model model) {
		
		//전달 받은 seq에 해당하는 데이터 select
		MemoDTO memo = memoService.findById(Long.valueOf(seq));
		model.addAttribute("MEMO",memo);
		return "memo/input";
	}
	

	@RequestMapping(value="/{seq}/update", method=RequestMethod.POST)
	public String update(@PathVariable("seq") String seq,
			@ModelAttribute("memo") MemoDTO memoDTO, MultipartFile file, HttpSession session) {
		
		long m_seq = Long.valueOf(seq);
		String username = (String)session.getAttribute("USERNAME");
		
		if(username == null) {
			return "redirect:/user/login";
		}
		memoDTO.setM_author(username);
		memoDTO.setM_seq(m_seq);
		memoService.insertAndUpdate(memoDTO, file);
		return String.format("redirect:/memo/%s/detail",seq);
	}
	
	@RequestMapping(value="/{seq}/delete",method=RequestMethod.GET)
	public String delete(@PathVariable("seq") String seq) {
		memoService.delete(Long.valueOf(seq));
		return "redirect:/";
	}
	
	@ModelAttribute("memo")
	private MemoDTO memoDTO() {
		
		Date date = new Date(System.currentTimeMillis());
		SimpleDateFormat toDay = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat toTime = new SimpleDateFormat("HH:mm:SS");
		
		MemoDTO memo = MemoDTO.builder()
					.m_date(toDay.format(date))
					.m_time(toTime.format(date))
					.build();
		
		return memo;
	}
	
}
