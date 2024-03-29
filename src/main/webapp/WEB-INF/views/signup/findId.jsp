<%@ page contentType="text/html;charset=UTF-8" language="java"%>


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
<form method="post" action="findIdResult">
	<h2 style="margin-bottom: 60px; text-align: center;">아이디 찾기</h2>

	<h5 style="margin-bottom: 20px;">TEL</h5>
	<input type="text" id="tel" name="tel"
		style="height: 50px; width: 100%; margin-bottom: 30px;"
		placeholder="TEL" required autofocus>

	<button type="submit">Find</button>

</form>
<div align="center" style="margin-bottom: 200px;">
	<a href="signin">로그인</a> |
	<a href="findPassword">비밀번호 찾기</a>
</div>
