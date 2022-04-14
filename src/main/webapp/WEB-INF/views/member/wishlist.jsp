<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>


<style>
    .js-load {
        display: none;
        margin-bottom: -10px;
    }

    .js-load.active {
        display: revert;
    }
</style>


<div align="right" style="margin-bottom: 50px;">
    <h4>위시리스트</h4>
</div>

<div align="right" style="margin-bottom: 20px;">
    <button class="tbutton small" data-toggle="modal"
            data-target="#myModal2" data-dismiss="modal" aria-label="Close">
        <span>위시리스트 생성</span>
    </button>
</div>
<div align="center">
    <div id="js-load">
        <c:if test="${empty wishlists}">
            <div style="margin: 250px 0px 240px 0px;">
                <h5>위시리스트가 존재하지 않습니다.</h5>
            </div>
        </c:if>
        <c:forEach items="${wishlists}" var="wishlist">
            <div class="js-load">
                <div class="mbf clearfix">
                    <div class="toggle-head"
                         style="cursor: auto; border-bottom: 1px solid #CCC;">
                        <!-- 위시리스트 삭제 버튼 -->
                        <div align="right">
                            <a><i onclick="delWishFnc(${wishlist.id})"
                                  class="icon-remove" id="${wishlist.id}"></i></a>
                        </div>
                        <div style="position: relative;" align="left">
                            <!-- 위시리스트 이름 > 곡목록 -->
                            <h5>
                                <a data-wname="${wishlist.name}"
                                   href="wishlistMusic.do?id=${wishlist.id }&name=${wishlist.name}">
                                        ${wishlist.name}&nbsp;&nbsp;[${wishlist.count}]</a>
                            </h5>
                            <!-- 위시리스트 재생 버튼 -->
                            <c:choose>
                                <c:when test="${wishlist.count eq 0}">
                                    <div
                                            style="position: absolute; float: left; left: 520px; bottom: -5px;">
                                        <a href="chart"><i
                                                class="icon-plus-sign"
                                                style="font-size: 35px; float: right;"></i></a>
                                    </div>
                                </c:when>
                                <c:otherwise>
                                    <div
                                            style="position: absolute; float: left; left: 520px; bottom: -5px;">
                                        <a href="streamingWishList?id=${wishlist.id}"><i
                                                class="icon-play-sign"
                                                style="font-size: 35px; float: right;"></i></a>
                                    </div>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>
        <!-- 더보기 버튼 -->
        <div id="js-btn-wrap" class="tbutton small">
            <a href="javascript:;" class="button"><span>더보기</span></a>
        </div>
    </div>
</div>

<!-- 위시리스트 생성 폼 -->
<form method="post" action="addWishlist.do" id="frm">
    <div class="modal fade def-block" id="myModal2" tabindex="-1"
         role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"
         style="top: 30%; display: none;">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"
                            aria-label="Close">
                        <span style="color: white" aria-hidden="true">&times;</span>
                    </button>
                    <h4 class="modal-title" id="myModalLabel" style="border: none;">위시리스트 생성</h4>
                </div>
                <div class="modal-body def-block">
                    <ul>
                        <li>
                            <!-- 위시리스트 이름 입력 -->
                            <div align="center">
                                <input type="text" class="inputstyle" name="name" id="name"
                                       style="background: none; color: white; border: 2px solid #CCC; padding: 10px; border-radius: 5px;">
                            </div>
                        </li>
                    </ul>
                </div>
                <!-- 위시리스트 생성 버튼 -->
                <div class="modal-footer def-block">
                    <button type="submit" class="tbutton small" aria-label="Close">
                        <span>생성</span>
                    </button>
                </div>
            </div>
        </div>
    </div>
</form>

<script>
    $(window).on('load', function () {
        // 기본 갯수
        load('#js-load', '4');
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
            $('.button').parent().hide();
        }
        $(list + ":lt(" + total_cnt + ")").addClass("active");
    }

    $(window).on('load', function () {
        // 기본 갯수
        load('#js-load', '4');
        $("#js-btn-wrap .button").on("click", function () {
            // 증가 갯수
            load('#js-load', '3', '#js-btn-wrap');
        })
    });

    function delWishFnc(id) {
        var wname = $(event.target).parent().parent().next().children().children().data("wname");
        if (!confirm("[" + wname + '] 삭제하시겠습니까?')) {
        } else {
            $.ajax({
                type: "POST",
                url: "deleteWishlist.do",
                data: JSON.stringify({"id": id}),
                contentType: "application/json"
            })
            .done(() => {
                document.getElementById(id).parentNode.parentNode.parentNode.parentNode.remove();
            });
        }
    }
</script>