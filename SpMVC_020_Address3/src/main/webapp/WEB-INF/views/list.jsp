<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<c:set value="${pageContext.request.contextPath}" var="rootPath" />    

<style>
	div.btn{
		margin-top: 20px;
	}
	div.btn a{
		color: black;
		text-decoration: none;
		padding: 12px 20px;
		background-color: skyblue;
		border-radius: 8px;
	}
	div.btn a:hover{
		font-weight: 900;
		background-color: #1f4acc;
	}
</style>
   

	<h1>반갑습니다</h1>
	<form>
		<label for="search">검색</label><input id ="search" name="search"/>
	</form>
	<table class="list-table">
		<thead>
			<tr>
				<th>SEQ</th>
				<th>이름</th>
				<th>전화번호</th>
				<th>주소</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${ADDRS}" var="ADDR">
				<tr data-seq="${ADDR.a_seq}">
					<td>${ADDR.a_seq}</td>
					<td>${ADDR.a_name}</td>
					<td>${ADDR.a_tel}</td>
					<td>${ADDR.a_address}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<%@ include file="/WEB-INF/views/pagination.jsp" %>
	<div class="btn">
		<a href="${rootPath}/insert">주소 추가하기</a>
	</div>
	
	
