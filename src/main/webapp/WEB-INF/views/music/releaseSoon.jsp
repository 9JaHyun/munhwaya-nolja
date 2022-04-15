<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<style>
	.pageInfo {
  	 list-style: none;
   	 display: inline-block;
	}
	
	.pageInfo li {
	   float: left;
	   font-size: 1px;
	   padding: 7px;
	   font-weight: 500;
	}
	
	a:link {
	   color: white;
	   text-decoration: none;
	}
	
	a:visited {
	   color: white;
	   text-decoration: none;
	}
	
	a:hover {
	   color: white;
	   text-decoration: underline;
	}
	
	.focus {
	   background-color: #cdd5ec;
	}
	
	.search_area {
	   display: inline-block;
	   margin-top: 30px;
	   margin-left: 260px;
	}
	
	.search_area input {
	   height: 30px;
	   width: 250px;
	}
	
	.search_area button {
	   width: 100px;
	   height: 36px;
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
						<input id="title" name="title" type="text"
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
		<!-- 앨범 -->
		<div class="row row-fluid clearfix mbf">
			<!-- 왼쪽하단 메인 -->	
			<div class="posts">
					<div class="def-block">
						<h4>발매임박 앨범</h4>
						<i class="icon-angle-right" style="font-size:large; margin-left: 7px;"></i>
						<span class="liner"></span>
						<ul class="tabs-content">
							<li id="Latest" class="active">
								<div class="video-grid">
								<c:forEach var="album" items="${releaseSoonAlbumList}" begin="0" end="11">
									<a href="albumInfo?id=${album.id }" class="grid_3">
										<img src="api/picture/${album.picture }" alt="#" style="max-width:200px; min-width:200px; max-height :200px; min-height:200px;">
										<span style="margin:0px; font-weight: bold; color:white;">앨범명: ${album.albName }</span>
										<span style="margin:0px; ">가수: ${album.artName }</span>
										<span style="margin:0px;">
											장르: 
											<c:choose>
		                                        <c:when test="${album.genre eq 'G01'}">발라드</c:when>
		                                        <c:when test="${album.genre eq 'G02'}">댄스</c:when>
		                                        <c:when test="${album.genre eq 'G03'}">랩/힙합</c:when>
		                                        <c:when test="${album.genre eq 'G04'}">R&B/Soul</c:when>
		                                    </c:choose> 
										</span>
										<span style="margin:0px;">발매일: <fmt:formatDate pattern = "YYYY년 MM월 dd일" value = "${album.releaseAt}" /></span>
									</a>
								</c:forEach>
								</div><!-- video grid -->
							</li><!-- tab content -->
						</ul><!-- end tabs -->
					</div><!-- def block -->
				</div><!-- posts -->
			<!-- 왼쪽하단 메인 끝-->	
		</div>
	<div class="pageInfo_wrap">
      <div class="pageInfo_area" style="text-align: center;">
         <ul id="pageInfo" class="pageInfo">
            <!-- 이전페이지 버튼 -->
            <c:if test="${pageMaker.prev}">
               <li class="pageInfo_btn previous"><a href="#"
                  onclick="paging(${pageMaker.startPage-1})">Previous</a></li>
            </c:if>
            <!-- 각 번호 페이지 버튼 -->
            <c:forEach var="num" begin="${pageMaker.startPage}"
               end="${pageMaker.endPage}">
               <li class="pageInfo_btn ${pageMaker.cri.pageNum == num ? "focus":""}"><a
                  href="#" onclick="paging(${num})">${num}</a></li>
            </c:forEach>
            <!-- 다음페이지 버튼 -->
            <c:if test="${pageMaker.next}">
               <li class="pageInfo_btn next"><a href="#"
                  onclick="paging(${pageMaker.endPage + 1})">Next</a></li>
            </c:if>
         </ul>
      </div>
   </div>
</div>
	<!-- content끝 -->
<form id="moveForm" method="get" action="releaseSoon">
      <input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
      <input type="hidden" name="amount" value="${pageMaker.cri.amount }">
      <%--       <input type="hidden" name="keyword" value="${pageMaker.cri.keyword }"> --%>
      <%--       <input type="hidden" name="type" value="${pageMaker.cri.type }"> --%>
   </form>
<script>
function paging(num) {
    moveForm.pageNum.value = num;
    moveForm.submit();
 };
 
</script>