<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
/* core tag 라이브러리, c tag 라이브러리
	JSP 파일에서 controller부터 전달받은 데이터를 취급하기 위하여
	사용하느 확장 tag 라이브러리
	주로 사용하는 것forEach, if, choose, set
*/
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set value="${pageContext.request.contextPath}" var="rootPath" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>반갑습니다</h1>
	<h2>${NATION}</h2>
	<form method="POST" action="${rootPath}/">
		<input name="nation" placeholder="국가이름" />
		<input name="age" placeholder="나이" />
		<button>전송하기</button>
	</form >

</body>
</html>