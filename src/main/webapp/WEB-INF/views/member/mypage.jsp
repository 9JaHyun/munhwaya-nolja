<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

<div align="center">
    <div id="js-load">
        <div class="mbf clearfix">
            <c:if test="${empty news1}">
                <div style="margin: 200px 0px 200px 0px;">
                    <h5>새소식이 존재하지 않습니다.</h5>
                </div>
            </c:if>
            <c:forEach items="${news1}" var="news">
                <c:choose>
                    <c:when test="${news.code eq 'feed'}">
                        <div class="js-load">
                            <div class="notification-box notification-box-success">
                                <p>
                                    <i class="icon-ok"></i>${news.artistName}님이
                                    <c:if test="${news.code eq 'feed'}">피드</c:if>를 등록하셨습니다.
                                </p>
                                <a href="#"
                                   class="notification-close notification-close-success"><i
                                        class="icon-remove" onclick="delNewsFnc(${news.id})"></i></a>
                            </div>
                        </div>
                    </c:when>
                    <c:when test="${news.code eq 'album'}">
                        <div class="js-load">
                            <div class="notification-box notification-box-info">
                                <p>
                                    <i class="icon-ok"></i>${news.artistName}님이
                                    <c:if test="${news.code eq 'album'}">앨범</c:if>을 등록하셨습니다.
                                </p>
                                <a href="#" class="notification-close notification-close-info"><i
                                        class="icon-remove" onclick="delNewsFnc(${news.id})"></i></a>
                            </div>
                        </div>
                    </c:when>
                    <c:when test="${news.code eq 'performance'}">
                        <div class="js-load">
                            <div class="notification-box notification-box-error">
                                <p>
                                    <i class="icon-ok"></i>${news.artistName}님이
                                    <c:if test="${news.code eq 'performance'}">공연</c:if>을 등록하셨습니다.
                                </p>
                                <a href="#" class="notification-close notification-close-error"><i
                                        class="icon-remove" onclick="delNewsFnc(${news.id})"></i></a>
                            </div>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <div class="js-load">
                            <div class="notification-box notification-box-warning">
                                <p>
                                    <i class="icon-ok"></i>${news.artistName}님이
                                    <c:if test="${news.code eq 'post'}">게시글</c:if>을 등록하셨습니다.
                                </p>
                                <a href="#"
                                   class="notification-close notification-close-warning"> <i
                                        class="icon-remove" onclick="delNewsFnc(${news.id})"></i></a>
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

<script>
    function delNewsFnc(id) {

        $.ajax({
            type : "POST",
            url : "deleteNews.do",
            data : JSON.stringify({"id": id}),
            contentType : "application/json"
        })
        .done(() => {
        });
    }

    $(window).on('load', function () {
        // 기본 갯수
        load('#js-load', '5');
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