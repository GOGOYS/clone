<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form"  prefix="form"%>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<c:set value="${pageContext.request.contextPath}" var="rootPath" />    
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<title>Insert title here</title>

</head>
<body>
	<form:form modelAttribute="userVO">
		<h1>회원가입</h1>
		<form:input path="email"/>
		<form:input path="key" placeholder="인증키"/>
		<c:if test="${not empty  error}"><p>인증키가 잘못되었습니다.</p>
		</c:if>
		<form:input path="username" placeholder="username"/>
		<form:input path="password" type="password"/>
		<input name="re_password" id="re_password"/>
		<form:input path="name"/>
		<button>회원가입</button>
	</form:form>
	
</body>
</html>