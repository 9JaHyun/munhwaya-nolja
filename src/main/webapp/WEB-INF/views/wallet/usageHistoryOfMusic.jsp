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
<%
response.setHeader("Cache-Control", "no-store");
response.setHeader("Pragma", "no-cache");
response.setDateHeader("Expires", 0);
if (request.getProtocol().equals("HTTP/1.1"))
	response.setHeader("Cache-Control", "no-cache");
%>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<div align="right" style="margin-bottom: 50px;">
	<h4>마일리지 사용내역</h4>
	<div class="mbf clearfix" style="font-size: 20px;"></div>
	<div style="float: right;">
		<div style="float: left; margin-right: 30px;">
			<a href="" class="tbutton small"><span>곡 구매 내역</span></a>
		</div>
		<div style="float: left; margin-right: 30px;">
			<a href="usageHistoryOfPerformance.do" class="tbutton small"><span>공연
					티켓 구매 내역</span></a>
		</div>
		<div style="float: left; margin-right: 30px;">
			<a href="walletInfo.do" class="tbutton small"><span>출금 내역</span></a>
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
		<form id="dateSelect" action="usageHistoryOfMusic.do" method="post"
			style="color: white;">
			시작일&nbsp;&nbsp; <input type="date" id="startDate" name="startDate"
				style="margin-bottom: 0px; margin-right: 20px; width: 100px;"
				value="${startDate}" max="${endDate}"> 종료일&nbsp;&nbsp;&nbsp;&nbsp; <input
				type="date" id="endDate" name="endDate"
				style="margin-bottom: 0px; width: 100px" value="${endDate }">
			<input type="submit" value="검색" class="tbutton small"
				style="height: 30px; width: 50px">
		</form>
		<div style="color: white; margin-top: 10px; margin-bottom: 10px;">
			기간별 사용액&nbsp;&nbsp;<input type="text" id="sumMileage"
				value="${sumMileage }" readonly="readonly"
				style="height: 20px; width: 60px; margin-bottom: 0px;">
		</div>
	</div>
	<table class="table">
		<thead>
			<tr>
				<th scope="col">사용 일자</th>
				<th scope="col">사용 금액</th>
				<th scope="col">사용처</th>
				<th scope="col">구매한 곡 명</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${usages }" var="usage">
				<tr>
					<td class="selReq" data-usageid="${usage.usageIds }" data-toggle="modal" data-target="#myModal" data-dismiss="modal" data-backdrop="static" data-keyboard="false" aria-label="Close" data-mid="${requestList.memberId }"><fmt:formatDate pattern="YYYY년 MM월 dd일 HH시 mm분"
							value="${usage.useAt}"  /></td>
					<td class="listMileage">${usage.mileage }</td>
					<td>${usage.commonCodevo.name }</td>
					<td>${usage.musicvo.title }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>
<div class="pageInfo_wrap">
	<div class="pageInfo_area"
		style="margin-left: auto; margin-top: 30px; width: 660px;">
		<ul id="pageInfo" class="pageInfo">
			<!-- 이전페이지 버튼 -->
			<c:if test="${pageMaker.prev}">
				<li class="pageInfo_btn previous"><a href="#"
					onclick="paging(${pageMaker.startPage-1})"
					style="border: 1px solid white; padding: 5px 5px;">Previous</a></li>
			</c:if>
			<!-- 각 번호 페이지 버튼 -->
			<c:forEach var="num" begin="${pageMaker.startPage}"
				end="${pageMaker.endPage}">
				<li class="pageInfo_btn ${pageMaker.cri.pageNum == num ? "active":""}"><a
					href="#" onclick="paging(${num})"
					style="border: 1px solid white; padding: 5px 5px;">${num}</a></li>
			</c:forEach>
			<!-- 다음페이지 버튼 -->
			<c:if test="${pageMaker.next}">
				<li class="pageInfo_btn next"><a href="#"
					onclick="paging(${pageMaker.endPage + 1})"
					style="border: 1px solid white; padding: 5px 5px;">Next</a></li>
			</c:if>
		</ul>
	</div>
</div>

<form id="moveForm" method="get" action="usageHistoryOfMusic.do">
	<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
	<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
	<input type="hidden" name="startDate" value="${startDate }"> <input
		type="hidden" name="endDate" value="${endDate }">
</form>


<div align="right">
	<a href="walletInfo.do" class="tbutton small" style="margin-top: 50px"><span>목록으로</span></a>
</div>

<!-- 모달 -->
<div class="modal fade def-block" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="top:30%; display:none;">
  <div class="modal-dialog ">
    <div class="modal-content ">
      <div class="modal-header" id="modalHeader">
        <h4 class="modal-title" id="myModalLabel">구매 목록</h4>
      </div>
     <table class="table">
		<thead>
			<tr>
				<th scope="col">사용 일자</th>
				<th scope="col">사용 금액</th>
				<th scope="col">구매한 곡 명</th>
				<th scope="col">상태(환불 여부)</th>
			</tr>
		</thead>
		<tbody id="tbody">
		</tbody>
	</table>
      <div id="artworkRead"style="color:white;"></div>
      <div class="modal-footer def-block">
        <button class="tbutton small" data-dismiss="modal" aria-label="Close" onclick="removeData()"><span>목록으로</span></button>
      </div>
    </div>
  </div>
</div>
<!-- 모달 끝-->
<script>
	 function paging(num) {
		moveForm.pageNum.value = num;
		moveForm.submit();
		
	};
	
	function selChange() {
		var sel = document.getElementById('cntPerPage').value;
		var startDate = document.getElementById('startDate').value;
		var endDate = document.getElementById('endDate').value;
		location.href="usageHistoryOfMusic.do?pageNum=1&amount="+sel+"&startDate="+startDate+"&endDate="+endDate;
	}
	
	var sumMileage = document.getElementById('sumMileage').value;
	var sumMileage2 = sumMileage.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	document.getElementById('sumMileage').value = sumMileage2+'원';
	
	for (var i=0; i<document.getElementsByClassName('listMileage').length; i++) {
	var listMileage = document.getElementsByClassName('listMileage')[i].textContent
	var listMileage2 = listMileage.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	document.getElementsByClassName('listMileage')[i].textContent = listMileage2+'원';
	
	}
	
function refundOfMusic() {

		if($(event.target).text() == '환불 불가' || $(event.target).text() == '환불 완료' ) {
			alert("환불이 불가능한 상태입니다.");
		} else {
				var id = $(event.target).data("usageid");
				var useAt = $(event.target).data(useAt);
					
			var confirm1 = confirm('환불 하시겠습니까?')
			if (confirm1) {
				$.ajax ({
					url:"refundOfMusic.do",
					type:"post",
					data : {"id": id, "place": "U01", "useAt" : useAt},
					dataType : "text",
			        success : function(data) {
		                alert("환불 되었습니다.")
 		                location.href="usageHistoryOfMusic.do";
			        },
	                error: function (xhr, status, error) {
	                    alert("환불에 실패 하였습니다.");
	                }
	            })
	        } else {
	            alert("취소하셨습니다.")
	        }
	    }
}
	$('.selReq').on("click", function(e) {
		let list =[];
		if($(event.target).data("usageid").toString().includes(',')){
			var id = $(event.target).data("usageid").split(', ');
			for (let i = 0; i < $(event.target).data("usageid").split(', ').length; i++) {
				var obj= {};
				obj["pks"] = id[i];
				list.push(obj);		
				
			}
		} else{
			var id = $(event.target).data("usageid");
			var obj= {};
			obj["pks"] = id;
			list.push(obj);		
		}
		console.log(list);
		$.ajax ({
			url:"usagePurchasedMusic",
			type:"post",
			data : JSON.stringify(list),
			dataType : "text",
			contentType : 'application/json; charset=utf-8',
			success : function(data) {
                alert("로딩이 완료 되었습니다.");
                var object = JSON.parse(data);
                console.log(object);
                console.log(object[0]['id']);
                console.log(object.length);
                for(var i=0; i<object.length; i++) {
				$('#tbody').append(
						'<tr class="insert">' +
						'<td class="useAt">'+object[i]['useAt'] + '</td>' +
						'<td class="mileage">'+object[i]['mileage'] + '</td>' +
						'<td class="name">'+object[i]['name'] + '</td>' +
						'<td class="refund">'+'<button class="tbutton small refundBtn" onclick="refundOfMusic()" data-usageid='+object[i]['id']+'>'+object[i]['refund']+ '</button>' + '</td>' + 
						'</tr>'
						)	
				if($('.refundBtn')[i].innerHTML == 'B01') {
					$('.refundBtn')[i].innerHTML = '환불 신청';
				} 
				else if ($('.refundBtn')[i].innerHTML == 'B03') {
					$('.refundBtn')[i].innerHTML = '환불 불가';
				} else {
					$('.refundBtn')[i].innerHTML ='환불 완료';
				}
               
                }
//                	replaceButton();
	        },
            error: function (xhr, status, error) {
                alert("실패");
            }
		})
	});
	
	function removeData() {
		$('.insert').remove();
	}
	
// 	function replaceButton() {
// 		for(var i=0; i < $('.refund').length; i++ ) {
// 			if($('.refundBtn')[i].innerHTML == '환불 불가') {
// 				$('.refundBtn')[i].remove();
// 				$('.refund').innerHTML = '환불 불가';
// 			} else if($('.refundBtn')[i].innerHTML == '환불 완료') {
// 				$('.refundBtn')[i].remove();
// 				$('.refund').innerHTML = '환불 완료';
// 			}
// 		}
// 	};
</script>