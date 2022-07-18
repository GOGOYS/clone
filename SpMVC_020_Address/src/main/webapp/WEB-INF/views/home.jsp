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
	<form method="POST">
		<input name="a_seq" type="hidden" value="<c:out value='${UPADDR.a_seq}' default='0'/>">
		<input name="a_name" placeholder="이름 입력" value="${UPADDR.a_name}">
		<input name="a_tel" placeholder="전화번호 입력" value="${UPADDR.a_tel}">
		<input name="a_address" placeholder="주소 입력" value="${UPADDR.a_address}">
		<button>저장</button>
	</form>
	<table>
		<thead>
			<tr>
				<th>번호</th>
				<th>이름</th>
				<th>번호</th>
				<th>주소</th>
			</tr>
		</thead>
		<c:forEach items="${ADDR}" var="ADDR">
				<tr>
					<td><a href="${rootPath}/detail?seq=${ADDR.a_seq}">${ADDR.a_seq}</a></td>
					<td>${ADDR.a_name}</td>
					<td>${ADDR.a_tel}</td>
					<td>${ADDR.a_address}</td>
				</tr>
		</c:forEach>	
	</table>
</body>
</html>