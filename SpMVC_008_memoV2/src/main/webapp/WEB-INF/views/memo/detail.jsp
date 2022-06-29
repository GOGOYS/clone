<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set value="${pageContext.request.contextPath}" var="rootPath" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Insert title here</title>
<style>

</style>
</head>
<body>
	<div>작성자 : ${MEMO.m_author}</div>
	<div>날짜 : ${MEMO.m_date}</div>
	<div>시간 : ${MEMO.m_time}</div>
	<div>내용 : ${MEMO.m_memo}</div>
	<div>이미지 : <img src="${rootPath}/upload/${MEMO.m_up_image}" alt="${MEMO.m_image}" width="500px"></div>
	<div>아이콘 : <img src="${rootPath}${MEMO.m_icon}" alt="${MEMO.m_icon}" width="500px"></div>
	
	<div>
		<a href="${rootPath}/memo/${MEMO.m_seq}/update">수정</a>
		<a href="${rootPath}/memo/${MEMO.m_seq}/delete">삭제</a>
		<a href="${rootPath}/">홈으로</a>
	</div>
	
</body>
</html>