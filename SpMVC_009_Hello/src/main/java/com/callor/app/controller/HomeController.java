package com.callor.app.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.extern.slf4j.Slf4j;

/*
 * Spring아 HomeContoller 클래스를 객체로 생성하여
 * 콘테이너에 보관해달라
 */
@Slf4j
@Controller
public class HomeController {	
	
	/*
	 * http://localhost:8080/hello/ GET으로 요청이 들어오면
	 * /WEB-INF/views/home.jsp파일을 렌더링하여 
	 * HTML 코드로 변환한 후 응답하라
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {
		
		/* model 객체
		 * jsp파일을 rendering 할때 데이터를 보내는 도구
		 * 
		 * NATION이라는 이름의 변수에 '대한민국'문자열을 담아서
		 * JSP에게 보내겠다.
		 */
		model.addAttribute("NATION","대한민국");
		return "home";
	}
	
	/*
	 * form을 통해 입력한 데이터를 보내면 
	 * method의 매개변수를 통하여 데이터를 수신한다.
	 * form 두개의 input box가 있고
	 * 각각 name 속성이 nation, age로 설정되어 있다.
	 * 각각 name 속성이 변수로 변환되어 controller의 method로 전달된다.
	 */
	@RequestMapping(value="/", method=RequestMethod.POST)
	public String home(String nation, String age) {
		log.debug("국가명 :{}", nation);
		log.debug("나이 :{}", age);
		return "home";
	}
	
}
