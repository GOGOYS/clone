<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set value="${pageContext.request.contextPath}" var="rootPath" />
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>마이 페이지</h1>
		<sec:authentication property="principal.username"/>
		<sec:authentication property="principal.email"/>
		<sec:authentication property="principal.realname"/>
		<sec:authentication property="principal.nickname"/>
	
</body>
</html>