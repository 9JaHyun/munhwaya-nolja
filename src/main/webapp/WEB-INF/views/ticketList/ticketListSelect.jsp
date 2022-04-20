<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="resources"
	value="${pageContext.request.contextPath}/resources" />
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=bf76e13e65e181699d60340265d9e67e"></script>
<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

body {
	height: 100vh;
	display: grid;
	color: black;
	font-size: 14px;
	letter-spacing: 0.1em;
}

.ticket {
	margin: auto;
	margin-top: 30px;
	display: flex;
	background: white;
	box-shadow: rgba(0, 0, 0, 0.3) 0px 19px 38px, rgba(0, 0, 0, 0.22) 0px
		15px 12px;
}

.left {
	display: flex;
}

.admit-one {
	position: absolute;
	color: darkgray;
	height: 250px;
	padding: 0 10px;
	letter-spacing: 0.15em;
	display: flex;
	text-align: center;
	justify-content: space-around;
	writing-mode: vertical-rl;
	transform: rotate(-180deg);
}

.admit-one span:nth-child(2) {
	color: white;
	font-weight: 700;
}

.left .ticket-number {
	height: 250px;
	width: 250px;
	display: flex;
	justify-content: flex-end;
	align-items: flex-end;
	padding: 5px;
}

.ticket-info {
	padding: 10px 30px;
	display: flex;
	flex-direction: column;
	text-align: center;
	justify-content: space-between;
	align-items: center;
}

.date {
	border-top: 1px solid gray;
	border-bottom: 1px solid gray;
	padding: 5px 0;
	font-weight: 700;
	display: flex;
	align-items: center;
	justify-content: space-around;
}

.date span {
	width: 100px;
}

.date span:first-child {
	text-align: left;
}

.date span:last-child {
	text-align: right;
}

.date .june-29 {
	color: #d83565;
	font-size: 20px;
}

.show-name {
	font-size: 32px;
	font-family: "Nanum Pen Script", cursive;
	color: #d83565;
}

.show-name h1 {
	font-size: 48px;
	font-weight: 700;
	letter-spacing: 0.1em;
	color: #4a437e;
}

.time {
	padding: 10px 0;
	color: #4a437e;
	text-align: center;
	display: flex;
	flex-direction: column;
	gap: 10px;
	font-weight: 700;
}

.time span {
	font-weight: 400;
	color: gray;
}

.left .time {
	font-size: 16px;
}

.location {
	display: flex;
	justify-content: space-around;
	align-items: center;
	width: 100%;
	padding-top: 8px;
	border-top: 1px solid gray;
}

.location .separator {
	font-size: 20px;
}

.right {
	width: 180px;
	border-left: 1px dashed #404040;
}

.right .admit-one {
	color: darkgray;
}

.right .admit-one span:nth-child(2) {
	color: gray;
}

.right .right-info-container {
	height: 250px;
	padding: 10px 10px 10px 35px;
	display: flex;
	flex-direction: column;
	justify-content: space-around;
	align-items: center;
}

.right .show-name h1 {
	font-size: 18px;
}

.barcode {
	height: 100px;
}

.barcode img {
	height: 100%;
}

.right .ticket-number {
	color: gray;
}

.tt {
	border-bottom: none;
}
</style>
<div align="right" style="margin-bottom: 80px; height: 400px;">
	<h4>구매한 공연</h4>
			<div class="ticket">
				<div class="left">
					<div class="ticket-info">
						<p class="date">
							<span><fmt:formatDate pattern="E요일"
									value="${ticket.performancevo.sdate }" /></span> <span
								class="june-29"><fmt:formatDate pattern="M월 dd일"
									value="${ticket.performancevo.sdate }" /></span> <span><fmt:formatDate
									pattern="yyyy" value="${ticket.performancevo.sdate }" /></span>
						</p>
						<div class="show-name" style="text-align: center;">
							<span>${ticket.performancevo.name }</span>
						</div>
						<br>
						<div style="text-align: left;">
							<p style="margin:15px; font-size:15pt;"><fmt:formatDate pattern="YYYY년 MM월 dd일 E요일" value="${ticket.performancevo.sdate }" /></p>
							<p style="margin:15px; font-size:15pt;"><fmt:formatDate pattern="HH시 mm분" value="${ticket.performancevo.sdate }" />~<fmt:formatDate pattern="HH시 mm분" value="${ticket.performancevo.edate }" /></p>
						</div>
						<p class="location">
							<span>${ticket.performancevo.location }</span> <span class="separator"><i
								class="far fa-smile"></i></span><span>053-421-2460</span>
						</p>
					</div>
				</div>
				<div class="right" style="width: 240px;">

					<div class="right-info-container"
						style="margin-top: 20px; margin-right: 20px; height: 350px;">
						<div class="show-name" style="text-align: center;">
							<h1>${ticket.performancevo.name }</h1>
						</div>
						<div class="time">
							<p style="margin: 0px;">
								<fmt:formatDate pattern="MM월 dd일 HH:mm "
									value="${ticket.performancevo.sdate }" />
								<span>To </span>
								<fmt:formatDate pattern="HH:mm "
									value="${ticket.performancevo.edate }" />
							</p>
							<p style="font-size: 16pt; margin-top: 10px;">총인원 :
								${ticket.person }명</p>
							<p style="margin: 0px; color: red; font-size: 18pt;">${ticket.attendance }</p>
						</div>
						<div class="barcode">
							<img src="api/picture/qrCodes/${ticket.qrcode}">
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<div align="right" style="margin-bottom: 80px; margin-top:40px; height: 400px; border-bottom: none;">
		<h4>오시는길</h4>
		
		<!-- row clearfix -->
			<div class="grid_12 tt" style="margin-top:20px;">
				<div id="map" style="width: 580px; height: 250px;"></div>
				<div style="text-align: left; margin-top:20px;">
					<h2>
						1호선 <span style="color: #FFD700;">중앙로역</span> 1번출구<br>
						<br> 약 200M(도보3분)
					</h2>
				</div>
			</div>
		</div>
<script>
	var container = document.getElementById('map');
	var options = {
		center : new kakao.maps.LatLng(35.869083704286574, 128.59330299446304),
		level : 3
	};

	var map = new kakao.maps.Map(container, options);

	// 마커가 표시될 위치
	var markerPosition = new kakao.maps.LatLng(35.869083704286574,
			128.59330299446304);

	// 마커 생성
	var marker = new kakao.maps.Marker({
		position : markerPosition
	});

	// 마커가 지도 위에 표시되도록 설정
	marker.setMap(map);
</script>