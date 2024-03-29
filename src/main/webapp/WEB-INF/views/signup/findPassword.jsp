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
	z-index: 1;

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

.wrap-loading{ /*화면 전체를 어둡게*/
    position: absolute;
    left:0;
    right:0;
    top:0;
    bottom:0;
    background: rgba(0,0,0,0.5);
    filter: progid:DXImageTransform.Microsoft.Gradient(startColorstr='#20000000', endColorstr='#20000000');
    z-index: 10;
}

.wrap-loading div{ /*로딩 이미지*/
	width: 50px;	
	height: 50px;
    position: fixed;
    top:50%;
    left:50%;
    margin-left: -21px;
    margin-top: -21px;
    z-index: 10;
}

.display-none{ /*감추기*/
	display:none;
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

<div class="wrap-loading display-none" id="div_ajax_load_image">
    <div><img src="resources/images/loadingIcon.gif" /></div>
</div>

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
					alert('해당 아이디로 메일을 전송합니다.');
		       		$("#div_ajax_load_image").show();
           	 	},
           	 	complete : function() {
           	 		$("#div_ajax_load_image").hide();
        	 	},
				success : function(result) {
					alert(result);
				}
			})
		});
	})
</script>