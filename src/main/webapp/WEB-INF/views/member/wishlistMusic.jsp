<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
	<a href="wishlist.do">위시리스트 ></a>
	<h4>${wishlistName}</h4>
</div>

<div style="overflow: auto; height: 450px;"
	class="container1">
<!-- 위시리스트 곡 리스트 -->
	<table class="table">
		<thead>
			<tr style="border-top: 1px solid white;">
				<th scope="col">TITLE</th>
				<th scope="col" style="padding-right: 30px;">ARTIST</th>
				<th scope="col"></th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${wishlistMusic}" var="wishlistMusic">
			<tr>
				<td>${wishlistMusic.title}</td>
				<td style="padding-right: 30px;">${wishlistMusic.artName}</td>
				<td style="padding-right: 20px;">
					<i class="icon-remove" id="${wishlistMusic.id}" onclick="delMusicFnc(${wishlistMusic.id})"></i>
				</td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
</div>

<script>

function delMusicFnc(musicId) {
	
	let query = window.location.search;
	let param = new URLSearchParams(query);
	let wishId = param.get('id');
	let name = param.get('name');

	$.ajax({
		type : "POST",
		url : "deleteWishlistMusic.do",
		data :{"wishId": wishId, "musicId": musicId, "name": name}
		
	})
	
	.done(() => {
		document.getElementById(musicId).parentNode.parentNode.remove();
	});

}

</script>