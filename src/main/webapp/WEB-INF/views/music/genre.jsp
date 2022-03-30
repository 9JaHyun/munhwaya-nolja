<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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
			<!-- 검색바 끝-->
		
		</div>
		<!-- 왼쪽 상단메인 -->
		<div class="row row-fluid clearfix mbf">
			<!-- 크기지정 -->
			<div class="posts">
				<!-- 검은블락 -->
				<div class="def-block">
						<h4>장르별 음악추천</h4>
						<i class="icon-angle-right" style="font-size:large; margin-left: 7px;"></i>
					<ul class="tabs">
						<li><a href="#Soon"> R&B/SOUL </a></li>
						<li><a href="#Latest" class="active"> 랩/힙합 </a></li>
						<li><a href="#Featured"> 댄스 </a></li>
						<li><a href="#Albums"> 발라드</a></li>
					</ul>
					
					<!-- 탭1 -->
					<ul class="tabs-content">
						<li id="Latest" class="active">
							<div class="post no-border no-mp clearfix">
								<ul class="tab-content-items">
									<li class="grid_6"><a class="m-thumbnail"
										href="steraming"><img style="width=60; height=60;"
											src="resources/images/bg/musicBg3.jpg" alt="#"></a>
										<h3>
											<a href="streaming">Don’t go mary ( Remix )</a>
										</h3> <span> Alexander </span> <span> 22,250 Plays </span></li>
									<li class="grid_6"><a class="m-thumbnail"
										href="streaming"><img style="width=60; height=60;"
											src="resources/images/bg/musicBg3.jpg" alt="#"></a>
										<h3>
											<a href="streaming">That's My Kind Of Night </a>
										</h3> <span> Alexander Mikoole </span> <span> 38,879 Plays </span>
									</li>
									<li class="grid_6"><a class="m-thumbnail"
										href="steraming"><img style="width=60; height=60;"
											src="resources/images/bg/musicBg3.jpg" alt="#"></a>
										<h3>
											<a href="streaming">Don’t go mary ( Remix )</a>
										</h3> <span> Alexander </span> <span> 22,250 Plays </span></li>
									<li class="grid_6"><a class="m-thumbnail"
										href="streaming"><img style="width=60; height=60;"
											src="resources/images/bg/musicBg3.jpg" alt="#"></a>
										<h3>
											<a href="streaming">That's My Kind Of Night </a>
										</h3> <span> Alexander Mikoole </span> <span> 38,879 Plays </span>
									</li>
									<li class="grid_6"><a class="m-thumbnail"
										href="steraming"><img style="width=60; height=60;"
											src="resources/images/bg/musicBg3.jpg" alt="#"></a>
										<h3>
											<a href="streaming">Don’t go mary ( Remix )</a>
										</h3> <span> Alexander </span> <span> 22,250 Plays </span></li>
									<li class="grid_6"><a class="m-thumbnail"
										href="streaming"><img style="width=60; height=60;"
											src="resources/images/bg/musicBg3.jpg" alt="#"></a>
										<h3>
											<a href="streaming">That's My Kind Of Night </a>
										</h3> <span> Alexander Mikoole </span> <span> 38,879 Plays </span>
									</li>
									<li class="grid_6"><a class="m-thumbnail"
										href="steraming"><img style="width=60; height=60;"
											src="resources/images/bg/musicBg3.jpg" alt="#"></a>
										<h3>
											<a href="streaming">Don’t go mary ( Remix )</a>
										</h3> <span> Alexander </span> <span> 22,250 Plays </span></li>
									<li class="grid_6"><a class="m-thumbnail"
										href="streaming"><img style="width=60; height=60;"
											src="resources/images/bg/musicBg3.jpg" alt="#"></a>
										<h3>
											<a href="streaming">That's My Kind Of Night </a>
										</h3> <span> Alexander Mikoole </span> <span> 38,879 Plays </span>
									</li>
									<li class="grid_6"><a class="m-thumbnail"
										href="mp3_single_half.html"><img style="width=60; height=60;"
											src="resources/images/bg/musicBg3.jpg" alt="#"></a>
										<h3>
											<a href="mp3_single_half.html">Magna Carta... Holy Grail
											</a>
										</h3> <span> Joe </span> <span> 12,240 Plays </span></li>
									<li class="grid_6"><a class="m-thumbnail"
										href="mp3_single_half.html"><img style="width=60; height=60;"
											src="resources/images/bg/musicBg3.jpg" alt="#"></a>
										<h3>
											<a href="mp3_single_half.html">If you love me</a>
										</h3> <span> Enrique </span> <span> 8,471 Plays </span></li>
									<li class="grid_6"><a class="m-thumbnail"
										href="mp3_single_half.html"><img style="width=60; height=60;"
											src="resources/images/bg/musicBg3.jpg" alt="#"></a>
										<h3>
											<a href="mp3_single_half.html">Burning For you</a>
										</h3> <span> Lura </span> <span> 10,105 Plays </span></li>
									<li class="grid_6"><a class="m-thumbnail"
										href="mp3_single_half.html"><img style="width=60; height=60;"
											src="resources/images/bg/musicBg3.jpg" alt="#"></a>
										<h3>
											<a href="mp3_single_half.html">Skyfool ( Dubstep Remix )</a>
										</h3> <span> Babel </span> <span> 1,748 Plays </span></li>
									<li class="grid_6"><a class="m-thumbnail"
										href="mp3_single_half.html"><img style="width=60; height=60;"
											src="resources/images/bg/musicBg3.jpg" alt="#"></a>
										<h3>
											<a href="mp3_single_half.html">Don’t go mary ( Remix )</a>
										</h3> <span> Alexander </span> <span> 82,250 Plays </span></li>
									<li class="grid_6"><a class="m-thumbnail"
										href="mp3_single_half.html"><img style="width=60; height=60;"
											src="resources/images/bg/musicBg3.jpg" alt="#"></a>
										<h3>
											<a href="mp3_single_half.html">That's My Kind Of Night </a>
										</h3> <span> Alexander Mikoole </span> <span> 8,879 Plays </span></li>
									<li class="grid_6"><a class="m-thumbnail"
										href="mp3_single_half.html"><img style="width=60; height=60;"
											src="resources/images/bg/musicBg3.jpg" alt="#"></a>
										<h3>
											<a href="mp3_single_half.html">Magna Carta... Holy Grail
											</a>
										</h3> <span> Joe </span> <span> 2,240 Plays </span></li>
									<li class="grid_6"><a class="m-thumbnail"
										href="mp3_single_half.html"><img style="width=60; height=60;"
											src="resources/images/bg/musicBg3.jpg" alt="#"></a>
										<h3>
											<a href="mp3_single_half.html">If you love me</a>
										</h3> <span> Enrique </span> <span> 8,471 Plays </span></li>
								</ul>
							</div>
							<!-- latest -->
						</li>
						<!-- 탭1 끝-->
						<!-- 탭2 -->
						<li id="Featured">
							<div class="post no-border no-mp clearfix">
								<ul class="tab-content-items">
									<li class="grid_6"><a class="m-thumbnail"
										href="steraming"><img style="width=60; height=60;"
											src="resources/images/bg/musicBg3.jpg" alt="#"></a>
										<h3>
											<a href="streaming">Don’t go mary ( Remix )</a>
										</h3> <span> Alexander </span> <span> 22,250 Plays </span></li>
									<li class="grid_6"><a class="m-thumbnail"
										href="streaming"><img style="width=60; height=60;"
											src="resources/images/bg/musicBg3.jpg" alt="#"></a>
										<h3>
											<a href="streaming">That's My Kind Of Night </a>
										</h3> <span> Alexander Mikoole </span> <span> 38,879 Plays </span>
									</li>
									<li class="grid_6"><a class="m-thumbnail"
										href="steraming"><img style="width=60; height=60;"
											src="resources/images/bg/musicBg3.jpg" alt="#"></a>
										<h3>
											<a href="streaming">Don’t go mary ( Remix )</a>
										</h3> <span> Alexander </span> <span> 22,250 Plays </span></li>
									<li class="grid_6"><a class="m-thumbnail"
										href="streaming"><img style="width=60; height=60;"
											src="resources/images/bg/musicBg3.jpg" alt="#"></a>
										<h3>
											<a href="streaming">That's My Kind Of Night </a>
										</h3> <span> Alexander Mikoole </span> <span> 38,879 Plays </span>
									</li>
									<li class="grid_6"><a class="m-thumbnail"
										href="steraming"><img style="width=60; height=60;"
											src="resources/images/bg/musicBg3.jpg" alt="#"></a>
										<h3>
											<a href="streaming">Don’t go mary ( Remix )</a>
										</h3> <span> Alexander </span> <span> 22,250 Plays </span></li>
									<li class="grid_6"><a class="m-thumbnail"
										href="streaming"><img style="width=60; height=60;"
											src="resources/images/bg/musicBg3.jpg" alt="#"></a>
										<h3>
											<a href="streaming">That's My Kind Of Night </a>
										</h3> <span> Alexander Mikoole </span> <span> 38,879 Plays </span>
									</li>
									<li class="grid_6"><a class="m-thumbnail"
										href="streaming"><img style="width=60; height=60;"
											src="images/assets/thumb-mp3-1.jpg" alt="#"></a>
										<h3>
											<a href="mp3_single_half.html">Don’t go mary ( Remix )</a>
										</h3> <span> Alexander </span> <span> 22,250 Plays </span></li>
									<li class="grid_6"><a class="m-thumbnail"
										href="mp3_single_half.html"><img style="width=60; height=60;"
											src="images/assets/thumb-mp3-2.jpg" alt="#"></a>
										<h3>
											<a href="mp3_single_half.html">That's My Kind Of Night </a>
										</h3> <span> Alexander Mikoole </span> <span> 38,879 Plays </span>
									</li>
									<li class="grid_6"><a class="m-thumbnail"
										href="mp3_single_half.html"><img style="width=60; height=60;"
											src="images/assets/thumb-mp3-3.jpg" alt="#"></a>
										<h3>
											<a href="mp3_single_half.html">Magna Carta... Holy Grail
											</a>
										</h3> <span> Joe </span> <span> 12,240 Plays </span></li>
									<li class="grid_6"><a class="m-thumbnail"
										href="mp3_single_half.html"><img style="width=60; height=60;"
											src="images/assets/thumb-mp3-4.jpg" alt="#"></a>
										<h3>
											<a href="mp3_single_half.html">If you love me</a>
										</h3> <span> Enrique </span> <span> 8,471 Plays </span></li>
									<li class="grid_6"><a class="m-thumbnail"
										href="mp3_single_half.html"><img style="width=60; height=60;"
											src="images/assets/thumb-mp3-5.jpg" alt="#"></a>
										<h3>
											<a href="mp3_single_half.html">Burning For you</a>
										</h3> <span> Lura </span> <span> 10,105 Plays </span></li>
									<li class="grid_6"><a class="m-thumbnail"
										href="mp3_single_half.html"><img style="width=60; height=60;"
											src="images/assets/thumb-mp3-6.jpg" alt="#"></a>
										<h3>
											<a href="mp3_single_half.html">Skyfool ( Dubstep Remix )</a>
										</h3> <span> Babel </span> <span> 1,748 Plays </span></li>
									<li class="grid_6"><a class="m-thumbnail"
										href="mp3_single_half.html"><img style="width=60; height=60;"
											src="images/assets/thumb-mp3-7.jpg" alt="#"></a>
										<h3>
											<a href="mp3_single_half.html">Don’t go mary ( Remix )</a>
										</h3> <span> Alexander </span> <span> 82,250 Plays </span></li>
									<li class="grid_6"><a class="m-thumbnail"
										href="mp3_single_half.html"><img style="width=60; height=60;"
											src="images/assets/thumb-mp3-8.jpg" alt="#"></a>
										<h3>
											<a href="mp3_single_half.html">That's My Kind Of Night </a>
										</h3> <span> Alexander Mikoole </span> <span> 8,879 Plays </span></li>
									<li class="grid_6"><a class="m-thumbnail"
										href="mp3_single_half.html"><img style="width=60; height=60;"
											src="images/assets/thumb-mp3-9.jpg" alt="#"></a>
										<h3>
											<a href="mp3_single_half.html">Magna Carta... Holy Grail
											</a>
										</h3> <span> Joe </span> <span> 2,240 Plays </span></li>
									<li class="grid_6"><a class="m-thumbnail"
										href="mp3_single_half.html"><img style="width=60; height=60;"
											src="images/assets/thumb-mp3-10.jpg" alt="#"></a>
										<h3>
											<a href="mp3_single_half.html">If you love me</a>
										</h3> <span> Enrique </span> <span> 8,471 Plays </span></li>
								</ul>
							</div>
							<!-- latest -->
						</li>
						<!-- 탭2 끝-->
						<!-- 탭3 -->
						<li id="Albums">
							<div class="post no-border no-mp clearfix">
								<ul class="tab-content-items">
								<li class="grid_6"><a class="m-thumbnail"
										href="steraming"><img style="width=60; height=60;"
											src="resources/images/bg/musicBg3.jpg" alt="#"></a>
										<h3>
											<a href="streaming">Don’t go mary ( Remix )</a>
										</h3> <span> Alexander </span> <span> 22,250 Plays </span></li>
									<li class="grid_6"><a class="m-thumbnail"
										href="streaming"><img style="width=60; height=60;"
											src="resources/images/bg/musicBg3.jpg" alt="#"></a>
										<h3>
											<a href="streaming">That's My Kind Of Night </a>
										</h3> <span> Alexander Mikoole </span> <span> 38,879 Plays </span>
									</li>
									<li class="grid_6"><a class="m-thumbnail"
										href="steraming"><img style="width=60; height=60;"
											src="resources/images/bg/musicBg3.jpg" alt="#"></a>
										<h3>
											<a href="streaming">Don’t go mary ( Remix )</a>
										</h3> <span> Alexander </span> <span> 22,250 Plays </span></li>
									<li class="grid_6"><a class="m-thumbnail"
										href="streaming"><img style="width=60; height=60;"
											src="resources/images/bg/musicBg3.jpg" alt="#"></a>
										<h3>
											<a href="streaming">That's My Kind Of Night </a>
										</h3> <span> Alexander Mikoole </span> <span> 38,879 Plays </span>
									</li>
									<li class="grid_6"><a class="m-thumbnail"
										href="steraming"><img style="width=60; height=60;"
											src="resources/images/bg/musicBg3.jpg" alt="#"></a>
										<h3>
											<a href="streaming">Don’t go mary ( Remix )</a>
										</h3> <span> Alexander </span> <span> 22,250 Plays </span></li>
									<li class="grid_6"><a class="m-thumbnail"
										href="streaming"><img style="width=60; height=60;"
											src="resources/images/bg/musicBg3.jpg" alt="#"></a>
										<h3>
											<a href="streaming">That's My Kind Of Night </a>
										</h3> <span> Alexander Mikoole </span> <span> 38,879 Plays </span>
									</li>
									<li class="grid_6"><a class="m-thumbnail"
										href="mp3_single_half.html"><img style="width=60; height=60;"
											src="images/assets/thumb-mp3-1.jpg" alt="#"></a>
										<h3>
											<a href="mp3_single_half.html">Don’t go mary ( Remix )</a>
										</h3> <span> Alexander </span> <span> 22,250 Plays </span></li>
									<li class="grid_6"><a class="m-thumbnail"
										href="mp3_single_half.html"><img style="width=60; height=60;"
											src="images/assets/thumb-mp3-2.jpg" alt="#"></a>
										<h3>
											<a href="mp3_single_half.html">That's My Kind Of Night </a>
										</h3> <span> Alexander Mikoole </span> <span> 38,879 Plays </span>
									</li>
									<li class="grid_6"><a class="m-thumbnail"
										href="mp3_single_half.html"><img style="width=60; height=60;"
											src="images/assets/thumb-mp3-3.jpg" alt="#"></a>
										<h3>
											<a href="mp3_single_half.html">Magna Carta... Holy Grail
											</a>
										</h3> <span> Joe </span> <span> 12,240 Plays </span></li>
									<li class="grid_6"><a class="m-thumbnail"
										href="mp3_single_half.html"><img style="width=60; height=60;"
											src="images/assets/thumb-mp3-4.jpg" alt="#"></a>
										<h3>
											<a href="mp3_single_half.html">If you love me</a>
										</h3> <span> Enrique </span> <span> 8,471 Plays </span></li>
									<li class="grid_6"><a class="m-thumbnail"
										href="mp3_single_half.html"><img style="width=60; height=60;"
											src="images/assets/thumb-mp3-5.jpg" alt="#"></a>
										<h3>
											<a href="mp3_single_half.html">Burning For you</a>
										</h3> <span> Lura </span> <span> 10,105 Plays </span></li>
									<li class="grid_6"><a class="m-thumbnail"
										href="mp3_single_half.html"><img style="width=60; height=60;"
											src="images/assets/thumb-mp3-6.jpg" alt="#"></a>
										<h3>
											<a href="mp3_single_half.html">Skyfool ( Dubstep Remix )</a>
										</h3> <span> Babel </span> <span> 1,748 Plays </span></li>
									<li class="grid_6"><a class="m-thumbnail"
										href="mp3_single_half.html"><img style="width=60; height=60;"
											src="images/assets/thumb-mp3-7.jpg" alt="#"></a>
										<h3>
											<a href="mp3_single_half.html">Don’t go mary ( Remix )</a>
										</h3> <span> Alexander </span> <span> 82,250 Plays </span></li>
									<li class="grid_6"><a class="m-thumbnail"
										href="mp3_single_half.html"><img style="width=60; height=60;"
											src="images/assets/thumb-mp3-8.jpg" alt="#"></a>
										<h3>
											<a href="mp3_single_half.html">That's My Kind Of Night </a>
										</h3> <span> Alexander Mikoole </span> <span> 8,879 Plays </span></li>
									<li class="grid_6"><a class="m-thumbnail"
										href="mp3_single_half.html"><img style="width=60; height=60;"
											src="images/assets/thumb-mp3-9.jpg" alt="#"></a>
										<h3>
											<a href="mp3_single_half.html">Magna Carta... Holy Grail
											</a>
										</h3> <span> Joe </span> <span> 2,240 Plays </span></li>
									<li class="grid_6"><a class="m-thumbnail"
										href="mp3_single_half.html"><img style="width=60; height=60;"
											src="images/assets/thumb-mp3-10.jpg" alt="#"></a>
										<h3>
											<a href="mp3_single_half.html">If you love me</a>
										</h3> <span> Enrique </span> <span> 8,471 Plays </span></li>
								</ul>
							</div>
							<!-- mp3 albums -->
						</li>
						<!-- 탭3 끝-->
						
						<!-- 탭4 -->	
						<li id="Soon">
							<div class="post no-border no-mp clearfix">
								<ul class="tab-content-items">
								<li class="grid_6"><a class="m-thumbnail"
										href="steraming"><img style="width=60; height=60;"
											src="resources/images/bg/musicBg3.jpg" alt="#"></a>
										<h3>
											<a href="streaming">Don’t go mary ( Remix )</a>
										</h3> <span> Alexander </span> <span> 22,250 Plays </span></li>
									<li class="grid_6"><a class="m-thumbnail"
										href="streaming"><img style="width=60; height=60;"
											src="resources/images/bg/musicBg3.jpg" alt="#"></a>
										<h3>
											<a href="streaming">That's My Kind Of Night </a>
										</h3> <span> Alexander Mikoole </span> <span> 38,879 Plays </span>
									</li>
									<li class="grid_6"><a class="m-thumbnail"
										href="steraming"><img style="width=60; height=60;"
											src="resources/images/bg/musicBg3.jpg" alt="#"></a>
										<h3>
											<a href="streaming">Don’t go mary ( Remix )</a>
										</h3> <span> Alexander </span> <span> 22,250 Plays </span></li>
									<li class="grid_6"><a class="m-thumbnail"
										href="streaming"><img style="width=60; height=60;"
											src="resources/images/bg/musicBg3.jpg" alt="#"></a>
										<h3>
											<a href="streaming">That's My Kind Of Night </a>
										</h3> <span> Alexander Mikoole </span> <span> 38,879 Plays </span>
									</li>
									<li class="grid_6"><a class="m-thumbnail"
										href="steraming"><img style="width=60; height=60;"
											src="resources/images/bg/musicBg3.jpg" alt="#"></a>
										<h3>
											<a href="streaming">Don’t go mary ( Remix )</a>
										</h3> <span> Alexander </span> <span> 22,250 Plays </span></li>
									<li class="grid_6"><a class="m-thumbnail"
										href="streaming"><img style="width=60; height=60;"
											src="resources/images/bg/musicBg3.jpg" alt="#"></a>
										<h3>
											<a href="streaming">That's My Kind Of Night </a>
										</h3> <span> Alexander Mikoole </span> <span> 38,879 Plays </span>
									</li>
									<li class="grid_6"><a class="m-thumbnail"
										href="mp3_single_half.html"><img style="width=60; height=60;"
											src="images/assets/thumb-mp3-1.jpg" alt="#"></a>
										<h3>
											<a href="mp3_single_half.html">Don’t go mary ( Remix )</a>
										</h3> <span> Alexander </span> <span> 22,250 Plays </span></li>
									<li class="grid_6"><a class="m-thumbnail"
										href="mp3_single_half.html"><img style="width=60; height=60;"
											src="images/assets/thumb-mp3-2.jpg" alt="#"></a>
										<h3>
											<a href="mp3_single_half.html">That's My Kind Of Night </a>
										</h3> <span> Alexander Mikoole </span> <span> 38,879 Plays </span>
									</li>
									<li class="grid_6"><a class="m-thumbnail"
										href="mp3_single_half.html"><img style="width=60; height=60;"
											src="images/assets/thumb-mp3-3.jpg" alt="#"></a>
										<h3>
											<a href="mp3_single_half.html">Magna Carta... Holy Grail
											</a>
										</h3> <span> Joe </span> <span> 12,240 Plays </span></li>
									<li class="grid_6"><a class="m-thumbnail"
										href="mp3_single_half.html"><img style="width=60; height=60;"
											src="images/assets/thumb-mp3-4.jpg" alt="#"></a>
										<h3>
											<a href="mp3_single_half.html">If you love me</a>
										</h3> <span> Enrique </span> <span> 8,471 Plays </span></li>
									<li class="grid_6"><a class="m-thumbnail"
										href="mp3_single_half.html"><img style="width=60; height=60;"
											src="images/assets/thumb-mp3-5.jpg" alt="#"></a>
										<h3>
											<a href="mp3_single_half.html">Burning For you</a>
										</h3> <span> Lura </span> <span> 10,105 Plays </span></li>
									<li class="grid_6"><a class="m-thumbnail"
										href="mp3_single_half.html"><img style="width=60; height=60;"
											src="images/assets/thumb-mp3-6.jpg" alt="#"></a>
										<h3>
											<a href="mp3_single_half.html">Skyfool ( Dubstep Remix )</a>
										</h3> <span> Babel </span> <span> 1,748 Plays </span></li>
									<li class="grid_6"><a class="m-thumbnail"
										href="mp3_single_half.html"><img style="width=60; height=60;"
											src="images/assets/thumb-mp3-7.jpg" alt="#"></a>
										<h3>
											<a href="mp3_single_half.html">Don’t go mary ( Remix )</a>
										</h3> <span> Alexander </span> <span> 82,250 Plays </span></li>
									<li class="grid_6"><a class="m-thumbnail"
										href="mp3_single_half.html"><img style="width=60; height=60;"
											src="images/assets/thumb-mp3-8.jpg" alt="#"></a>
										<h3>
											<a href="mp3_single_half.html">That's My Kind Of Night </a>
										</h3> <span> Alexander Mikoole </span> <span> 8,879 Plays </span></li>
									<li class="grid_6"><a class="m-thumbnail"
										href="mp3_single_half.html"><img style="width=60; height=60;"
											src="images/assets/thumb-mp3-9.jpg" alt="#"></a>
										<h3>
											<a href="mp3_single_half.html">Magna Carta... Holy Grail
											</a>
										</h3> <span> Joe </span> <span> 2,240 Plays </span></li>
									<li class="grid_6"><a class="m-thumbnail"
										href="mp3_single_half.html"><img style="width=60; height=60;"
											src="images/assets/thumb-mp3-10.jpg" alt="#"></a>
										<h3>
											<a href="mp3_single_half.html">If you love me</a>
										</h3> <span> Enrique </span> <span> 8,471 Plays </span></li>
								</ul>
							</div>
							<!-- news -->
						</li>
						<!-- 탭4 끝-->	
					</ul>
					<!-- 탭끝 -->
				</div>
				<!-- 검은블락 -->
			</div>
			<!-- 크기지정 span8 post 끝-->
			<!-- 왼쪽 상단메인 끝 -->
		</div>
	</div>
</div>