<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="resources" value="${pageContext.request.contextPath}/resources"/>
<header id="header" class="glue">
    <div class="headdown">
        <div class="row clearfix">
            <div class="logo bottomtip" title="Best and Most Popular Musics">
                <a href="#"><img src="${resources}/images/logo.png"
                                 alt="Best and Most Popular Musics"></a>
            </div>

            <%-- 헤더 네비게이션 바 --%>
            <nav>
                <ul class="sf-menu">
                    <li class="current selectedLava"><a href="/prj">Home<span class="sub">start here</span></a>
                    </li>
                    <li><a href="#">음악<span class="sub">remix all features</span></a>
                        <%-- <ul> - <li>를 사용해서 메뉴 계층화 가능 --%>
                        <ul>
                            <li><a href="#">Shortcodes</a>
                                <ul>
                                    <li><a href="shortcode_buttons.html">Buttons</a></li>
                                    <li><a href="#">Typography</a>
                                        <ul>
                                            <li><a href="shortcode_columns.html">Grid Columns</a>
                                            </li>
                                            <li><a href="shortcode_quote.html">Quote</a></li>
                                        </ul>
                                    </li>
                                </ul>
                            </li>
                        </ul>
                    </li>
                    <li><a href="performance">공연<span class="sub">Photo Gallery</span></a>
                        <ul>
                            <li><a href="performanceInsertForm.do">아티스트 공연 등록 신청</a></li>
                        </ul>
                    </li>
                    <li><a href="#">게시판<span class="sub">more templates</span></a>
                        <ul>
                            <li><a href="rtl.html">RTL Support</a></li>
                            <li><a href="events.html">Events</a></li>
                        </ul>
                    </li>
                </ul>
<%--                로그인 버튼--%>
                <div id="Login_PopUp_Link" class="sign-btn tbutton small"><span>로그인</span></div>
            </nav>
        </div>
    </div>

    <%-- 로그인 모달--%>
    <div id="popupLogin">
        <div class="def-block widget">
            <h4> 로그인 </h4><span class="liner"></span>
            <div class="widget-content row-fluid">
                <form id="popup_login_form">
                    <input type="text" name="login_username" id="login_username"
                           onfocus="if (this.value=='username') this.value = '';"
                           onblur="if (this.value=='') this.value = 'username';" value="username"
                           placeholder="아이디">
                    <input type="password" name="login_password" id="login_password"
                           onfocus="if (this.value=='password') this.value = '';"
                           onblur="if (this.value=='') this.value = 'password';" value="password"
                           placeholder="비밀번호">
                    <a href="#" class="tbutton small"><span>로그인</span></a>
                    <a href="#" class="tbutton color2 small"><span>회원가입</span></a>
                </form>
            </div>
        </div>
        <div id="popupLoginClose">x</div>
    </div>
    <div id="LoginBackgroundPopup"></div>
</header>