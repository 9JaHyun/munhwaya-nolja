<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>

<div align="right" style="margin-bottom: 90px;">
	<h4>공연 내용 수정</h4>
</div>

<!-- 수정폼 -->
<div class="grid_12 tt"
	style="margin: 100px 0px 150px 0px; border: none;">
	<div><a>공연 제목 : </a> <input id="name" value="${performance.name}" readonly="readonly"></div><br>
	<div style="margin-top:10px; margin-left:10px;"><a>공연 내용 : </a> <textarea id="content" name="content" rows="4" cols="50"></textarea></div>
	<input id="id" value="${performance.id}" type="hidden">
</div>
<div align="right" style="margin-bottom: 10px">
	<button type="button" class="tbutton small" style="margin-right: 2px;"
		onclick="location.href='performanceByArtistId'">
		<span>뒤로가기</span>
	</button>
	<button class="tbutton small success">
		<span>수정</span>
	</button>
</div>
<script>
$(".success").on("click", function(e) {
	var id = $('#id').val();
	var content = $('#content').val();
	console.log(id);
	console.log(content);
	$.ajax({
	    type: "POST",
	    url: "updatePerformance",
	    data: {"content" : content, "id" : id},
	    dataType:"text",
	    success: function(res){
			alert("공연이 수정되었습니다.");
			location.href="performanceByArtistId";
	    },
	    error: function(error){
	    	alert("공연 수정이 실패하였습니다.");
	    },
	});
});
</script>