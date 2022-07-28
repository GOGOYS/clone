<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set value="${pageContext.request.contextPath}" var="rootPath" />
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	form.join-form{
		width:60%;
		margin:20px auto;
	}
	
	form.join-from fieldset{
		border: 1px solid green;
		border-radius: 10px;
	}
	
	form.join-form legend{
		text-align: center;
		color: blue;
		font-weight: 500;
	}
	
	form.join-form input,
	form.join-form button{
		display: inline-block;
		width: 80%;
		margin: 5px;
		padding: 8px;
	}
</style>
</head>
<body>

<form:form class="join-from">
	<fieldset>
		<legend>회원가입</legend>
		<input name="username" placeholder="USERNAME">
		<input name="password" placeholder="PASSWORD">
		<button>가입</button>
	</fieldset>
</form:form>

</body>
</html>