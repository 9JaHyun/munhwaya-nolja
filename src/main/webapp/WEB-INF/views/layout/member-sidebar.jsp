<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<!-- sidebar -->
<div class="span4 sidebar">
    <div class="def-block widget">
        <h4>${member.nickname}</h4>
        <div style="float: right;">
            <a style="color: #FF0078;">
                <div style="float: right;">
                    <a style="color: #FF0078;">${member.role.role}</a>
                </div>
            </a>
        </div>
        <span class="liner"></span>
        <div class="widget-content">

            <!-- 프로필 이미지 -->
            <div align="center" style="margin-top: 35px;">
                <c:choose>

                    <c:when test="${member.sname eq null}">
                        <img src="resources/images/basic_profile.png" alt="image"
                             style="border-radius: 70%; overflow: hidden; height: 150px; width: 150px;">
                    </c:when>

                    <c:otherwise>
                        <c:choose>
                            <c:when test="${fn:indexOf(member.sname, 'https://') != -1}">
                                <img src="${artist.image}" alt="image"
                                     style="border-radius: 70%; overflow: hidden; height: 150px; width: 150px;">
                            </c:when>
                            <c:otherwise>
                                <img src="api/picture/${member.sname}" alt="image"
                                     style="border-radius: 70%; overflow: hidden; height: 150px; width: 150px;">
                            </c:otherwise>
                        </c:choose>
                    </c:otherwise>

                </c:choose>
            </div>

            <!-- 마일리지 -->
            <div align="right" style="margin: 20px 0px 10px 0px;">
            <div style="font-size:12px; color:white;">보유 마일리지 : <a id="sidebarMileage">${member.mileage}</a></div>
            </div>
            <!-- 충전버튼 -->
            <div align="right">
                <a href="chargeForm.do" class="tbutton small"><span>충전</span></a>
            </div>
        </div>
    </div>
    <!-- 카테고리 -->
    <div class="def-block widget">
        <h4>카테고리</h4>
        <span class="liner"></span>
        <div class="widget-content">
            <ul class="list" style="font-size: 13px;">
                <li><a href="memberChangeInfo.do"><i class="icon-caret-right"> </i>회원정보 변경</a></li>
                <li><a href="likeArtist.do"><i class="icon-caret-right"> </i>좋아요 한 아티스트</a></li>
                <li><a href="artistRequestForm"><i class="icon-caret-right"></i>아티스트 신청</a>
                <li><a href="wishlist.do"><i class="icon-caret-right"> </i>위시리스트</a></li>
                <li><a href="walletInfo.do"><i class="icon-caret-right"> </i>지갑 정보</a></li>
                <c:choose>
                    <c:when test="${member.role == 'R01'}">
                        <li><a href="ticketList.do"><i class="icon-caret-right"> </i>구매한 공연</a></li>
                    </c:when>
                    <c:otherwise>
                        <li><a href="artistManagement"><i class="icon-caret-right"></i>아티스트 관리</a></li>
                        <li><a href="artistProfileForm"><i class="icon-caret-right"></i>아티스트 정보 등록</a>
                        <li><a href="artistDetail"><i class="icon-caret-right"></i>아티스트 정보 상세페이지</a></li>
                        <li><a href="changeArtistProfileForm"><i class="icon-caret-right"></i>아티스트 정보 변경</a></li>
                    </c:otherwise>
                </c:choose>
            </ul>
        </div>
    </div>
</div>

<script>
	var sidebarMileage = document.getElementById('sidebarMileage').innerHTML;
	var sidebarMileage2 = sidebarMileage.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	document.getElementById('sidebarMileage').innerHTML = sidebarMileage2+'원';
</script>