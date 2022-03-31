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
/* select, input[type="file"]{ */
/* 	margin-left: 2em; */
/* 	} */
/* input[type="text"]{ */
/* 	margin-left: 3.3em; */
/* } */
/* .selectbox{ */
/* 	margin-left: 1.6em; */
/* 	} */
/*  .laber.textarea{ */
 	
/*  } */
</style>


<div align="right" style="margin-bottom: 50px;">
	<h4>아티스트 신청</h4>
		<div class="grid_12 tt" style="margin-top: 70px;">
			<ul class="forum-items" style="text-align: left;">
				<li><i class="icon-comment-alt"></i> <a href="changePassword.do">정보입력</a>
					<div class="topic-time">아티스트 정보를 입력해주세요.</div></li>
			</ul>
		</div>
</div>
<div style="padding-top:5%;">
	<div style="margin: 100px 0px 10px 0px; border: none;"><br> <!-- class="grid_12 tt삭제 -->
		<form id="info" method="post">
			<label id="request-label"><div class="sort">작업물 설명란</div><textarea id="content" name="content" placeholder="내용을 입력해 주세요."></textarea></label><br><br>
			<label><div class="sort">작업물 인증&emsp;</div><input type="file" id="image" name="image" accept="image/png, image/jpeg"></label></div><br>
			<label><div class="sort">본인인증&emsp;</div></label><br>
			<label><div class="sort">활동명&emsp;</div><input type="text" id="name" name="name" placeholder="활동명을 기입하세요."></label><br><br>
	
			<ul>
				<label>활동정보 선택</label><!-- 아티스트 상세에 한번에 두개의 내용이 들어가므로 목록 묶음 처리 -->
					<label>성별<br><select id="gender" name="gender"></label> <!-- select box 수직 정렬 -->
											<option>선택</option>
											<option>남자</option>
											<option>여자</option>
											<option>혼성</option>
									  </select><br>	
					<label>활동유형<br><select id="type" name="type"></label><br>
											<option>선택</option>
											<option>솔로</option>
											<option>그룹</option>
								      </select>
			</ul><br>						
	
				<label>주요활동 장르<br><select id="genre" name="genre"></label>
											<option>선택</option>
											<option>발라드</option>
											<option>댄스</option>
											<option>랩/힙합</option>
											<option>R&B/Soul</option>
									   </select><br><br>
				<label>소개글<br><textarea id="content" name="content" placeholder="내용을 입력해 주세요."></textarea></label>
		</form>
	</div>
</div><br>
<div align="center" style="margin-bottom: 10px">
	<a onclick="return chk_request()" class="tbutton small"><span>신청</span></a>&emsp;
	<a href="#" class="tbutton small"><span>취소</span></a> <!-- 뒤로가기 만들기 -->
</div>
<script>
function chk_request(){
	if(document.get)
	
}
</script>
