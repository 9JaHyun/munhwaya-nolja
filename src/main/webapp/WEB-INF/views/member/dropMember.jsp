<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<<<<<<< HEAD
=======
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
>>>>>>> 2935405 (2022/04/07 회원테이블 수정)
<div align="right" style="margin-bottom: 50px;">
	<a href="memberChangeInfo.do">회원정보 변경 ></a>
	<h4>회원탈퇴</h4>
	<div class="grid_12 tt" style="margin-top: 70px;">
		<ul class="forum-items" style="text-align: left;">
			<li><i class="icon-ok"></i><a>회원 탈퇴를 위해 정보를 입력해주세요.</a></li>
		</ul>
	</div>
</div>
<<<<<<< HEAD
<div class="grid_12 tt"
	style="margin: 100px 0px 100px 0px; border: none;">
	<a>아이디 : </a> <input type="text" value="asas@ddd.cc"><br> 
	<a>비밀번호 : </a> <input type="password" value="aaabbb123">
</div>
<div align="right" style="margin-bottom: 10px">
	<a href="#" class="tbutton small"><span>탈퇴</span></a>
</div>
=======
<!-- 탈퇴폼 -->
<form id="frm" method="post" action="deleteMember.do" onsubmit="return delMemFn()">
<div class="grid_12 tt"
	style="margin: 100px 0px 100px 0px; border: none;">
	
	<c:if test="${message ne null}">
		<h5 style="color: #FF0078;">${message}</h5>
	</c:if>
	
	<a>비밀번호 : </a> <input type="password" id="password" name="password">
</div>
<div align="right" style="margin-bottom: 10px">
	<button type="submit" class="tbutton small"><span>탈퇴</span></button>
</div>
</form>

<script>
function delMemFn() {

		if (!confirm('정말 탈퇴하시겠습니까?')) {
			return false;
		} else {
			return true;
		}
}
</script>
>>>>>>> 2935405 (2022/04/07 회원테이블 수정)
