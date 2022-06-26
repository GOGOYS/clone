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
<script>
	const rootPath = '${rootPath}'
</script>

<style>
form {
	display: flex;
	flex-direction: column;
}
.memo-list{
	border-collapse: collapse;
}

.memo-list tr th, .memo-list tr td{
	border: 1px solid #aaa;
}
</style>

</head>
<body>
	<h1>메모장 프로젝트</h1>
	<table class="memo-list">
		<thead>
			<tr>
				<th>순서</th>
				<th>작성일</th>
				<th>내용</th>
				<th>작성자</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${MEMO}" var="MEMO">
				<tr data-memo="${MEMO.m_seq}">
					<td>${MEMO.m_seq}</td>
					<td>${MEMO.m_date}</td>
					<td>${MEMO.m_memo}</td>
					<td>${MEMO.m_author}</td>
				</tr>
			</c:forEach>

		</tbody>
	</table>
	<a href="${rootPath}/memo/memo_write">메모하러 가기</a>
	<a href="${rootPath}/random">랜덤 뽑기</a>

</body>
<script src="${rootPath}/static/js/memo.js?ver=2022-06-24-002"></script>
</html>