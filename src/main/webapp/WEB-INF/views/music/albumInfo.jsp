<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
								<img src="resources/images/bg/musicBg3.jpg" alt="#">
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
								<h3>발매일: ${selectAlbum.releaseAt }</h3>
								<h3>앨범코멘트: </h3>
								<span style="color: white; font-size:medium;">${selectAlbum.content }</span>
								<br><br><br><br>
									<div class="single_variation_wrap" style="text-align:right;">
											<button class="tbutton medium"><span>전체재생</span></button>
											<button class="tbutton medium"><span>위시리스트 추가</span></button>
											<button class="tbutton medium"><span>공유</span></button>
											<button class="tbutton medium"><span>구매</span></button>
											<a href="#"><i class="icon-heart" style="font-size: 30px; margin-left:10px">    </i></a>
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
								<form action="#" method="post">
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
													<tr class="cart_table_item" style="text-align: center; font-size: medium;">
														<td class="product-thumbnail" style="width:70px;">
														<a href="#"><img class="img1" src="resources/images/bg/musicBg3.jpg" alt="#" style="margin: 10px 0px 10px 0px;"></a>
														</td>
														<td class="product-name" style="vertical-align:middle;">
															${music.title }
														</td>
														<td class="product-name" style="vertical-align:middle;">
															${music.artName }
														</td>
														<td class="product-name" style="vertical-align:middle;">
															${music.likeIt }
														</td>
														<td class="product-name" style="vertical-align:middle;">
															<button class="tbutton medium" style="font-size:10px"><span>mp3</span></button>
														</td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
									</div><!-- bag table -->
								</form><!-- end form -->
							</div><!-- grid12 -->
						</div><!-- products -->

					</div><!-- def block -->
				</div><!-- span8 posts -->
			</div><!-- row clearfix -->
		<!-- 수록곡리스트 끝 -->
	</div>
	<!-- content끝 -->
	