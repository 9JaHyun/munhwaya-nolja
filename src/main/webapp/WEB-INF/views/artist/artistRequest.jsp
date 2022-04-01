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
<div style="padding-top:5%;">
	<div style="margin: 100px 0px 10px 0px; border: none;"><br> <!-- class="grid_12 tt삭제 -->
		<form name="info" method="post">
			<label id="request-label"><div class="sort">작업물 설명란</div><textarea id="artwork" name="artwork" placeholder="내용을 입력해 주세요."></textarea></label><br>
			<label><div class="sort">작업물 인증</div><input type="file" id="file" name="file" accept="image/png, image/jpeg"></label><br>
			<label><div class="sort">본인인증</div></label><br>
		</form>
	</div>
</div>
<br>
<div align="center" style="margin-bottom: 10px">
	<a href="mypage.do" onclick="return chk_request()" class="tbutton small"><span>신청</span></a>&emsp;
	<a href="javascript:window.history.back();" class="tbutton small"><span>취소</span></a> <!-- 클릭시 뒤로가기-->
</div>
<script>
function chk_request(){
	if(!document.info.artwork.value){
		alert("작업물 설명란에 내용을 입력하세요.");
		return false;
	}
	if(!document.info.file.value){
		alert("작업물 인증란에 파일을 첨부하세요.");
		return false;
	}
	if(!document.info.identify.value){
		alert("본인인증을 진행해주세요.");
		return false;
	}	
		
}
</script>