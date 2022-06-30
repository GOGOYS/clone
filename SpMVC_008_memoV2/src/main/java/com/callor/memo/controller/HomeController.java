package com.callor.memo.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.callor.memo.model.MemoDTO;
import com.callor.memo.service.MemoService;
import com.google.gson.JsonObject;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class HomeController {
	
	@Autowired
	private MemoService memoService;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model, HttpSession session) {
		
		String username = (String)session.getAttribute("USERNAME");
		if(!(username == null)) {
			
			List<MemoDTO> memos = memoService.findByAuthor(username);
			model.addAttribute("MEMOS",memos);			
		}
		
		return "home";
	}
	
	
	
}
