<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
.filebox .upload-name {
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
}
</style>

<div align="right" style="margin-bottom: 30px;">
	<a href="memberChangeInfo.do">회원정보 변경 ></a>
	<h4>프로필 변경</h4>

	<div align="center" style="margin-top: 80px;">
		<!-- 프로필사진 -->
		<img id="image_container" src="${member.image}" alt="album cover"
			style="border-radius: 70%; overflow: hidden; height: 180px; width: 180px;"><br>
		<!-- 프로필사진 선택 -->
		<div class="filebox">
			<input class="upload-name" value="첨부파일" style="text-align: center;">
			<label for="file">포르필사진 선택</label> <input type="file" id="file" accept="image/*" onchange="setThumbnail(event);">
		</div>
	</div>
	<div align="center" style="margin: 20px 0px 100px 0px;">
		<a>닉네임 : </a><input type="text"
			value="${member.nickname}">
	</div>
	<div align="right">
		<a href="#" class="tbutton small"><span>수정</span></a>
	</div>

<!-- 	<input type="file" id="image" accept="image/*"
		onchange="setThumbnail(event);" />
	<div id="image_container"></div>
 -->

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
</script>



