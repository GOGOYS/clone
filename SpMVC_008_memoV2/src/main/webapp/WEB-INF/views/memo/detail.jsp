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
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/js/all.min.js"></script>
<title>Insert title here</title>
<style>

body{
	background-color: #45AFFF;
	overflow-y: scroll;
}
div.container-box {
	margin: 0 auto;
	margin-top:100px;
	width: 800px;
	background-color: #fff;
	border-radius: 12px;
}

div.detail-info{
	width: 720px;
	margin: 20px auto 0;
}
div.detail-author{
	font-size: 24px;
	padding-bottom:2px;
}
div.detail-inner1{
	border-bottom:1px solid #aaa;
	display: flex;
	justify-content: space-between;
	padding-top:20px;
}

div.detail-inner2{
	display: flex;
	justify-content: space-between;
	margin-top:10px;
}

div.detail-title{
	display: inline-block;
	font-size: 20px;
}
div.detail-date{
	display: inline-block;
}

div.detail-icon img{
	width: 54px;
}
div.detail-img{
	margin-top:10px;
	width: 720px;
}
div.detail-img img{
	width: 100%;
	border-radius: 8px;
}

div.detail-date{
	text-align: right;
	margin-top: 4px 0 20px;	
}

div.detail-btn-box{
	width:90%;
	margin:0 auto;
	margin-top:50px;
}

div.detail-btn-box a{
	border-radius: 8px;
	padding: 8px 20px;
	font-size: 20px;
	background-color: #45AFFF;
	color: #fff;
	text-decoration: none;
}

div.detail-btn-box a:hover{
	box-shadow:0 -6px  4px #186D94;
	font-weight: 900;
}

</style>
</head>
<body>
	<div class="container-box">
		<div class="detail-info">
			<div class="detail-inner1">
				<div class="detail-author">${MEMO.m_author}님의 구르미</div>
				<c:if test="${not empty MEMO.m_icon}">
					<div class="detail-icon"><img class="memo-list-m_icon " src="${rootPath}${MEMO.m_icon}"></div>
				</c:if>
					<c:if test="${empty MEMO.m_icon}">
					<div class="detail-icon"><img class="memo-list-m_icon" src="${rootPath}/static/image/x(2).png"></div>
				</c:if>
			</div>
			<div class="detail-inner2">
				<div class="detail-title">${MEMO.m_title}</div>
				<div class="detail-date"><i class="fa-solid fa-calendar"></i> ${MEMO.m_date} ${MEMO.m_time}</div>
			</div>
					<c:if test="${not empty MEMO.m_image}">
						<div class="memo-list-m_image detail-img"><img src="${rootPath}/upload/${MEMO.m_up_image} " alt="${MEMO.m_image}"></div>					
					</c:if>
					<c:if test="${empty MEMO.m_image}">
						<div class="memo-list-m_image detail-img"><img src="${rootPath}/static/image/x(1).png" alt="${MEMO.m_image}"></div>					
					</c:if>
			<div class="detail-content">${MEMO.m_memo}</div>
		</div>
					
	
		<div class="detail-btn-box">
			<a href="${rootPath}/memo/memo-map/${MEMO.m_seq}/update">수정</a>
			<a href="${rootPath}/memo/memo-map/${MEMO.m_seq}/delete">삭제</a>
			<a href="${rootPath}/memo/memo-map">리스트 보기</a>
		</div>
	</div>
	
</body>
</html>