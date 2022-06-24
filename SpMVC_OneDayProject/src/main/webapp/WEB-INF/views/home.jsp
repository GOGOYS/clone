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
</style>

</head>
<body>
	<h1>메모장 프로젝트</h1>
	<table class="memo">
		<thead>
			<tr>
				<th>순서</th>
				<th>내용</th>
				<th>작성자</th>
				<th>이미지</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${MEMO}" var="MEMO">
				<tr data-memo="${MEMO.m_seq}">
				
					<td>${MEMO.m_seq}</td>
					<td>${MEMO.m_memo}</td>
					<td>${MEMO.m_author}</td>
					<td><img src="${rootPath}/upload/${MEMO.m_image}" width ="100px" alt="${MEMO}"/></td>
				</tr>
			</c:forEach>

		</tbody>
	</table>
	<a href="${rootPath}/memo/memo_write">메모하러 가기</a>

</body>
<script src="${rootPath}/static/js/memo.js?ver=2022-06-24-002"></script>
</html>