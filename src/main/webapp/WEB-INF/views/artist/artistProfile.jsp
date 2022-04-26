<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<style>
	textarea {
	padding-left:1em;
    width: 55%;
    height: 7em;
    border: none;
    resize: none;
    }
    request-label{
    float: left;
    font-size:0.5em;
    width:70%;
    
    }
    .sort {
    width: 100px;
    margin: 0px;
    }
 
 label{
 	display: block;
	 }

</style>

<!-- 이미지 주석 -->
  <!-- <img src="resources/images/artistFile/click.png" alt="image"
                             style="border-radius: 70%; overflow: hidden; height: 150px; width: 150px;"> -->
                             
<div align="right" style="margin-bottom: 50px;">
	<h4>아티스트 정보 입력</h4>
		<div class="grid_12 tt" style="margin-top: 70px;">
			<ul class="forum-items" style="text-align: left;">
				<li><i class="icon-comment-alt"><a>  정보 등록</a></i>
					<div class="topic-time" style="margin:5px">아티스트 정보를 입력해주세요.</div>
			</ul>
		</div>
</div>
<div style="padding-top:5%;">
	<div style="margin: 100px 0px 10px 0px; border: none;"><br> 
		<form action="artistProfile" id="frm" name="frm" onsubmit="return chk_profile()"> <!--  method="post" -->
			<div align="center" style="margin: 20px 0px 100px 0px;">
				<label><div class="sort" style="font-size: 14px; color: white; padding: 0.5em; margin-top:1em;">활동명&emsp;</div><input type="text" id="name" name="name" placeholder=" 활동명을 입력하세요."></label><br>
				<label><div class="sort" style="font-size: 14px; color: white; padding: 0.5em; margin-top:1em;">활동사진&emsp;</div><input type="file" id="image" name="image" accept="image/png, image/jpeg"></label><br>
			
			
			<ul>
				<label style="font-size: 15px; color: white; padding: 0.5em; margin-top:2em;">활동정보 선택</label><!-- 아티스트 상세에 한번에 두개의 내용이 들어가므로 목록 묶음 처리 -->
					<label style="font-size: 14px; color: white; padding: 0.5em; margin-top:2em;">성별<br><select id="gender" name="gender" ></label> <!-- select box 수직 정렬 -->
											<option>선택</option>
											<option value="S01">남자</option>
											<option value="S02">여자</option>
											<option value="S03">혼성</option>
								  </select><br>	
					<label style="font-size: 14px; color: white; padding: 0.5em; margin-top:1em;">활동유형<br><select id="type" name="type"></label><br>
											<option>선택</option>
											<option value="T01">솔로</option>
											<option value="T02">그룹</option>
								      </select>
			</ul><br>						
	
				<label style="font-size: 14px; color: white; padding: 0.5em; margin-top:1em;">주요활동 장르<br><select id="genre" name="genre"></label>
											<option>선택</option>
											<option value="G01">발라드</option>
											<option value="G02">댄스</option>
											<option value="G03">랩/힙합</option>
											<option value="G04">R&B/Soul</option>
									   </select><br><br>
				<label style="font-size: 14px; color: white; padding: 0.5em; margin-top:1em;">소개글<br><textarea id="content" name="content" placeholder="내용을 입력해 주세요."></textarea></label>
		</div>
	</div>
</div>
<br>
		<div align="right" style="margin-top:-6em">
			<input type="submit" style="padding: 0.3em  1em 0.3em 1em; margin: 1em 0.3em 0em 0.3em;" value="등록" class="tbutton small" onclick=""/>
			<button style="padding: 0.3em  1em 0.3em 1em; margin: 1em 0.3em 0em 0.3em;" onclick="location.href='mypage.do'" class="tbutton small" >취소</button>
		</div>
	</form>
<script>
<!-- 유효성 검사-->
function chk_profile(){

	if(document.frm.name.value == ''){
		alert("활동할 아티스트명을 입력하세요.");
		return false;
	}	
	if(document.frm.gender.value == '선택'){
		alert("아티스트의 성별을 선택하세요.");
		return false;
	}
	if(document.frm.type.value == '선택'){
		alert("활동유형을 선택하세요.");
		return false;
	}
	if(document.frm.genre.value == '선택'){
		alert("주요활동 장르를 선택하세요.");
		return false;
	
	}
}


</script>
