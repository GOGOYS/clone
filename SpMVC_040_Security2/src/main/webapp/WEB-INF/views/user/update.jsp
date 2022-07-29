<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set value="${pageContext.request.contextPath}" var="rootPath" />
<%@ taglib uri="http://www.springframework.org/tags/form"  prefix="form"%>
<%@ taglib uri="http://www.springframework.org/security/tags"  prefix="sec"%>

<div class="w3-container w3-card-4">
	<form:form class="w3-container">
		<c:if test="${error == 'PASSFAIL'}">
			<div class="w3-text-red">
				* 비밀번호가 불일치합니다. 사용자정보를 다시 입력해주세요
			</div>
		</c:if>
			
		<div class="w3-text-red">사용자 인증 후 개인정보를 변경해 주세요</div>
		<label class="w3-text-blue">USERNAME</label>
			<input readonly="readonly" class="w3-border w3-input"
			value=' <sec:authentication property="principal.username"/>'>
		<label class="w3-text-blue">PASSWORD</label>
			<input name="password" class="w3-border w3-input">
				
		<hr>
		
		<label class="w3-text-blue">EMAIL</label>
			<input name="email" class="w3-border w3-input"
			value=' <sec:authentication property="principal.email"/>'>
		<label class="w3-text-blue">실명</label>
			<input name="realname" class="w3-border w3-input"
			value=' <sec:authentication property="principal.realname"/>'>
		<label class="w3-text-blue">닉네임</label>
			<input name="nickname" class="w3-border w3-input"
			value=' <sec:authentication property="principal.nickname"/>'>
		<label class="w3-text-blue">전화번호</label>
			<input name="tel" class="w3-border w3-input"
			value=' <sec:authentication property="principal.tel"/>'>
		<button class="w3-button w3-blue">수정하기</button>
	</form:form>
</div>    
