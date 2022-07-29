package com.callor.sec.service.author;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationFailureHandler;
import org.springframework.stereotype.Service;

/*
 * 현재 userDetailsService와 AuthorProvider에서 
 * 인증을 실행하는 중간에 '문제'가 생기면 excaption을 강제로 발생시켰다.
 * '문제' == uaername이 table에 없어가 password가 틀렸거나, enabled 칼럼의 값이 false이거나
 * 이 exception을 custom하여 과정에 만들어진 message를 login화면에 보여주는 일을 수행
 */

@Service("authorFailurHandler")
public class AuthorFailHandlerImpl extends SimpleUrlAuthenticationFailureHandler{

	/*
	 * 컨트롤+쉬프트+s 해서 오버라이트 클릭
	 * 인증과정에서 exception이 발생하면 처리할 이벤트 핸들러
	 * request, response, exception 3개의 매개변수를 가지는 메서드
	 */
	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
			AuthenticationException exception) throws IOException, ServletException {
		
		String exceptionMessage = "";
		String redirectURL = "/user/login?exception=%s";
		if(exception instanceof BadCredentialsException) {
			// exception.getMessage() : BadCredentialsException에 붙어있는 메세지를 가져옴
			exceptionMessage = exception.getMessage();
		}else if(exception instanceof UsernameNotFoundException) {
			exceptionMessage = "회원가입을 먼저 해주세요";
			redirectURL = "/user/join?exception=%s";
		}
		// url을 보내기 위해 UTF-8 방식으로 엔코딩
		exceptionMessage = URLEncoder.encode(exceptionMessage, "UTF-8");
		// %s 부분에 exceptionMessage을 붙여 하나의 URL로 변경
		redirectURL = String.format(redirectURL, exceptionMessage);
		//redirect를 수행하는 method
		setDefaultFailureUrl(redirectURL);
		super.onAuthenticationFailure(request, response, exception);
	}
	
	
}
