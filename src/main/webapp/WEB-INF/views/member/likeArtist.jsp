<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	<h4>좋아요 한 아티스트</h4>
</div>

<div style="overflow:auto; height:485px;" class="container1">
<div align="center">
	<table class="table">
		<tbody>
			<c:forEach items="${likeArtists}" var="likeArtist">
			<tr>
				<td style="padding-left: 30px;">
					<img src="resources/music/1.jpg" alt="album cover" 
					style="border-radius: 70%; overflow: hidden; height: 40px; width: 40px;">
				</td>
				<td style="text-align: center; padding: 22px 110px 0px 0px;"><a>${likeArtist.name}</a></td>
				<!-- 좋아요 한 아티스트 삭제 버튼 -->
				<td style="padding: 20px 15px 0px 0px;">
					<a><i class="icon-remove" id="${likeArtist.id}"
					onclick="delArtistFn(${likeArtist.id})"></i></a>
				</td>
			</tr>
			</c:forEach>

		</tbody>
	</table>
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
</script>
