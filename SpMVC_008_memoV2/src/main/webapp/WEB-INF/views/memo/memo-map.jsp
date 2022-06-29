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
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=893369622e6174e9707bd86f1b9af909&libraries=services,clusterer"></script>
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


nav.icon-memu-bar{
	position: fixed;
	top: 20px;
	left: 160px;
	width:696px;
	height: 56px;
	background-color: #fff;
	border-radius: 8px;
	z-index: 10000;
}

.icon-menu-ul{
	display: flex;
	margin-top:14px;
}

nav.icon-memu-bar ul li{
	display: inline-block;
	text-align: center;
}
nav.icon-memu-bar ul li img{
	width:50px;
	line-height: 56px;
}
nav.icon-memu-bar ul li{
	height:30px;
	padding:0 12px;
	border-left: 1px solid #ddd;
	margin: auto 0;
}
nav.icon-memu-bar ul li:first-child{
	margin-left: 12px;
	border:none;
}

.input-form{
	width:500px;
	height: 500px;
	position: fixed;
	top:50%;
	left: 50%;
	z-index: 10000;
	background-color: #fff;
	transform: translate(-50%, -50%);
	display: none;
	padding:20px;
	border-radius: 8px;
}

div.input-info{
	display: flex;
	justify-content: space-between;
	margin-bottom: 20px;
	border-bottom: 1px solid #aaa;
}

div.input-info p{
	font-size: 24px;
}



.icon-radio{
	opacity: 0;
}

input[type=radio]:checked +label{
	background-color: #ccc;
	color: fff;
}

input[name=m_title]{
	width: 488px;
	padding:5px;
	margin-bottom: 8px;
}

div.input-icon-box{
	margin-top:20px;
}

div.input-icon-box p{
	text-align: center;
	border-bottom: 1px solid #aaa;
	margin-bottom: 10px;
}

div.btn-close{
	cursor: pointer;
}

.input-form button{
	margin: 20px auto 0;
}

div.memo-list-wrap{
	width:24vw;;
	height: 100vh;
	background-color: #fff;
	position: fixed;
	top:0;
	left: 76vw;
	z-index: 10000;
}

div.memo-list-info{
	padding:20px;
}

div.memo-list-info p{
	font-size: 20px;
	border-bottom: 1px solid #aaa;
}

div.memo-list-view{
	padding: 0 20px;
	overflow-y: scroll;
	overflow-x: hidden;
	height: 860px;
}
div.memo-list-titleIcon{
	display: flex;
	justify-content: space-between;
	margin-top:30px;
}
div.memo-list-m_title p{
	font-size: 24px;
	display: inline-block;
}

img.memo-list-m_icon{
	width: 56px;
}

div.memo-list-m_image{
	width: 400px;
	height: 160px;
	overflow: hidden;
	margin-top:4px;
}

div.memo-list-m_image img{
	width: 400px;
}

div.memo-list-m_memo{
	margin:4px 0 10px;
	border-bottom: 1px solid #aaa;
}

div.memo-list-xy{
	display: none;
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
		<ul class="icon-menu-ul">
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
	<form class="input-form" method="POST" enctype="multipart/form-data">
		<div class="input-info">
			<p>${USERNAME}</p>
			<div class="btn-close" onclick="btn-close">&times;</div>
		</div>
		<input name="m_title" placeholder="제목을 입력하세요" value="${MEMO.m_title}">
		<textarea name="m_memo" placeholder="메모를 입력하세요" cols="69" rows="16">${MEMO.m_memo}</textarea> 
		<input name="m_seq" type="hidden" value='<c:out value="${MEMO.m_seq}" default="0"/>'/>
		<input id="mapx" name="m_mapx" type="hidden" value=""/> 
		<input id="mapy" name="m_mapy" type="hidden" value=""/> 			
		<input name="file" type="file" accept="image/*"/>
			
		<div class="input-icon-box">
			<p>구르미 고르미</p>
			<input type="radio" name="m_icon"  class="icon-radio" id="icon-btn-1" value="/static/image/goorme (1).png"/> <label for="icon-btn-1">아이콘1</label>
			<input type="radio" name="m_icon"  class="icon-radio" id="icon-btn-2" value="/static/image/goorme (2).png"/> <label for="icon-btn-2">아이콘2</label>
			<input type="radio" name="m_icon"  class="icon-radio" id="icon-btn-3" value="/static/image/goorme (3).png"/> <label for="icon-btn-3">아이콘3</label>
			<input type="radio" name="m_icon"  class="icon-radio" id="icon-btn-4" value="/static/image/goorme (4).png"/> <label for="icon-btn-4">아이콘4</label>
			<input type="radio" name="m_icon"  class="icon-radio" id="icon-btn-5" value="/static/image/goorme (5).png"/> <label for="icon-btn-5">아이콘5</label>
			<input type="radio" name="m_icon"  class="icon-radio" id="icon-btn-6" value="/static/image/goorme (6).png"/> <label for="icon-btn-6">아이콘6</label>
			<input type="radio" name="m_icon"  class="icon-radio" id="icon-btn-7" value="/static/image/goorme (7).png"/> <label for="icon-btn-7">아이콘7</label>
			<input type="radio" name="m_icon"  class="icon-radio" id="icon-btn-8" value="/static/image/goorme (8).png"/> <label for="icon-btn-8">아이콘8</label>
			<input type="radio" name="m_icon"  class="icon-radio" id="icon-btn-9" value="/static/image/goorme (9).png"/> <label for="icon-btn-9">아이콘9</label>
			<input type="radio" name="m_icon"  class="icon-radio" id="icon-btn-10" value="/static/image/goorme (10).png"/> <label for="icon-btn-10">아이콘10</label>
		</div>
		<button type="submit">메모 기록</button>
	</form>
	<div class="memo-list-wrap">
		<div class="memo-list-info">
			<p>${USERNAME}님의 구르미</p>
		</div>
		<div class="memo-list-view">
			<c:forEach items="${MEMOS}" var="MEMO">
			<div data-seq="${MEMO.m_seq}">
				<div class="memo-list-titleIcon">
					<div class="memo-list-m_title"><p>${MEMO.m_title}</p></div>
					<c:if test="${not empty MEMO.m_icon}">
						<img class="memo-list-m_icon" src="${rootPath}${MEMO.m_icon}">
					</c:if>
					<c:if test="${empty MEMO.m_icon}">
						<div>없어</div>
					</c:if>
				</div>
				<c:if test="${not empty MEMO.m_image}">
					<div class="memo-list-m_image"><img src="${rootPath}/upload/${MEMO.m_up_image}"></div>					
				</c:if>
				<c:if test="${empty MEMO.m_image}">
					<div>없어</div>					
				</c:if>
				<div class="memo-list-m_memo"><p>${MEMO.m_memo}</p></div>
				<div class="memo-list-xy">${MEMO.m_mapx}</div>
				<div class="memo-list-xy">${MEMO.m_mapy}</div>
			</div>
			</c:forEach>
		</div>
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
		    
		    document.getElementById('mapx').value = latlng.getLat(); 
		    
		    document.getElementById('mapy').value = latlng.getLng(); 
		    
		    //input 박스 나타내기
		    document.querySelector('.input-form').style.display = "block";
		    
		});
		
		//input 박스 투명도로 숨기기
		var btn_close = document.querySelector('.btn-close')
		
		btn_close.addEventListener("click",()=>{
			document.querySelector('.input-form').style.display = "none";
		});
		
	
	</script>

</html>