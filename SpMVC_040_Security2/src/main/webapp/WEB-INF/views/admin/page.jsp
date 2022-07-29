<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set value="${pageContext.request.contextPath}" var="rootPath" />
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>여기는 어드민 페이지</h1>

<table class="w3-table w3-table-all username" >
	<thead>
		<tr>
			<th>아이디</th>
			<th>이메일</th>
			<th>실명</th>
			<th>닉네임</th>
			<th>전화번호</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${USERLIST}" var="USER">
			<tr data-user="${USER.username}">
				<td >${USER.username}</td>
				<td>${USER.email}</td>
				<td>${USER.realname}</td>
				<td>${USER.nickname}</td>
				<td>${USER.tel}</td>
			</tr>
		</c:forEach>
	</tbody>
</table>

</body>
</html>