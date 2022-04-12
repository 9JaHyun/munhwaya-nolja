<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>

	<!--(배경이미지) -->
	<div class="under_header" style="height:70px">
		<img src="resources/images/bg/musicBB.jpg" alt="" style="height: 1700px;">
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
						<a href="searchResultMusic?title=${title}">
							<h3>검색결과</h3>
							<span class="liner"></span> 
							<h4>음악
								<span><i class="icon-angle-right" style="font-size:large;"></i></span>
							</h4>
						</a>
						<ul class="tabs-content">
							<li id="Latest" class="active">
								<div class="video-grid">
								<c:forEach var="music" items="${musicSelectListByTitle}" begin="0" end="7">
									<a href="streaming?id=${music.id }" class="grid_3">
										<img src="api/picture/${music.picture}" alt="#">
										<span><strong>${music.title }</strong>${music.artName}</span>
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
						<a href="searchResultAlbum?title=${title}">
							<h3>검색결과</h3>
							<span class="liner"></span> 
							<h4>앨범
								<span><i class="icon-angle-right" style="font-size:large;"></i></span>
							</h4>
						</a>
						<ul class="tabs-content">
							<li id="Latest" class="active">
								<div class="video-grid">
								<c:forEach var="album" items="${albumSelectListByTitle}" begin="0" end="7">
									<a class="grid_3" href="albumInfo?id=${album.id }">
										<img src="api/picture/${album.picture}" alt="#">
										<span><strong>${album.albName }</strong>${album.artName}</span>
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

