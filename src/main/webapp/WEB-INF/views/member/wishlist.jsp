<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
.container1::-webkit-scrollbar {
	width: 10px;
}

.container1::-webkit-scrollbar-thumb {
	background-color: #686868;
	border-radius: 10px;
}

.container1::-webkit-scrollbar-track {
	background-color: white;
	border-radius: 10px;
}
</style>


<div align="right" style="margin-bottom: 50px;">
	<h4>위시리스트</h4>
</div>

<div style="overflow: auto; height: 450px; padding: 20px;" class="container1">
	<c:forEach items="${wishlists}" var="wishlist">
		<div class="mbf clearfix">
			<ul>
				<li>
					<div class="toggle-head" style="cursor: auto;">
						<!-- 위시리스트 삭제 버튼 -->
						<div align="right">
							<a><i onclick="delWishFnc(${wishlist.id})"
								class="icon-remove" id="${wishlist.id}"></i></a>
						</div>
						<div style="position: relative;">
							<!-- 위시리스트 이름 > 곡목록 -->
							<h5>
								<a data-wname="${wishlist.name}"
									href="wishlistMusic.do?id=${wishlist.id }&name=${wishlist.name}">${wishlist.name}</a>
							</h5>
							<div style="position: absolute; float: left; left: 480px; bottom: -5px;">
								<!-- 위시리스트 재생 버튼 (링크 넣어야함) -->
								<a href="#"><i class="icon-play-sign"
									style="font-size: 35px; float: right;"></i></a>
							</div>
						</div>
					</div>
				</li>
			</ul>
		</div>
	</c:forEach>
</div>
<script>

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
