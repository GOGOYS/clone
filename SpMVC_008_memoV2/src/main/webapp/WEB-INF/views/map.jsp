<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set value="${pageContext.request.contextPath}" var="rootPath" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width initial-scale=1.0" />
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=893369622e6174e9707bd86f1b9af909"></script>
<title>간단한 지도 표시하기</title>

<style>
* {
	padding: 0;
	margin: 0;
	border-collapse: collapse;
	list-style: none;
	box-sizing: border-box;
}


.container {
	display: flex;
}

header{
	width:120px;
}
header .logoBlue{
	margin: 20px auto; 
}

header .logoBlue img{
	width: 80px;
}
</style>
</head>
<body>
	<div class="container">
		<header>
			<div class="logoBlue">
				<img src="${rootPath}/static/image/logoBlue.png">
			</div>
			<nav>
				<ul>
					<li>메뉴</li>
					<li>메뉴</li>
					<li>메뉴</li>
					<li>메뉴</li>
				</ul>
			</nav>
		</header>
		<div id="map" style="width:100vw;height:100vh;"></div>
	</div>




</body>
	<script>
		var container = document.getElementById('map');
		var options = {
			center: new kakao.maps.LatLng(33.450701, 126.570667),
			level: 3
		};

		var map = new kakao.maps.Map(container, options);
	</script>

</html>