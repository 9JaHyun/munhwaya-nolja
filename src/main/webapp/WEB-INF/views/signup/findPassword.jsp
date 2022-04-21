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
<form>
	<h2 style="margin-bottom: 60px; text-align: center;">비밀번호 찾기</h2>

	<h5 style="margin-bottom: 20px;">ID</h5>
	<input type="email" id="id" name="id"
		style="height: 50px; width: 100%; margin-bottom: 30px;"
		placeholder="ID(EMAIL)" required autofocus>

	<button type="button" id="findBtn">Find</button>

</form>
<div align="center" style="margin-bottom: 200px;">
	<a href="signin">로그인</a> |
	<a href="findId">아이디 찾기</a>
</div>



<script>
	$(function(){
		$("#findBtn").click(function(){

			$.ajax({
				url : "findpw",
				type : "POST",
				contentType: "application/x-www-form-urlencoded; charset=UTF-8",
				data : {
					id : $("#id").val()
				},
				beforeSend : function() {
           		 $('html').css('cursor', 'wait');
           	 	},
           	 	complete : function() {
        		 $('html').css('cursor', 'auto');
        	 	},
				success : function(result) {
					alert(result);
				}
			})
		});
	})
</script>