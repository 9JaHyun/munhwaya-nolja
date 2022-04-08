<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

	<!--(배경이미지) -->
	<div class="under_header" style="height:70px">
		<img src="resources/images/bg/musicBg.jpg" alt="" style="height: 1500px;">
	</div>
	
	<!-- content -->
	<div class="page-content back_to_up">
		<!-- 최상단메인칸 -->
		<div class="row row-fluid clearfix mbf">
			<!-- 검색바 -->
			<div class="little-head row">
				<div class="search">
					<form action="searchResult" id="search" method="get" >
						<input id="title" name="title" type="text"
							style="font-size:small; width: 1000px; height: 60px;"
							placeholder="노래명, 앨범명 입력">
						<button type="submit" style="margin-top:15px; margin-right:10px;">
							<i class="icon-search" style="font-size: 25px;"></i>
						</button>
					</form>
				</div>
			</div>
			<!-- 검색바 끝-->
		</div>
		<!-- 최상단메인칸 끝 -->
		
		<!-- 중상단메인 -->
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
						<li><a href="#Soon" class="active"> R&B/SOUL </a></li>
						<li><a href="#Latest"> 랩/힙합 </a></li>
						<li><a href="#Featured"> 댄스 </a></li>
						<li><a href="#Albums"> 발라드</a></li>
					</ul>
					<!-- 탭1 -->
					<ul class="tabs-content">
						<li id="Soon" class="active">
							<div class="post no-border no-mp clearfix">
								<ul class="tab-content-items">
									<c:forEach var="music" items="${musicRnBList}" begin="0" end="9">
										<li class="grid_6">
											<a class="m-thumbnail" href="streaming?id=${music.id }">
												<img style="width:100%; height:100%; object-fit: cover;" src="api/picture/${music.picture }" alt="#">
											</a>
											<h3>
												<a href="streaming?id=${music.id }">${music.title }</a>
											</h3> 
											<span>${music.artName }</span> 
											<span>likes:${music.likeIt}</span>
										</li>
									</c:forEach>
								</ul>
							</div>
							<!-- latest -->
						</li>
						<!-- 탭1 끝-->
						
						<!-- 탭2 -->
						<li id="Latest">
							<div class="post no-border no-mp clearfix">
								<ul class="tab-content-items">
									<c:forEach var="music" items="${musicRapList}" begin="0" end="9">
										<li class="grid_6">
											<a class="m-thumbnail" href="steraming?id=${music.id }">
												<img style="width:100%; height:100%; object-fit: cover;" src="api/picture/${music.picture }" alt="#">
											</a>
											<h3>
												<a href="streaming?id=${music.id }">${music.title }</a>
											</h3> 
											<span>${music.artName }</span> 
											<span>likes:${music.likeIt}</span>
										</li>
									</c:forEach>
								</ul>
							</div>
							<!-- latest -->
						</li>
						<!-- 탭2 끝-->
						
						<!-- 탭3 -->
						<li id="Featured">
							<div class="post no-border no-mp clearfix">
								<ul class="tab-content-items">
									<c:forEach var="music" items="${musicDanceList}" begin="0" end="9">
										<li class="grid_6">
											<a class="m-thumbnail" href="streaming?id=${music.id }">
												<img style="width:100%; height:100%; object-fit: cover;" src="api/picture/${music.picture }" alt="#">
											</a>
											<h3>
												<a href="streaming?id=${music.id }">${music.title }</a>
											</h3> 
											<span>${music.artName }</span> 
											<span>likes:${music.likeIt}</span>
										</li>
									</c:forEach>
								</ul>
							</div>
							<!-- latest -->
						</li>
						<!-- 탭3 끝-->
						
						<!-- 탭4 -->	
						<li id="Albums">
							<div class="post no-border no-mp clearfix">
								<ul class="tab-content-items">
										<c:forEach var="music" items="${musicBalladList}" begin="0" end="9">
											<li class="grid_6">
												<a class="m-thumbnail" href="streaming?id=${music.id }">
													<img style="width:100%; height:100%; object-fit: cover;" src="api/picture/${music.picture }" alt="#">
												</a>
												<h3>
													<a href="streaming?id=${music.id }">${music.title }</a>
												</h3> 
												<span>${music.artName }</span> 
												<span>likes:${music.likeIt}</span>
											</li>
										</c:forEach>
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
							<c:forEach var="music" items="${musicChartList}" begin="0" end="4" varStatus="status">
								<li>
									<span style="margin:0px;">
										<h4 style="color: white; margin: 0px;font-size:small;padding: 0px;">
											${status.count }위
										</h4>
									</span>
									<a class="m-thumbnail" href="streaming?id=${music.id }">
										<img style="width:100%; height:100%; object-fit: cover;" 
											src="api/picture/${music.picture }" alt="#">
									</a>
									<h3>
										<a href="streaming?id=${music.id }">${music.title }</a>
									</h3>
									<span>${music.artName }</span>
									<span> ${music.likeIt }</span>
								</li>
							</c:forEach>	
							</ul>
						</div><!-- widget content -->
					</div><!-- 검은block -->
				</div><!-- 크기지정 span4 sidebar 끝 -->
				<!-- 오른쪽 상단메인 끝 -->
			</div>
		<!-- 중상단메인 끝 -->
		
		<!-- 중하단메인 -->
		<!-- 발매임박앨범 -->
		<div class="row row-fluid clearfix mbf">
			<!-- 검은블락 -->
			<div class="def-block animtt" data-gen="fadeUp" style="opacity: 0;">
				<a href="releaseSoon">
					<h4>발매임박앨범</h4>
					<i class="icon-angle-right" style="font-size:large; margin-left: 7px;"></i>
				</a>
				<span class="liner"></span>
				<!--비디오그리드-->
				<div class="video-grid clearfix">
					<div class="mp3-carousel">
						<div class="anyClass">
							<ul class="tab-content-items">
								<c:forEach var="album" items="${releaseSoonAlbumList}" begin="0" end="4">
								<li>
									<a class="m-thumbnail" href="albumInfo?id=${album.id }">
										<img style="width:100%; height:100%; object-fit: cover; " src="api/picture/${album.picture }" alt="#">
									</a>
									<h3>
										<a href="albumInfo?id=${album.id }">${album.albName}</a>
									</h3> 
									<span>${album.artName}</span> 
									<span><fmt:formatDate pattern = "YYYY년 MM월 dd일" value = "${album.releaseAt}" /></span> 
								</li>
								</c:forEach>
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
				<!--비디오그리드 끝 -->
			</div>
			<!-- 검은블락 끝 -->
		</div>
		<!-- 발매임박앨범 끝 -->
		<!-- 중상단메인칸 끝 -->
		
		<!-- =================================================== -->
		
		<!-- 하단 메인칸 -->
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
									<c:forEach var="music" items="${musicPersonalList}" begin="0" end="7">
										<a href="streaming?id=${music.id }" class="grid_3">
											<img style="width:100%; height:100%; object-fit: cover;" src="api/picture/${music.picture }" alt="#">
											<span><strong>${music.title }</strong>${music.artName }</span>
										</a>
									</c:forEach>
								</div><!-- video grid -->
							</li>
						</ul>
					</div>
					<!-- 검은블락 끝 -->
				</div>
				<!-- 왼쪽하단 메인 끝-->	
		</div>
		<!-- 하단 메인칸끝 -->
	</div>
	<!-- content끝 -->


	