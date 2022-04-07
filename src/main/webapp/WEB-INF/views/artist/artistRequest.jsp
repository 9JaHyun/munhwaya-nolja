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
	<h4>아티스트 승급신청</h4>
		<div class="grid_12 tt" style="margin-top: 70px;">
			<ul class="forum-items" style="text-align: left;">
				<li><i class="icon-comment-alt"></i> <a href="changePassword.do">승급 신청</a>
					<div class="topic-time">아티스트 승급에 필요한 인증사항을 입력해주세요.</div></li>
			</ul>
		</div>
</div>
<!-- 아티스트 승급 신청에 필요한 인증 -->
<div style="padding-top:5%;">
	<div style="margin: 100px 0px 10px 0px; border: none;"><br> 
		<form method="post" action="artistRequest" enctype="multipart/form-data" onsubmit="return chk_request()">
			<label id="request-label"><div class="sort">작업물 설명란</div>
				<textarea id="artwork" name="artwork" placeholder="내용을 입력해 주세요."></textarea>
			</label><br>
			<label><div class="sort">작업물 인증</div><input type="file" id="file" name="file" accept="image/png, image/jpeg"></label><br>
			<label><div class="sort">본인인증</div><button onclick='location.href=/user/sms'>휴대폰 인증</button></label><br>
	
	<!-- 신청, 취소 버튼 -->
	<div align="center" style="margin-bottom: 10px">
			<input type="submit" style="padding: 0.2em 1.1em 0.08em 1em; position: relative; bottom: 8px; margin: 1em 1em 1.1em 0em;" value="신청" class="tbutton small">
	<!-- <a href="mypage.do" onsubmit="return chk_request()" class="tbutton small"><span>신청</span></a>&emsp; -->
	<a href="javascript:window.history.back();" class="tbutton small"><span>취소</span></a> <!-- 클릭시 뒤로가기-->
	</div>
		</form>
	</div>
</div>
<br>


<script>
	<!-- 유효성 검사-->
		function chk_request(){
			if(!document.info.artwork.value){
				alert("작업물 내용을 입력하세요.");
			return false;
			}
			if(!document.info.file.value){
				alert("작업물 인증 파일을 첨부하세요.");
			return false;
			}
// 			if(!document.info.identify.value){
// 				alert("본인인증을 진행해주세요.");
// 				return false;
// 			}
			/* if(document.info.file.value){
				alert("아티스트 승급 신청을 요청했습니다.");
			return true;
			}	 */
// 				return true;
		}
	
</script>