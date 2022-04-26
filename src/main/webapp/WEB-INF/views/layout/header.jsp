<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<c:set var="resources" value="${pageContext.request.contextPath}/resources"/>
<c:set var="rootPath" value="${pageContext.request.contextPath}"/>
<script type="text/javascript"
        src="//dapi.kakao.com/v2/maps/sdk.js?appkey=bf76e13e65e181699d60340265d9e67e"></script>
<header id="header" class="glue">
    <%-- 로그인 버튼--%>
    <div class="row clearfix">
        <div class="little-head">
            <sec:authorize access="isAnonymous()">
                <a href="${rootPath}/signupForm.do" class="sign-btn tbutton color3 small"> <span>회원가입</span></a>
                <a href="${rootPath}/signin" class="sign-btn tbutton small"
                   style="margin-right: 6px;"> <span>로그인</span></a>
            </sec:authorize>
            <sec:authorize access="isAuthenticated()">
                <a href="${rootPath}/mypage.do" class="tbutton color2 small"
                   style="background-color: #4c4c4c; margin-right: 6px;">
                   <span>
                      <c:choose>
                          <c:when test="${member.role eq 'R03'}">관리페이지</c:when>
                          <c:otherwise>마이페이지</c:otherwise>
                      </c:choose>
                   </span></a>
                <c:if test="${member.role ne 'R03'}">
                    <div id="cart" style="float: right; margin-left: 10px">
                        <a href="${rootPath}/cart"><i class="icon-shopping-cart"
                                                      style="font-size: 25px"></i></a>
                    </div>
                </c:if>
                <div style="float: right;">
                    <form action="${rootPath}/logout" method="post">
                        <button class="sign-btn tbutton small" type="submit">
                            <span>로그아웃</span>
                        </button>
                    </form>
                </div>
            </sec:authorize>
        </div>
    </div>
    <div class="headdown">
        <div class="row clearfix">
            <div class="logo bottomtip" title="Catch Cultural Current">
                <a href="${rootPath}/home.do"><img src="${resources}/images/ccc_logo.png"
                                                   alt="Catch Cultural Current"></a>
            </div>
            <%-- 헤더 네비게이션 바 --%>
            <nav>
                <ul class="sf-menu">
                    <li class="current selectedLava"><a href="${rootPath}/home.do">Home<span
                            class="sub">start here</span></a></li>
                    <li><a href="${rootPath}/musicMain">음악<span class="sub">Search
								And Streaming Music</span></a> <%-- <ul> - <li>를 사용해서 메뉴 계층화 가능 --%>
                        <ul>
                            <li><a href="${rootPath}/genre">장르별 음악추천</a></li>
                            <li><a href="${rootPath}/chart">차트순위</a></li>
                            <li><a href="${rootPath}/releaseSoon">발매임박 앨범</a></li>
                            <li><a href="${rootPath}/personalResult">퍼스널 추천</a></li>
                            <li><a href="${rootPath}/purchase">내가 구입한 음원</a></li>
                        </ul>
                    </li>
                    <li><a href="${rootPath}/performance">공연<span class="sub">Photo
								Gallery</span></a>
                        <ul>
                            <sec:authorize access="hasRole('ROLE_R02')">
                                <li><a href="${rootPath}/performanceInsertForm.do">아티스트 공연 등록 신청</a>
                                </li>
                            </sec:authorize>
                        </ul>
                    </li>
                </ul>
            </nav>
        </div>
    </div>
</header>