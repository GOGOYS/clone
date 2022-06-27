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
	<div class="table-wrap">
		<h1>오늘의 메모</h1>
		<table class="memo-list">
				<colgroup>
					<col width="6%">
					<col width="24%">
					<col width="50%">
					<col width="20%">
				</colgroup>
			<thead>
				<tr>
					<th>순서</th>
					<th>작성자</th>
					<th>내용</th>
					<th>이미지</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>${MEMO.m_seq}</td>
					<td>${MEMO.m_author}</td>
					<td>${MEMO.m_memo}</td>
					<td><img src="${rootPath}/upload/${MEMO.m_image}" width ="100px" alt="${MEMO}"/></td>
				</tr>
			</tbody>
		</table>
		<a href="${rootPath}/">메모리스트 보러가기</a>
		<a href="${rootPath}/memo/delete/${MEMO.m_seq}">메모 완료</a>
	</div>
</body>
</html>