<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<style>
	span{
		color: #D0D0D0;
	}
</style>
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
							style="font-size:small; width: 1000px; height: 60px; "
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
								<c:choose>
									<c:when test="${checkM eq 0}">
												<span><strong>검색결과가 없습니다</strong></span>
									</c:when>
									<c:otherwise>
										<c:forEach var="music" items="${musicSelectListByTitle}" begin="0" end="7">
											<a href="streaming?id=${music.id }" class="grid_3">
												<img src="api/picture/${music.picture}" alt="#" style="max-width:200px; min-width:200px; max-height :200px; min-height:200px;">
												<span><strong>${music.title }</strong>${music.artName}</span>
											</a>
										</c:forEach>
									</c:otherwise>
								</c:choose>
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
								<c:choose>
									<c:when test="${checkA eq 0}">
												<span><strong>검색결과가 없습니다</strong></span>
									</c:when>
									<c:otherwise>
										<c:forEach var="album" items="${albumSelectListByTitle}" begin="0" end="7">
											<a class="grid_3" href="albumInfo?id=${album.id }">
												<img src="api/picture/${album.picture}" alt="#" style="max-width:200px; min-width:200px; max-height :200px; min-height:200px;">
												<span><strong>${album.albName }</strong>${album.artName}</span>
											</a>
										</c:forEach>
									</c:otherwise>
								</c:choose>
								</div><!-- video grid -->
							</li><!-- tab content -->
						</ul><!-- end tabs -->
					</div><!-- def block -->
				</div><!-- posts -->
			<!-- 왼쪽하단 메인 끝-->	
		</div>
</div>
<!-- content끝 -->

