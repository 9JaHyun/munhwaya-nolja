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
	color: white;
	text-decoration: underline;
}

.active {
	background-color: #cdd5ec;
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

.accordion {
  background-color: #eee;
  color: #444;
  cursor: pointer;
  padding: 18px;
  width: 100%;
  border: none;
  text-align: left;
  outline: none;
  font-size: 15px;
  transition: 0.4s;
}

</style>
<!-- <div class="def-block clearfix"> -->
<div align="right" style="margin-bottom: 50px;">
	<h4>마일리지 사용내역</h4>
	<div class="mbf clearfix" style="font-size: 20px;"></div>
	<div style="float:right;">
	<div style="float:left; margin-right:30px;"><a href="usageHistoryOfMusic.do" class="tbutton small"><span>곡 구매 내역</span></a></div> 
	<div style="float:left; margin-right:30px;"><a href="" class="tbutton small"><span>공연 티켓 구매 내역</span></a></div> 
	<div style="float:left; margin-right:30px;"><a href="walletInfo.do" class="tbutton small"><span>출금 내역</span></a></div>
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
	</div>
	<table class="table">
		<thead>
			<tr>
				<th scope="col">사용 일자</th>
				<th scope="col">사용 금액</th>
				<th scope="col">사용처</th>
				<th scope="col">구매한 공연 명</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${usages }" var="usage">
				<tr>
					<td><fmt:formatDate pattern="YYYY년 MM월 dd일 HH시 mm분"
							value="${usage.useAt}" /></td>
					<td>${usage.mileage }</td>
					<td>${usage.commonCodevo.name }</td>
					<td>${usage.performancevo.name }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>
<div class="pageInfo_wrap">
	<div class="pageInfo_area" style="margin-left: 100px;">
		<ul id="pageInfo" class="pageInfo">
			<!-- 이전페이지 버튼 -->
			<c:if test="${pageMaker.prev}">
				<li class="pageInfo_btn previous"><a href="#"
					onclick="paging(${pageMaker.startPage-1})">Previous</a></li>
			</c:if>
			<!-- 각 번호 페이지 버튼 -->
			<c:forEach var="num" begin="${pageMaker.startPage}"
				end="${pageMaker.endPage}">
				<li class="pageInfo_btn ${pageMaker.cri.pageNum == num ? "active":""}"><a
					href="#" onclick="paging(${num})">${num}</a></li>
			</c:forEach>
			<!-- 다음페이지 버튼 -->
			<c:if test="${pageMaker.next}">
				<li class="pageInfo_btn next"><a href="#"
					onclick="paging(${pageMaker.endPage + 1})">Next</a></li>
			</c:if>
		</ul>
	</div>
</div>

<form id="moveForm" method="get" action="usageHistoryOfPerformance.do">
	<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
	<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
	<%-- 		<input type="hidden" name="keyword" value="${pageMaker.cri.keyword }"> --%>
	<%-- 		<input type="hidden" name="type" value="${pageMaker.cri.type }"> --%>
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
		location.href="usageHistoryOfPerformance.do?pageNum=1&amount="+sel;
	}

</script>