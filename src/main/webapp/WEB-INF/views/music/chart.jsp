<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
	div,tbody, td, tr, table{
		vertical-align: middle;
		color: white;
	}
	
	tr {
	margin-bottom: 100px;
	}
	
  	.img1{
  		width: 80px;
  		height: 80px;
  		object-fit: cover;
	}
</style>
<!-- layout -->
<div id="layout" class="full">
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
		<!-- 음원 리스트 -->
			<div class="row row-fluid clearfix mbf">
				<div class="posts">
					<div class="def-block">
						<h4> 차트순위 </h4><span class="liner"></span>
						<div class="products shop clearfix">
							<div class="grid_12">
								<form action="#" method="post">
									<div class="bag_table">
										<table class="shop_table footable tablet footable-loaded" style="width:100%;">
											<tbody>
												<tr class="cart_table_item" style="text-align: center;">
													<td>1</td>
													<td class="product-thumbnail" style="width:70px;">
													<a href="#"><img class="img1" src="resources/images/bg/musicBg3.jpg" alt="#" style="margin: 10px 0px 10px 0px;"></a>
													</td>
													<td class="product-name">
														음원제목
													</td>
													<td class="product-name">
														가수
													</td>
													<td class="product-name">
														앨범
													</td>
													<td class="product-name">
														<button class="tbutton medium" style="font-size:10px"><span>mp3</span></button>
													</td>
												</tr>
			
												<tr class="cart_table_item" style="text-align: center;">
													<td>2</td>
													<td class="product-thumbnail" style="width:70px;">
													<a href="#"><img class="img1" src="resources/images/bg/musicBg3.jpg" alt="#" style="margin: 10px 0px 10px 0px;"></a>
													</td>
													<td class="product-name">
														음원제목
													</td>
													<td class="product-name">
														가수
													</td>
													<td class="product-name">
														앨범
													</td>
													<td class="product-name">
														<button class="tbutton medium" style="font-size:10px"><span>mp3</span></button>
													</td>
												</tr>
												
												<tr class="cart_table_item" style="text-align: center;">
													<td>3</td>
													<td class="product-thumbnail" style="width:70px;">
													<a href="#"><img class="img1" src="resources/images/bg/musicBg3.jpg" alt="#" style="margin: 10px 0px 10px 0px;"></a>
													</td>
													<td class="product-name">
														음원제목
													</td>
													<td class="product-name">
														가수
													</td>
													<td class="product-name">
														앨범
													</td>
													<td class="product-name">
														<button class="tbutton medium" style="font-size:10px"><span>mp3</span></button>
													</td>
												</tr>
												<tr class="cart_table_item" style="text-align: center;">
													<td>4</td>
													<td class="product-thumbnail" style="width:70px;">
													<a href="#"><img class="img1" src="resources/images/bg/musicBg3.jpg" alt="#" style="margin: 10px 0px 10px 0px;"></a>
													</td>
													<td class="product-name">
														음원제목
													</td>
													<td class="product-name">
														가수
													</td>
													<td class="product-name">
														앨범
													</td>
													<td class="product-name">
														<button class="tbutton medium" style="font-size:10px"><span>mp3</span></button>
													</td>
												</tr>
												<tr class="cart_table_item" style="text-align: center;">
													<td>5</td>
													<td class="product-thumbnail" style="width:70px;">
													<a href="#"><img class="img1" src="resources/images/bg/musicBg3.jpg" alt="#" style="margin: 10px 0px 10px 0px;"></a>
													</td>
													<td class="product-name">
														음원제목
													</td>
													<td class="product-name">
														가수
													</td>
													<td class="product-name">
														앨범
													</td>
													<td class="product-name">
														<button class="tbutton medium" style="font-size:10px"><span>mp3</span></button>
													</td>
												</tr>
												<tr class="cart_table_item" style="text-align: center;">
													<td>6</td>
													<td class="product-thumbnail" style="width:70px;">
													<a href="#"><img class="img1" src="resources/images/bg/musicBg3.jpg" alt="#" style="margin: 10px 0px 10px 0px;"></a>
													</td>
													<td class="product-name">
														음원제목
													</td>
													<td class="product-name">
														가수
													</td>
													<td class="product-name">
														앨범
													</td>
													<td class="product-name">
														<button class="tbutton medium" style="font-size:10px"><span>mp3</span></button>
													</td>
												</tr>
											</tbody>
										</table>
									</div><!-- bag table -->
								</form><!-- end form -->
							</div><!-- grid12 -->
						</div><!-- products -->

					</div><!-- def block -->
				</div><!-- span8 posts -->
			</div><!-- row clearfix -->
	</div>
		<!-- content끝 -->
</div>
	<!-- layout 끝 -->

<script>
$(document).ready(function(){
	
	addCart();

	});
	
	function addCart() {
		$.ajax ({
			url : "cart/test/add",
			type : "get",
			data : {"id" : 2, "title" : "테스트2", "price" : 700},
			dataType : "text",
			success : function(data) {
				alert("장바구니에 담았습니다.");
			},
			error: function(xhr, status, error){
                alert(error);
            }
		})
	}
</script>
	