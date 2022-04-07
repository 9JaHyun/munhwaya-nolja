<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
/* .filebox .upload-name {
	display: inline-block;
	height: 30px;
	vertical-align: middle;
	border: 1px solid #dddddd;
	color: #999999;
	border-radius: 5px;
}

.filebox label {
	display: inline-block;
	padding: 5px 15px;
	color: #fff;
	vertical-align: middle;
	background-color: #2d2d2d;
	cursor: pointer;
	margin-left: 10px;
	border-radius: 5px;
}

.filebox input[type="file"] {
	position: absolute;
	width: 0;
	height: 0;
	padding: 0;
	overflow: hidden;
	border: 0;
} */

#file {
    visibility: hidden;
}
</style>

<div align="right" style="margin-bottom: 30px;">
	<a href="memberChangeInfo.do">회원정보 변경 ></a>
	<h4>프로필 변경</h4>

<form method="post" id="frm" action="updateProfile.do?id=${member.id}" enctype="multipart/form-data">
	<div align="center" style="margin-top: 80px;">
		<!-- 변경할 프로필사진 썸네일 -->
		<c:choose>
			<c:when test="${member.sname eq null}">
				<img id="image_container" src="resources/music/1.jpg" alt="image"
					style="border-radius: 70%; overflow: hidden; height: 180px; width: 180px;"><br><br>	
			</c:when>
			<c:otherwise>
				<img id="image_container" src="api/picture/${member.sname}" alt="image"
					style="border-radius: 70%; overflow: hidden; height: 180px; width: 180px;"><br><br>		
			</c:otherwise>
		</c:choose>
		<!-- 변경할 프로필사진 선택 -->
		<div class="filebox">
			<input class="upload-name" id="image" name="image" style="text-align: center;">
			<label for="file">프로필사진 선택</label> 
			<input type="file" id="file" name="file" accept="image/*" onchange="setThumbnail(event);">
		</div>
	</div>
	<div align="center" style="margin: 20px 0px 100px 0px;">
		<input type="hidden" id="originalNick" name="originalNick" value="${member.nickname}">
		<a>닉네임 : </a><input type="text" id="nickname" name="nickname" value="${member.nickname}">
	</div>
	<div align="right">
		<button type="button" class="tbutton small" onclick="send();"><span>수정</span></button>
	</div>
</form>

</div>

<script>
	function setThumbnail(event) {
		var reader = new FileReader();
		reader.onload = function(event) {
			var img = document.getElementById('image_container');
			img.setAttribute("src", event.target.result);
		};
		reader.readAsDataURL(event.target.files[0]);
		
		
	}
	
	function send() {

		var nickname = $("#nickname").val();
		var originalNick = $('#originalNick').val();
		var regExp = /\s/g;
		if (nickname.length > 0 && !nickname.match(regExp)) {
			$.ajax({
				url : "nickChk",
				type : "POST",
				dataType : "JSON",
				data : {"nickname" : nickname},
				success : function(data) {
					if(nickname == originalNick ) {
						alert("수정 완료되었습니다.");
						frm.submit();
					} else if (data == 0) {
						alert("수정 완료되었습니다.");
						frm.submit();
					} else if (data == 1) {
						alert("중복된 닉네임입니다.");
					}
				}
			});
		} else {
			alert('적절하지 않은 닉네임 양식입니다.');
		}
	}
</script>
