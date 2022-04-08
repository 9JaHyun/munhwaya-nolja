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
</style>
<div class="def-block clearfix">
	<div align="right" style="margin-bottom: 50px;">
		<h4>상세 지갑 정보</h4>

		<div class="mbf clearfix" style="font-size: 20px;">
			<div align="center" style="color: white" class="def-block clearfix">
				현재 보유중인 마일리지&nbsp;&nbsp;&nbsp;<input type="text" readonly="readonly"
					style="height: 15px; margin-top: 5px;" value="${mileage }">
			</div>
		</div>
		<div style="float: right;">
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
					<th scope="col">충전 일자</th>
					<th scope="col">충전 금액</th>
					<th scope="col">충전 수단</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${charges }" var="charge">
					<tr>
						<td><fmt:formatDate pattern="YYYY년 MM월 dd일 HH시 mm분" value="${charge.chargeAt}"/></td>
						<td>${charge.mileage }</td>
						<td>${charge.commonCodevo.name }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<div class="pageInfo_wrap">
		<div class="pageInfo_area" style="margin-left:100px;">
			<ul id="pageInfo" class="pageInfo">
				<!-- 이전페이지 버튼 -->
				<c:if test="${pageMaker.prev}">
					<li class="pageInfo_btn previous"><a href="#"
						onclick="paging(${pageMaker.startPage-1})">Previous</a></li>
				</c:if>
				<!-- 각 번호 페이지 버튼 -->
				<c:forEach var="num" begin="${pageMaker.startPage}"
					end="${pageMaker.endPage}">
					<li class="pageInfo_btn ${pageMaker.cri.pageNum == num ? "active":"" }"><a
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

	<form id="moveForm" method="get" action="walletInfoSelect.do">
		<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
		<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
		<%-- 		<input type="hidden" name="keyword" value="${pageMaker.cri.keyword }"> --%>
		<%-- 		<input type="hidden" name="type" value="${pageMaker.cri.type }"> --%>
	</form>

	<div align="right">
		<a href="walletInfo.do" class="tbutton small" style="margin-top: 50px"><span>뒤로가기</span></a>
	</div>
</div>

<button class="tbutton small" data-toggle="modal" data-target="#myModal" data-dismiss="modal" aria-label="Close"><span>위시리스트 생성</span></button>
<!-- 위시리스트모달 -->
<div class="modal fade def-block" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="top:30%; display:none;">
  <div class="modal-dialog">
    <div class="modal-content ">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span style="color:white" aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">위시리스트 선택</h4>
      </div>
      <div id="activeAdd" class="modal-body def-block">
      <div class="mbf clearfix">
         <ul>
            <li>
               <!-- 위시리스트 이름 -->
               <div class="toggle-head">
                  <h5 style="margin:0px;">
                     <button onclick="" class="tbutton small" style="margin-left:90%">
                        <span data-wishid="">선택</span>
                     </button>
                  </h5>
               </div>
            </li>
         </ul>
      </div>
      </div>
      <div class="modal-footer def-block">
        <button class="tbutton small" data-toggle="modal" data-target="#myModal2" data-dismiss="modal" aria-label="Close"><span>위시리스트 생성</span></button>
        <button class="tbutton small" data-dismiss="modal" aria-label="Close"><span>확인</span></button>
      </div>
    </div>
  </div>
</div>
   <!-- 위시리스트모달 끝-->

<!-- def block -->
<!-- span8 posts -->
<script>
	 function paging(num) {
		moveForm.pageNum.value = num;
		moveForm.submit();
		
	};
	
	function selChange() {
		var sel = document.getElementById('cntPerPage').value;
		location.href="walletInfoSelect.do?pageNum=1&amount="+sel;
	}


	
</script>