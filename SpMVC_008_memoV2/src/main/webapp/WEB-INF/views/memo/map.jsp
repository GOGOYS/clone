<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set value="${pageContext.request.contextPath}" var="rootPath" />

<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/include/head.jsp" %>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=893369622e6174e9707bd86f1b9af909&libraries=services,clusterer"></script>
<style>
* {
	padding: 0;
	margin: 0;
	border-collapse: collapse;
	list-style: none;
}


.container {
	display: flex;
	background-color: #45AFFF;
}

header{
	width:120px;
}

header .logoBlue img{
	width: 80px;
	margin: 26px 0 20px 15px ;
}

nav.menu-bar ul{
	display: flex;
	flex-direction: column;
}
nav.menu-bar li{
	margin-top:40px;
}
nav.menu-bar li a{
	color: #fff;
	text-decoration: none;
		font-size: 20px;
	padding: 20px 36px;
}
nav.menu-bar li a:hover{
	background-color: #fff;
	color:#45AFFF;
	font-weight: 900;
}


nav.icon-memu-bar{
	position: fixed;
	top: 20px;
	left: 140px;
	width:910px;
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
	border:none;
	margin-left:10px;
}

nav.icon-memu-bar ul li a:first-child{
	font-size: 20px;
	color: #45AFFF;
	text-decoration: none;
}

div.weather-today{
	position:fixed;
	top:20px;
	left: 1080px;
	background-color: #fff;
	width:152px;
	height: 44px;
	border-radius: 8px;
	display: flex;
}
div.weather-title{
	margin: 10px 0 10px 16px;
	display: inline-block;
	color: #45AFFF;
	font-weight: 900;
}

div.weather-icon{
	margin: 10px 0 10px 10px;
	display: inline-block;
}

.fa-sun{
	color: #ff4824;
}

.input-form{
	width:500px;
	height: 580px;
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
	color: #45AFFF;
}



.icon-radio{
	opacity: 0;
}

input.icon-radio:checked +label{
	border-bottom: 3px solid #186D94;
	border-radius: 8px;
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
	margin: 40px 0 0 198px;
	background-color: #45AFFF;
	border: none;
	font-size: 16px;
	padding: 8px 20px;
	border-radius: 8px;
	color: #fff;
}

div.personal-btn{
	display: inline-block;
	margin-left:64px;
}

div.personal-btn input{
	margin-left:5px;
}


.input-form button:hover{
	background-color: #186D94;
	color: #fff;
}
div.memo-list-wrap{
	width:24vw;;
	height: 100vh;
	background-color: #fff;

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
	width: 40px;
	height: 23px;
	padding-top:10px;
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
label img{
	width:64px;
	padding-top:8px;
}

div.input-icon-box label{
	margin-left:10px;
}

div.container-wrap{
	display: flex;
	position: fixed;
	top:0;
	left: 73vw;
	z-index: 10000;
}

.slide-home{
	background-color: #fff;
	padding:8px 15px;
	margin:20px 20px 0 0;
	border-radius: 8px;
}
.slide-home a{
	color: #45AFFF;
}

.memo-list-btn{
	margin-top:340px;
	margin-left:auto;
	width:36px;
	height: 120px;
	background-color: #fff;
	border-radius: 20px 0 0 20px;
}

div.memo-list-btn svg{
	margin: 50px 0 0 10px;
}

</style>
</head>
<body>
	<div class="container">
		<header>
			<!-- 왼쪽 사이드 메뉴 -->
			<div class="logoBlue">
				<img src="${rootPath}/static/image/logoWhite.png">
			</div>
			<nav class="menu-bar">
				<ul>
					<li><a href="">메뉴</a></li>
					<li><a href="">메뉴</a></li>
					<li><a href="">메뉴</a></li>
					<li><a href="">메뉴</a></li>
				</ul>
			</nav>
		</header>
		
		<div id="map" style="width:100vw;height:100vh;"></div>
	</div>
	<!--  구르미 아이콘 -->
	<nav class="icon-memu-bar">
		<ul class="icon-menu-ul">
			<li><a href="${rootPath}/memo/map/all">ALL</a></li>
			<li><a href="${rootPath}/memo/map/find/static/image/goorme(1).png"><img src="${rootPath}/static/image/goorme(1).png"></a></li>
			<li><a href="${rootPath}/memo/map/find/static/image/goorme(2).png"><img src="${rootPath}/static/image/goorme(2).png"></a></li>
			<li><a href="${rootPath}/memo/map/find/static/image/goorme(3).png"><img src="${rootPath}/static/image/goorme(3).png"></a></li>
			<li><a href="${rootPath}/memo/map/find/static/image/goorme(4).png"><img src="${rootPath}/static/image/goorme(4).png"></a></li>
			<li><a href="${rootPath}/memo/map/find/static/image/goorme(5).png"><img src="${rootPath}/static/image/goorme(5).png"></a></li>
			<li><a href="${rootPath}/memo/map/find/static/image/goorme(6).png"><img src="${rootPath}/static/image/goorme(6).png"></a></li>
			<li><a href="${rootPath}/memo/map/find/static/image/goorme(7).png"><img src="${rootPath}/static/image/goorme(7).png"></a></li>
			<li><a href="${rootPath}/memo/map/find/static/image/goorme(8).png"><img src="${rootPath}/static/image/goorme(8).png"></a></li>
			<li><a href="${rootPath}/memo/map/find/static/image/goorme(9).png"><img src="${rootPath}/static/image/goorme(9).png"></a></li>
			<li><a href="${rootPath}/memo/map/find/static/image/goorme(10).png"><img src="${rootPath}/static/image/goorme(10).png"></a></li>
			<li><a href="${rootPath}/memo/map/public">PUBLIC</a></li>
		</ul>
		
		<!-- 날씨 정보 -->
		<div class="weather-today">
			<div class="weather-title">오늘의 날씨 :</div>
			<c:choose>
			<c:when test="${rnYn eq'강수없음'}">
				<div class="weather-icon"><i class="fa-solid fa-sun"></i></div>
			</c:when>
			<c:when test="${rnYn eq '비'}">
				<div class="weather-icon"><i class="fa-solid fa-cloud-showers"></i></div>
			</c:when>
			<c:when test="${rnYn eq '비/눈'}">
				<div class="weather-icon"><i class="fa-solid fa-cloud-hail-mixed"></i></div>
			</c:when>
			<c:when test="${rnYn eq '눈'}">
				<div class="weather-icon"><i class="fa-solid fa-sun"></i></div>
			</c:when>
			<c:when test="${rnYn eq '소나기'}">
				<div class="weather-icon"><i class="fa-solid fa-snowflake"></i></div>
			</c:when>
			</c:choose>
		</div>
	</nav>
	
	<!-- insert 창 -->
	<form class="input-form" method="POST" enctype="multipart/form-data">
		<div class="input-info">
			<p>${USERNAME}님의 구르미</p>
			<div class="btn-close" onclick="btn-close"><i class="fa-solid fa-x"></i></div>
		</div>
		<input name="m_title" placeholder="제목을 입력하세요" value="${MEMO.m_title}">
		<textarea name="m_memo" placeholder="메모를 입력하세요" cols="69" rows="16">${MEMO.m_memo}</textarea> 
		<input name="m_seq" type="hidden" value='<c:out value="${MEMO.m_seq}" default="0"/>'/>
		<input name="m_weather" type="hidden" value="${rnYn}"/>
		<input id="mapx" name="m_mapx" type="hidden" value=""/> 
		<input id="mapy" name="m_mapy" type="hidden" value=""/> 			
		<input name="file" type="file" accept="image/*"/>
			
		<div class="input-icon-box">
			<p>구르미 고르미</p>
			<input type="radio" name="m_icon"  class="icon-radio" id="icon-btn-1" value="/static/image/goorme(1).png"/> <label for="icon-btn-1"><img src="${rootPath}/static/image/goorme(1).png"></label>
			<input type="radio" name="m_icon"  class="icon-radio" id="icon-btn-2" value="/static/image/goorme(2).png"/> <label for="icon-btn-2"><img src="${rootPath}/static/image/goorme(2).png"></label>
			<input type="radio" name="m_icon"  class="icon-radio" id="icon-btn-3" value="/static/image/goorme(3).png"/> <label for="icon-btn-3"><img src="${rootPath}/static/image/goorme(3).png"></label>
			<input type="radio" name="m_icon"  class="icon-radio" id="icon-btn-4" value="/static/image/goorme(4).png"/> <label for="icon-btn-4"><img src="${rootPath}/static/image/goorme(4).png"></label>
			<input type="radio" name="m_icon"  class="icon-radio" id="icon-btn-5" value="/static/image/goorme(5).png"/> <label for="icon-btn-5"><img src="${rootPath}/static/image/goorme(5).png"></label>
			<input type="radio" name="m_icon"  class="icon-radio" id="icon-btn-6" value="/static/image/goorme(6).png"/> <label for="icon-btn-6"><img src="${rootPath}/static/image/goorme(6).png"></label>
			<input type="radio" name="m_icon"  class="icon-radio" id="icon-btn-7" value="/static/image/goorme(7).png"/> <label for="icon-btn-7"><img src="${rootPath}/static/image/goorme(7).png"></label>
			<input type="radio" name="m_icon"  class="icon-radio" id="icon-btn-8" value="/static/image/goorme(8).png"/> <label for="icon-btn-8"><img src="${rootPath}/static/image/goorme(8).png"></label>
			<input type="radio" name="m_icon"  class="icon-radio" id="icon-btn-9" value="/static/image/goorme(9).png"/> <label for="icon-btn-9"><img src="${rootPath}/static/image/goorme(9).png"></label>
			<input type="radio" name="m_icon"  class="icon-radio" id="icon-btn-10" value="/static/image/goorme(10).png"/> <label for="icon-btn-10"><img src="${rootPath}/static/image/goorme(10).png"></label>
		</div>
		<button type="submit">메모 기록</button>
		<div class="personal-btn">
			<input type="radio" name="m_personal" id="personal-ok" value="OK"/><label for="personal-ok">공개</label>
			<input type="radio" name="m_personal" id="personal-no" value="NO" checked="checked"/><label for="personal-no">비공개</label>
		</div>
	</form>
	
	<!-- 오른쪽 메모 리스트 창 -->
	<div class="container-wrap">
		<div class="memo-list-slide">
			<div class="slide-home"> <a href="${rootPath}/"><i class="fa-solid fa-house"></i></a></div>
			<div class="memo-list-btn"><i class="fa-solid fa-list"></i></div>
		</div>
		<div class="memo-list-wrap">
			<div class="memo-list-info">
				<p>${USERNAME}님의 구르미</p>
			</div>
			<div class="memo-list-view">
				<%-- <c:if test="${NOMEMO == null}">
					<p>구르미가 없습니다</p>
				</c:if> --%>
				<c:forEach items="${MEMOS}" var="MEMO">
				<div class="choice" data-seq="${MEMO.m_seq}">
					<div class="memo-list-titleIcon">
						<div class="memo-list-m_title"><p>${MEMO.m_title}</p></div>
						<c:if test="${not empty MEMO.m_icon}">
							<img class="memo-list-m_icon" src="${rootPath}${MEMO.m_icon}">
						</c:if>
						<c:if test="${empty MEMO.m_icon}">
							<img class="memo-list-m_icon" src="${rootPath}/static/image/x(2).png">
						</c:if>
					</div>
					<c:if test="${not empty MEMO.m_image}">
						<div class="memo-list-m_image"><img src="${rootPath}/upload/${MEMO.m_up_image}"></div>					
					</c:if>
					<c:if test="${empty MEMO.m_image}">
						<div class="memo-list-m_image"><img src="${rootPath}/static/image/x(1).png"></div>					
					</c:if>
					<div class="memo-list-m_memo"><p>${MEMO.m_memo}</p></div>
					<div class="memo-list-xy">${MEMO.m_mapx}</div>
					<div class="memo-list-xy">${MEMO.m_mapy}</div>
				</div>
				</c:forEach>
			</div>
		</div>
	</div>	

</body>
	<script>
	
	</script>
	<script>
		const rootPath = "${rootPath}"
		var container = document.getElementById('map');
		var options = {
			center: new kakao.maps.LatLng(35.160010812082966, 126.9102089290472),
			level: 4
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
		
		// 서버에 저장된 주소값
		
		var mapX = ${mapX}		
		var mapY = ${mapY}
		
	
		// 지도에 표시된 마커 객체를 가지고 있을 배열입니다
		var markers = [];

		// 마커 하나를 지도위에 표시합니다 
		for(var i = 0; i < mapX.length; i++){		
			addMarker(new kakao.maps.LatLng(mapX[i], mapY[i]));
		}

		// 마커를 생성하고 지도위에 표시하는 함수입니다
		function addMarker(position) {
		    
		    // 마커를 생성합니다
		    var marker = new kakao.maps.Marker({
		        position: position
		    });

		    // 마커가 지도 위에 표시되도록 설정합니다
		    marker.setMap(map);
		    
		    // 생성된 마커를 배열에 추가합니다
		    markers.push(marker);
		}



		
	
	</script>
	<script src="${rootPath}/static/js/memo.js?ver=2022-07-11-005"></script>
</html>