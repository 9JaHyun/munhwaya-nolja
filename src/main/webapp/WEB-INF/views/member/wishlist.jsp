<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

<div style="overflow: auto; height: 450px; padding: 20px;"
	class="container1">

	<c:forEach items="${wishlists}" var="wishlist">
		<div class="mbf clearfix">
			<ul>
				<li>
					<!-- 위시리스트 이름 -->
					<div class="toggle-head">
						<div align="right">
							<i onclick="delWishFnc()" class="icon-remove"></i>
						</div>
						<h5><a href="wishlistMusic.do?id=${wishlist.id }">${wishlist.name}</a></h5>
					</div>
				</li>
			</ul>
		</div>
	</c:forEach>
</div>

<script>
	function delWishFnc() {
		if (!confirm('(위시리스트이름) 삭제하시겠습니까?')) {
			window.event.stopPropagation();
		}
	}
</script>