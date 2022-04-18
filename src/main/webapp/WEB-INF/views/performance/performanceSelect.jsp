<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="resources" value="${pageContext.request.contextPath}/resources" />
	<div class="under_header">
		<img src="${resources}/images/assets/breadcrumbs1.png" alt="#">
	</div>
	<!-- under header -->

	<div class="page-content back_to_up">
		<div class="row clearfix mb">
			<div class="breadcrumbIn">
				<ul>
					<li><a href="index.html" class="toptip" title="Homepage">
							<i class="icon-home"></i>
					</a></li>
					<li><a href="performance.do"> 공연 </a></li>
					<li>공연 상세정보</li>
				</ul>
			</div>
			<!-- breadcrumb -->
		</div>

		<div class="row row-fluid clearfix mbf">
			<div class="span8 posts">
				<div class="def-block" style="width:600px;">
					<h4>공연 상세정보</h4>
					<span class="liner"></span>

					<div class="products shop clearfix">
						<div class="grid_12">
							<div class="clearfix mbs">
								<div class="grid_6" style="border: 1px solid white; width: 250px; height: 300px; margin-top:30px;">
									<div>
										<img src="api/picture/${performance.image }"
											style="width: 250px; height: 300px;">
									</div>
								</div>
								<!-- grid6 -->

								<div class="grid_6" style="margin-left:33px;">
									<h3 style="font-size: 25pt; margin-bottom: 30px;">${performance.name }</h3>
									<br>
									<div style="margin-bottom: 10px">
										<strong style="font-size: 14pt;">아티스트</strong>
										<span style="margin-left:30px; color:white; font-size:13pt;">${artistname }</span>
									</div>
									<br>
									<div style="margin-bottom: 10px">
										<strong style="font-size: 14pt;">공연장소</strong>
										<span style="margin-left:30px; color:white; font-size:13pt;">${performance.location }</span>
									</div>
									<br>
									<div style="margin-bottom: 10px">
										<strong style="font-size: 14pt">공연시작일</strong>
										<span style="margin-left:13px; color:white; font-size:13pt;"><fmt:formatDate pattern="MM월 dd일 HH시 mm분" value="${performance.sdate }" /></span>
									</div>
									<br>
									<div style="margin-bottom: 10px">
										<strong style="font-size: 14pt">공연종료일</strong>
										<span style="margin-left:13px; color:white; font-size:13pt;"><fmt:formatDate pattern="MM월 dd일 HH시 mm분" value="${performance.edate }" /></span>
									</div>
									<br>
									<div style="margin-bottom: 10px">
										<strong style="font-size: 14pt;">공연가격</strong>
										<span id="Mileage" style="margin-left:30px; color:white; font-size:13pt;">${performance.price }</span>
									</div>
								</div>
								<!-- grid6 -->
							</div>
							<!-- clearfix -->


							<div class="clearfix mbs">
								<ul class="tabs">
									<li><a href="#t-1" class="active">공연내용</a></li>
								</ul>
								<!-- tabs -->

								<ul class="tabs-content">
									<li id="t-1" class="active"><strong>${performance.content }</strong>
									</li>
									<!-- tab content -->
								</ul>
								<!-- end tabs -->
							</div>
							<!-- clearfix -->

						</div>
						<!-- grid12 -->
					</div>
					<!-- products -->
				</div>
				<!-- def block -->
			</div>
			<!-- span8 posts -->

			<div class="span4 sidebar">
				<div class="def-block widget">
					<h4>가격</h4>
					<span class="liner"></span>
					<div class="widget-content">
						<table class="total_w_table" cellspacing="0">
							<tbody>
								<tr class="cart-subtotal">
									<th><strong>보유중인 마일리지</strong></th>
									<td><span class="sumMileage" style="margin-left:10px; color:white; font-size:13pt;">${mileage }</span></td>
								</tr>
								<tr class="total">
									<th><strong>결제 금액</strong></th>
									<td><span class="sumMileage" id="price"style="margin-left:10px; color:white; font-size:13pt;">${performance.price }</span></td>
								</tr>
								<tr class="total">
									<th><strong>잔여 마일리지</strong></th>
									<td><span class="sumMileage" id="mileage" style="margin-left:10px; color:white; font-size:13pt;">${mileage }</span></td>
								</tr>
							</tbody>
						</table>
						<br><br><br>
						<h4>티켓수량</h4>
						<span class="liner"></span>
						<select id="option" style="width:275px; margin-bottom:20px;" onchange="changeMileage(this.value)">
						<c:choose >
						<c:when test="${performance.performancepersonalvo.personal > 45}">
							<c:forEach var="i" begin="1" end="${50 - performance.performancepersonalvo.personal}">
								<option value="${i}">${i}매</option>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<c:forEach var="i" begin="1" end="5">
								<option value="${i}">${i}매</option>
							</c:forEach>
						</c:otherwise>
						</c:choose>
						</select>
						
						<span class="liner"></span>
						<button onclick="ticketListInsert(${performance.id})"
							type="button" class="tbutton mt medium" name="update_cart" style="width:275px;">
							<span>구매하기</span>
						</button>
					</div>
					<!-- widget content -->
				</div>
				<!-- widget shop cart -->
			</div>
			<!-- span4 sidebar -->

			<div class="span4 sidebar">

				<div class="def-block widget">
					<h4>현재시간</h4>
					<span class="liner"></span>
					<div class="widget-content tags">
						<ul id="backsoon" class="countdown clearfix">
							<li style="padding:0px;">
        						<span id="date" class="date" style="font-size:17pt;"></span>
								<span id="time" class="days" style="font-size:18pt;"></span>							
							</li>
							<li style="padding:0px;">
							</li>
						</ul>
					</div>
					<!-- widget content -->
				</div>
				<!-- span4 sidebar -->

			</div>
			<!-- row clearfix -->
		</div>
		<!-- end page content -->
	</div>
	<!-- end layout -->
<div>
	<form id = "ticketFrm" action="ticketListInsert.do" method="get">
		<input type="hidden" id="id" name="id">
		<input type="hidden" id="person" name="person">
	</form>
</div>
<script type="text/javascript">
	
	function changeMileage(value) {
		let price = '${performance.price }' * value 
		$("#price").html(price + '원')
		let mileage = '${mileage}' - price
		$("#mileage").html(mileage + '원')
	}

	function ticketListInsert(n) {
		ticketFrm.id.value = n;
		var num = $('#option').val();
		console.log(num);
		ticketFrm.person.value = num;
		ticketFrm.submit();
	}
	
	function setClock(){
	    var dateInfo = new Date(); 
	    var hour = modifyNumber(dateInfo.getHours());
	    var min = modifyNumber(dateInfo.getMinutes());
	    var sec = modifyNumber(dateInfo.getSeconds());
	    var year = dateInfo.getFullYear();
	    var month = dateInfo.getMonth()+1; //monthIndex를 반환해주기 때문에 1을 더해준다.
	    var date = dateInfo.getDate();
	    document.getElementById("time").innerHTML = hour + ":" + min  + ":" + sec;
	    document.getElementById("date").innerHTML = year + "년 " + month + "월 " + date + "일";
	}
	function modifyNumber(time){
	    if(parseInt(time)<10){
	        return "0"+ time;
	    }
	    else
	        return time;
	}
	window.onload = function(){
	    setClock();
	    setInterval(setClock,1000); //1초마다 setClock 함수 실행
	}
	
 var sumMileage = document.getElementById('Mileage').innerHTML;
 var sumMileage2 = sumMileage.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
 document.getElementById('Mileage').innerHTML = sumMileage2+'원';
 
 for (var i=0; i<document.getElementsByClassName('sumMileage').length; i++) {
	    var listMileage = document.getElementsByClassName('sumMileage')[i].innerHTML
	    var listMileage2 = listMileage.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	    document.getElementsByClassName('sumMileage')[i].innerHTML = listMileage2+'원';
	    }
</script>