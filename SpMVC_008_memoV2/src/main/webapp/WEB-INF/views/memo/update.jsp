<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set value="${pageContext.request.contextPath}" var="rootPath" />

<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/include/head.jsp" %>
<style>
* {
	box-sizing: border-box;
	margin: 0;
	padding: 0;
}

html {
	width: 100vw;
	height: 100vh;
}

body {
	width: 100%;
	height: 100%;
	display: flex;
	justify-content: center;
	align-items: center;
}

form {
	width: 50%;
	text-align: center;
}

input {
	padding: 1rem;
	width: 100%;
}
</style>
</head>
<body>
	<form method="POST" enctype="multipart/form-data">
		<input name="m_seq" type="hidden" value='<c:out value="${MEMO.m_seq}" default="0"/>'/>
		<input name="m_title" placeholder="제목을 입력하세요"  value="${MEMO.m_title}"/>
		<input name="m_memo" placeholder="메모를 입력하세요" value="${MEMO.m_memo}"/> 
		<input name="m_mapx" type="hidden" value="${MEMO.m_mapx}"/> 
		<input name="m_mapy" type="hidden" value="${MEMO.m_mapy}"/> 
		<input name="m_icon" type="hidden" value="${MEMO.m_icon}"/> 
		<input name="file" type="file" accept="image/*"/>
		<button>메모 기록</button>
	</form>

</body>
</html>