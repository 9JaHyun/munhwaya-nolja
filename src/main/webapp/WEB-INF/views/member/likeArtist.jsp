<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.css" integrity="sha512-3pIirOrwegjM6erE5gPSwkUzO+3cTjpnV9lexlNZqvupR64iZBnOOTiiLPb9M36zpMScbmUNIcHUqKD47M719g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js" integrity="sha512-VEd+nq25CkR676O+pLBnDW09R7VQX9Mdiij052gVCp5yVH3jGtH70Ho/UUv4mJDsEdTvqRCFZg0NKGiojGnUCw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<style>
    .js-load {
        display: none;
    }

    .js-load.active {
        display: revert;
    }
    
	.toast-success {
	  background-color: #D42C7A;
	}    
</style>

<div align="right" style="margin-bottom: 50px;">
    <h4>좋아요 한 아티스트</h4>
</div>

<div align="center">
    <div id="js-load">
        <table class="table" style="margin-bottom: 50px;">
            <tbody>
            <c:if test="${empty likeArtists}">
                <div style="margin: 250px 0px 200px 0px;">
                    <h5>좋아요 한 아티스트가 존재하지 않습니다.</h5>
                </div>
            </c:if>
            <c:forEach items="${likeArtists}" var="likeArtist">
                <tr class="js-load">
                    <td style="padding-left: 30px;">
                        <c:choose>
                            <c:when test="${likeArtist.image eq null}">
                                <img src="resources/images/basic_profile.png" alt="image"
                                     style="border-radius: 70%; overflow: hidden; height: 40px; width: 40px;">
                            </c:when>
                            <c:otherwise>
                                <img src="api/file/${likeArtist.image}" alt="image"
                                     style="border-radius: 70%; overflow: hidden; height: 40px; width: 40px;">
                            </c:otherwise>
                        </c:choose>
                    </td>
                    <td style="text-align: center; padding: 22px 110px 0px 0px;" id="artistName">
                    	<a href="artistDetail?artId=${likeArtist.artistId}">${likeArtist.name}</a>
                    </td>
                    <!-- 좋아요 한 아티스트 삭제 버튼 -->
                    <td style="padding: 20px 15px 0px 0px;"><a><i
                            class="icon-remove" id="${likeArtist.artistId}"
                            onclick="delArtistFn(${likeArtist.artistId})"></i></a></td>
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
    function delArtistFn(id) {

    	var td = $("#" + id).parent().parent().parent().children();
		var name = td.eq(1).text();
    	
         $.ajax({
            url: "deleteLikeArtist.do",
            data: JSON.stringify({artistId: id}),
            type: "POST",
            contentType: "application/json"
        })

        .done(() => {
            document.getElementById(id).parentNode.parentNode.parentNode.remove();
            load('#js-load', '1');
        	
            Command: toastr["success"]("[" + name + "] 좋아요가 해제되었습니다.")
            toastr.options = {
              "closeButton": false,
              "debug": false,
              "newestOnTop": false,
              "progressBar": false,
              "positionClass": "toast-bottom-right",
              "preventDuplicates": false,
              "onclick": null,
              "showDuration": "30000",
              "hideDuration": "1000",
              "timeOut": "5000",
              "extendedTimeOut": "5000",
              "showEasing": "swing",
              "hideEasing": "linear",
              "showMethod": "fadeIn",
              "hideMethod": "fadeOut"
            }
        })
        ;
    }

    $(window).on('load', function () {
        // 기본 갯수
        load('#js-load', '8');
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