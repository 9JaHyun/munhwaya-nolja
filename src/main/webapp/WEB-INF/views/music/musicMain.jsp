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
			<div class="span8 posts">
				<!-- 검은블락 -->
				<div class="def-block">
					<a href="genre">
						<h4>장르별 음악추천</h4>
						<i class="icon-angle-right" style="font-size:large; margin-left: 7px;"></i>
					</a>
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
										href="steraming"><img style="width:60; height:60;"
											src="resources/images/bg/musicBg3.jpg" alt="#"></a>
										<h3>
											<a href="streaming">Don’t go mary ( Remix )</a>
										</h3> <span> Alexander </span> <span> 22,250 Plays </span></li>
									<li class="grid_6"><a class="m-thumbnail"
										href="streaming"><img style="width:60; height:60;"
											src="resources/images/bg/musicBg3.jpg" alt="#"></a>
										<h3>
											<a href="streaming">That's My Kind Of Night </a>
										</h3> <span> Alexander Mikoole </span> <span> 38,879 Plays </span>
									</li>
									<li class="grid_6"><a class="m-thumbnail"
										href="mp3_single_half.html"><img style="width:60; height:60;"
											src="resources/images/bg/musicBg3.jpg" alt="#"></a>
										<h3>
											<a href="mp3_single_half.html">Magna Carta... Holy Grail
											</a>
										</h3> <span> Joe </span> <span> 12,240 Plays </span></li>
									<li class="grid_6"><a class="m-thumbnail"
										href="mp3_single_half.html"><img style="width:60; height:60;"
											src="resources/images/bg/musicBg3.jpg" alt="#"></a>
										<h3>
											<a href="mp3_single_half.html">If you love me</a>
										</h3> <span> Enrique </span> <span> 8,471 Plays </span></li>
									<li class="grid_6"><a class="m-thumbnail"
										href="mp3_single_half.html"><img style="width:60; height:60;"
											src="resources/images/bg/musicBg3.jpg" alt="#"></a>
										<h3>
											<a href="mp3_single_half.html">Burning For you</a>
										</h3> <span> Lura </span> <span> 10,105 Plays </span></li>
									<li class="grid_6"><a class="m-thumbnail"
										href="mp3_single_half.html"><img style="width:60; height:60;"
											src="resources/images/bg/musicBg3.jpg" alt="#"></a>
										<h3>
											<a href="mp3_single_half.html">Skyfool ( Dubstep Remix )</a>
										</h3> <span> Babel </span> <span> 1,748 Plays </span></li>
									<li class="grid_6"><a class="m-thumbnail"
										href="mp3_single_half.html"><img style="width:60; height:60;"
											src="resources/images/bg/musicBg3.jpg" alt="#"></a>
										<h3>
											<a href="mp3_single_half.html">Don’t go mary ( Remix )</a>
										</h3> <span> Alexander </span> <span> 82,250 Plays </span></li>
									<li class="grid_6"><a class="m-thumbnail"
										href="mp3_single_half.html"><img style="width:60; height:60;"
											src="resources/images/bg/musicBg3.jpg" alt="#"></a>
										<h3>
											<a href="mp3_single_half.html">That's My Kind Of Night </a>
										</h3> <span> Alexander Mikoole </span> <span> 8,879 Plays </span></li>
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
										href="streaming"><img style="width:60; height:60;"
											src="images/assets/thumb-mp3-1.jpg" alt="#"></a>
										<h3>
											<a href="mp3_single_half.html">Don’t go mary ( Remix )</a>
										</h3> <span> Alexander </span> <span> 22,250 Plays </span></li>
									<li class="grid_6"><a class="m-thumbnail"
										href="mp3_single_half.html"><img style="width:60; height:60;"
											src="images/assets/thumb-mp3-2.jpg" alt="#"></a>
										<h3>
											<a href="mp3_single_half.html">That's My Kind Of Night </a>
										</h3> <span> Alexander Mikoole </span> <span> 38,879 Plays </span>
									</li>
									<li class="grid_6"><a class="m-thumbnail"
										href="mp3_single_half.html"><img style="width:60; height:60;"
											src="images/assets/thumb-mp3-3.jpg" alt="#"></a>
										<h3>
											<a href="mp3_single_half.html">Magna Carta... Holy Grail
											</a>
										</h3> <span> Joe </span> <span> 12,240 Plays </span></li>
									<li class="grid_6"><a class="m-thumbnail"
										href="mp3_single_half.html"><img style="width:60; height:60;"
											src="images/assets/thumb-mp3-4.jpg" alt="#"></a>
										<h3>
											<a href="mp3_single_half.html">If you love me</a>
										</h3> <span> Enrique </span> <span> 8,471 Plays </span></li>
									<li class="grid_6"><a class="m-thumbnail"
										href="mp3_single_half.html"><img style="width:60; height:60;"
											src="images/assets/thumb-mp3-5.jpg" alt="#"></a>
										<h3>
											<a href="mp3_single_half.html">Burning For you</a>
										</h3> <span> Lura </span> <span> 10,105 Plays </span></li>
									<li class="grid_6"><a class="m-thumbnail"
										href="mp3_single_half.html"><img style="width:60; height:60;"
											src="images/assets/thumb-mp3-6.jpg" alt="#"></a>
										<h3>
											<a href="mp3_single_half.html">Skyfool ( Dubstep Remix )</a>
										</h3> <span> Babel </span> <span> 1,748 Plays </span></li>
									<li class="grid_6"><a class="m-thumbnail"
										href="mp3_single_half.html"><img style="width:60; height:60;"
											src="images/assets/thumb-mp3-7.jpg" alt="#"></a>
										<h3>
											<a href="mp3_single_half.html">Don’t go mary ( Remix )</a>
										</h3> <span> Alexander </span> <span> 82,250 Plays </span></li>
									<li class="grid_6"><a class="m-thumbnail"
										href="mp3_single_half.html"><img style="width:60; height:60;"
											src="images/assets/thumb-mp3-8.jpg" alt="#"></a>
										<h3>
											<a href="mp3_single_half.html">That's My Kind Of Night </a>
										</h3> <span> Alexander Mikoole </span> <span> 8,879 Plays </span></li>
									<li class="grid_6"><a class="m-thumbnail"
										href="mp3_single_half.html"><img style="width:60; height:60;"
											src="images/assets/thumb-mp3-9.jpg" alt="#"></a>
										<h3>
											<a href="mp3_single_half.html">Magna Carta... Holy Grail
											</a>
										</h3> <span> Joe </span> <span> 2,240 Plays </span></li>
									<li class="grid_6"><a class="m-thumbnail"
										href="mp3_single_half.html"><img style="width:60; height:60;"
											src="images/assets/thumb-mp3-10.jpg" alt="#"></a>
										<h3>
											<a href="mp3_single_half.html">If you love me</a>
										</h3> <span> Enrique </span> <span> 8,471 Plays </span></li>
								</ul>
								<a href="news_single.html" class="Rmore tbutton small"><span>더보기</span></a>
							</div>
							<!-- latest -->
						</li>
						<!-- 탭2 끝-->
						<!-- 탭3 -->
						<li id="Albums">
							<div class="post no-border no-mp clearfix">
								<ul class="tab-content-items">
									<li class="grid_6"><a class="m-thumbnail"
										href="mp3_single_half.html"><img style="width:60; height:60;"
											src="images/assets/thumb-mp3-1.jpg" alt="#"></a>
										<h3>
											<a href="mp3_single_half.html">Don’t go mary ( Remix )</a>
										</h3> <span> Alexander </span> <span> 22,250 Plays </span></li>
									<li class="grid_6"><a class="m-thumbnail"
										href="mp3_single_half.html"><img style="width:60; height:60;"
											src="images/assets/thumb-mp3-2.jpg" alt="#"></a>
										<h3>
											<a href="mp3_single_half.html">That's My Kind Of Night </a>
										</h3> <span> Alexander Mikoole </span> <span> 38,879 Plays </span>
									</li>
									<li class="grid_6"><a class="m-thumbnail"
										href="mp3_single_half.html"><img style="width:60; height:60;"
											src="images/assets/thumb-mp3-3.jpg" alt="#"></a>
										<h3>
											<a href="mp3_single_half.html">Magna Carta... Holy Grail
											</a>
										</h3> <span> Joe </span> <span> 12,240 Plays </span></li>
									<li class="grid_6"><a class="m-thumbnail"
										href="mp3_single_half.html"><img style="width:60; height:60;"
											src="images/assets/thumb-mp3-4.jpg" alt="#"></a>
										<h3>
											<a href="mp3_single_half.html">If you love me</a>
										</h3> <span> Enrique </span> <span> 8,471 Plays </span></li>
									<li class="grid_6"><a class="m-thumbnail"
										href="mp3_single_half.html"><img style="width:60; height:60;"
											src="images/assets/thumb-mp3-5.jpg" alt="#"></a>
										<h3>
											<a href="mp3_single_half.html">Burning For you</a>
										</h3> <span> Lura </span> <span> 10,105 Plays </span></li>
									<li class="grid_6"><a class="m-thumbnail"
										href="mp3_single_half.html"><img style="width:60; height:60;"
											src="images/assets/thumb-mp3-6.jpg" alt="#"></a>
										<h3>
											<a href="mp3_single_half.html">Skyfool ( Dubstep Remix )</a>
										</h3> <span> Babel </span> <span> 1,748 Plays </span></li>
									<li class="grid_6"><a class="m-thumbnail"
										href="mp3_single_half.html"><img style="width:60; height:60;"
											src="images/assets/thumb-mp3-7.jpg" alt="#"></a>
										<h3>
											<a href="mp3_single_half.html">Don’t go mary ( Remix )</a>
										</h3> <span> Alexander </span> <span> 82,250 Plays </span></li>
									<li class="grid_6"><a class="m-thumbnail"
										href="mp3_single_half.html"><img style="width:60; height:60;"
											src="images/assets/thumb-mp3-8.jpg" alt="#"></a>
										<h3>
											<a href="mp3_single_half.html">That's My Kind Of Night </a>
										</h3> <span> Alexander Mikoole </span> <span> 8,879 Plays </span></li>
									<li class="grid_6"><a class="m-thumbnail"
										href="mp3_single_half.html"><img style="width:60; height:60;"
											src="images/assets/thumb-mp3-9.jpg" alt="#"></a>
										<h3>
											<a href="mp3_single_half.html">Magna Carta... Holy Grail
											</a>
										</h3> <span> Joe </span> <span> 2,240 Plays </span></li>
									<li class="grid_6"><a class="m-thumbnail"
										href="mp3_single_half.html"><img style="width:60; height:60;"
											src="images/assets/thumb-mp3-10.jpg" alt="#"></a>
										<h3>
											<a href="mp3_single_half.html">If you love me</a>
										</h3> <span> Enrique </span> <span> 8,471 Plays </span></li>
								</ul>
								<a href="news_single.html" class="Rmore tbutton small"><span>더보기</span></a>
							</div>
							<!-- mp3 albums -->
						</li>
						<!-- 탭3 끝-->
						
						<!-- 탭4 -->	
						<li id="Soon">
							<div class="post no-border no-mp clearfix">
								<ul class="tab-content-items">
									<li class="grid_6"><a class="m-thumbnail"
										href="mp3_single_half.html"><img style="width:60; height:60;"
											src="images/assets/thumb-mp3-1.jpg" alt="#"></a>
										<h3>
											<a href="mp3_single_half.html">Don’t go mary ( Remix )</a>
										</h3> <span> Alexander </span> <span> 22,250 Plays </span></li>
									<li class="grid_6"><a class="m-thumbnail"
										href="mp3_single_half.html"><img style="width:60; height:60;"
											src="images/assets/thumb-mp3-2.jpg" alt="#"></a>
										<h3>
											<a href="mp3_single_half.html">That's My Kind Of Night </a>
										</h3> <span> Alexander Mikoole </span> <span> 38,879 Plays </span>
									</li>
									<li class="grid_6"><a class="m-thumbnail"
										href="mp3_single_half.html"><img style="width:60; height:60;"
											src="images/assets/thumb-mp3-3.jpg" alt="#"></a>
										<h3>
											<a href="mp3_single_half.html">Magna Carta... Holy Grail
											</a>
										</h3> <span> Joe </span> <span> 12,240 Plays </span></li>
									<li class="grid_6"><a class="m-thumbnail"
										href="mp3_single_half.html"><img style="width:60; height:60;"
											src="images/assets/thumb-mp3-4.jpg" alt="#"></a>
										<h3>
											<a href="mp3_single_half.html">If you love me</a>
										</h3> <span> Enrique </span> <span> 8,471 Plays </span></li>
									<li class="grid_6"><a class="m-thumbnail"
										href="mp3_single_half.html"><img style="width:60; height:60;"
											src="images/assets/thumb-mp3-5.jpg" alt="#"></a>
										<h3>
											<a href="mp3_single_half.html">Burning For you</a>
										</h3> <span> Lura </span> <span> 10,105 Plays </span></li>
									<li class="grid_6"><a class="m-thumbnail"
										href="mp3_single_half.html"><img style="width:60; height:60;"
											src="images/assets/thumb-mp3-6.jpg" alt="#"></a>
										<h3>
											<a href="mp3_single_half.html">Skyfool ( Dubstep Remix )</a>
										</h3> <span> Babel </span> <span> 1,748 Plays </span></li>
									<li class="grid_6"><a class="m-thumbnail"
										href="mp3_single_half.html"><img style="width:60; height:60;"
											src="images/assets/thumb-mp3-7.jpg" alt="#"></a>
										<h3>
											<a href="mp3_single_half.html">Don’t go mary ( Remix )</a>
										</h3> <span> Alexander </span> <span> 82,250 Plays </span></li>
									<li class="grid_6"><a class="m-thumbnail"
										href="mp3_single_half.html"><img style="width:60; height:60;"
											src="images/assets/thumb-mp3-8.jpg" alt="#"></a>
										<h3>
											<a href="mp3_single_half.html">That's My Kind Of Night </a>
										</h3> <span> Alexander Mikoole </span> <span> 8,879 Plays </span></li>
									<li class="grid_6"><a class="m-thumbnail"
										href="mp3_single_half.html"><img style="width:60; height:60;"
											src="images/assets/thumb-mp3-9.jpg" alt="#"></a>
										<h3>
											<a href="mp3_single_half.html">Magna Carta... Holy Grail
											</a>
										</h3> <span> Joe </span> <span> 2,240 Plays </span></li>
									<li class="grid_6"><a class="m-thumbnail"
										href="mp3_single_half.html"><img style="width:60; height:60;"
											src="images/assets/thumb-mp3-10.jpg" alt="#"></a>
										<h3>
											<a href="mp3_single_half.html">If you love me</a>
										</h3> <span> Enrique </span> <span> 8,471 Plays </span></li>
								</ul>
								<a href="news_single.html" class="Rmore tbutton small"><span>더보기</span></a>
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
			
			<!-- 오른쪽상단메인 -->
			<!-- 인기순위 -->
				<!-- 크기지정 span4 sidebar -->
				<div class="span4 sidebar">
					<!-- 검은블락 -->
					<div class="def-block widget">
 					<a href="chart"> 
						<h4> 전체 차트순위 </h4>
						<i class="icon-angle-right" style="font-size:large; margin-left: 7px;"></i>
					</a>
						<span class="liner"></span>
						<div class="widget-content row-fluid">
							<ul class="tab-content-items">
								<li>
									<a class="m-thumbnail" href="mp3_single_half.html"><img style="width:60; height:60;" src="resources/images/bg/musicBg3.jpg" alt="#"></a>
									<h3><a href="mp3_single_half.html">Skyfool ( Dubstep Remix )</a></h3>
									<span> Babel </span>
									<span> 4,451,748 Plays </span>
								</li>
								
								<li>
									<a class="m-thumbnail" href="mp3_single_half.html"><img style="width:60; height:60;" src="resources/images/bg/musicBg3.jpg" alt="#"></a>
									<h3><a href="mp3_single_half.html">Don’t go mary ( Remix )</a></h3>
									<span> Alexander </span>
									<span> 3,582,250 Plays </span>
								</li>
								<li>
									<a class="m-thumbnail" href="mp3_single_half.html"><img style="width:60; height:60;" src="resources/images/bg/musicBg3.jpg" alt="#"></a>
									<h3><a href="mp3_single_half.html">That's My Kind Of Night </a></h3>
									<span> Alexander Mikoole </span>
									<span> 3,258,879 Plays </span>
								</li>
								<li>
									<a class="m-thumbnail" href="mp3_single_half.html"><img style="width:60; height:60;" src="resources/images/bg/musicBg3.jpg" alt="#"></a>
									<h3><a href="mp3_single_half.html">Magna Carta... Holy Grail </a></h3>
									<span> Joe </span>
									<span> 1,992,244 Plays </span>
								</li>
								<li>
									<a class="m-thumbnail" href="mp3_single_half.html"><img style="width:60; height:60;" src="resources/images/bg/musicBg3.jpg" alt="#"></a>
									<h3><a href="mp3_single_half.html">Don’t go mary ( Remix )</a></h3>
									<span> Alexander </span>
									<span> 82,250 Plays </span>
								</li>									<li>
									<a class="m-thumbnail" href="mp3_single_half.html"><img style="width:60; height:60;" src="resources/images/bg/musicBg3.jpg" alt="#"></a>
									<h3><a href="mp3_single_half.html">That's My Kind Of Night </a></h3>
									<span> Alexander Mikoole </span>
									<span> 8,879 Plays </span>
								</li>
							</ul>
						</div><!-- widget content -->
					</div><!-- 검은block -->
				</div><!-- 크기지정 span4 sidebar -->
			</div><!-- posts -->
			<!-- 오른쪽 상단메인 끝 -->
		<!-- 왼쪽오른쪽 상단메인 끝 -->
		<!-- 상단메인 끝 -->
		
		<!-- 발매임박앨범 -->
		<div class="row row-fluid clearfix mbf">
			<!-- 검은블락 -->
			<div class="def-block animtt" data-gen="fadeUp" style="opacity: 0;">
				<a href="releaseSoon">
					<h4>발매임박앨범</h4>
					<i class="icon-angle-right" style="font-size:large; margin-left: 7px;"></i>
				</a>
				<span class="liner"></span>
				<div class="video-grid clearfix">
					<div class="mp3-carousel">
						<div class="anyClass">
							<ul class="tab-content-items">
								<li>
									<a class="m-thumbnail" href="mp3_single_half.html">
										<img style="width:60; height:60;" src="resources/images/bg/musicBg3.jpg" alt="#">
									</a>
									<h3>
										<a href="mp3_single_half.html">앨범0</a>
									</h3> 
									<span> Lura </span> 
									<span> 10,105 Plays </span>
								</li>
								<li>
									<a class="m-thumbnail" href="mp3_single_half.html">
										<img style="width:60; height:60;" src="resources/images/bg/musicBg3.jpg" alt="#">
									</a>
									<h3>
										<a href="mp3_single_half.html">앨범0.5</a>
									</h3> 
									<span> Lura </span> 
									<span> 10,105 Plays </span>
								</li>
								<li>
									<a class="m-thumbnail" href="mp3_single_half.html">
										<img style="width:60; height:60;" src="resources/images/bg/musicBg3.jpg" alt="#">
									</a>
									<h3>
										<a href="mp3_single_half.html">앨범1</a>
									</h3> 
									<span> Lura </span> 
									<span> 10,105 Plays </span>
								</li>
								<li>
									<a class="m-thumbnail" href="mp3_single_half.html">
										<img style="width:60; height:60;" src="resources/images/bg/musicBg3.jpg" alt="#">
									</a>
									<h3>
										<a href="mp3_single_half.html">앨범2</a>
									</h3> 
									<span> Babel </span> 
									<span> 1,748 Plays </span>
								</li>
								<li>
									<a class="m-thumbnail" href="mp3_single_half.html">
										<img style="width:60; height:60;" src="resources/images/bg/musicBg3.jpg" alt="#">
									</a>
									<h3>
										<a href="mp3_single_half.html">앨범3</a>
									</h3> 
									<span> Alexander </span> 
									<span> 82,250 Plays </span>
								</li>
								<li>
									<a class="m-thumbnail" href="mp3_single_half.html">
										<img style="width:60; height:60;" src="resources/images/bg/musicBg3.jpg" alt="#">
									</a>
									<h3>
										<a href="mp3_single_half.html">앨범4</a>
									</h3> 
									<span> Alexander Mikoole </span> 
									<span> 8,879 Plays </span>
								</li>
								<li>
									<a class="m-thumbnail" href="mp3_single_half.html">
										<img style="width:60; height:60;" src="resources/images/bg/musicBg3.jpg" alt="#">
									</a>
									<h3>
										<a href="mp3_single_half.html">앨범5</a>
									</h3> 
									<span> Alexander Mikoole </span> 
									<span> 8,879 Plays </span>
								</li>
							</ul>
							
						</div>
				<!-- 발매임박 화살표 -->
						<div class="preve">
							<i class="icon-angle-left"></i>
						</div>
						<!--  left -->
						<div class="nexte">
							<i class="icon-angle-right"></i>
						</div>
						<!--  right -->
					</div>
					<!-- 발매임박 화살표 -->
				</div>
				<!-- 발매임박 끝 -->
			</div>
			<!-- 검은블락 끝 -->
		</div>
		<!-- 발매임박앨범 끝 -->
		<!-- 상단메인칸 끝 -->
		
		<!-- =================================================== -->
		
		<!-- 메인하단칸 -->
		<div class="row row-fluid clearfix mbf">
			<!-- 왼쪽하단 메인 -->	
			<div class="posts">
					<div class="def-block">
						<a href="personalResult">
						<h4>퍼스널 추천</h4>
						<i class="icon-angle-right" style="font-size:large; margin-left: 7px;"></i>
						</a>
						<ul class="tabs-content">
							<li id="Latest" class="active">
								<div class="video-grid">
									<a href="video_single_wide.html" class="grid_3">
										<img src="resources/images/bg/musicBg3.jpg" alt="#">
										<span><strong>Avril Lopez</strong>Daredevil (video version)</span>
									</a>
									<a href="video_single_wide.html" class="grid_3">
										<img src="resources/images/bg/musicBg3.jpg" alt="#">
										<span><strong>Bob Stoo</strong>No Name No Number</span>
									</a>
									<a href="video_single_wide.html" class="grid_3">
										<img src="resources/images/bg/musicBg3.jpg" alt="#">
										<span><strong>Alfered Graceful</strong>Tonight (Remix)</span>
									</a>
									<a href="video_single_wide.html" class="grid_3">
										<img src="resources/images/bg/musicBg3.jpg" alt="#">
										<span><strong>Dj Alex</strong>Divine</span>
									</a>
									<a href="video_single_wide.html" class="grid_3">
										<img src="resources/images/bg/musicBg3.jpg" alt="#">
										<span><strong>Justin Gomez</strong>Love You as Love Me</span>
									</a>
									<a href="video_single_wide.html" class="grid_3">
										<img src="resources/images/bg/musicBg3.jpg" alt="#">
										<span><strong>Dj Back</strong>I Like It (Radio Edit)</span>
									</a>
									<a href="video_single_wide.html" class="grid_3">
										<img src="resources/images/bg/musicBg3.jpg" alt="#">
										<span><strong>Anna</strong>Bad Dog</span>
									</a>
									<a href="video_single_wide.html" class="grid_3">
										<img src="resources/images/bg/musicBg3.jpg" alt="#">
										<span><strong>Armando</strong>On Time</span>
									</a>
								</div><!-- video grid -->
							</li><!-- tab content -->
						</ul><!-- end tabs -->
					</div><!-- def block -->
				</div><!-- posts -->
			<!-- 왼쪽하단 메인 끝-->	
		</div>
		<!-- 메인칸끝 -->
	</div>
		<!-- content끝 -->
</div>
	<!-- layout 끝 -->
	