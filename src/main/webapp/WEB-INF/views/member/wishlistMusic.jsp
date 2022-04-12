<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <a href="wishlist.do">위시리스트 ></a>
    <h4>${wishlistName}</h4>
</div>

<!-- 위시리스트 곡 리스트 -->
<div align="center">
    <div id="js-load">
        <table class="table" style="margin-bottom: 50px;">
            <thead>
            <tr style="border-top: 1px solid white;">
                <th scope="col">TITLE</th>
                <th scope="col" style="padding-right: 30px;">ARTIST</th>
                <th scope="col"></th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${wishlistMusic}" var="wishlistMusic">
                <tr class="js-load">
                    <td><a href="streaming?id=${wishlistMusic.id}">${wishlistMusic.title}</a></td>
                    <td style="padding-right: 30px;">${wishlistMusic.artName}</td>
                    <td style="padding-right: 20px;"><i class="icon-remove"
                                                        id="${wishlistMusic.id}"
                                                        onclick="delMusicFnc(${wishlistMusic.id})"></i>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        <!-- 더보기 버튼 -->
        <div id="js-btn-wrap" class="tbutton small">
            <a href="javascript:;" class="button"><span>더보기</span></a>
        </div>
    </div>
</div>


<script>
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

    function delMusicFnc(musicId) {
        let query = window.location.search;
        let param = new URLSearchParams(query);
        let wishId = param.get('id');
        let name = param.get('name');

        $.ajax({
            type: "POST",
            url: "deleteWishlistMusic.do",
            data: {"wishId": wishId, "musicId": musicId, "name": name}

        })
        .done(() => {
            document.getElementById(musicId).parentNode.parentNode.remove();
        });
    }
</script>