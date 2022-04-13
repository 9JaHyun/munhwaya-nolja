<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div align="right" style="margin-bottom: 50px;">
	<a href="memberChangeInfo.do">회원정보 변경 >&nbsp;</a><a href="changeInfo.do">개인정보 변경 ></a>
	<h4>비밀번호 변경</h4>
	<div class="grid_12 tt" style="margin-top: 70px;">
		<ul class="forum-items" style="text-align: left;">
			<li><i class="icon-ok"></i><a>새로운 비밀번호를 입력해주세요.</a></li>
		</ul>
	</div>
</div>

<!-- 수정폼 -->
<form method="post" id="frm" action="updatePassword.do?id=${member.id}" onsubmit="return send()">
	<div class="grid_12 tt"
		style="margin: 100px 0px 100px 0px; border: none;">
		<a>변경할 비밀번호 : </a> <input type="password" id="password1" name="password1"><br> 
		<a>변경할 비밀번호 확인 : </a> <input type="password" id="password2" name="password2">
	</div>
	<div align="right" style="margin-bottom: 10px">
		<button type="submit" class="tbutton small"><span>수정</span></button>
	</div>
</form>


<script>

function send() {
	var pw = $("#password1").val();
	var pw2 = $("#password2").val();
	var num = pw.search(/[0-9]/g);
	var eng = pw.search(/[a-z]/ig);
	var spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
	
	if(pw.length < 8 || pw.length > 20){
		 alert("비밀번호를 8자리 ~ 20자리 이내로 입력해주세요.");
		 return false;
		}else if(pw.search(/\s/) != -1){
		 alert("비밀번호를 공백 없이 입력해주세요.");
		 return false;
		}else if(num < 0 || eng < 0 || spe < 0 ){
		 alert("비밀번호를 영문, 숫자, 특수문자를 포함하여 입력해주세요.");
		 return false;
		}else if(pw != pw2) {
		 alert("비밀번호가 서로 일치하지 않습니다.");
		 return false;
		}else {
		 alert("수정 완료되었습니다.");
		 return true;	
		}
	}

</script>