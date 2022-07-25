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
	<input name="st_name" placeholder="이름을 입력해주세요" value="${STVO.st_name}"/>
	<input name="st_dept" placeholder="학과를 입력해주세요" value="${STVO.st_dept}"/>
	<input name="st_grade" type="hidden" value="${STVO.st_grade}"/>
	<input name="st_tel" placeholder="전번을 입력해주세요" value="${STVO.st_tel}"/>
	<input name="st_addr" placeholder="주소를 입력해주세요" value="${STVO.st_addr}"/>
	<button type="submit" >저장</button>
</form>

</body>
</html>