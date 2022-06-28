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
}


.container {
	display: flex;
}

header{
	width:120px;
}

header .logoBlue img{
	width: 80px;
	margin: 20px 0 20px 15px ;
}

nav.menu-bar ul{
	display: flex;
	flex-direction: column;
}
nav.menu-bar li{
	display: inline-block;
	font-size: 20px;
	padding: 20px 20px;
	text-align: center;
}


.icon-memu-bar{
	position: fixed;
	top: 20px;
	left: 160px;
	width:786px;
	height: 56px;
	background-color: #fff;
	border-radius: 8px;
	z-index: 10000;
}

nav.icon-menu-bar ul{
	display: flex;
	display: inline-block;
}
nav.icon-memu-bar ul li{
	display: inline-block;
	text-align: center;
}
nav.icon-memu-bar ul li img{
	width:60px;
	line-height: 56px;
}
nav.icon-memu-bar ul li{
	height:40px;
	padding:0 8px;
	border-left: 1px solid #ddd;
	margin: auto 0;
}
nav.icon-memu-bar ul li:first-child{
	margin-left: 24px;
	border:none;
}
nav.icon-memu-bar ul li:last-child{
	margin-right: 24px;
}

div.input-form{
	width:500px;
	height: 500px;
	position: fixed;
	top:50%;
	left: 50%;
	z-index: 10000;
	background-color: #fff;
	transform: translate(-50%, -50%);
}

.icon-radio{
	opacity: 0;
}

input[type=radio]:checked +label{
	background-color: #ccc;
	color: fff;
}
</style>
</head>
<body>
	<div class="container">
		<header>
			<div class="logoBlue">
				<img src="${rootPath}/static/image/logoBlue.png">
			</div>
			<nav class="menu-bar">
				<ul>
					<li id="clickLatlng">메뉴</li>
					<li>메뉴</li>
					<li>메뉴</li>
					<li>메뉴</li>
				</ul>
			</nav>
		</header>
		
		<div id="map" style="width:100vw;height:100vh;"></div>
	</div>
	<nav class="icon-memu-bar">
		<ul>
			<li><img src="${rootPath}/static/image/goorme (1).png"></li>
			<li><img src="${rootPath}/static/image/goorme (2).png"></li>
			<li><img src="${rootPath}/static/image/goorme (3).png"></li>
			<li><img src="${rootPath}/static/image/goorme (4).png"></li>
			<li><img src="${rootPath}/static/image/goorme (5).png"></li>
			<li><img src="${rootPath}/static/image/goorme (6).png"></li>
			<li><img src="${rootPath}/static/image/goorme (7).png"></li>
			<li><img src="${rootPath}/static/image/goorme (8).png"></li>
			<li><img src="${rootPath}/static/image/goorme (9).png"></li>
		</ul>
	</nav>
	<div class="input-form">
		<form method="POST" enctype="multipart/form-data">
			<input name="m_seq" type="hidden" value='<c:out value="${MEMO.m_seq}" default="0"/>'/>
			<textarea name="m_memo" placeholder="메모를 입력하세요" cols="50" rows="10">${MEMO.m_memo}</textarea> 
			<input id="mapx" name="m_mapx" type="hidden" value=""/> 
			<input id="mapy" name="m_mapy" type="hidden" value=""/> 
			
			<input type="radio" name="m_icon"  class="icon-radio" id="icon-btn-1" value="/static/image/goorme (1).png"/> <label for="icon-btn-1">아이콘</label>
			<input type="radio" name="m_icon"  class="icon-radio" id="icon-btn-2" value="/static/image/goorme (2).png"/> <label for="icon-btn-2">아이콘1</label>
			<input type="radio" name="m_icon"  class="icon-radio" id="icon-btn-3" value="/static/image/goorme (3).png"/> <label for="icon-btn-3">아이콘3</label>
			<input name="file" type="file" accept="image/*"/>
			<button>메모 기록</button>
		</form>
	</div>



</body>
	<script>
		var container = document.getElementById('map');
		var options = {
			center: new kakao.maps.LatLng(33.450701, 126.570667),
			level: 3
		};

		var map = new kakao.maps.Map(container, options);
		
		// 지도를 클릭한 위치에 표출할 마커입니다
		var marker = new kakao.maps.Marker({ 
		    // 지도 중심좌표에 마커를 생성합니다 
		    position: map.getCenter() 
		}); 
		// 지도에 마커를 표시합니다
		marker.setMap(map);

		// 지도에 클릭 이벤트를 등록합니다
		// 지도를 클릭하면 마지막 파라미터로 넘어온 함수를 호출합니다
		kakao.maps.event.addListener(map, 'click', function(mouseEvent) {        
		    
		    // 클릭한 위도, 경도 정보를 가져옵니다 
		    var latlng = mouseEvent.latLng; 
		    
		    // 마커 위치를 클릭한 위치로 옮깁니다
		    marker.setPosition(latlng);		   
		    
		    var resultDiv = document.getElementById('mapx').value = latlng.getLat(); 
		    
		    var resultDiv = document.getElementById('mapy').value = latlng.getLng(); 
		    
		});
	</script>

</html>