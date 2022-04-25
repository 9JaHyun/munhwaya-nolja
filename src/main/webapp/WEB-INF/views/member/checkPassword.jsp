<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>         
<div align="right" style="margin-bottom: 50px;">
    <a href="memberChangeInfo.do">회원정보 변경 >&nbsp;</a>
    <h4>비밀번호 변경</h4>
    <div class="grid_12 tt" style="margin-top: 70px;">
        <ul class="forum-items" style="text-align: left;">
            <li><i class="icon-ok"></i><a>현재 비밀번호를 입력해주세요.</a></li>
        </ul>
    </div>
</div>

<!-- 수정폼 -->
<form id="frm" method="post" action="checkPassword.do">
	<div class="grid_12 tt"
	     style="margin: 100px 0px 100px 0px; border: none;">
	     
	        <c:if test="${message ne null}">
	            <h5 style="color: #FF0078;">${message}</h5>
	        </c:if>
	     
	    <a>비밀번호 : </a> <input type="password" id="password" name="password">
	</div>
	<div align="right" style="margin-bottom: 10px">
		<button type="button" class="tbutton small" style="margin-right: 2px;" onclick="location.href='memberChangeInfo.do'"><span>뒤로가기</span></button>
	    <button type="submit" class="tbutton small"><span>확인</span></button>
	</div>
</form>
