<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set value="${pageContext.request.contextPath}" var="rootPath" />
<%@ taglib uri="http://www.springframework.org/tags/form"  prefix="form"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>로그인 페이지</h1>
	<form:form action="${rootPath}/user/login">
		<c:if test="${error == 'LOGIN_NEED'}">
			<div> * 로그인이 필요한 페이지에 접속 하였습니다.</div>
		</c:if>
		<div><input name="username" placeholder="USERNAME"></div>	
		<div><input name="password" type="password"></div>
		<div><button>로그인</button></div>	
	</form:form>
</body>
</html>