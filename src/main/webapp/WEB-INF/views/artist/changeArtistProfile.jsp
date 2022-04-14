<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

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
	<a href="ChangeArtistProfileForm">아티스트 정보 변경 ></a>
	<h4>프로필 변경</h4>

	<!-- action에 form이름지정?id="$로그인 된 아이디 값" -->
	<form method="post" id="frm"
		action="changeArtistProfile?id=${artist.memberId}"
		enctype="multipart/form-data">
		<div align="center" style="margin-top: 80px;">
			<!-- 변경할 프로필사진 썸네일 -->
			<!-- 차례대로 기본이미지, 구글 계정 이미지, 계정에 있는 이미지 -->
			<c:choose>
				<c:when test="${artist.image eq null}">
					<img id="image_container" src="resources/images/basic_profile.png"
						alt="image"
						style="border-radius: 70%; overflow: hidden; height: 180px; width: 180px;">
					<br>
					<br>
				</c:when>
				<c:otherwise>
					<c:choose>
						<c:when test="${fn:indexOf(artist.image, 'https://') != -1}">
							<img id="image_container" src="${artist.image}" alt="image"
								style="border-radius: 70%; overflow: hidden; height: 180px; width: 180px;">
							<br>
							<br>
						</c:when>
						<c:otherwise>
							<img id="image_container" src="api/picture/${artist.image}"
								alt="image"
								style="border-radius: 70%; overflow: hidden; height: 180px; width: 180px;">
							<br>
							<br>
						</c:otherwise>
					</c:choose>
				</c:otherwise>
			</c:choose>
			<!-- 변경할 프로필사진 선택 -->
			<div class="filebox">
				<input class="upload-name" id="imageName" name="imageName"
					value="${artist.image}" readonly="readonly"
					style="text-align: center; cursor: default;"> <label
					for="file"> 프로필사진 선택 </label> <input type="file" id="file"
					name="file" accept="image/*" onchange="setThumbnail(event);">
			</div>
		</div>
		<div align="center" style="margin: 20px 0px 100px 0px;">
			<input type="hidden" id="orig0inalNick" name="originalNick"
				value="${artist.name}"> <label><div class="sort">활동명&emsp;</div>
				<input type="text" id="name" name="name" placeholder=" 활동명을 입력하세요."
				value="${artist.name}"></label><br>

			<ul>
				<!-- 아티스트 상세에 한번에 두개의 내용이 들어가므로 목록 묶음 처리 -->
				<label>활동정보 선택</label>

				<label>성별<br> <select id="gender" name="gender"></label>
				<!-- select box 수직 정렬 -->
				<option>선택</option>
				<c:if test="${artist.gender == 'S01'}">
					<option value="S01" selected>남자</option>
					<option value="S02">여자</option>
					<option value="S03">혼성</option>
				</c:if>
				<c:if test="${artist.gender == 'S02'}">
					<option value="S01">남자</option>
					<option value="S02" selected>여자</option>
					<option value="S03">혼성</option>
				</c:if>
				<c:if test="${artist.gender == 'S03'}">
					<option value="S01" >남자</option>
					<option value="S02">여자</option>
					<option value="S03" selected>혼성</option>
				</c:if>
				</select>
				<br>

				<label>활동유형<br> <select id="type" name="type"></label>
				<br>
				<option>선택</option>
				<option value="T01">솔로</option>
				<option value="T02">그룹</option>
				</select>
			</ul>
			<br> <label>주요활동 장르<br> <select id="genre"
				name="genre"></label>
			<option>선택</option>
			<option value="G01">발라드</option>
			<option value="G02">댄스</option>
			<option value="G03">랩/힙합</option>
			<option value="G04">R&B/Soul</option>
			</select><br>
			<br> <label>소개글<br> <textarea id="content"
					name="content" placeholder="내용을 입력해 주세요."></textarea>
			</label>
		</div>
</div>

<div align="right">
	<button type="button" class="tbutton small"
		onclick="chk_profile(); send();">
		<span>수정</span>
	</button>
</div>
</form>

<script>
<!-- 유효성 검사-->
	function chk_profile() {

		if (document.frm.name.value == '') {
			alert("활동할 아티스트명을 입력하세요.");
			return false;
		}
		if (document.frm.gender.value == '선택') {
			alert("아티스트의 성별을 선택하세요.");
			return false;
		}
		if (document.frm.type.value == '선택') {
			alert("활동유형을 선택하세요.");
			return false;
		}
		if (document.frm.genre.value == '선택') {
			alert("주요활동 장르를 선택하세요.");
			return false;
		} else {
			alert("아티스트 정보 변경이 완료되었습니다.");
		}
	}

	function setThumbnail(event) {

		// 썸네일 표시
		var reader = new FileReader();
		reader.onload = function(event) {
			var img = document.getElementById('image_container');
			img.setAttribute("src", event.target.result);
		};
		reader.readAsDataURL(event.target.files[0]);

		// 현재 파일명 -> 변경할 파일명
		var afterName = event.target.files[0].name;
		var beforeName = $("#imageName");
		beforeName.val(afterName);

	}

	function send() {

		var name = $("name").val();
		var originalNick = $('#originalNick').val();
		var regExp = /\s/g;
		if (nickname.length > 0 && !nickname.match(regExp)) {
			$.ajax({
				url : "nickChk",
				type : "POST",
				dataType : "JSON",
				data : {
					"nickname" : nickname
				},
				success : function(data) {
					if (nickname == originalNick) {
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