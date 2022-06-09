<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set value="${pageContext.request.contextPath}" var="rootPath" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<style>
	form.login{
		width: 60%;
		margin: 10px auto;
		padding: 10px;
	}
	
	form.login input, form.login button{
		margin: 10px;
	}
</style>
<script src="${rootPath}/static/js/login.js?ver=2022-06-09-005"></script>
</head>
<body>
	<form method="POST" class="w3-container w3-card-4 login">
		<h2 class="w3-text-blue">로그인</h2>
		<c:if test="${error == 'LOGIN_NEED'}">
			<div class="w3-red w3-padding-16 w3-margin-left-16">* 로그인이 필요한 서비스 입니다.</div>
		</c:if>
		<c:if test="${error == 'USERNAME FAIL'}">
			<div class="w3-red w3-padding-16 w3-margin-left-16">* 아이디가 없습니다. 회원가입을 먼저 하세요.</div>
		</c:if>
		<c:if test="${error == 'PASSWORD FAIL'}">
			<div class="w3-red w3-padding-16 w3-margin-left-16">* 비밀번호가 틀렸습니다.</div>
		</c:if>
		
		<label class="w3-text-blue"><strong>USER NAME(ID)</strong></label>
		<input name="username" class="w3-input w3-border" placeholder="USERNAME">
		<label class="w3-text-blue"><strong>PASSWORD</strong></label>
		<input name="password" class="w3-input w3-border" placeholder="PASSWORD">
		<button type="button" class="w3-button w3-green btn-login">로그인</button>
	</form>
</body>
</html>