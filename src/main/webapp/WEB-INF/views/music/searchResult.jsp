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
			<!-- 왼쪽하단 메인 -->	
			<div class="posts">
					<div class="def-block">
						<a href="searchResultMusic">
						<h4>검색결과</h4>
						<span class="liner"></span> 
						<h4>음악</h4>
						<i class="icon-angle-right" style="font-size:large; margin-left: 7px;"></i>
						</a>
						<span class="liner"></span> 
						<ul class="tabs-content">
							<li id="Latest" class="active">
								<div class="video-grid">
									<a href="video_single_wide.html" class="grid_3">
										<img src="resources/images/bg/musicBg3.jpg" alt="#">
										<span><strong>Dean</strong>half moon</span>
									</a>
									<a href="video_single_wide.html" class="grid_3">
										<img src="resources/images/bg/musicBg3.jpg"" alt="#">
										<span><strong>Bob Stoo</strong>No Name No Number</span>
									</a>
									<a href="video_single_wide.html" class="grid_3">
										<img src="resources/images/bg/musicBg3.jpg"" alt="#">
										<span><strong>Alfered Graceful</strong>Tonight (Remix)</span>
									</a>
									<a href="video_single_wide.html" class="grid_3">
										<img src="resources/images/bg/musicBg3.jpg"" alt="#">
										<span><strong>Dj Alex</strong>Divine</span>
									</a>
									<a href="video_single_wide.html" class="grid_3">
										<img src="resources/images/bg/musicBg3.jpg"" alt="#">
										<span><strong>Justin Gomez</strong>Love You as Love Me</span>
									</a>
									<a href="video_single_wide.html" class="grid_3">
										<img src="resources/images/bg/musicBg3.jpg"" alt="#">
										<span><strong>Dj Back</strong>I Like It (Radio Edit)</span>
									</a>
									<a href="video_single_wide.html" class="grid_3">
										<img src="resources/images/bg/musicBg3.jpg"" alt="#">
										<span><strong>Anna</strong>Bad Dog</span>
									</a>
									<a href="video_single_wide.html" class="grid_3">
										<img src="resources/images/bg/musicBg3.jpg"" alt="#">
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
		<!-- 앨범 -->
		<div class="row row-fluid clearfix mbf">
			<!-- 왼쪽하단 메인 -->	
			<div class="posts">
					<div class="def-block">
						<a href="searchResultAlbum">
						<h4>검색결과</h4>
						<span class="liner"></span> 
						<h4>앨범</h4>
						<i class="icon-angle-right" style="font-size:large; margin-left: 7px;"></i>
						</a>
						<span class="liner"></span>
						<ul class="tabs-content">
							<li id="Latest" class="active">
								<div class="video-grid">
									<a href="video_single_wide.html" class="grid_3">
										<img src="resources/images/bg/musicBg3.jpg" alt="#">
										<span><strong>Avril Lopez</strong>Daredevil (video version)</span>
									</a>
									<a href="video_single_wide.html" class="grid_3">
										<img src="resources/images/bg/musicBg3.jpg"" alt="#">
										<span><strong>Bob Stoo</strong>No Name No Number</span>
									</a>
									<a href="video_single_wide.html" class="grid_3">
										<img src="resources/images/bg/musicBg3.jpg"" alt="#">
										<span><strong>Alfered Graceful</strong>Tonight (Remix)</span>
									</a>
									<a href="video_single_wide.html" class="grid_3">
										<img src="resources/images/bg/musicBg3.jpg"" alt="#">
										<span><strong>Dj Alex</strong>Divine</span>
									</a>
								</div><!-- video grid -->
							</li><!-- tab content -->
						</ul><!-- end tabs -->
					</div><!-- def block -->
				</div><!-- posts -->
			<!-- 왼쪽하단 메인 끝-->	
		</div>
	</div>
		<!-- content끝 -->
</div>
	<!-- layout 끝 -->
	