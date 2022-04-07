<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
						<td style="padding-left: 30px;"><img
							src="resources/music/1.jpg" alt="album cover"
							style="border-radius: 70%; overflow: hidden; height: 40px; width: 40px;">
						</td>
						<td style="text-align: center; padding: 22px 110px 0px 0px;"><a>${likeArtist.name}</a></td>
						<!-- 좋아요 한 아티스트 삭제 버튼 -->
						<td style="padding: 20px 15px 0px 0px;"><a><i
								class="icon-remove" id="${likeArtist.id}"
								onclick="delArtistFn(${likeArtist.id})"></i></a></td>
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

	$.ajax({
		url : "deleteLikeArtist.do",
		data : JSON.stringify({artistId: id}),
		type : "POST",
		contentType : "application/json"
	})
	
	.done(() => {
		document.getElementById(id).parentNode.parentNode.parentNode.remove();
	})
	;
	
}


$(window).on('load', function () {
	// 기본 갯수
    load('#js-load', '6');
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
