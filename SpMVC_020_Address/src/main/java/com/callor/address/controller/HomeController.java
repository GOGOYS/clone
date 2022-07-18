package com.callor.address.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.callor.address.model.AddressVO;
import com.callor.address.service.AddressService;

import lombok.extern.slf4j.Slf4j;


@Slf4j
@Controller
public class HomeController {
	
	private AddressService addrService;
	public HomeController(AddressService addrService) {
		this.addrService = addrService;
	}
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {
		
		List<AddressVO> addr = addrService.selectAll();
		log.debug("마아아:{}",addr.toString());
		
		model.addAttribute("ADDR",addr);

		return "home";
	}
	
	@RequestMapping(value={"/",""},method=RequestMethod.POST)
	public String home(AddressVO addrVO) {
		
		addrService.insert(addrVO);
		
		
		
		return "redirect:/";
	}
	
	@RequestMapping(value="/detail",method=RequestMethod.GET)
	public String detail(@RequestParam(name="seq", required= false, defaultValue="0") String strSeq, Model model) {
		
		log.debug("문자열혈 변수 : {}",strSeq);
		long a_seq = Long.valueOf(strSeq);
		
		AddressVO addr = addrService.findById(a_seq);
		log.debug(addr.toString());
		
		model.addAttribute("VO",addr);
		
		return "/detail";
	}
	
	@RequestMapping(value="/update",method=RequestMethod.GET)
	public String update(@RequestParam(name="seq", required= false, defaultValue="0" ) String strSeq, Model model) {
		long a_seq = Long.valueOf(strSeq);
		
		AddressVO addr = addrService.findById(a_seq);
		
		model.addAttribute("UPADDR",addr);
		
		return "home";
	}
	
}
