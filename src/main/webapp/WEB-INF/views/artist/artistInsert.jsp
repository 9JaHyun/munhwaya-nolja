<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<style>
	textarea {
	padding-left:1em;
    width: 70%;
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


<div align="right" style="margin-bottom: 50px;">
	<h4>아티스트 정보 등록</h4>
		<div class="grid_12 tt" style="margin-top: 70px;">
			<ul class="forum-items" style="text-align: left;">
				<li><i class="icon-comment-alt"></i> <a href="changePassword.do">정보입력</a>
					<div class="topic-time">아티스트 정보를 입력해주세요.</div></li>
			</ul>
		</div>
</div>
<div style="padding-top:5%;">
	<div style="margin: 100px 0px 10px 0px; border: none;"><br> 
		<form action="artistInsert" id="frm" name="frm" method="post">
			<label><div class="sort">활동명&emsp;</div><input type="text" id="name" name="name" value="" placeholder=" 활동명을 입력하세요."></label><br>
			<label><div class="sort">활동사진&emsp;</div><input type="file" id="image" name="image" accept="image/png, image/jpeg"></label><br>
			<ul>
				<label>활동정보 선택</label><!-- 아티스트 상세에 한번에 두개의 내용이 들어가므로 목록 묶음 처리 -->
					<label>성별<br><select id="gender" name="gender" ></label> <!-- select box 수직 정렬 -->
											<option>선택</option>
											<option value="S01">남자</option>
											<option value="S02">여자</option>
											<option value="S03">혼성</option>
									  </select><br>	
					<label>활동유형<br><select id="type" name="type"></label><br>
											<option>선택</option>
											<option value="T01">솔로</option>
											<option value="T02">그룹</option>
								      </select>
			</ul><br>						
	
				<label>주요활동 장르<br><select id="genre" name="genre"></label>
											<option>선택</option>
											<option value="G01">발라드</option>
											<option value="G02">댄스</option>
											<option value="G03">랩/힙합</option>
											<option value="G04">R&B/Soul</option>
									   </select><br><br>
				<label>소개글<br><textarea id="content" name="content" placeholder="내용을 입력해 주세요."></textarea></label>
		</form>
	</div>
</div>
<br>
<div align="left">
		<input type="submit" style="padding: 0.3em  1em 0.3em 1em; margin: 1em 0.3em 0em 0.3em;" value="등록" class="tbutton small" onclick="document.getElementById('frm').submit();"/>
		<button style="padding: 0.3em  1em 0.3em 1em; margin: 1em 0.3em 0em 0.3em;" onclick="location.href='home.do'" class="tbutton small" >취소</button>
	
		
</div>
<script>
function chk_insert(){

	if(!document.info.name.value){
		alert("활동할 아티스트명을 입력하세요.");
		return false;
	}	
	if(!document.info.gender.value){
		alert("아티스트의 성별을 선택하세요.");
		return false;
	}
	if(!documet.info.type.value){
		alert("활동유형을 선택하세요.");
		return false;
	}
	if(!documnet.info.genre.vlaue"){
		alert("주요활동 장르를 선택하세요.");
		return false;
	}
}



</script>
