<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<c:set value="${pageContext.request.contextPath}" var="rootPath" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<title>Insert title here</title>

<style>
form {
	display: flex;
	flex-direction: column;
}
</style>

</head>
<body>
	<h1>수정하기</h1>
	<form:form modelAttribute="memoVO" enctype="multipart/form-data">

		<form:input path="m_author" placeholder="m_author" />

		<form:textarea path="m_memo" placeholder="m_memo"></form:textarea>
		<input type="file" name="up_file" accept="image/*" />
		<button>수정하기</button>
	</form:form>
</body>
</html>