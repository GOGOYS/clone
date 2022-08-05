<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set value="${pageContext.request.contextPath}" var="rootPath" />
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/security/tags"  prefix="sec" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>나.투.리</h1>
	<sec:authorize access="isAnonymous()">
		<h3>
			<a href="${rootPath}/login">로그인</a>
		</h3>
		<h3>
			<a href="${rootPath}/user/join">회원가입</a>
		</h3>
	</sec:authorize>
	<sec:authorize access="isAuthenticated() AND hasRole('ROLE_ADMIN')">
		<h3><a href="${rootPath}/admin/home">관리자페이지</a></h3>
	</sec:authorize>
	<sec:authorize access="isAuthenticated() AND hasRole('ROLE_USER')">
		<h3>
			<a href="${rootPath}/user/mypage">마이페이지</a>
		</h3>
		<h3>
			<form:form action="${rootPath}/logout">
				<button>로그아웃</button>
			</form:form>
		</h3>
	</sec:authorize>

</body>
</html>