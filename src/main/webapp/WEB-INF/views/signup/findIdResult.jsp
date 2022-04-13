<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<!--Stylesheet-->
<style>
*, *:before, *:after {
	padding: 0;
	margin: 0;
	box-sizing: border-box;
}

body {
	background-color: #080710;
}

.background {
	width: 430px;
	height: 260px;
	left: 50%;
	top: 50%;
}

form {
	height: 400px;
	width: 500px;
	background-color: rgba(255, 255, 255, 0.13);
	position: absolute;
	transform: translate(-50%, -40%);
	top: 55%;
	left: 50%;
	border-radius: 10px;
	backdrop-filter: blur(10px);
	border: 1px solid #ff0078;
	box-shadow: 0 0 40px rgba(8, 7, 16, 0.6);
	padding: 50px 35px;
}

form * {
	color: #ffffff;
	letter-spacing: 0.5px;
	outline: none;
	border: none;
}


label {
	display: block;
	margin-bottom: 20px;
	font-size: 13px;
}

button {
	margin-top: 20px;
	width: 100%;
	background-color: #ff0078;
	color: #f7f7f7;
	padding: 15px 0;
	font-size: 18px;
	font-weight: 600;
	border-radius: 5px;
	cursor: pointer;
}

.social {
	margin-top: 30px;
}

.social div {
	width: 150px;
	border-radius: 3px;
	padding: 5px 10px 10px 5px;
	background-color: rgba(255, 255, 255, 0.27);
	color: #eaf0fb;
	text-align: center;
}
</style>

<div class="under_header">
	<img src="resources/images/assets/signupback.png" alt="#">
</div>

<div class="background"></div>
<form style="height: auto;">
	<c:choose>
		<c:when test="${fn:length(idLists)==0 or idLists==null}">
			<h5 style="margin: 70px 0px 60px 0px; text-align: center;">일치하는 아이디가 존재하지 않습니다.</h5>
		</c:when>
		<c:otherwise>
			<h4 style="margin: 20px 0px 50px 0px; text-align: center;">${fn:length(idLists)}개의 아이디가 존재합니다.</h4>
			<c:forEach items="${idLists}" var="idList">
				<div align="center">
					<a href="signin">${idList.id}</a><br>
				</div>
			</c:forEach>
		</c:otherwise>
	</c:choose>

</form>
<div align="center" style="margin-bottom: 200px; margin-top: 20px;">
	<a href="signin">로그인</a> |
	<a href="findPassword">비밀번호 찾기</a>
</div>
