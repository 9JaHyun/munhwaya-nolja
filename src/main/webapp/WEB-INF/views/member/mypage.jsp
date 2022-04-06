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
	<h4>새소식</h4>
</div>

<div style="overflow:auto; height:440px;" class="container1">
<div class="mbf clearfix" style="width: 98%;">
	<c:forEach items="${news1}" var="news">
		<c:choose>
			<c:when test="${news.code eq 'feed'}">
				<div class="notification-box notification-box-success">
					<p>
						<i class="icon-ok"></i>${news.artistName}님이
						<c:if test="${news.code eq 'feed'}">피드</c:if>를 등록하셨습니다.
					</p>
					<a href="#" class="notification-close notification-close-success"><i
						class="icon-remove" onclick="delNewsFnc(${news.id})"></i></a>
				</div>
			</c:when>
			<c:when test="${news.code eq 'album'}">
				<div class="notification-box notification-box-info">
					<p>
						<i class="icon-ok"></i>${news.artistName}님이
						<c:if test="${news.code eq 'album'}">앨범</c:if>을 등록하셨습니다.
					</p>
					<a href="#" class="notification-close notification-close-info"><i
						class="icon-remove" onclick="delNewsFnc(${news.id})"></i></a>
				</div>
			</c:when>
			<c:when test="${news.code eq 'performance'}">
				<div class="notification-box notification-box-error">
					<p>
						<i class="icon-ok"></i>${news.artistName}님이
						<c:if test="${news.code eq 'performance'}">공연</c:if>을 등록하셨습니다.
					</p>
					<a href="#" class="notification-close notification-close-error"><i
						class="icon-remove" onclick="delNewsFnc(${news.id})"></i></a>
				</div>
			</c:when>
			<c:otherwise>
				<div class="notification-box notification-box-warning">
					<p>
						<i class="icon-ok"></i>${news.artistName}님이
						<c:if test="${news.code eq 'post'}">게시글</c:if>을 등록하셨습니다.
					</p>
					<a href="#" class="notification-close notification-close-warning">
					<i class="icon-remove" onclick="delNewsFnc(${news.id})"></i></a>
				</div>
			</c:otherwise>
		</c:choose>
	</c:forEach>
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
</script>
