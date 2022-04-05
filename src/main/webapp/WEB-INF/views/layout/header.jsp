<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<c:set var="resources"
       value="${pageContext.request.contextPath}/resources"/>
<header id="header" class="glue">
    <%-- 로그인 버튼--%>
    <div class="row clearfix">
        <div class="little-head">
            <sec:authorize access="isAnonymous()">
            <div id="Login_PopUp_Link" class="sign-btn tbutton small">
                <span>로그인</span>
            </div>
            </sec:authorize>
            <sec:authorize access="isAuthenticated()">
                <form action="logout" method="post">
                    <button class="btn btn-info" type="submit">  로그아웃 </button>
                </form>
            <a href="mypage.do" class="tbutton color2 small" style="background-color: #4c4c4c;">
                <span>마이페이지</span></a>
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
                            class="sub">start here</span></a>
                    </li>
                    <li><a href="musicMain">음악<span
                            class="sub">Search And Streaming Music</span></a>
                        <%-- <ul> - <li>를 사용해서 메뉴 계층화 가능 --%>
                        <ul>
                            <li><a href="genre">장르별 음악추천</a>
                            </li>
                            <li><a href="chart">차트순위</a>
                            </li>
                            <li><a href="releaseSoon">발매임박 앨범</a>
                            </li>
                            <li><a href="personalResult">퍼스널 추천</a>
                            </li>
                            <li><a href="purchase">내가 구입한 음원</a>
                            </li>
                        </ul>
                    </li>
                    <li><a href="performance">공연<span class="sub">Photo Gallery</span></a>
                        <ul>
                        	<sec:authorize access="hasRole('ROLE_R02')">
                            	<li><a href="performanceInsertForm.do">아티스트 공연 등록 신청</a></li>                        	
                        	</sec:authorize>
                            <li><a href="ticketList.do">구매리스트</a></li>
                            <sec:authorize access="hasRole('ROLE_R03')">
                            	<li><a href="admin/performanceList">관리자 공연리스트</a></li>
                            </sec:authorize>
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
    <%-- 로그인 모달--%>
    <div id="popupLogin">
        <div class="def-block widget">
            <h4>이게로그인창</h4>
            <span class="liner"></span>
            <div class="widget-content row-fluid">
                <form id="popup_login_form" method="post" action="login">
                    <input type="text" name="username" id="username"
                           placeholder="아이디">
                    <input type="password" name="password" id="password" placeholder="비밀번호">
                    <button type="submit" class="tbutton small"><span>로그인</span></button>
                    <a href="signupForm.do" class="tbutton color2 small"><span>회원가입</span></a>
                </form>
            </div>
        </div>
        <div id="popupLoginClose">x</div>
    </div>
    <div id="LoginBackgroundPopup"></div>
</header>