<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set value="${pageContext.request.contextPath}" var="rootPath" />
<style>
	
	header{
		background-color: #0f1012;
		color: white;
		text-align: center;
	}
	
	header h1 {
		font-weight: 900;
		text-shadow: 1px 1px 1px black;
		padding:30px 0 20px;
	}
	
	nav ul{
		display: flex;
		list-style: none;
		background-color:  #1f4acc;
		color: white;
	}
	
	nav li{
		padding: 12px 16px;
		margin: 1.5rem;
	}
	
	nav a{
		color: inherit;
		text-decoration:  none;
	}
	
	
	
</style>

<header>
	<h1>주소록 2022-07-20</h1>
</header>
<nav>
	<ul>
		<li>HOME</li>
		<li><a href="${rootPath}/about">About</a></li>
		<li>JOIN</li>
		<li>LOGIN</li>
	</ul>
</nav>