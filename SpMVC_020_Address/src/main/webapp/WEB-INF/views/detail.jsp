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
<h1>주소자세히보기</h1>
<table>
	<tr>
		<th>번호</th>
		<th>이름</th>
		<th>전화</th>
		<th>주소</th>
	</tr>
	<tr>
		<td>${VO.a_seq}</td>
		<td>${VO.a_name}</td>
		<td>${VO.a_tel}</td>
		<td>${VO.a_address}</td>
	</tr>
</table>
<a href="${rootPath}/update?seq=${VO.a_seq}">수정하기</a>
<a href="${rootPath}/delete?seq=${VO.a_seq}">삭제하기</a>
<a href="${rootPath}/">처음으로</a>

</body>
</html>