package com.callor.app.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.callor.app.Service.MemoService;
import com.callor.app.model.MemoVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping(value="/memo")
public class MemoController {
	
	@Qualifier("serviceV2")
	private MemoService memoService;
	
	public MemoController(MemoService memoService) {
		this.memoService = memoService;
	}
	
	@RequestMapping(value="/memo_write", method=RequestMethod.GET)
	public String memo_write() {
		
		return null;
	}
	@RequestMapping(value="/memo_write", method=RequestMethod.POST)
	public String memo_write(@ModelAttribute("memoVO") MemoVO memoVO, 
			@RequestParam("up_file") MultipartFile file, Model model) {
		
		log.debug("파일 확인해 {}",file.getOriginalFilename());
			
		
		Date date = new Date(System.currentTimeMillis());
		SimpleDateFormat dayFormat = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat timeFormat = new SimpleDateFormat("HH:mm:ss");

		try {
			String fileName = memoService.fileUp(file);
			memoVO.setM_image(fileName);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}


		memoVO.setM_date(dayFormat.format(date));
		memoVO.setM_time(timeFormat.format(date));
		memoService.insert(memoVO);
			
			
		return "redirect:/";
		
	}
	
	@RequestMapping(value="/{memo}/detail")
	public String memo_detail(@PathVariable("memo") int m_seq, Model model ) {
		MemoVO memoVO = memoService.findById(m_seq);
		model.addAttribute("MEMO", memoVO);
		
		return "/memo/memo_detail";
		
	}
	
	@RequestMapping(value = "/update/{m_seq}", method = RequestMethod.GET)
	public String update(@PathVariable("m_seq") int seq, Model model) {
		
		MemoVO memoVO = memoService.findById(seq);
		model.addAttribute("MEMO", memoVO);
		
		log.debug("아아아아아: {}",seq);
		return "/memo/memo_update";
	}

	@RequestMapping(value = "/update/{m_seq}", method = RequestMethod.POST)
	public String update(Model model, 
			@ModelAttribute("memoVO") MemoVO memoVO, 
			@RequestParam("up_file") MultipartFile up_file) {
		
		Date date = new Date(System.currentTimeMillis());
		SimpleDateFormat dayFormat = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat timeFormat = new SimpleDateFormat("HH:mm:ss");

		try {
			String fileName = memoService.fileUp(up_file);
			memoVO.setM_image(fileName);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}


		memoVO.setM_date(dayFormat.format(date));
		memoVO.setM_time(timeFormat.format(date));
		memoService.update(memoVO);
		
		
		return "redirect:/";
	}

	@RequestMapping(value = "/delete/{m_seq}", method = RequestMethod.GET)
	public String delete(@PathVariable int m_seq) {
		
		memoService.delete(m_seq);
		return "redirect:/";
	}
	
	
	@ModelAttribute("memoVO")
	public MemoVO memoVO() {
		return new MemoVO();
	}
}
