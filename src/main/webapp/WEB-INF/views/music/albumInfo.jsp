<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<style>
	table {
		color: white;
	}
</style>

	<!--(배경이미지) -->
	<div class="under_header" style="height:70px">
		<img src="resources/images/bg/musicBg.jpg" alt="#" style="height: 1500px;">
	</div>
		
	<!-- content -->
	<div class="page-content back_to_up">
		<!-- 최상단메인칸 -->
		<div class="row row-fluid clearfix mbf">
			<!-- 검색바 -->
			<div class="little-head row">
				<div class="search">
					<form action="searchResult" id="search" method="get" >
						<input  id="id" name="id" type="text"
							style="font-size:small; width: 1000px; height: 60px; " value=""
							placeholder="노래명, 앨범명 입력">
						<button type="submit" style="margin-top:15px; margin-right:10px;">
							<i class="icon-search" style="font-size: 25px;"></i>
						</button>
					</form>
				</div>
			</div>
		</div>
		<!-- 검색바 끝-->
		<!-- 앨범정보 -->
		<div class="row row-fluid clearfix" style="margin-bottom:0px;">
				<div class="posts">
					<div class="def-block">
						<h4>앨범정보</h4><span class="liner"></span>
						<div class="products shop clearfix">
						<div class="clearfix mbs">
							<div class="grid_6">
								<img src="api/picture/${selectAlbum.picture }" alt="#">
							</div>
							<!-- grid6 -->
							<div class="grid_6">
								<h2>제목: ${selectAlbum.albName }</h2>
								<h2>가수: ${selectAlbum.artName }</h2>
							<c:choose>
								<c:when test="${selectAlbum.genre eq 'G01' }">
									<h3>장르: 발라드</h3>
								</c:when>
								<c:when test="${selectAlbum.genre eq 'G02' }">
									<h3>장르: 댄스</h3>
								</c:when>
								<c:when test="${selectAlbum.genre eq 'G03' }">
									<h3>장르: 랩/힙합</h3>
								</c:when>
								<c:when test="${selectAlbum.genre eq 'G04' }">
									<h3>장르: R&B/SOUL</h3>
								</c:when>
							</c:choose>
								<h3>발매일: <fmt:formatDate pattern = "YYYY년 MM월 dd일" value = "${selectAlbum.releaseAt}" /></h3>
								<h3>앨범코멘트: </h3>
								<span style="color: white; font-size:medium;">${selectAlbum.content }</span>
								<br><br><br><br>
									<div class="single_variation_wrap" style="text-align:right;">
											<button class="tbutton medium" onclick="playAll()"><span >전체재생</span></button>
											<button class="tbutton medium"><span data-toggle="modal" data-target="#myModal">위시리스트 추가</span></button>
											<button class="tbutton medium"><span>공유</span></button>
									</div>
							</div><!-- grid6 -->
						</div><!-- clearfix -->
						</div>
					</div>
				</div>
		</div>
		<!-- 앨범정보 끝 -->
		
		<!-- 수록곡리스트 -->
		<div class="row row-fluid clearfix mbf">
				<div class="posts">
					<div class="def-block">
						<h4> 앨범수록곡 </h4><span class="liner"></span>
						<div class="products shop clearfix">
							<div class="grid_12">
								<form id="playList" action="streamingList" method="post">
									<div class="bag_table">
										<table class="shop_table footable tablet footable-loaded" style="width:100%;">
											<thead>
												<tr>
													<th></th>
													<th style="width:300px;"><h4>제목</h4></th>
													<th><h4>가수</h4></th>
													<th><h4>좋아요</h4></th>
													<th><h4>다운로드</h4></th>
												</tr>
											</thead>
											<tbody>
												<c:forEach var="music" items="${selectMusicByAlbum}">
													<tr data-musicid="${music.id }" class="cart_table_item" style="text-align: center; font-size: medium;">
														<td style="display:none;"><input name="musicIdList" value="${music.id }"></td>
														<td class="product-thumbnail" style="width:70px;">
															<a href="streaming?id=${music.id }">
																<img class="img1" src="api/picture/${music.picture }" alt="#" style="margin: 10px 0px 10px 0px;">
															</a>
														</td>
														<td  class="product-name" style="vertical-align:middle;">
															${music.title }
														</td>
														<td class="product-name" style="vertical-align:middle;">
															${music.artName }
														</td>
														<td class="product-name" style="vertical-align:middle;">
															${music.likeIt }
														</td>
														<td class="product-name" style="vertical-align:middle;">
															<button onclick="addCart()" type="button" class="tbutton medium" style="font-size:10px"><span >구매</span></button>
														</td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
									</div><!-- bag table -->
									<button type="submit" style="display:none;"></button>
								</form><!-- end form -->
							</div><!-- grid12 -->
						</div><!-- products -->

					</div><!-- def block -->
				</div><!-- span8 posts -->
			</div><!-- row clearfix -->
		<!-- 수록곡리스트 끝 -->
	</div>
	<!-- content끝 -->

<!-- 위시리스트모달 -->
<div class="modal fade def-block" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="top:30%; display:none;">
  <div class="modal-dialog ">
    <div class="modal-content ">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span style="color:white" aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">위시리스트 선택</h4>
      </div>
      <div class="modal-body def-block">
        <c:forEach items="${wishlists}" var="wishlist">
		<div class="mbf clearfix">
			<ul>
				<li>
					<!-- 위시리스트 이름 -->
					<div class="toggle-head">
						<h5 style="margin:0px;">
							${wishlist.name}
							<button  class="tbutton small" style="margin-left:90%">
								<span onclick="addWishList()" data-wishid="${wishlist.id}">선택</span>
							</button>
						</h5>
					</div>
				</li>
			</ul>
		</div>
	</c:forEach>
      </div>
      <div class="modal-footer def-block">
        <button class="tbutton small" data-dismiss="modal" aria-label="Close"><span>확인</span></button>
      </div>
    </div>
  </div>
</div>
	<!-- 위시리스트모달 끝-->
<script>
/* 위시리스트 추가 */
function addWishList() {
	let wishId = $(event.target).data('wishid')
	let musicIdList = [];
	$('.cart_table_item').each (function() {
		var musicId = $(this).data('musicid')
		musicIdList.push(musicId)
	})
	let params = {
		"wishId" : wishId,
		"musicIdList" : musicIdList
	}
	
	$.ajax({
		url:"addWishList2",
		type: "POST",
		contentType:'application/x-www-form-urlencoded;charset=utf-8',
		traditional:true,
		data: params,
		dataType:"text", //서버가 요청 URL을 통해서 응답하는 내용의 타입
		success: function(result) {
			alert("추가되었습니다");
		},
		error : function(){
			alert("통신실패");
		}
	}) 
}

/* 구매 */
 function addCart() {
     var id = $(event.target).parent().parent().parent().data("musicid")
     var confirm1 = confirm('장바구니에 담으시겠습니까?')
     if(confirm1) {
          $.ajax ({
            url : "cart/test/add",
            type : "post",
            data : {"id" : id},                   
            dataType : "text",
            success : function(data) {
               alert("장바구니에 담았습니다.");
            },
            error: function(xhr, status, error){
                   alert("통신실패");
            }
         }) 
         
      } else {
         alert("취소")
      }
   }
   
// 전체재생
function playAll() {
	$('#playList').submit();
}
</script>	
