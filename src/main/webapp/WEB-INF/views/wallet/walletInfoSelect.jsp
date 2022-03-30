<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
ul {
	text-align: center;
	display: inline-block;
	border: 1px solid #ccc;
	border-right: 0;
}

ul li {
	text-align: center;
	float: left;
}

ul li a {
	display: block;
	font-size: 14px;
	padding: 9px 12px;
	border-right: solid 1px #ccc;
	box-sizing: border-box;
}

ul li.on {
	background: #eda712;
}

ul li.on a {
	color: #fff;
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
			<div align="center" style="color: white" class="def-block clearfix">
				요소 선택 <select id="dataPerPage">
					<option value="10">10개씩보기</option>
					<option value="15">15개씩보기</option>
					<option value="20">20개씩보기</option>
				</select>
			</div>
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
	<div align="right">
		<a href="walletInfo.do" class="tbutton small" style="margin-top: 50px"><span>뒤로가기</span></a>
	</div>
</div>
<ul id="pagingul">
</ul>
<!-- def block -->
<!-- span8 posts -->
<script>
let totalData; //총 데이터 수
let dataPerPage; //한 페이지에 나타낼 글 수
let pageCount = 10; //페이징에 나타낼 페이지 수
let globalCurrentPage=1; //현재 페이지

$(document).ready(function () {
 //dataPerPage 선택값 가져오기
 dataPerPage = $("#dataPerPage").val();
 
 $.ajax({ // ajax로 데이터 가져오기
	method: "GET",
	url: "https://url/data?" + data,
	dataType: "json",
	success: function (d) {
	   //totalData 구하기
	   totalData = d.data.length;
 });
 
 //글 목록 표시 호출 (테이블 생성)
 displayData(1, dataPerPage);
 
 //페이징 표시 호출
 paging(totalData, dataPerPage, pageCount, 1);
});

function paging(totalData, dataPerPage, pageCount, currentPage) {
	  console.log("currentPage : " + currentPage);

	  totalPage = Math.ceil(totalData / dataPerPage); //총 페이지 수
	  
	  if(totalPage<pageCount){
	    pageCount=totalPage;
	  }
	  
	  let pageGroup = Math.ceil(currentPage / pageCount); // 페이지 그룹
	  let last = pageGroup * pageCount; //화면에 보여질 마지막 페이지 번호
	  
	  if (last > totalPage) {
	    last = totalPage;
	  }

	  let first = last - (pageCount - 1); //화면에 보여질 첫번째 페이지 번호
	  let next = last + 1;
	  let prev = first - 1;

	  let pageHtml = "";

	  if (prev > 0) {
	    pageHtml += "<li><a href='#' id='prev'> 이전 </a></li>";
	  }

	 //페이징 번호 표시 
	  for (var i = first; i <= last; i++) {
	    if (currentPage == i) {
	      pageHtml +=
	        "<li class='on'><a href='#' id='" + i + "'>" + i + "</a></li>";
	    } else {
	      pageHtml += "<li><a href='#' id='" + i + "'>" + i + "</a></li>";
	    }
	  }

	  if (last < totalPage) {
	    pageHtml += "<li><a href='#' id='next'> 다음 </a></li>";
	  }

	  $("#pagingul").html(pageHtml);
	  let displayCount = "";
	  displayCount = "현재 1 - " + totalPage + " 페이지 / " + totalData + "건";
	  $("#displayCount").text(displayCount);


	  //페이징 번호 클릭 이벤트 
	  $("#pagingul li a").click(function () {
	    let $id = $(this).attr("id");
	    selectedPage = $(this).text();

	    if ($id == "next") selectedPage = next;
	    if ($id == "prev") selectedPage = prev;
	    
	    //전역변수에 선택한 페이지 번호를 담는다...
	    globalCurrentPage = selectedPage;
	    //페이징 표시 재호출
	    paging(totalData, dataPerPage, pageCount, selectedPage);
	    //글 목록 표시 재호출
	    displayData(selectedPage, dataPerPage);
	  });
	}
	
//현재 페이지(currentPage)와 페이지당 글 개수(dataPerPage) 반영
function displayData(currentPage, dataPerPage) {

  let chartHtml = "";

//Number로 변환하지 않으면 아래에서 +를 할 경우 스트링 결합이 되어버림.. 
  currentPage = Number(currentPage);
  dataPerPage = Number(dataPerPage);
  
  for (
    var i = (currentPage - 1) * dataPerPage;
    i < (currentPage - 1) * dataPerPage + dataPerPage;
    i++
  ) {
    chartHtml +=
      "<tr><td>" +
      dataList[i].d1 +
      "</td><td>" +
      dataList[i].d2 +
      "</td><td>" +
      dataList[i].d3 +
      "</td></tr>";
  }
  $("#dataTableBody").html(chartHtml);
}

$("#dataPerPage").change(function () {
    dataPerPage = $("#dataPerPage").val();
    //전역 변수에 담긴 globalCurrent 값을 이용하여 페이지 이동없이 글 표시개수 변경 
    paging(totalData, dataPerPage, pageCount, globalCurrentPage);
    displayData(globalCurrentPage, dataPerPage);
 });
</script>