<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>

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
						<input  id="title" name="title" type="text"
							style="font-size:small; width: 1000px; height: 60px; " value=""
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
					<form action="searchResultMusic" id="frm">
						<input type="hidden" name="title" value="${title }">
							<h3>검색결과</h3>
							<span class="liner"></span> 
							<h4>음악</h4>
							<button type="submit" class="Rmore tbutton small" style="margin-bottom:5px;">
								<span><i class="icon-angle-right" style="font-size:large;"></i></span>
							</button>
					</form>
						<ul class="tabs-content">
							<li id="Latest" class="active">
								<div class="video-grid">
								<c:forEach var="music" items="${musicSelectListByTitle}" begin="0" end="7">
									<a href="video_single_wide.html" class="grid_3">
										<img src="resources/images/bg/musicBg3.jpg" alt="#">
										<span><strong>${music.musicTitle }</strong>${music.musicArtistName }</span>
									</a>
								</c:forEach>
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
						<form action="searchResultAlbum" id="frm">
						<input type="hidden" name="title" value="${title }">
							<h3>검색결과</h3>
							<span class="liner"></span> 
							<h4>수록앨범</h4>
							<button type="submit" class="Rmore tbutton small" style="margin-bottom:5px;">
								<span><i class="icon-angle-right" style="font-size:large;"></i></span>
							</button>
						</form>
						<ul class="tabs-content">
							<li id="Latest" class="active">
								<div class="video-grid">
								<c:forEach var="album" items="${musicSelectListByTitle}" begin="0" end="7">
									<a class="grid_3" href="albumInfo?id=${album.albumId }">
										<img src="resources/images/bg/musicBg3.jpg" alt="#">
										<span><strong>${album.albumTitle }</strong>${album.albumArtistName }</span>
									</a>
								<%-- <form action="#" method="post">
									<input type="hidden" value="${album.albumId }" name="albumId">
								</form> --%>
							</c:forEach>
								</div><!-- video grid -->
							</li><!-- tab content -->
						</ul><!-- end tabs -->
					</div><!-- def block -->
				</div><!-- posts -->
			<!-- 왼쪽하단 메인 끝-->	
		</div>
	</div>
		<!-- content끝 -->
