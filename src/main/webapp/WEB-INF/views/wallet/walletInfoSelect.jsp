<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
.pageInfo {
	list-style: none;
	display: inline-block;
	margin: 50px 0 0 100px;
}

.pageInfo li {
	float: left;
	font-size: 20px;
	margin-left: 18px;
	padding: 7px;
	font-weight: 500;
}

a:link {
	color: black;
	text-decoration: none;
}

a:visited {
	color: black;
	text-decoration: none;
}

a:hover {
	color: black;
	text-decoration: underline;
}

.active{
      background-color: #cdd5ec;
  }
 
</style>
<div class="def-block clearfix">
	<div align="right" style="margin-bottom: 50px;">
		<h4>상세 지갑 정보</h4>

		<div class="mbf clearfix" style="font-size: 20px;">
			<div align="center" style="color: white" class="def-block clearfix">
				현재 보유중인 마일리지&nbsp;&nbsp;&nbsp;<input type="text" readonly="readonly"
					style="height: 15px; margin-top: 5px;">
			</div>
<!-- 			<div align="center" style="color: white" class="def-block clearfix"> -->
<!-- 				요소 선택 <select id="dataPerPage"> -->
<!-- 					<option value="10">10개씩보기</option> -->
<!-- 					<option value="15">15개씩보기</option> -->
<!-- 					<option value="20">20개씩보기</option> -->
<!-- 				</select> -->
<!-- 			</div> -->

		</div>
		<table class="table">
			<thead>
				<tr>
					<th scope="col">충전 일자</th>
					<th scope="col">충전 금액</th>
					<th scope="col">충전 수단</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${charges }" var="charge">
					<tr>
						<td>${charge.chargeAt}</td>
						<td>${charge.mileage }</td>
						<td>${charge.commonCodevo.name }</td>
					</tr>
				</c:forEach>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="6">Footer Note: Lorem ipsum dolor sit amet</td>
				</tr>
			</tfoot>
		</table>
	</div>
	<div class="pageInfo_wrap">
		<div class="pageInfo_area">
			<ul id="pageInfo" class="pageInfo">
				<!-- 이전페이지 버튼 -->
				<c:if test="${pageMaker.prev}">
					<li class="pageInfo_btn previous"><a
						href="${pageMaker.startPage-1}">Previous</a></li>
				</c:if>
				<!-- 각 번호 페이지 버튼 -->
				<c:forEach var="num" begin="${pageMaker.startPage}"
					end="${pageMaker.endPage}">
					<li class="pageInfo_btn ${pageMaker.cri.pageNum == num ? "active":"" }"><button
						onclick="paging(${num})">${num}</button></li>
				</c:forEach>
				<!-- 다음페이지 버튼 -->
				<c:if test="${pageMaker.next}">
					<li class="pageInfo_btn next"><a
						href="${pageMaker.endPage + 1 }">Next</a></li>
				</c:if>
			</ul>
		</div>
	</div>

	<form id="moveForm" method="get" action="walletInfoSelect.do" >
		<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
		<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
	</form>

	<div align="right">
		<a href="walletInfo.do" class="tbutton small" style="margin-top: 50px"><span>뒤로가기</span></a>
	</div>
</div>


<!-- def block -->
<!-- span8 posts -->
<script>
	 function paging(num) {
		moveForm.pageNum.value = num;
// 		moveForm.attr("action", "walletInfoSelect.do");
		moveForm.submit();
	};
</script>