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
	<div>
		<div>${STVO.st_num}</div>
		<div>${STVO.st_name}</div>
		<div>${STVO.st_dept}</div>
		<div>${STVO.st_tel}</div>
		<div>${STVO.st_addr}</div>
	</div>

</body>
</html>