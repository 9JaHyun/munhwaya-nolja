<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<style>
	.pageInfo {
   list-style: none;
   display: inline-block;
	}
	
	.pageInfo li {
	   float: left;
	   font-size: 1px;
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
	
	.focus {
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
	div,tbody, td, tr, table{
		vertical-align: middle;
		color: white;
	}
	
	tr {
	margin-bottom: 100px;
	}
</style>
	<!--(배경이미지) -->
	<div class="under_header" style="height:70px">
		<img src="resources/images/bg/musicBB.jpg" alt="" style="height: 1700px;">
	</div>
	<!-- content -->
	<div class="page-content back_to_up">
		<!-- 최상단메인칸 -->
		<div class="row row-fluid clearfix mbf">
			<!-- 검색바 -->
			<div class="little-head row">
				<div class="search">
					<form action="searchResult" id="search" method="get" >
						<input id="title" name="title" type="text"
							style="font-size:x-small; width: 1000px; height: 60px; "
							placeholder="노래명, 앨범명 입력">
						<button type="submit" style="margin-top:15px; margin-right:10px;">
							<i class="icon-search" style="font-size: 25px;"></i>
						</button>
					</form>
				</div>
			</div>
		</div>
		<!-- 검색바 끝-->
		<div class="row row-fluid clearfix mbf">
				<div class="posts">
					<div class="def-block">
						<h4> 내가 구입한 음원 </h4><span class="liner"></span>
						<div class="products shop clearfix">
							<div class="grid_12">
									<div class="bag_table">
										<table class="shop_table footable tablet footable-loaded" style="width:100%;">
											<thead>
												<tr>
													<th></th>
													<th style="width: 300px;"><h4>제목</h4></th>
													<th><h4>가수</h4></th>
													<th><h4>결제한 가격</h4></th>
													<th><h4>결제시기</h4></th>
													<th><h4>다운로드</h4></th>
												</tr>
											<tbody>
											<c:forEach var="music" items="${purchasedList}">
												<tr class="cart_table_item" style="text-align: center; font-size:medium;">
													<td class="product-thumbnail" style="width:70px;">
													<a href="#"><img src="api/picture/${music.picture }" alt="#" style="max-width:70px; min-width:70px; max-height :75px; min-height:75px; margin: 10px 0px 10px 0px;"></a>
													</td>
													<td class="product-name">
														${music.title}
													</td>
													<td class="product-name">
														${music.artName}
													</td>
													<td class="product-name">
														${music.price}원
													</td>
													<td class="product-name">
														<fmt:formatDate pattern = "YYYY년 MM월 dd일" value = "${music.createdAt}" />
														
													</td>
													
													<td class="product-name">
														<button type="button"  onclick="location.href='api/attach/${music.fileId}'; statusUpdate()" class="tbutton medium" style="font-size:10px"><span data-musicid="${music.id }">다운로드</span></button>
													</td>
												</tr>		
											</c:forEach>
											</tbody>
										</table>
									</div><!-- bag table -->
							</div><!-- grid12 -->
						</div><!-- products -->

					</div><!-- def block -->
				</div><!-- span8 posts -->
			</div><!-- row clearfix -->
			<!-- 크기지정  post 끝-->
			<!-- 왼쪽 상단메인 끝 -->
	<div class="pageInfo_wrap">
      <div class="pageInfo_area" style="text-align: center;">
         <ul id="pageInfo" class="pageInfo">
            <!-- 이전페이지 버튼 -->
            <c:if test="${pageMaker.prev}">
               <li class="pageInfo_btn previous"><a href="#"
                  onclick="paging(${pageMaker.startPage-1})">Previous</a></li>
            </c:if>
            <!-- 각 번호 페이지 버튼 -->
            <c:forEach var="num" begin="${pageMaker.startPage}"
               end="${pageMaker.endPage}">
               <li class="pageInfo_btn ${pageMaker.cri.pageNum == num ? "focus":""}"><a
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
</div>
<!-- content끝 -->
<form id="moveForm" method="get" action="purchase">
      <input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
      <input type="hidden" name="amount" value="${pageMaker.cri.amount }">
      <%--       <input type="hidden" name="keyword" value="${pageMaker.cri.keyword }"> --%>
      <%--       <input type="hidden" name="type" value="${pageMaker.cri.type }"> --%>
   </form>
<script>
function paging(num) {
    moveForm.pageNum.value = num;
    moveForm.submit();
 };
//  다운로드 여부 업뎃
 function statusUpdate() {
	
	//클릭한 곳의 뮤직 데이터 속성 가져오기
	let musicId = $(event.target).data("musicid")
	//뮤직아이디 주고 그음원의 status 변경
	 $.ajax({
			type: "POST", //요청 메소드 방식
			url:"statusUpdate",
			data: {"musicId" : musicId},
			dataType:"text",
			success: function(result) {
				
			},
			error : function(){
				alert("통신실패");
			}
		})	
	
	
	
	
 }
</script>