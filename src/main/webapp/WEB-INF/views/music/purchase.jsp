<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<style>
	div,tbody, td, tr, table{
		vertical-align: middle;
		color: white;
	}
	
	tr {
	margin-bottom: 100px;
	}
	
  	.img1 {
  		width: 80px;
  		height: 80px;
  		object-fit: cover;
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
							style="font-size:x-small; width: 1000px; height: 60px; " value=""
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
													<th><h4>다운로드</h4></th>
												</tr>
											<tbody>
											<c:forEach var="music" items="${purchasedList}">
												<tr class="cart_table_item" style="text-align: center; font-size:medium;">
													<td class="product-thumbnail" style="width:70px;">
													<a href="#"><img class="img1" src="api/picture/${music.picture }" alt="#" style="margin: 10px 0px 10px 0px;"></a>
													</td>
													<td class="product-name">
														${music.title}
													</td>
													<td class="product-name">
														${music.artName}
													</td>
													<td class="product-name">
														${music.price}
													</td>
													
													<td class="product-name">
														<button type="button" onclick="location.href='api/attach/${music.fileId}'" class="tbutton medium" style="font-size:10px"><span>다운로드</span></button>
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
	</div>
		<!-- content끝 -->
	