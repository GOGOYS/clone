<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set value="${pageContext.request.contextPath}" var="rootPath" />
    
    <style>
    	.ok{
    		display: none;
    	}
    	
    	.no{
    		display: block;
    	}
 
    </style>
	<form class="input-form" method="POST">
		<input name="a_seq" type="hidden" 
			value='<c:out value="${ADDR.a_seq}" default="0"/>' />
		<input name="a_name" placeholder="이름" value="${ADDR.a_name}"/>
		<input name="a_tel" placeholder="전화번호"  value="${ADDR.a_tel}"/>
		<input name="a_address" placeholder="주소"  value="${ADDR.a_address}"/>
		<button class="btn-submit" type="button">저장</button>
	</form>
	<div class="name-msg ok">이름 채워랏</div>
	<div class="tel-msg ok">번호 채워랏</div>
	<div class="address-msg ok">주소 채워랏</div>