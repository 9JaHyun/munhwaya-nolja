<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- layout -->
	<!--(배경이미지) -->
	<div class="under_header" style="height:70px">
		<img src="resources/images/bg/musicBB.jpg" alt="" style="height: 1700px;">
	</div>
<style>
	span{
		color: #D0D0D0;
	}
</style>		
	<!-- content -->
	<div class="page-content back_to_up">
		<!-- 최상단메인칸 -->
		<div class="row row-fluid clearfix mbf">
			<!-- 검색바 -->
			<div class="little-head row">
				<div class="search">
					<form action="searchResult" id="search" method="get" >
						<input  id="title" name="title" type="text"
							style="font-size:x-small; width: 1000px; height: 60px;"
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
												<img style="max-width:65px; min-width:65px; max-height :65px; min-height:65px;" src="api/picture/${music.picture }" alt="#">
											</a>
											<h3>
												<a href="streaming?id=${music.id }">${music.title }</a>
											</h3> 
											<span>${music.artName }</span> 
											<span>
												<c:choose>
		                                           <c:when test="${music.genre eq 'G01'}">발라드</c:when>
		                                           <c:when test="${music.genre eq 'G02'}">댄스</c:when>
		                                           <c:when test="${music.genre eq 'G03'}">랩/힙합</c:when>
		                                           <c:when test="${music.genre eq 'G04'}">R&B/Soul</c:when>
		                                        </c:choose> 
											</span>
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
									<c:forEach var="music" items="${musicRapList}" begin="0" end="15">
										<li class="grid_6">
											<a class="m-thumbnail" href="streaming?id=${music.id }">
												<img style="max-width:65px; min-width:65px; max-height :65px; min-height:65px;" src="api/picture/${music.picture }" alt="#">
											</a>
											<h3>
												<a href="streaming?id=${music.id }">${music.title }</a>
											</h3> 
											<span>${music.artName }</span> 
											<span>
												<c:choose>
		                                            <c:when test="${music.genre eq 'G01'}">발라드</c:when>
		                                            <c:when test="${music.genre eq 'G02'}">댄스</c:when>
		                                            <c:when test="${music.genre eq 'G03'}">랩/힙합</c:when>
		                                            <c:when test="${music.genre eq 'G04'}">R&B/Soul</c:when>
		                                        </c:choose> 
											</span>
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
									<c:forEach var="music" items="${musicDanceList}" begin="0" end="15">
										<li class="grid_6">
											<a class="m-thumbnail" href="streaming?id=${music.id }">
												<img style="max-width:65px; min-width:65px; max-height :65px; min-height:65px;" src="api/picture/${music.picture }" alt="#">
											</a>
											<h3>
												<a href="streaming?id=${music.id }">${music.title }</a>
											</h3> 
											<span>${music.artName }</span> 
											<span>
											<c:choose>
		                                        <c:when test="${music.genre eq 'G01'}">발라드</c:when>
		                                        <c:when test="${music.genre eq 'G02'}">댄스</c:when>
		                                        <c:when test="${music.genre eq 'G03'}">랩/힙합</c:when>
		                                        <c:when test="${music.genre eq 'G04'}">R&B/Soul</c:when>
		                                    </c:choose> 
											</span>
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
										<c:forEach var="music" items="${musicBalladList}" begin="0" end="15">
											<li class="grid_6">
												<a class="m-thumbnail" href="streaming?id=${music.id }">
													<img style="max-width:65px; min-width:65px; max-height :65px; min-height:65px;" src="api/picture/${music.picture }" alt="#">
												</a>
												<h3>
													<a href="streaming?id=${music.id }">${music.title }</a>
												</h3> 
												<span>${music.artName }</span> 
												<span>
													<c:choose>
				                                        <c:when test="${music.genre eq 'G01'}">발라드</c:when>
				                                        <c:when test="${music.genre eq 'G02'}">댄스</c:when>
				                                        <c:when test="${music.genre eq 'G03'}">랩/힙합</c:when>
				                                        <c:when test="${music.genre eq 'G04'}">R&B/Soul</c:when>
				                                    </c:choose> 
												</span>
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
		</div>
	</div>