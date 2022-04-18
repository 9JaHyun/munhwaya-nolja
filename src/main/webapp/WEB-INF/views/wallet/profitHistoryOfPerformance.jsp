<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<style>
.pageInfo {
	list-style: none;
	display: inline-block;
	margin: 10px 0 0 100px;
}

.pageInfo li {
	float: left;
	font-size: 1px;
	margin-left: 10px;
	padding: 7px;
	font-weight: 500;
}

a:link {
	color: white;
	text-decoration: none;
}

a:visited {
	color: white;
	text-decoration: none;
}

a:hover {
	color: #FF0078;
	text-decoration: underline;
}

.search_area {
	display: inline-block;
	margin-top: 30px;
	margin-left: 260px;
}

.search_area input {
	height: 30px;
	width: 250px;
}

.search_area button {
	width: 100px;
	height: 36px;
}
</style>
<%
response.setHeader("Cache-Control", "no-store");
response.setHeader("Pragma", "no-cache");
response.setDateHeader("Expires", 0);
if (request.getProtocol().equals("HTTP/1.1"))
	response.setHeader("Cache-Control", "no-cache");
%>
<!-- <div class="def-block clearfix"> -->
<div align="right" style="margin-bottom: 50px;">
	<h4>아티스트 수익내역</h4>

	<div class="mbf clearfix" style="font-size: 20px;"></div>
	<div style="float: right;">
		<div style="float: left; margin-right: 70px;">
			<a href="profitHistoryOfMusic.do" class="tbutton small"><span>곡 수익 내역</span></a>
		</div>
		<div style="float: left; margin-right: 70px;">
			<a href="" class="tbutton small"><span>공연
					수익 내역</span></a>
		</div>
		<select id="cntPerPage" name="sel" onchange="selChange()">
			<option value="10"
				<c:if test="${pageMaker.cri.amount == 10}">selected</c:if>>10줄
				보기</option>
			<option value="15"
				<c:if test="${pageMaker.cri.amount == 15}">selected</c:if>>15줄
				보기</option>
			<option value="20"
				<c:if test="${pageMaker.cri.amount == 20}">selected</c:if>>20줄
				보기</option>
		</select>
		<form id="dateSelect" action="profitHistoryOfPerformance.do" method="post"
				style="color: white;">
				시작일&nbsp;&nbsp; <input type="date" id="startDate" name="startDate"
					style="margin-bottom: 0px; margin-right: 20px; width: 100px;"
					value="${startDate}"> 종료일&nbsp;&nbsp;&nbsp;&nbsp; <input
					type="date" id="endDate" name="endDate"
					style="margin-bottom: 0px; width: 100px" value="${endDate }">
				<input type="submit" value="검색" class="tbutton small"
					style="height: 30px; width: 50px">
			</form>
			<div style="color: white; margin-top: 10px; margin-bottom: 10px;">
				기간별 수익&nbsp;&nbsp;<input type="text" id="sumMileage"
					value="${sumMileage }" readonly="readonly"
					style="height: 20px; width: 60px; margin-bottom: 0px;">
			</div>
	</div>
	<table class="table" style="word-break:break-all;">
		<thead>
			<tr>
				<th scope="col">수익 일자</th>
				<th scope="col">수익 금액</th>
				<th scope="col">수익처</th>
				<th scope="col">판매 공연</th>
				<th scope="col">상태(환불 여부)</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${profits }" var="profit">
				<tr>
					<td><fmt:formatDate pattern="YYYY년 MM월 dd일 HH시 mm분"
							value="${profit.profitAt}" /></td>
					<td class="listMileage">${profit.mileage }</td>
					<td>${profit.commonCodevo.name }</td>
					<td style="width:15%">${profit.performancevo.name }</td>
					<td><c:choose>
							<c:when test="${profit.refund eq 'B01'}">
								<span>결제</span>
							</c:when>
							<c:when test="${profit.refund eq 'B02'}">
								<span>환불 완료</span>
							</c:when>
							<c:when test="${profit.refund eq 'B03'}">
								<span>환불 불가</span>
							</c:when>
						</c:choose></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>
<div class="pageInfo_wrap" style="float:left; width:80%; text-align:center;">
	<div class="pageInfo_area" style="display: inline-block;">
		<ul id="pageInfo" class="pageInfo">
			<!-- 이전페이지 버튼 -->
			<c:if test="${pageMaker.prev}">
				<li class="pageInfo_btn previous"><a href="#"
					onclick="paging(${pageMaker.startPage-1})" style="border : 1px solid white; padding:5px 5px;">Previous</a></li>
			</c:if>
			<!-- 각 번호 페이지 버튼 -->
			<c:forEach var="num" begin="${pageMaker.startPage}"
				end="${pageMaker.endPage}">
				<li class="pageInfo_btn ${pageMaker.cri.pageNum == num ? "active":"" }"><a
					href="#" onclick="paging(${num})" style="border : 1px solid white; padding:5px 5px;">${num}</a></li>
			</c:forEach>
			<!-- 다음페이지 버튼 -->
			<c:if test="${pageMaker.next}">
				<li class="pageInfo_btn next"><a href="#"
					onclick="paging(${pageMaker.endPage + 1})" style="border : 1px solid white; padding:5px 5px;">Next</a></li>
			</c:if>
		</ul>
	</div>
</div>

<form id="moveForm" method="get" action="profitHistoryOfPerformance.do">
	<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
	<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
	<input type="hidden" name="startDate" value="${startDate }"> <input
			type="hidden" name="endDate" value="${endDate }">
</form>

<div align="right">
	<a href="walletInfo.do" class="tbutton small" style="margin-top: 50px"><span>뒤로가기</span></a>
</div>

<script>
	 function paging(num) {
		moveForm.pageNum.value = num;
		moveForm.submit();
		
	};
	
	function selChange() {
		var sel = document.getElementById('cntPerPage').value;
		var startDate = document.getElementById('startDate').value;
		var endDate = document.getElementById('endDate').value;
		location.href="profitHistoryOfPerformance.do?pageNum=1&amount="+sel+"&startDate="+startDate+"&endDate="+endDate;
	}

	var sumMileage = document.getElementById('sumMileage').value;
	var sumMileage2 = sumMileage.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	document.getElementById('sumMileage').value = sumMileage2+'원';
	
	for (var i=0; i<document.getElementsByClassName('listMileage').length; i++) {
	var listMileage = document.getElementsByClassName('listMileage')[i].textContent
	var listMileage2 = listMileage.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	document.getElementsByClassName('listMileage')[i].textContent = listMileage2+'원';
	
	}
</script>