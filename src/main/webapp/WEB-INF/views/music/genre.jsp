<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- layout -->
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
		
		<!-- 장르별음악추천 리스트 -->
		<div class="row row-fluid clearfix mbf">
			<!-- 크기지정 -->
			<div class="posts">
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
									<c:forEach var="music" items="${musicRnBList}" begin="0" end="15">
										<li class="grid_6">
											<a class="m-thumbnail" href="streaming?id=${music.id }">
												<img style="width:60; height:60;" src="resources/images/bg/musicBg3.jpg" alt="#">
											</a>
											<h3>
												<a href="streaming?id=${music.id }">${music.title }</a>
											</h3> 
											<span>${music.artName }</span> 
											<span>likes:${music.likeIt}</span>
										</li>
									</c:forEach>
								</ul>
								<a href="news_single.html" class="Rmore tbutton small"><span>더보기</span></a>
							</div>
							<!-- latest -->
						</li>
						<!-- 탭1 끝-->
						
						<!-- 탭2 -->
						<li id="Latest">
							<div class="post no-border no-mp clearfix">
								<ul class="tab-content-items">
									<c:forEach var="music" items="${musicRapList}" begin="0" end="15">
										<li class="grid_6">
											<a class="m-thumbnail" href="streaming?id=${music.id }">
												<img style="width:60; height:60;" src="resources/images/bg/musicBg3.jpg" alt="#">
											</a>
											<h3>
												<a href="streaming?id=${music.id }">${music.title }</a>
											</h3> 
											<span>${music.artName }</span> 
											<span>likes:${music.likeIt}</span>
										</li>
									</c:forEach>
								</ul>
								<a href="news_single.html" class="Rmore tbutton small"><span>더보기</span></a>
							</div>
							<!-- latest -->
						</li>
						<!-- 탭2 끝-->
						
						<!-- 탭3 -->
						<li id="Featured">
							<div class="post no-border no-mp clearfix">
								<ul class="tab-content-items">
									<c:forEach var="music" items="${musicDanceList}" begin="0" end="15">
										<li class="grid_6">
											<a class="m-thumbnail" href="streaming?id=${music.id }">
												<img style="width:60; height:60;" src="resources/images/bg/musicBg3.jpg" alt="#">
											</a>
											<h3>
												<a href="streaming?id=${music.id }">${music.title }</a>
											</h3> 
											<span>${music.artName }</span> 
											<span>likes:${music.likeIt}</span>
										</li>
									</c:forEach>
								</ul>
								<a href="news_single.html" class="Rmore tbutton small"><span>더보기</span></a>
							</div>
							<!-- latest -->
						</li>
						<!-- 탭3 끝-->
						
						<!-- 탭4 -->	
						<li id="Albums">
							<div class="post no-border no-mp clearfix">
								<ul class="tab-content-items">
										<c:forEach var="music" items="${musicBalladList}" begin="0" end="15">
											<li class="grid_6">
												<a class="m-thumbnail" href="streaming?id=${music.id }">
													<img style="width:60; height:60;" src="resources/images/bg/musicBg3.jpg" alt="#">
												</a>
												<h3>
													<a href="streaming?id=${music.id }">${music.title }</a>
												</h3> 
												<span>${music.artName }</span> 
												<span>likes:${music.likeIt}</span>
											</li>
										</c:forEach>
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
		</div>
	</div>