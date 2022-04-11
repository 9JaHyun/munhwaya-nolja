<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<c:set var="resources" value="${pageContext.request.contextPath}/resources"/>
<header id="header" class="glue">
    <%-- 로그인 버튼--%>
    <div class="row clearfix">
        <div class="little-head">

            <sec:authorize access="isAnonymous()">
                <a href="signupForm.do" class="sign-btn tbutton color3 small"> <span>회원가입</span></a>
                <a href="signin" class="sign-btn tbutton small"
                   style="margin-right: 6px;"> <span>로그인</span></a>
            </sec:authorize>
            <sec:authorize access="isAuthenticated()">
                <a href="mypage.do" class="tbutton color2 small"
                   style="background-color: #4c4c4c; margin-right: 6px;"> <span>마이페이지</span></a>
                <div id="cart" style="float: right; margin-left: 10px">
                    <a href="cart"><i class="icon-shopping-cart"
                                      style="font-size: 25px"></i></a>
                </div>
            </sec:authorize>
            <sec:authorize access="isAuthenticated()">
                <div style="float: right;">
                    <form action="logout" method="post">
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
            <div class="logo bottomtip" title="Best and Most Popular Musics">
                <a href="home.do"><img src="${resources}/images/logo.png"
                                       alt="Best and Most Popular Musics"></a>
            </div>
            <%-- 헤더 네비게이션 바 --%>
            <nav>
                <ul class="sf-menu">
                    <li class="current selectedLava"><a href="/prj">Home<span
                            class="sub">start here</span></a></li>
                    <li><a href="musicMain">음악<span class="sub">Search
								And Streaming Music</span></a> <%-- <ul> - <li>를 사용해서 메뉴 계층화 가능 --%>
                        <ul>
                            <li><a href="genre">장르별 음악추천</a></li>
                            <li><a href="chart">차트순위</a></li>
                            <li><a href="releaseSoon">발매임박 앨범</a></li>
                            <li><a href="personalResult">퍼스널 추천</a></li>
                            <li><a href="purchase">내가 구입한 음원</a></li>
                        </ul>
                    </li>
                    <li><a href="/prj/performance">공연<span class="sub">Photo Gallery</span></a>
                        <ul>
                            <sec:authorize access="hasRole('ROLE_R02')">
                                <li><a href="/prj/performanceInsertForm.do">아티스트 공연 등록 신청</a></li>
                            </sec:authorize>
                            <li><a href="/prj/ticketList.do">구매리스트</a></li>
                            <sec:authorize access="hasRole('ROLE_R03')">
                                <li><a href="/prj/admin/performanceList">관리자 공연리스트</a></li>
                            </sec:authorize>
                            <li><a href="kakao">kakao test</a></li>
                        </ul>
                    </li>
                    <li><a href="#">게시판<span class="sub">more templates</span></a>
                        <ul>
                            <li><a href="rtl.html">RTL Support</a></li>
                            <li><a href="events.html">Events</a></li>
                        </ul>
                    </li>
                </ul>
            </nav>
        </div>
    </div>
</header>