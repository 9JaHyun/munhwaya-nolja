<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<style>
    .js-load {
        display: none;
    }

    .js-load.active {
        display: revert;
    }
</style>
<div align="right" style="margin-bottom: 50px;">
    <h4>새소식</h4>
</div>
<c:if test="${not empty news1}">
	<div align="right" style="margin-bottom: 25px;">
		<button class="tbutton small" onclick="location.href='deleteNewsAll.do'">
		   	<span>전체삭제</span>
		</button>
	</div>
</c:if>

<div align="center">
    <div id="js-load">
        <div class="mbf clearfix">
            <c:if test="${empty news1 && member.role ne 'R03'}">
                <div style="margin: 200px 0px 200px 0px;">
                    <h5>새소식이 존재하지 않습니다.</h5>
                </div>
            </c:if>
             <c:if test="${member.role eq 'R03'}">
                <div style="margin: 250px 0px 200px 0px;">
                    <h5>관리자 페이지입니다.</h5>
                </div>
            </c:if> 
            <c:forEach items="${news1}" var="news">
                <c:choose>
                    <c:when test="${news.code eq 'N01-1'}">
                        <div class="js-load">
                            <div class="notification-box notification-box-success">
                                <p>
                                    <i class="icon-ok"></i><a onclick="delNewsFnc(${news.id});">${news.artistName}님이
                                    <c:if test="${news.code eq 'N01-1'}">아티스트</c:if>승급 승인되셨습니다.&nbsp;&nbsp;
                                    <fmt:formatDate pattern = "yyyy-MM-dd HH:mm" value = "${news.createdAt}" /> </a>
                                </p>
                                <a class="notification-close notification-close-success">
                                	<i class="icon-remove"
                                        onclick="delNewsFnc(${news.id})"></i></a>
                            </div>
                        </div>
                    </c:when>
                    <c:when test="${news.code eq 'N01-2'}">
                        <div class="js-load">
                            <div class="notification-box notification-box-success">
                                <p>
                                    <i class="icon-ok"></i><a onclick="delNewsFnc(${news.id});">${news.artistName}님이
                                    <c:if test="${news.code eq 'N01-2'}">아티스트</c:if>승급 거절되셨습니다.&nbsp;&nbsp;
                                    <fmt:formatDate pattern = "yyyy-MM-dd HH:mm" value = "${news.createdAt}" /> </a>
                                </p>
                                <a class="notification-close notification-close-success">
                                	<i class="icon-remove"
                                        onclick="delNewsFnc(${news.id})"></i></a>
                            </div>
                        </div>
                    </c:when>
                    <c:when test="${news.code eq 'N02'}">
                        <div class="js-load">
                            <div class="notification-box notification-box-info">
                                <p>
                                    <i class="icon-ok"></i><a onclick="delNewsFnc(${news.id});">${news.artistName}님이
                                    <c:if test="${news.code eq 'N02'}">앨범</c:if>을 등록하셨습니다.&nbsp;&nbsp;
                                    <fmt:formatDate pattern = "yyyy-MM-dd HH:mm" value = "${news.createdAt}" /> </a>
                                </p>
                                <a class="notification-close notification-close-info">
                                	<i class="icon-remove"
                                        onclick="delNewsFnc(${news.id})"></i></a>
                            </div>
                        </div>
                    </c:when>
                    <c:when test="${news.code eq 'N03'}">
                        <div class="js-load">
                            <div class="notification-box notification-box-error">
                                <p>
                                    <i class="icon-ok"></i><a onclick="performanceSearch(${news.pks}); delNewsFnc(${news.id});">${news.artistName}님이
                                    <c:if test="${news.code eq 'N03'}">공연</c:if>을 등록하셨습니다.&nbsp;&nbsp;
                                    <fmt:formatDate pattern = "yyyy-MM-dd HH:mm" value = "${news.createdAt}" /> </a>
                                </p>

                                <a class="notification-close notification-close-error">
                                	<i class="icon-remove"
                                        onclick="delNewsFnc(${news.id})"></i></a>
                            </div>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <div class="js-load">
                            <div class="notification-box notification-box-warning">
                                <p>
                                    <i class="icon-ok"></i><a onclick="delNewsFnc(${news.id});">${news.artistName}님이
                                    <c:if test="${news.code eq 'N04'}">게시글</c:if>을 등록하셨습니다.&nbsp;&nbsp;
                                    <fmt:formatDate pattern = "yyyy-MM-dd HH:mm" value = "${news.createdAt}" /> </a>
                                </p>
                                <a class="notification-close notification-close-warning"> 
                                	<i class="icon-remove"
                                        onclick="delNewsFnc(${news.id})"></i></a>
                            </div>
                        </div>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
            <!-- 더보기 버튼 -->
            <div id="js-btn-wrap" class="tbutton small" style="margin-top: 40px;">
                <a href="javascript:;" class="button"><span>더보기</span></a>
            </div>
        </div>
    </div>
</div>

<div>
	<form id = "frm" action="performanceSelect.do" method="post">
		<input type="hidden" id="id" name="id">
	</form>
</div>

<script>
	function performanceSearch(n) {
		frm.id.value = n;
		frm.submit();
	}
	
    function delNewsFnc(id) {
        $.ajax({
            type: "POST",
            url: "deleteNews.do",
            data: JSON.stringify({"id": id}),
            contentType: "application/json"
        })
        .done(() => {
        	load('#js-load', '1');
        });
    }

    $(window).on('load', function () {
        // 기본 갯수
        load('#js-load', '7');
        $("#js-btn-wrap .button").on("click", function () {
            // 증가 갯수
            load('#js-load', '3', '#js-btn-wrap');
        })
    });

    function load(id, cnt, btn) {
        var list = id + " .js-load:not(.active)";
        var length = $(list).length;
        var total_cnt;
        if (cnt < length) {
            total_cnt = cnt;
        } else {
            total_cnt = length;
            $('.button').parent().hide()
        }
        $(list + ":lt(" + total_cnt + ")").addClass("active");
    }

</script>