# 복습하기

* 프로젝트를 실행하면 가장먼저 web.xml을 읽어서 실행한다.
웹 브라우저에서 요청을 하게되면 톰캣이 요청을 수신 후 DispatcherServlet이 요청을 받는다.
Servlet: 자바에서 서버로 만들어진 어플리케이션
DispatcherServlet이 서버에서 요청을 제일 먼저 받는다.
```
<servlet-mapping>
		<servlet-name>appServlet</servlet-name>
		<url-pattern>/</url-pattern>
	</servlet-mapping>
```
웹브라우저 요청중에 마지막에 "/"로 요청이 오면 appServlet의 값을 참조하여 appServlet이
설정되어 있는 곳에 가서  DispatcherServlet에게 요청을 전달한다.
그 후 servlet-context.xml파일을 읽어 서버를 작동시킨다.

servlet-context.xml파일 안의 component-scan base-package를 읽는다.
기본 베이스 패키지를 다 읽으면 너무 불필요하고 오래걸리기 때문에 읽는 범위를 제한 할 필요가 있다.
```base-package="com.callor.app.controller"```


* ```
<beans:bean class="org.springframework.web.servlet.view.InternalResourceViewResolver">
		<beans:property name="prefix" value="/WEB-INF/views/" />
		<beans:property name="suffix" value=".jsp" />
	</beans:bean>
```
컨트롤러가 문자열을 리턴했을때 InternalResourceViewResolver의 역할은 prefix에 의해서 
리턴한 문자열 앞에 /WEB-INF/views/를 붙이고 suffix에 의해서 .jsp를 붙여서 렌더링을 한 후 html 코드로
변환해서 보여준다.
InternalResourceViewResolver의 역할은 문자열을 받아서 JSP로 리턴하여 렌더링을 해주는 역할


* WEB-INF안에 있는 폴더들은 스프링에서 직접 접근이 어려운 구간
접근할려면 자바 클래스를 통해서 접근해야함
그래서 controller를 통해서  jsp를 접근해야함 왜냐?
jsp에서 핸들링을 하면 서버가 무거워지고 보안에 취약함 MVC2패턴을 해용해 controller로 핸들링



* logback-test.xml
디버그 모드를 할때

```
<logger name="com.callor.hello" level="INFO"  additivity="false">
        <appender-ref ref="STDOUT"/>
    </logger>
```
에 있는 level을 INFO로 바꿔주면 DEBUG를 사용자에게 보여주지 않는다.

* form에 action을 안 입력해도
쵸정한 주소로 자동으로 따라붙는다.

* @ResponseBody가 붙어 있으면 jsp파일을 열라는것이 아니라
클라이언트에게 바로 데이터를 전송해랏!
일반적인 Controoler의 method에서 문자열 또는 null 값을
return하면 .jsp파일을 rendering하여 응답하는
@ResponseBody가 부착된 controller의 method에서
문자열을 직접 클라이언트에게 전달하는 것