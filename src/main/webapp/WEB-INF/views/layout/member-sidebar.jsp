<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- sidebar -->
<div class="span4 sidebar">
    <div class="def-block widget">
        <h4>${sessionScope.member.nickname}</h4>
        <div style="float: right;">
        	<a style="color: #FF0078;">
        		<c:choose>
        			<c:when test="${sessionScope.member.role == 'R01'}">일반회원</c:when>
        			<c:otherwise>아티스트</c:otherwise>
        		</c:choose> 
        	</a>
        </div>
        <span class="liner"></span>
        <div class="widget-content">

            <!-- 프로필 이미지 -->
            <div align="center" style="margin-top: 35px;">
            	<c:choose>
            		<c:when test="${member.image eq null}">
            		<!-- 사진 없을 경우 기본 이미지 -->
            		<img src="resources/music/1.jpg" alt="album cover" 
					style="border-radius: 70%; overflow: hidden; height: 150px; width: 150px;">
            		</c:when>
            		<c:otherwise>
            		<!-- 사진 있을 경우-->
            		</c:otherwise>
            	</c:choose>
            </div>
	
			<!-- 마일리지 -->
            <div align="right" style="margin: 20px 0px 10px 0px;">
                <a>보유 마일리지 : ${member.mileage} 원</a>
            </div>
            <!-- 충전버튼 -->
            <div align="right">
                <a href="#" class="tbutton small"><span>충전</span></a>
            </div>
        </div>
    </div>
    <!-- 카테고리 -->
    <div class="def-block widget">
        <h4>카테고리</h4>
        <span class="liner"></span>
        <div class="widget-content">
            <ul class="list">
                <li><a href="memberChangeInfo.do"><i class="icon-caret-right"> </i>회원정보 변경</a></li>
                <li><a href="likeArtist.do"><i class="icon-caret-right"> </i>좋아요 한 아티스트</a></li>
                <li><a href="wishlist.do"><i class="icon-caret-right"> </i>위시리스트</a></li>
                <li><a href="#"><i class="icon-caret-right"> </i>지갑정보</a></li>
	                <c:choose>
	        			<c:when test="${member.role == 'R01'}">
 			                <li><a href="#"><i class="icon-caret-right"> </i>구매한 공연</a></li>
	       					<li><a href="#"><i class="icon-caret-right"> </i>아티스트 신청</a></li>
	        			</c:when>
	        			<c:otherwise>
	        				<li><a href="#"><i class="icon-caret-right"> </i>아티스트 관리</a></li>
	        			</c:otherwise>
	        		</c:choose> 
            </ul>
        </div>
    </div>
</div>