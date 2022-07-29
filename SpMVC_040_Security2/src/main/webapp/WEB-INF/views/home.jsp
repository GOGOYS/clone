<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set value="${pageContext.request.contextPath}" var="rootPath" />
<%@ taglib uri="http://www.springframework.org/tags/form"  prefix="form" %>
<%@ taglib uri="http://www.springframework.org/security/tags"  prefix="sec" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<style>
	nav ul {
		list-style: none;
		display: flex;
		background-color: blue;
		color: white;
	}
	
	nav li {
		padding: 12px 16px;
		margin: 5px;
		cursor: pointer;
	}
	
	nar li:hover{
		box-shadow: 2px 2px 2px yellow;
	}
	
	nav li:nth-of-type(2){
		margin-left: auto;
	}
	
	nav a{
		text-decoration: none;
		color: inherit;
	}
	
	form#logout-from{
		display: none;
	}
</style>

</head>
<body>
<header class="w3-container w3-green w3-text-white">
	<h1>안녕</h1>
	<p> 가장심플 프로젝트</p>
</header>
<nav>
	<ul>
		<li><a href="${rootPath}/">Home</a></li>
		<li><a href="${rootPath}/user/login">로그인</a></li>
		<li><a href="${rootPath}/user/join">회원가입</a></li>
		<sec:authorize access="isAuthenticated()">
			<li class="logout">로그아웃</li>
			<sec:authorize access="hasRole('ROLE_USER')">
			<li><a href="${rootPath}/user/mypage">마이페이지</a></li>
			</sec:authorize>
		</sec:authorize>
		
		<sec:authorize access="hasRole('ROLE_ADMIN')">
			<li><a href="${rootPath}/admin">관리자</a></li>
		</sec:authorize>
	</ul>
</nav>

<section class="w3-container w3-padding-16">
	<c:choose>
		<c:when test="${LAYOUT == 'LOGIN'}">
			<%@ include file="/WEB-INF/views/user/login.jsp" %>
		</c:when>
		<c:when test="${LAYOUT == 'JOIN'}">
			<%@ include file="/WEB-INF/views/user/join.jsp" %>
		</c:when>
		<c:when test="${LAYOUT == 'MYPAGE'}">
			<%@ include file="/WEB-INF/views/user/mypage.jsp" %>
		</c:when>
		<c:when test="${LAYOUT == 'UPDATE'}">
			<%@ include file="/WEB-INF/views/user/update.jsp" %>
		</c:when>
		<c:when test="${LAYOUT == 'ADMINPAGE'}">
			<%@ include file="/WEB-INF/views/admin/page.jsp" %>
		</c:when>
		<c:when test="${LAYOUT == 'ADMINUPDATE'}">
			<%@ include file="/WEB-INF/views/admin/userupdate.jsp" %>
		</c:when>
		<c:otherwise>
			<h1>여기는 홈 화면 입니다</h1>
		</c:otherwise>
	</c:choose>
</section>

	<form:form id="logout-form" action="${rootPath}/logout" method="POST"/>

</body>
<script src="${rootPath}/static/js/admin.js?ver=2022-07-29-004"></script>
<script>
	const rootPath = "${rootPath}";
</script>

<script>
	document.querySelector("li.logout")?.addEventListener("click",()=>{
		document.querySelector("form#logout-form")?.submit()
	})
</script>
</html>