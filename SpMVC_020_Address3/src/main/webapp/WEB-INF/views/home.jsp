<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles"  prefix="tiles"%>

<c:set value="${pageContext.request.contextPath}" var="rootPath" />    
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<title>Insert title here</title>
<style>
	*{
		box-sizing: border-box;
		padding: 0;
		margin: 0;
	}
	
	html{
		width: 100vw;
		height: 100vh;
	}
	
	body{
		width: 100%;
		height: 100%;
		display: flex;
		flex-direction: column;
	}

</style>
</head>
<body>
	<tiles:insertAttribute name="header" />
	<tiles:insertAttribute name="body" />
	<tiles:insertAttribute name="footer" />
	
</body>
<script>
	const rootPath = "${rootPath}"
</script>
<script src="${rootPath}/static/js/list.js?ver=2022-07-20-003"></script>
<script src="${rootPath}/static/js/input.js?ver=2022-07-20-008"></script>
</html>