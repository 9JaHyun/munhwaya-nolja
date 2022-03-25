<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!-- layout -->
<div id="layout" class="full">
	<!--(배경이미지) -->
	<div class="under_header" style="height:70px">
		<img src="resources/images/musicBg.jpg" alt="#">
	</div>
		
	<!-- content -->
	<div class="page-content back_to_up">
		<!-- 상단메인칸 -->
		<div class="row row-fluid clearfix mbf">
			<!-- 검색바 -->
			<!-- 검은블락 -->
			<div class="little-head row">
				<div class="search">
					<form action="search.html" id="search" method="get" >
						<input  id="inputhead" name="search" type="text"
							style="font-size:medium; width: 1000px; height: 60px; " value=""
							placeholder="노래명, 앨범명 입력">
						<button type="submit">
							<i class="icon-search"></i>
						</button>
					</form>
				</div>
			</div>
		</div>
		<!-- 장르별 음악추천 -->
		<div class="row row-fluid clearfix mbf">
			<!-- 검은블락 -->
			<div class="def-block animtt" data-gen="fadeUp" style="opacity: 0;">
				<h4>장르</h4>
				<!-- 장르칸 -->
				<span class="liner"></span>
				<div class="video-grid clearfix">
					<div class="mp3-carousel">
						<div class="anyClass">
							<ul class="tab-content-items">
								<li>
									<a class="m-thumbnail" href="mp3_single_half.html">
										<img width="50" height="50" src="resources/images/slides/dddd.png" alt="#">
									</a>
									<h3>
										<a href="mp3_single_half.html">랩/힙합</a>
									</h3> <span> Lura </span> <span> 10,105 Plays </span></li>
								<li>
									<a class="m-thumbnail" href="mp3_single_half.html">
										<img width="50" height="50" src="resources/images/slides/dddd.png" alt="#">
									</a>
									<h3>
										<a href="mp3_single_half.html">발라드</a>
									</h3> 
									<span> Babel </span> 
									<span> 1,748 Plays </span>
								</li>
								<li>
									<a class="m-thumbnail" href="mp3_single_half.html">
										<img width="50" height="50" src="resources/images/slides/dddd.png" alt="#">
									</a>
									<h3>
										<a href="mp3_single_half.html">댄스</a>
									</h3> 
									<span> Alexander </span> 
									<span> 82,250 Plays </span>
								</li>
								<li>
									<a class="m-thumbnail" href="mp3_single_half.html">
										<img width="50" height="50" src="resources/images/slides/dddd.png" alt="#">
									</a>
									<h3>
										<a href="mp3_single_half.html">R&B/Soul</a>
									</h3> 
									<span> Alexander Mikoole </span> 
									<span> 8,879 Plays </span>
								</li>
								<li>
									<a class="m-thumbnail" href="mp3_single_half.html">
										<img width="50" height="50" src="resources/images/slides/dddd.png" alt="#">
									</a>
									<h3>
										<a href="mp3_single_half.html">어떤장르</a>
									</h3> 
									<span> Alexander Mikoole </span> 
									<span> 8,879 Plays </span>
								</li>
							</ul>
						</div>
				<!-- 장르칸 -->
				<!-- 장르변경 화살표 -->
						<div class="preve">
							<i class="icon-angle-left"></i>
						</div>
						<!--  left -->
						<div class="nexte"> <!-- nexte/preve 찾아서 클래스 복붙해서 장르랑 발매임박쪽 따로주기 -->
							<i class="icon-angle-right"></i>
						</div>
						<!--  right -->
					</div>
					<!-- 장르변경 화살표 -->
				</div>
				<!-- 장르칸 끝 -->
			</div>
			<!-- 검은블락 끝 -->
		</div>
		<!-- 장르별 음악추천 끝 -->
		<!-- 상단메인칸 끝 -->
		
		<!-- 발매임박앨범 -->
		<div class="row row-fluid clearfix mbf">
			<!-- 검은블락 -->
			<div class="def-block animtt" data-gen="fadeUp" style="opacity: 0;">
				<h4>발매임박앨범</h4>
				<!-- 장르칸 -->
				<span class="liner"></span>
				<div class="video-grid clearfix">
					<div class="mp3-carousel">
						<div class="anyClass">
							<ul class="tab-content-items">
								<li>
									<a class="m-thumbnail" href="mp3_single_half.html">
										<img width="50" height="50" src="resources/images/slides/dddd.png" alt="#">
									</a>
									<h3>
										<a href="mp3_single_half.html">앨범0</a>
									</h3> 
									<span> Lura </span> 
									<span> 10,105 Plays </span>
								</li>
								<li>
									<a class="m-thumbnail" href="mp3_single_half.html">
										<img width="50" height="50" src="resources/images/slides/dddd.png" alt="#">
									</a>
									<h3>
										<a href="mp3_single_half.html">앨범0.5</a>
									</h3> 
									<span> Lura </span> 
									<span> 10,105 Plays </span>
								</li>
								<li>
									<a class="m-thumbnail" href="mp3_single_half.html">
										<img width="50" height="50" src="resources/images/slides/dddd.png" alt="#">
									</a>
									<h3>
										<a href="mp3_single_half.html">앨범1</a>
									</h3> 
									<span> Lura </span> 
									<span> 10,105 Plays </span>
								</li>
								<li>
									<a class="m-thumbnail" href="mp3_single_half.html">
										<img width="50" height="50" src="resources/images/slides/dddd.png" alt="#">
									</a>
									<h3>
										<a href="mp3_single_half.html">앨범2</a>
									</h3> 
									<span> Babel </span> 
									<span> 1,748 Plays </span>
								</li>
								<li>
									<a class="m-thumbnail" href="mp3_single_half.html">
										<img width="50" height="50" src="resources/images/slides/dddd.png" alt="#">
									</a>
									<h3>
										<a href="mp3_single_half.html">앨범3</a>
									</h3> 
									<span> Alexander </span> 
									<span> 82,250 Plays </span>
								</li>
								<li>
									<a class="m-thumbnail" href="mp3_single_half.html">
										<img width="50" height="50" src="resources/images/slides/dddd.png" alt="#">
									</a>
									<h3>
										<a href="mp3_single_half.html">앨범4</a>
									</h3> 
									<span> Alexander Mikoole </span> 
									<span> 8,879 Plays </span>
								</li>
								<li>
									<a class="m-thumbnail" href="mp3_single_half.html">
										<img width="50" height="50" src="resources/images/slides/dddd.png" alt="#">
									</a>
									<h3>
										<a href="mp3_single_half.html">앨범5</a>
									</h3> 
									<span> Alexander Mikoole </span> 
									<span> 8,879 Plays </span>
								</li>
							</ul>
						</div>
				<!-- 장르칸 -->
				<!-- 장르변경 화살표 -->
						<div class="preve">
							<i class="icon-angle-left"></i>
						</div>
						<!--  left -->
						<div class="nexte">
							<i class="icon-angle-right"></i>
						</div>
						<!--  right -->
					</div>
					<!-- 장르변경 화살표 -->
				</div>
				<!-- 장르칸 끝 -->
			</div>
			<!-- 검은블락 끝 -->
		</div>
		<!-- 발매임박앨범 끝 -->
		<!-- 상단메인칸 끝 -->
		
		<!-- =================================================== -->
		
		<!-- 메인칸 -->
		<div class="row row-fluid clearfix mbf">
			
			<!-- 왼쪽 메인칸 -->
			<!-- 탭헤더 -->
			<div class="span8 posts">
				<!-- 검은블락 -->
				<div class="def-block">
					
					<ul class="tabs">
						<li><a href="#Latest" class="active"> 차트순위 </a></li>
						<li><a href="#Featured"> 추천 </a></li>
						<li><a href="#Albums"> 새로운 앨범</a></li>
						<li><a href="#Soon"> Comming Soon </a></li>
					</ul>
					
					<!-- 탭1 -->
					<ul class="tabs-content">
						<li id="Latest" class="active">
							<div class="post no-border no-mp clearfix">
								<ul class="tab-content-items">
									<li class="grid_6"><a class="m-thumbnail"
										href="mp3_single_half.html"><img width="50" height="50"
											src="images/assets/thumb-mp3-1.jpg" alt="#"></a>
										<h3>
											<a href="mp3_single_half.html">Don’t go mary ( Remix )</a>
										</h3> <span> Alexander </span> <span> 22,250 Plays </span></li>
									<li class="grid_6"><a class="m-thumbnail"
										href="mp3_single_half.html"><img width="50" height="50"
											src="images/assets/thumb-mp3-2.jpg" alt="#"></a>
										<h3>
											<a href="mp3_single_half.html">That's My Kind Of Night </a>
										</h3> <span> Alexander Mikoole </span> <span> 38,879 Plays </span>
									</li>
									<li class="grid_6"><a class="m-thumbnail"
										href="mp3_single_half.html"><img width="50" height="50"
											src="images/assets/thumb-mp3-3.jpg" alt="#"></a>
										<h3>
											<a href="mp3_single_half.html">Magna Carta... Holy Grail
											</a>
										</h3> <span> Joe </span> <span> 12,240 Plays </span></li>
									<li class="grid_6"><a class="m-thumbnail"
										href="mp3_single_half.html"><img width="50" height="50"
											src="images/assets/thumb-mp3-4.jpg" alt="#"></a>
										<h3>
											<a href="mp3_single_half.html">If you love me</a>
										</h3> <span> Enrique </span> <span> 8,471 Plays </span></li>
									<li class="grid_6"><a class="m-thumbnail"
										href="mp3_single_half.html"><img width="50" height="50"
											src="images/assets/thumb-mp3-5.jpg" alt="#"></a>
										<h3>
											<a href="mp3_single_half.html">Burning For you</a>
										</h3> <span> Lura </span> <span> 10,105 Plays </span></li>
									<li class="grid_6"><a class="m-thumbnail"
										href="mp3_single_half.html"><img width="50" height="50"
											src="images/assets/thumb-mp3-6.jpg" alt="#"></a>
										<h3>
											<a href="mp3_single_half.html">Skyfool ( Dubstep Remix )</a>
										</h3> <span> Babel </span> <span> 1,748 Plays </span></li>
									<li class="grid_6"><a class="m-thumbnail"
										href="mp3_single_half.html"><img width="50" height="50"
											src="images/assets/thumb-mp3-7.jpg" alt="#"></a>
										<h3>
											<a href="mp3_single_half.html">Don’t go mary ( Remix )</a>
										</h3> <span> Alexander </span> <span> 82,250 Plays </span></li>
									<li class="grid_6"><a class="m-thumbnail"
										href="mp3_single_half.html"><img width="50" height="50"
											src="images/assets/thumb-mp3-8.jpg" alt="#"></a>
										<h3>
											<a href="mp3_single_half.html">That's My Kind Of Night </a>
										</h3> <span> Alexander Mikoole </span> <span> 8,879 Plays </span></li>
									<li class="grid_6"><a class="m-thumbnail"
										href="mp3_single_half.html"><img width="50" height="50"
											src="images/assets/thumb-mp3-9.jpg" alt="#"></a>
										<h3>
											<a href="mp3_single_half.html">Magna Carta... Holy Grail
											</a>
										</h3> <span> Joe </span> <span> 2,240 Plays </span></li>
									<li class="grid_6"><a class="m-thumbnail"
										href="mp3_single_half.html"><img width="50" height="50"
											src="images/assets/thumb-mp3-10.jpg" alt="#"></a>
										<h3>
											<a href="mp3_single_half.html">If you love me</a>
										</h3> <span> Enrique </span> <span> 8,471 Plays </span></li>
									<li class="grid_6"><a class="m-thumbnail"
										href="mp3_single_half.html"><img width="50" height="50"
											src="images/assets/thumb-mp3-11.jpg" alt="#"></a>
										<h3>
											<a href="mp3_single_half.html">Burning For you</a>
										</h3> <span> Lura </span> <span> 2,105 Plays </span></li>
									<li class="grid_6"><a class="m-thumbnail"
										href="mp3_single_half.html"><img width="50" height="50"
											src="images/assets/thumb-mp3-12.jpg" alt="#"></a>
										<h3>
											<a href="mp3_single_half.html">Skyfool ( Dubstep Remix )</a>
										</h3> <span> Babel </span> <span> 4,748 Plays </span></li>
									<li class="grid_6"><a class="m-thumbnail"
										href="mp3_single_half.html"><img width="50" height="50"
											src="images/assets/thumb-mp3-13.jpg" alt="#"></a>
										<h3>
											<a href="mp3_single_half.html">Magna Carta... Holy Grail
											</a>
										</h3> <span> Joe </span> <span> 109,240 Plays </span></li>
									<li class="grid_6"><a class="m-thumbnail"
										href="mp3_single_half.html"><img width="50" height="50"
											src="images/assets/thumb-mp3-14.jpg" alt="#"></a>
										<h3>
											<a href="mp3_single_half.html">If you love me</a>
										</h3> <span> Enrique </span> <span> 88,471 Plays </span></li>
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
										href="mp3_single_half.html"><img width="50" height="50"
											src="images/assets/thumb-mp3-6.jpg" alt="#"></a>
										<h3>
											<a href="mp3_single_half.html">Skyfool ( Dubstep Remix )</a>
										</h3> <span> Babel </span> <span> 4,451,748 Plays </span></li>
									<li class="grid_6"><a class="m-thumbnail"
										href="mp3_single_half.html"><img width="50" height="50"
											src="images/assets/thumb-mp3-7.jpg" alt="#"></a>
										<h3>
											<a href="mp3_single_half.html">Don’t go mary ( Remix )</a>
										</h3> <span> Alexander </span> <span> 3,582,250 Plays </span></li>
									<li class="grid_6"><a class="m-thumbnail"
										href="mp3_single_half.html"><img width="50" height="50"
											src="images/assets/thumb-mp3-8.jpg" alt="#"></a>
										<h3>
											<a href="mp3_single_half.html">That's My Kind Of Night </a>
										</h3> <span> Alexander Mikoole </span> <span> 3,258,879
											Plays </span></li>
									<li class="grid_6"><a class="m-thumbnail"
										href="mp3_single_half.html"><img width="50" height="50"
											src="images/assets/thumb-mp3-9.jpg" alt="#"></a>
										<h3>
											<a href="mp3_single_half.html">Magna Carta... Holy Grail
											</a>
										</h3> <span> Joe </span> <span> 1,992,244 Plays </span></li>
								</ul>
							</div>
							<!-- latest -->
						</li>
						<!-- 탭2 끝-->
						<!-- 탭3 -->
						<li id="Albums">
							<div class="mp3-albums">
								<a href="mp3_play_list.html" class="grid_3"> <img
									src="images/assets/album1.jpg" alt="#"> <span><strong>Michele
											Jordan</strong>New Day</span>
								</a> <a href="mp3_play_list.html" class="grid_3"> <img
									src="images/assets/album2.jpg" alt="#"> <span><strong>Dj
											Alaska</strong>No Name No Number</span>
								</a> <a href="mp3_play_list.html" class="grid_3"> <img
									src="images/assets/album3.jpg" alt="#"> <span><strong>Alexander
											Lea</strong>R.T.O 2</span>
								</a> <a href="mp3_play_list.html" class="grid_3"> <img
									src="images/assets/album4.jpg" alt="#"> <span><strong>Jessica
											Alma</strong>Love Rock'n Roll</span>
								</a> <a href="mp3_play_list.html" class="grid_3"> <img
									src="images/assets/album5.jpg" alt="#"> <span><strong>Bob
											Jexman</strong>Your Heart in my Hand</span>
								</a> <a href="mp3_play_list.html" class="grid_3"> <img
									src="images/assets/album6.jpg" alt="#"> <span><strong>Abele</strong>Set
										Rain to The Fire</span>
								</a>
							</div>
							<!-- mp3 albums -->
						</li>
						<!-- 탭3 끝-->
						
						<!-- 탭4 -->	
						<li id="Soon">
							<p>Nulla id ligula arcu. Integer et tincidunt lectus. Duis id
								ligula diam, quis dapibus erat. Curabitur nec libero et est
								vulputate sollicitudin. Fusce sit amet turpis sed mauris
								volutpat posuere.</p>
							<div class="news row-fluid">
								<div class="span5">
									<img class="four-radius" src="images/assets/news1.jpg" alt="#">
								</div>
								<div class="span7">
									<h3 class="news-title">Michele Jordan Release New Album in
										September 2014</h3>
									<p>Nine Inch Nails aren't on the bill, and they won't play
										the fest anytime soon. Soundwave promoter AJ Maddah started a
										Twitter war-of-words with a few choice comments about NIN's
										Trent Reznor. mauris volutpat posuere. Morbi vulputate, odio
										eget adipiscing faucibus, lorem ipsum facilisis justo, gravida
										tempus orci nisi ac eros. Pellentesque metus dolor.</p>
								</div>
								<!-- span7 -->
							</div>
							<!-- news -->
							<div class="news row-fluid">
								<div class="span5">
									<img class="four-radius" src="images/assets/news3.jpg" alt="#">
								</div>
								<div class="span7">
									<h3 class="news-title">New Track Named Without You (Remix)
									</h3>
									<p>Nine Inch Nails aren't on the bill, and they won't play
										the fest anytime soon. Soundwave promoter AJ Maddah started a
										Twitter war-of-words with a few choice comments about NIN's
										Trent Reznor. mauris volutpat posuere. Morbi vulputate, odio
										eget adipiscing faucibus, lorem ipsum facilisis justo, gravida
										tempus orci nisi ac eros. Pellentesque metus dolor.</p>
								</div>
								<!-- span7 -->
							</div>
							<!-- news -->
						</li>
						<!-- 탭4 끝-->	
					</ul>
					<!-- 탭끝 -->
				</div>
				<!-- 검은블락 -->
			</div>
			<!-- 왼쪽메인끝 -->
			
		<!-- 이벤트 -->
		<!-- 오른쪽 메인칸 -->
			<div class="span4 sidebar">
				<!-- 오른쪽메인칸 밑-->
				<!-- 검은블락 -->
				<div class="def-block widget">
					<h4>이벤트</h4>
					<span class="liner"></span>
					<div class="widget-content row-fluid">
						<div class="videos clearfix flexslider">
							<ul class="slides">
								<li class="">
									<a href="video_single_wide.html">
									<img src="resources/images/slides/dddd.png" alt="#"> 
									<h3>이벤트1</h3> 
									<span>이벤트1</span>
									</a>
								</li>
								<!-- slide -->
								<li class="">
									<a href="video_single_wide.html">
									<img src="resources/images/slides/dddd.png" alt="#"> 
									<h3>이벤트2</h3> 
									<span>이벤트2</span>
									</a>
								</li>
								<!-- slide -->
								<li class=" "><a href="video_single_wide.html">
									<img src="resources/images/slides/dddd.png" alt="#"> 
									<h3>이벤트3</h3> 
									<span>이벤트3</span>
									</a>
								</li>
								<!-- slide -->
							</ul>
						</div>
					</div>
					<!-- widget content -->
				</div>
				<!-- 오른쪽메인칸 밑-->
				<!-- 검은블락 -->
			</div>
			<!-- 오른쪽 메인칸 끝-->
			
			<!-- 이벤트 끝 -->
		</div>
		<!-- 메인칸끝 -->
	</div>
		<!-- content끝 -->
</div>
	<!-- layout 끝 -->
	