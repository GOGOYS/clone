package com.callor.memo.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.callor.memo.model.MemoDTO;
import com.callor.memo.model.WeatherVO;
import com.callor.memo.service.MemoService;
import com.callor.memo.service.WeatherService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping(value="memo/map")
public class MemoController {
	
	
	@Autowired
	private MemoService memoService;
	@Autowired
	private WeatherService weatherService;
	
	@RequestMapping(value={"","/","/all"},method=RequestMethod.GET)
	public String map(@ModelAttribute("memo") MemoDTO memo, HttpSession httpSession, Model model)throws IOException  {
		
		String username = (String) httpSession.getAttribute("USERNAME");
		
		if(username == null) {
			return "redirect:/user/login";
		}
		
		memo.setM_author(username);
		
		List<MemoDTO> memoList = memoService.findByAuthor(username);
		
		List<String> mapx = new ArrayList<String>();
		List<String> mapy = new ArrayList<String>();
		
		for(int i=0; i < memoList.size(); i++) {
			
			mapx.add(memoList.get(i).getM_mapx());
			mapy.add(memoList.get(i).getM_mapy());
		}		
		JSONArray arrayX = new JSONArray(mapx);
		JSONArray arrayY = new JSONArray(mapy);
		

		//log.debug(mapXY.toString());
		
		model.addAttribute("mapX",arrayX);
		model.addAttribute("mapY",arrayY);
		model.addAttribute("MEMOS",memoList);
		
		
		WeatherVO weatherVO = weatherService.getWeather();
		String rnYn = weatherService.getRNYN(weatherVO);
		
		model.addAttribute("rnYn",rnYn);
		
		return "/memo/map";
	}
	
	@RequestMapping(value={"/public"},method=RequestMethod.GET)
	public String okPublic(@ModelAttribute("memo") MemoDTO memo, HttpSession httpSession, Model model) {
		
		List<MemoDTO> memoList = memoService.findByPersonal("OK");
		
		List<String> mapx = new ArrayList<String>();
		List<String> mapy = new ArrayList<String>();
		
		for(int i=0; i < memoList.size(); i++) {
			
			mapx.add(memoList.get(i).getM_mapx());
			mapy.add(memoList.get(i).getM_mapy());
		}		
		JSONArray arrayX = new JSONArray(mapx);
		JSONArray arrayY = new JSONArray(mapy);
		

		//log.debug(mapXY.toString());
		
		model.addAttribute("mapX",arrayX);
		model.addAttribute("mapY",arrayY);
		model.addAttribute("MEMOS",memoList);
		
		return "/memo/map";
	}
	
	
	/*
	 * ??????????????? ?????? ?????????????????? 
	 * form??? file input box??? ????????? ?????? VO, DTO??? ????????? ????????? ???????????? ?????????.
	 * ????????? ????????? 400 ????????? ??????.
	 */
	@RequestMapping(value={"","/","/all","/public"},method=RequestMethod.POST)
	public String insert(@ModelAttribute("memo") MemoDTO memo,
			 			 MultipartFile file, HttpSession httpSession) {
		
		//????????? ???????????? ?????? ?????? session??? ????????? usename??? ????????????
		String username = (String)httpSession.getAttribute("USERNAME");
		//????????? ?????? ????????? username ??????
		memo.setM_author(username);
		log.debug(file.getOriginalFilename());
		
		
		memoService.insertAndUpdate(memo, file);
		
		return "redirect:/memo/map";
	}	
	
	@RequestMapping(value="/detail/{seq}", method=RequestMethod.GET)
	public String detail(@PathVariable("seq") String seq, @ModelAttribute("memo") MemoDTO memo, Model model) {
		
		long m_seq = Long.valueOf(seq);
		
		memo = memoService.findById(m_seq);
		model.addAttribute("MEMO", memo);
		return "memo/detail";
	}
	
	@RequestMapping(value="/{seq}/update", method=RequestMethod.GET)
	public String update(@PathVariable("seq") String seq, Model model) {
		
		//?????? ?????? seq??? ???????????? ????????? select
		MemoDTO memo = memoService.findById(Long.valueOf(seq));
		model.addAttribute("MEMO",memo);
		return "memo/update";
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
		return String.format("redirect:/memo/map/%s/detail",seq);
	}
	
	@RequestMapping(value="/{seq}/delete",method=RequestMethod.GET)
	public String delete(@PathVariable("seq") String seq) {
		memoService.delete(Long.valueOf(seq));
		return "redirect:/memo/map";
	}
	
	@RequestMapping(value="/find/{static}/{image}/{png:.+}",method=RequestMethod.GET)
	public String iconChoice(@PathVariable("static") String root,
							 @PathVariable("image") String image,
							 @PathVariable("png") String png, Model model) {
		
		String icon = "/"+ root + "/"+ image + "/" +png;
		
		List<MemoDTO> memoList =memoService.findByIcon(icon);
				
		List<String> mapx = new ArrayList<String>();
		List<String> mapy = new ArrayList<String>();
		
		for(int i=0; i < memoList.size(); i++) {
			
			mapx.add(memoList.get(i).getM_mapx());
			mapy.add(memoList.get(i).getM_mapy());
		}		
		JSONArray arrayX = new JSONArray(mapx);
		JSONArray arrayY = new JSONArray(mapy);
		
		
		model.addAttribute("mapX",arrayX);
		model.addAttribute("mapY",arrayY);
		model.addAttribute("MEMOS",memoList);
		return "/memo/map";
		
	}
	
	@RequestMapping(value={"/find/{static}/{image}/{png:.+}"},method=RequestMethod.POST)
	public String pInsert(@PathVariable("static") String root,
			 			  @PathVariable("image") String image,
			 			  @PathVariable("png") String png,
			 			  MultipartFile file,@ModelAttribute("memo") MemoDTO memo, HttpSession httpSession) {
		
		String icon = "/"+ root + "/"+ image + "/" +png;
		
		//????????? ???????????? ?????? ?????? session??? ????????? usename??? ????????????
		String username = (String)httpSession.getAttribute("USERNAME");
		//????????? ?????? ????????? username ??????
		memo.setM_author(username);
		
		
		memoService.insertAndUpdate(memo, file);
		
		return "redirect:/memo/map/find"+icon;
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
