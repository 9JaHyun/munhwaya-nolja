<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
	table {
		color: white;
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
								<h2>앨범이름</h2>
								<h2>가수</h2>
								<h3>작사: 홍정우</h3>
								<h3>작곡: 홍정우</h3>
								<h3>편곡: 홍정우</h3>
								<h3>발매일: 2022.03.28</h3>
								<h3>앨범코멘트</h3>
								<span style="color: white;">국회는 의장 1인과 부의장 2인을 선출한다. 국회의원은 국회에서 직무상 행한 발언과 표결에 관하여 국회외에서 책임을 지지 아니한다. 학교교육 및 평생교육을 포함한 교육제도와 그 운영, 교육재정 및 교원의 지위에 관한 기본적인 사항은 법률로 정한다.
								대한민국의 영토는 한반도와 그 부속도서로 한다. 국회는 의원의 자격을 심사하며, 의원을 징계할 수 있다. 선거에 있어서 최고득표자가 2인 이상인 때에는 국회의 재적의원 과반수가 출석한 공개회의에서 다수표를 얻은 자를 당선자로 한다.</span>
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
											<tbody>
												<tr class="cart_table_item" style="text-align: center;">
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
		<!-- 수록곡리스트 끝 -->
	</div>
	<!-- content끝 -->
</div>
	<!-- layout 끝 -->
	