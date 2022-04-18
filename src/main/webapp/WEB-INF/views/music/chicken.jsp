<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<form method="post" action="upload" enctype="multipart/form-data">
	<img src="api/picture/aec36753-2a97-455c-886a-3a99f6c29f8d.png">
	         <label><div class="sort">작업물 인증</div><input type="file" id="file" name="file" accept="image/png, image/jpeg"></label><br>
	   
	   <!-- 신청, 취소 버튼 -->
	   <div align="center" style="margin-bottom: 10px">
	         <input type="submit" style="padding: 0.2em 1.1em 0.08em 1em; position: relative; bottom: 8px; margin: 1em 1em 1.1em 0em;" value="신청" class="tbutton small">
	   <!-- <a href="mypage.do" onsubmit="return chk_request()" class="tbutton small"><span>신청</span></a>&emsp; -->
	   <a href="javascript:window.history.back();" class="tbutton small"><span>취소</span></a> <!-- 클릭시 뒤로가기-->
	   </div>
	 </form>