<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set value="${pageContext.request.contextPath}" var="rootPath" />
<%@ taglib uri="http://www.springframework.org/tags/form"  prefix="form"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	*{	
		box-sizing: border-box;
		padding: 0;
		margin: 0;
	}
	h1{
		margin: 0 auto;
	}
	form{
		display: flex;
		flex-direction: column;
		margin: 10px 30px;
	}
</style>
</head>
<body>
	<h1>회원가입 페이지</h1>
	<form:form>
		<label>유저이름 : </label><input name="username" placeholder="USERNAME"/>
		<label>비밀번호 : </label><input name="password" type="password"/>
		<label>비밀번호 확인 : </label><input name="re_password" type="password"/>
		<label>이메일 : </label><input name="email" placeholder="EMAIL"/>
		<label>실명 :</label><input name="realname" placeholder="REALNAME"/>
		<label>가명 :</label><input name="nickname" placeholder="NICKNAME"/>
		<button>가입</button>
	</form:form>
	
</body>
</html>