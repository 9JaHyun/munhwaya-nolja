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
	<h4>위시리스트</h4>
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
				<div class="toggle-head" style="cursor: auto; border-bottom: 1px solid #CCC;">
					<!-- 위시리스트 삭제 버튼 -->
					<div align="right">
						<a><i onclick="delWishFnc(${wishlist.id})" class="icon-remove"
							id="${wishlist.id}"></i></a>
					</div>
					<div style="position: relative;" align="left">
						<!-- 위시리스트 이름 > 곡목록 -->
						<h5>
							<a data-wname="${wishlist.name}"
								href="wishlistMusic.do?id=${wishlist.id }&name=${wishlist.name}">${wishlist.name}</a>
						</h5>
						<div
							style="position: absolute; float: left; left: 520px; bottom: -5px;">
							<!-- 위시리스트 재생 버튼 (링크 넣어야함) -->
							<a href="#"><i class="icon-play-sign"
								style="font-size: 35px; float: right;"></i></a>
						</div>
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
 
	function delWishFnc(id) {
		
		var wname = $(event.target).parent().parent().next().children().children().data("wname");

		if (!confirm("[" + wname + '] 삭제하시겠습니까?')) {

		} else {
			$.ajax({
				type : "POST",
				url : "deleteWishlist.do",
				data : JSON.stringify({"id": id}),
				contentType : "application/json"
			})
			
			.done(() => {
				document.getElementById(id).parentNode.parentNode.parentNode.remove();
			});
		}
	}
	
</script>