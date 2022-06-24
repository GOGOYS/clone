<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form"  prefix="form"%>
<c:set value="${pageContext.request.contextPath}" var="rootPath" />    
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<title>Insert title here</title>

<style>
	form{
		display: flex;
		flex-direction: column;
	}
</style>

</head>
<body>
	<h1>메모장 프로젝트</h1>
	
	<form:form modelAttribute="memoVO" enctype="multipart/form-data">
		<form:input path="m_author" placeholder="이메일을 입력해주세요"/>
		<form:input path="m_date" type="hidden"/>
		<form:input path="m_time" type="hidden"/>
		<form:textarea path="m_memo" rows="10" cols="10"/>
		<input name="up_file" type="file"/>
		<button type="submit">작성하기</button>
	</form:form>
</body>
</html>