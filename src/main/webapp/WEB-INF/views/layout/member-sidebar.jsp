
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<c:set var="rootPath" value="${pageContext.request.contextPath}"/>

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
					<c:when test="${member.role == 'R03'}">
						<img src="resources/images/admin_profile.png" alt="image"
                             style="border-radius: 70%; overflow: hidden; height: 150px; width: 150px;">
					</c:when>
					<c:otherwise>
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
				            <!-- 마일리지 -->
				            <div align="right" style="margin: 20px 0px 10px 0px;">
				            	<div style="font-size:12px; color:white;">보유 마일리지 : <a id="sidebarMileage">${member.mileage}</a></div>
				            </div>
				            <!-- 충전버튼 -->
				            <div align="right">
				                <a href="chargeForm.do" class="tbutton small"><span>충전</span></a>
				            </div>
					</c:otherwise>
                </c:choose>
            </div>
        </div>
    </div>
    <!-- 카테고리 -->
    <div class="def-block widget">
        <h4>카테고리</h4>
        <span class="liner"></span>
        <div class="widget-content">
            <ul class="list">
                    <c:if test="${member.role == 'R01'}">
		                <li><a href="${rootPath}/memberChangeInfo.do"><i class="icon-caret-right"> </i>회원정보 변경</a></li>
		                <li><a href="${rootPath}/likeArtist.do"><i class="icon-caret-right"> </i>좋아요 한 아티스트</a></li>
		                <li><a href="${rootPath}/wishlist.do"><i class="icon-caret-right"> </i>위시리스트</a></li>
		                <li><a href="${rootPath}/walletInfo.do"><i class="icon-caret-right"> </i>지갑 정보</a></li>
                        <li><a href="${rootPath}/ticketList.do"><i class="icon-caret-right"> </i>구매한 공연</a></li>
		                <li><a href="${rootPath}/artistRequestForm"><i class="icon-caret-right"></i>아티스트 신청</a>
                    </c:if>
                    <c:if test="${member.role == 'R02'}">
                    	<li><a href="${rootPath}/memberChangeInfo.do"><i class="icon-caret-right"> </i>회원정보 변경</a></li>
		                <li><a href="${rootPath}/likeArtist.do"><i class="icon-caret-right"> </i>좋아요 한 아티스트</a></li>
		                <li><a href="${rootPath}/wishlist.do"><i class="icon-caret-right"> </i>위시리스트</a></li>
		                <li><a href="${rootPath}/walletInfo.do"><i class="icon-caret-right"> </i>지갑 정보</a></li>
                        <li><a href="${rootPath}/ticketList.do"><i class="icon-caret-right"> </i>구매한 공연</a></li>
                        <li><a href="${rootPath}/performanceInsertForm.do"><i class="icon-caret-right"> </i>아티스트 공연 신청</a></li>
                        <li><a href="${rootPath}/artistManagement"><i class="icon-caret-right"> </i>아티스트 관리</a></li>
                    </c:if>
                    <c:if test="${member.role == 'R03' }">
                    	<li><a href="${rootPath}/judgeArtist"><i class="icon-caret-right"> </i>아티스트 승급 관리</a></li>
                      <li><a href="${rootPath}/performanceList"><i class="icon-caret-right"> </i>아티스트 공연 관리</a></li>
                    </c:if>
            </ul>
        </div>
    </div>
</div>

<script>
	var sidebarMileage = document.getElementById('sidebarMileage').innerHTML;
	var sidebarMileage2 = sidebarMileage.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	document.getElementById('sidebarMileage').innerHTML = sidebarMileage2+'원';
</script>