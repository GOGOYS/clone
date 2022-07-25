<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set value="${pageContext.request.contextPath}" var="rootPath" />
    
	<div class="student detail-body">
		<div>학번 : </div><div class="student datail">${STVO.st_num}</div>
	</div>
	<div class="student detail-body">
		<div>이름 : </div><div class="student datail">${STVO.st_name}</div>
	</div>
	<div class="student detail-body">
		<div>학과 : </div><div class="student datail">${STVO.st_dept}</div>
	</div>
	<div class="student detail-body">
		<div>전번 : </div><div class="student datail">${STVO.st_tel}</div>
	</div>
	<div class="student detail-body">
		<div>주소 : </div><div class="student datail">${STVO.st_addr}</div>
	</div>
	
	<c:forEach items="${STVO.scoreList}" var="SC">
	<div class="student detail-body">
		<div>${SC.sb_name} : </div><div class="student datail">${SC.sc_score}</div>
	</div>
	</c:forEach>
	
	<div>${SC.sb_name === "SB007"} : </div><div class="student datail">${SC.sc_score}</div>
	
	<a href="${rootPath}/student/update?st_num=${STVO.st_num}">수정하기</a>
	<a href="${rootPath}/student/">리스트가기</a>
	