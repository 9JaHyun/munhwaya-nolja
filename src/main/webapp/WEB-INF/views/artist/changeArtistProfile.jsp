<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<div align="right" style="margin-bottom: 30px;">
	<a href="changeArtistProfileForm">아티스트 정보 변경 ></a>
	<h4>프로필 변경</h4>

	<!-- action에 form이름지정?id="$로그인 된 아이디 값" -->
	<form method="post" id="frm" action="changeArtistProfile"
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
			<input type="file" id="image" name="image" accept="image/*"
				onchange="setThumbnail(event);">
		</div>
		<div align="center" style="margin: 20px 0px 100px 0px;">
			<input type="hidden" id="originalName" name="originalName"
				value="${artist.name}"> <label>
				<div class="sort" style="font-size: 14px; color: white; padding: 0.5em; margin-top:3em;">활동명&emsp;</div>
				<input type="text" id="name" name="name" placeholder=" 활동명을 입력하세요."
				value="${artist.name}">
				</label>
			<ul>
				<!-- 아티스트 상세에 한번에 두개의 내용이 들어가므로 목록 묶음 처리 -->
				<label style="font-size: 15px; color: white; padding: 0.5em; margin-top:2.5em;">< 활동정보 선택 ></label>

				<label style="font-size: 14px; color: white; padding: 0.5em;">성별<br> <select id="gender" name="gender"></label>
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
					<option value="S01">남자</option>
					<option value="S02">여자</option>
					<option value="S03" selected>혼성</option>
				</c:if>
				</select>
				<br>

				<label style="font-size: 14px; color: white; padding: 0.5em;">활동유형<br> <select id="type" name="type"></label>
				<br>
				<c:if test="${artist.type == 'T01'}">
					<option value="T01" selected>솔로</option>
					<option value="T02">그룹</option>
				</c:if>
				<c:if test="${artist.type == 'T02' }">
					<option value="T01">솔로</option>
					<option value="T02" selected>그룹</option>
				</c:if>
				</select>
			</ul>
			<br> <label style="font-size: 14px; color: white; padding: 0.5em;">주요활동 장르<br> <select id="genre"
				name="genre"></label>
			<c:if test="${artist.genre == 'G01'}">
				<option>선택</option>
				<option value="G01" selected>발라드</option>
				<option value="G02">댄스</option>
				<option value="G03">랩/힙합</option>
				<option value="G04">R&B/Soul</option>
			</c:if>
			<c:if test="${artist.genre == 'G02'}">
				<option>선택</option>
				<option value="G01">발라드</option>
				<option value="G02" selected>댄스</option>
				<option value="G03">랩/힙합</option>
				<option value="G04">R&B/Soul</option>
			</c:if>
			<c:if test="${artist.genre == 'G03'}">
				<option>선택</option>
				<option value="G01">발라드</option>
				<option value="G02">댄스</option>
				<option value="G03" selected>랩/힙합</option>
				<option value="G04">R&B/Soul</option>
			</c:if>
			<c:if test="${artist.genre == 'G04'}">
				<option value="G01">발라드</option>
				<option value="G02">댄스</option>
				<option value="G03">랩/힙합</option>
				<option value="G04" selected>R&B/Soul</option>
			</c:if>
			</select><br> <br> <label style="font-size: 14px; color: white; padding: 0.7em;">소개글<br> <textarea
					id="content" name="content" placeholder="내용을 입력해 주세요.">${artist.content }</textarea>
			</label>
		</div>

		<div align="right" style="margin-top:-5em;">
			<input type="button" style="padding: 0.3em 1em 0.3em 1em; margin: 1em 0.3em 0em 0.3em;" class="tbutton small" value="수정"
				onclick="send()">
			<button
				style="padding: 0.3em 1em 0.3em 1em; margin: 1em 0.3em 0em 0.3em;"
				onclick="location.href='home.do'" class="tbutton small">취소</button>
			<!--  onclick="send();" -->

			<!-- 		<button type="button" class="tbutton small" onclick="send(); "> -->
			<!-- 			<span>수정</span> -->
			<!-- 		</button> -->
		</div>
	</form>

	<script type="text/javascript">
	<!-- 유효성 검사-->
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

			var regExp = /\s/g; // 문자열 내의 모든 공백 
			var name = frm.name.value;
			var fileName = frm.image.value;
			var form = $('#frm')[0];
			var data = new FormData(form)
			if (name.length > 0 && !name.match(regExp)) { // match()함수는 인자에 포함된 문자를 찾으면 이를 반환함 / 활동명(길이) > 0~공백이들어있는 활동명의 조건이 만족되지 않는 경우
				if ('${artist.name}' === name &&  (fileName == null || fileName == '')
						&& '${artist.gender}' === frm.gender.value
						&& '${artist.type}' === frm.type.value
						&& '${artist.genre}' === frm.genre.value
						&& ('${artist.content}' === frm.content.value || frm.content.value == '')) {
					alert("수정사항이 없습니다.");

					return;

				} else {
					alert("수정 완료 되었습니다.");
					$.ajax({
						url : "changeArtistProfile",
						type : "POST",
						data : data,
						contentType : false,
						processData : false,
						success : function(data){
							console.log('redirect to ' + data);
							window.location.href = data;
						}
					});

				}
			} else {
				alert('적절하지 않은 활동명입니다.');
				return;
			}
		}
	</script>