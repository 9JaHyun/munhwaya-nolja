<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!-- layout -->
<div id="layout" class="full">
	<!--(배경이미지) -->
	<div class="under_header" style="height:70px">
		<img src="resources/images/bg/musicBg.jpg" alt="#" style="height: 1200px;">
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
			<!-- 크기지정 -->
			<div class="posts">
				<!-- 검은블락 -->
				<div class="def-block">
					<ul class="tabs">
						<li><a href="#Latest" class="active"> 음원 리스트 </a></li>
					</ul>
					<!-- 리스트 -->
					<ul class="tabs-content">
						<li id="Latest" class="active">
							<div class="post no-border no-mp clearfix">
								<ul class="tab-content-items">
									<li class="grid_6"><a class="m-thumbnail"
										href="mp3_single_half.html"><img width="50" height="50"
											src="resources/images/bg/musicBg3.jpg" alt="#"></a>
										<h3>
											<a href="mp3_single_half.html">Don’t go mary ( Remix )</a>
										</h3> <span> Alexander </span> <span> 22,250 Plays </span></li>
									<li class="grid_6"><a class="m-thumbnail"
										href="mp3_single_half.html"><img width="50" height="50"
											src="resources/images/bg/musicBg3.jpg" alt="#"></a>
										<h3>
											<a href="mp3_single_half.html">That's My Kind Of Night </a>
										</h3> <span> Alexander Mikoole </span> <span> 38,879 Plays </span>
									</li>
									<li class="grid_6"><a class="m-thumbnail"
										href="mp3_single_half.html"><img width="50" height="50"
											src="resources/images/bg/musicBg3.jpg" alt="#"></a>
										<h3>
											<a href="mp3_single_half.html">Magna Carta... Holy Grail
											</a>
										</h3> <span> Joe </span> <span> 12,240 Plays </span></li>
									<li class="grid_6"><a class="m-thumbnail"
										href="mp3_single_half.html"><img width="50" height="50"
											src="resources/images/bg/musicBg3.jpg" alt="#"></a>
										<h3>
											<a href="mp3_single_half.html">If you love me</a>
										</h3> <span> Enrique </span> <span> 8,471 Plays </span></li>
									<li class="grid_6"><a class="m-thumbnail"
										href="mp3_single_half.html"><img width="50" height="50"
											src="resources/images/bg/musicBg3.jpg" alt="#"></a>
										<h3>
											<a href="mp3_single_half.html">Burning For you</a>
										</h3> <span> Lura </span> <span> 10,105 Plays </span></li>
									<li class="grid_6"><a class="m-thumbnail"
										href="mp3_single_half.html"><img width="50" height="50"
											src="resources/images/bg/musicBg3.jpg" alt="#"></a>
										<h3>
											<a href="mp3_single_half.html">Skyfool ( Dubstep Remix )</a>
										</h3> <span> Babel </span> <span> 1,748 Plays </span></li>
									<li class="grid_6"><a class="m-thumbnail"
										href="mp3_single_half.html"><img width="50" height="50"
											src="resources/images/bg/musicBg3.jpg" alt="#"></a>
										<h3>
											<a href="mp3_single_half.html">Don’t go mary ( Remix )</a>
										</h3> <span> Alexander </span> <span> 82,250 Plays </span></li>
									<li class="grid_6"><a class="m-thumbnail"
										href="mp3_single_half.html"><img width="50" height="50"
											src="resources/images/bg/musicBg3.jpg" alt="#"></a>
										<h3>
											<a href="mp3_single_half.html">That's My Kind Of Night </a>
										</h3> <span> Alexander Mikoole </span> <span> 8,879 Plays </span></li>
									<li class="grid_6"><a class="m-thumbnail"
										href="mp3_single_half.html"><img width="50" height="50"
											src="resources/images/bg/musicBg3.jpg" alt="#"></a>
										<h3>
											<a href="mp3_single_half.html">Magna Carta... Holy Grail
											</a>
										</h3> <span> Joe </span> <span> 2,240 Plays </span></li>
									<li class="grid_6"><a class="m-thumbnail"
										href="mp3_single_half.html"><img width="50" height="50"
											src="resources/images/bg/musicBg3.jpg" alt="#"></a>
										<h3>
											<a href="mp3_single_half.html">If you love me</a>
										</h3> <span> Enrique </span> <span> 8,471 Plays </span></li>
								</ul>
							</div>
							<!-- latest -->
						</li>
						<!-- 리스트 끝-->
					</ul>
					<!-- 탭끝 -->
				</div>
				<!-- 검은블락 -->
			</div>
		</div>
			<!-- 크기지정  post 끝-->
			<!-- 왼쪽 상단메인 끝 -->
	</div>
		<!-- content끝 -->
</div>
	<!-- layout 끝 -->
	