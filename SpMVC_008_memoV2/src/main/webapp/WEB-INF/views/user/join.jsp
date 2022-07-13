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

	<div class="join-box">
		<div>
			<h1>회원가입</h1>
		</div>
		<form method="post">
			<label for="id">아이디 : <input id="userid" name="u_userid" placeholder="아이디를 입력해주세요" value=""/></label>
			<label for="password">패스워드 : <input id="password" name="u_password" placeholder="비밀번호를 입력해주세요" value=""/></label>
			<label for="re_password">패스워드 확인 :<input id="re_password" placeholder="비밀번호를 확인해주세요" value=""/></label>
			<label for="email">이메일 :<input id="email" name="u_email" placeholder="이메일을 입력해주세요" value=""/></label>
			<label for="name">닉네임 :<input id="name" name="u_name" placeholder="닉네임을 입력해주세요" value=""/></label>
			<input name="u_role" type="hidden" value="USER"/>
			<button>회원가입</button>
		</form>
	</div>
</body>
</html>