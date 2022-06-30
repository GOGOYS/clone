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

<title>Insert title here</title>
<script>
	const rootPath = "${rootPath}"
</script>

<script src="${rootPath}/static/js/memo.js?ver=2022-06-27-007"></script>

<style>
body {
	background-color: #45AFFF;
}

.container {
	position: fixed;
	top: 40%;
	left: 50%;
	transform: translate(-50%, -50%);
	width: 16%;
	height: 20%;
}

.logo-img img {
	width: 100%;
	margin: 0 auto;
}

.btn{
	width: 100%;
	margin: 0 auto;
	margin-top: 40px;
}

.btn a {
	text-decoration: none;
	color: #fff;
	background-color: #186D94;
	padding: 8px 20px;
	border-radius: 8px;
}
.btn a:first-child {
	margin-left: 26px;
}

.btn a:hover {
	background-color: #fff;
	color:#186D94;
	font-weight: 900;
}
</style>
</head>
<body>

	<div class="container">
		<div class="logo-img">
			<img src="${rootPath}/static/image/logoWhite.png">
		</div>
		<div class="btn">
			<a href="${rootPath}/memo/memo-map">리스트 보기</a>
			<c:if test="${empty USERNAME}">
				<a href="${rootPath}/user/login">로그인하기</a>
			</c:if>
			<c:if test="${not empty USERNAME}">
				<a href="${rootPath}/user/logout">로그아웃하기</a>
			</c:if>
		</div>
	</div>


</body>
</html>