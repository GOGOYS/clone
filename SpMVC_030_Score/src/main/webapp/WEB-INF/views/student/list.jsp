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

	<ul class="student list">
		<li class="student stnum">학번</li>
		<li class="student stname">이름</li>
		<li class="student stdept">학과</li>
		<li class="student sttel">전화번호</li>
		<li class="student staddr">주소</li>
	</ul>
	<div class="detail-view student body">
		<c:forEach items="${LIST}" var="LIST">
			<ul class="student list detail-view" data-stnum ="${LIST.st_num}">
				<li class="student stnum">${LIST.st_num}</li>
				<li class="student stname">${LIST.st_name}</li>
				<li class="student stdept">${LIST.st_dept}</li>
				<li class="student sttel">${LIST.st_tel}</li>
				<li class="student staddr">${LIST.st_addr}</li>
			</ul>
		</c:forEach>
	</div>
	
</body>
</html>