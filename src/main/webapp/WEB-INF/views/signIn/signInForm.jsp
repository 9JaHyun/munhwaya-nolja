<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


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
	<h3 style="margin-bottom: 40px;">Sign In</h3>

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
		<label> Remember ID <input type="checkbox" name="remember-me"
			style="margin: 0px;">
		</label>
	</div>

	<button type="submit">Sign in</button>
	<div class="social" align="center">
		<div
			style="padding-top: 10px; float: left; width: 48%; background-color: #1A73E8;">
			<a href="/prj/oauth2/authorization/google" role="button">Google</a>
		</div>
		<div
			style="padding-top: 10px; float: right; width: 48%; background-color: #19CE60;">
			<a href="/prj/oauth2/authorization/naver" role="button">Naver</a>
		</div>
	</div>
</form>
<div align="center" style="margin-bottom: 130px;">
	<a href="findId">아이디 찾기</a> |
	<a href="findPassword">비밀번호 찾기</a> | 
	<a href="signupForm.do">회원가입</a>
</div>
