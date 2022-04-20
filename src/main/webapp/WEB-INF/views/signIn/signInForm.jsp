<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="rootPath" value="${pageContext.request.contextPath}"/>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>


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
	height: 380px;
	left: 50%;
	top: 50%;
}

form {
	height: 585px;
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

form h3 {
	font-size: 32px;
	font-weight: 500;
	line-height: 42px;
	text-align: center;
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
<form method="post" action="signin">
	<h3 style="margin-bottom: 40px;">SIGN IN</h3>

	<h5 style="margin-bottom: 20px;">ID</h5>
	<input type="text" id="username" name="username"
		style="height: 50px; width: 100%; margin-bottom: 30px;"
		placeholder="ID(EMAIL)" required autofocus>

	<h5 style="margin-bottom: 20px;">PASSWORD</h5>
	<input type="password" type="password" id="password" name="password"
		style="height: 50px; width: 100%;" placeholder="PASSWORD" required>

	<c:if test="${not empty SPRING_SECURITY_LAST_EXCEPTION}">
		<div style="font-weight: bold">
			<p style="color: #ff0078;">${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message}</p>
			<c:remove var="SPRING_SECURITY_LAST_EXCEPTION" scope="session" />
		</div>
	</c:if>


	<div align="right">
		Remember ID <input type="checkbox" id="idSaveCheck"
			style="margin: 0px;">
	</div>

	<button type="submit">Sign in</button>
	<div class="social" align="center">
		<div onclick="location.href='${rootPath}/oauth2/authorization/google'"
			 style="padding-top: 10px; float: left; width: 48%; background-color: #1A73E8; cursor:pointer;">
			<p  role="button">Google</p>
		</div>
		<div onclick="location.href='${rootPath}/oauth2/authorization/naver'"
			style="padding-top: 10px; float: right; width: 48%; background-color: #19CE60; cursor:pointer;">
			<p>Naver</p>
		</div>
	</div>
</form>
<div align="center" style="margin-bottom: 130px;">
	<a href="findId">아이디 찾기</a> | <a href="findPassword">비밀번호 찾기</a> | <a
		href="signupForm.do">회원가입</a>
</div>


<script>
	$(document).ready(function() {

		// 저장된 쿠키값을 가져와서 ID 칸에 넣어줌. 없으면 공백.
		var key = getCookie("key");
		$("#username").val(key);

		if ($("#username").val() != "") { // 입력 칸에 저장된 ID가 표시된 상태라면 체크 상태로 두기.
			$("#idSaveCheck").attr("checked", true);
		}

		$("#idSaveCheck").change(function() { // 체크박스에 변화가 있다면 7일 동안 쿠키 보관
			if ($("#idSaveCheck").is(":checked")) { 
				setCookie("key", $("#username").val(), 7); 
			} else {
				deleteCookie("key");
			}
		});

		// 체크한 상태에서 ID를 입력하는 경우 쿠키 저장
		$("#username").keyup(function() { 
			if ($("#idSaveCheck").is(":checked")) { 
				setCookie("key", $("#username").val(), 7); 
			}
		});
	});

	function setCookie(cookieName, value, exdays) {
		var exdate = new Date();
		exdate.setDate(exdate.getDate() + exdays);
		var cookieValue = escape(value)
				+ ((exdays == null) ? "" : "; expires=" + exdate.toGMTString());
		document.cookie = cookieName + "=" + cookieValue;
	}

	function deleteCookie(cookieName) {
		var expireDate = new Date();
		expireDate.setDate(expireDate.getDate() - 1);
		document.cookie = cookieName + "= " + "; expires="
				+ expireDate.toGMTString();
	}

	function getCookie(cookieName) {
		cookieName = cookieName + '=';
		var cookieData = document.cookie;
		var start = cookieData.indexOf(cookieName);
		var cookieValue = '';
		if (start != -1) {
			start += cookieName.length;
			var end = cookieData.indexOf(';', start);
			if (end == -1)
				end = cookieData.length;
			cookieValue = cookieData.substring(start, end);
		}
		return unescape(cookieValue);
	}
</script>
