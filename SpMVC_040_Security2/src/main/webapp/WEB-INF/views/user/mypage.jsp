<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set value="${pageContext.request.contextPath}" var="rootPath" />
<%@ taglib uri="http://www.springframework.org/security/tags"  prefix="sec"%>
<div class="w3-container w3-card-4">
	<h1>My Page</h1>
	
	<ul class="w3-text-blue">
		<li>USERNAME : <sec:authentication property="principal.username"/></li>
		<li>EMAIL : <sec:authentication property="principal.email"/></li>
		<li>실명 : <sec:authentication property="principal.realname"/></li>
		<li>닉네임 : <sec:authentication property="principal.nickname"/></li>
		<li>전화번호 : <sec:authentication property="principal.tel"/></li>
	</ul>			
	<a href="${rootPath}/user/update?username=<sec:authentication property="principal.username"/>">
		수정하기
	</a>	
</div>