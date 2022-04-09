<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div align="right" style="margin-bottom: 50px;">
	<a href="memberChangeInfo.do">회원정보 변경 ></a>
	<h4>회원탈퇴</h4>
	<div class="grid_12 tt" style="margin-top: 70px;">
		<ul class="forum-items" style="text-align: left;">
			<li><i class="icon-ok"></i><a>회원 탈퇴를 위해 정보를 입력해주세요.</a></li>
		</ul>
	</div>
</div>
<!-- 탈퇴폼 -->
<form id="frm" method="post" action="deleteMember.do" onsubmit="return delMemFn()">
<input type="hidden" value="${sessionScope.member.id}" id="idChk" name="idChk">
<input type="hidden" value="${sessionScope.member.password}" id="pwChk" name="pwChk">
<div class="grid_12 tt"
	style="margin: 100px 0px 100px 0px; border: none;">
	<a>아이디 : </a> <input type="text" id="id" name="id"><br> 
	<a>비밀번호 : </a> <input type="password" id="password" name="password">
</div>
<div align="right" style="margin-bottom: 10px">
	<button type="submit" class="tbutton small"><span>탈퇴</span></button>
</div>
</form>

<script>
function delMemFn() {
	var id = $("#id").val();
	var pw = $("#password").val();
	var idChk = $("#idChk").val();
	var pwChk = $("#pwChk").val();
	
	
	if (id == idChk && pw == pwChk) {
		if (!confirm('정말 탈퇴하시겠습니까?')) {
			return false;
		} else {
			return true;
		}
	} else {
		alert('아이디 또는 비밀번호가 일치하지 않습니다.');
		return false;
	}
}
</script>
