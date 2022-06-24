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
	
	<h2>상세보기</h2>
	
	<table>
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
	
	<button onclick="location.href='${rootPath}/update/${MEMO.m_seq}';">수정하기</button>
	<button onclick="location.href='${rootPath}/delete/${MEMO.m_seq}';">삭제하기</button>
</body>
</html>