<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set value="${pageContext.request.contextPath}" var="rootPath" />
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	*{
		box-sizing: border-box;
		padding:0;
		margin:0;
	}
	
	table{
		border-collapse: collapse;
	}
	table tr, table td{
		border: 1px solid #aaa;
	}
	table td{
		padding: 6px 12px;
	}
</style>
</head>
<body>	
<h1>학생 LIST</h1>

<table>
	<thead>
		<tr>
			<th>학번</th>
			<th>이름</th>
			<th>학과</th>
			<th>학년</th>
			<th>전화번호</th>
			<th>주소</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${LIST}" var="LIST" >
			<tr>
				<td>${LIST.st_num}</td>
				<td>${LIST.st_name}</td>
				<td>${LIST.st_dept}</td>
				<td>${LIST.st_grade}</td>
				<td>${LIST.st_tel}</td>
				<td>${LIST.st_addr}</td>
			</tr>
		</c:forEach>
	</tbody>
</table>

</body>
</html>