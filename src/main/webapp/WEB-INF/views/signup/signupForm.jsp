<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
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
	height: 845px;
	left: 50%;
	top: 50%;
}

form {
	height: 880px;
	width: 600px;
	background-color: rgba(255, 255, 255, 0.13);
	position: absolute;
	transform: translate(-50%, 20%);
	top: 15%;
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
<form method="post" id="frm" action="signup.do" onsubmit="return send()">

	<h3 style="margin-bottom: 40px;">SIGN UP</h3>
	
	<!-- 아이디 -->
	<h5 style="margin-bottom: 10px;">ID</h5>
	<input type="email" name="id" id="id" placeholder="ID (EMAIL)" required="required"
		style="height: 50px; width: 100%; margin-bottom: 30px;">
	<!-- 아이디 중복확인-->	
	<div align="right" style="position: absolute; top: 168px; right: 45px;">
		<p class="tbutton small" id="chkId" value="N" onclick="chkIdFn();" style="border-radius: 4px;">
			<span>중복확인</span>
		</p>	
	</div>
	<!-- 비밀번호 -->
	<h5 style="margin-bottom: 10px;">PASSWORD</h5>
	<input type="password" name="password" id="password" placeholder="PASSWORD (영문, 숫자, 특수문자를 포함한 8~20자리)" required="required"
		style="height: 50px; width: 100%; margin-bottom: 30px;">
	<!-- 비밀번호 재확인 -->	
	<h5 style="margin-bottom: 10px;">PASSWORD CHECK</h5>
	<input type="password" name="password2" id="password2" placeholder="PASSWORD CHECK" required="required"
		style="height: 50px; width: 100%; margin-bottom: 30px;">	
	<!-- 닉네임 -->	
	<h5 style="margin-bottom: 10px;">NICKNAME</h5>
	<input type="text" name="nickname" id="nickname" placeholder="NICKNAME (4자리 이상)" required="required"
		style="height: 50px; width: 100%; margin-bottom: 30px;">
	<!-- 닉네임 중복확인 -->
	<div align="right" style="position: absolute; top: 479px; right: 45px;">
		<p class="tbutton small" id="chkNick" value="N" onclick="chkNickFn();" style="border-radius: 4px;">
			<span>중복확인</span>
		</p>	
	</div>
	<!-- 전화번호 -->
	<h5 style="margin-bottom: 10px;">TEL</h5>
	<input type="text" name="tel" id="tel" placeholder="TEL" required="required"
		style="height: 50px; width: 100%; margin-bottom: 30px;">
	<!-- 관심장르 -->
	<h5 style="margin-bottom: 10px;">GENRE</h5>					
	<select id="genre" name="genre" style="color: #414141; height: 50px; width: 100%;">
		<option style="color: black;" disabled selected="selected">관심장르</option>
		<option style="color: black;" value="G01">발라드</option>
		<option style="color: black;" value="G02">댄스</option>
		<option style="color: black;" value="G03">랩/힙합</option>
		<option style="color: black;" value="G04">R&B/Soul</option>
	</select>

	<button style="margin-top: 40px;" type="submit">Sign Up</button>

</form>

<div align="center" style="margin-bottom: 130px;">
	<a href="findId">아이디 찾기</a> |
	<a href="findPassword">비밀번호 찾기</a> | 
	<a href="signInForm.do">로그인</a>
</div>

<script>
function send() {
	if(chkId.value == "Y" && chkNick.value == "Y") {
		
		var pw = frm.password.value;
		var pw2 = frm.password2.value;
		var num = pw.search(/[0-9]/g);
		var eng = pw.search(/[a-z]/ig);
		var spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
		
		var tel = $("#tel").val();
		var regPhone = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/;
		
		var genre = $("#genre").val();
		
		if(pw.length < 8 || pw.length > 20){
			 alert("비밀번호를 8자리 ~ 20자리 이내로 입력해주세요.");
			 return false;
			}else if(pw.search(/\s/) != -1){
			 alert("비밀번호를 공백 없이 입력해주세요.");
			 return false;
			}else if(num < 0 || eng < 0 || spe < 0 ){
			 alert("비밀번호를 영문, 숫자, 특수문자를 포함하여 입력해주세요.");
			 return false;
			}else if(pw != pw2) {
			 alert("비밀번호가 서로 일치하지 않습니다.");
			 return false;
			}else if (!tel.match(regPhone)) {
			 alert("적절하지 않은 전화번호 양식입니다.");
			 return false;
			}else if (genre === null){
			 alert("관심 장르를 선택해주세요.");
			 return false;
			}else {
			 return true;		
			}

	} else {
		alert("아이디와 닉네임 중복확인 후 회원가입이 가능합니다.");
		return false;
	}
}

function chkIdFn() {
	var id = $("#id").val();
	var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	if (id.match(regExp) != null){
	$.ajax({
		url : "chkId",
		type : "POST",
		dataType : "JSON",
		data : {"id" : id},
		success : function(data) {
			if(data === 1) {
				$("#chkId").attr("value", "N");
				alert("중복된 아이디입니다.");
			} else if (data === 0) {
				$("#chkId").attr("value", "Y");
				alert("사용 가능한 아이디입니다.")
			}
		}
	})
	} else {
		alert('적절하지 않은 아이디 양식입니다.');
	}
}

function chkNickFn() {
	var nickname = $("#nickname").val();
	var regExp = /\s/g;
	if (nickname.length > 0 && !nickname.match(regExp)) {
		$.ajax({
			url : "chkNick",
			type : "POST",
			dataType : "JSON",
			data : {"nickname" : nickname},
			success : function(data) {
				if(data == 1) {
					$("#chkNick").attr("value", "N");
					alert("중복된 닉네임입니다.");
				} else if (data == 0) {
					$("#chkNick").attr("value", "Y");
					alert("사용 가능한 닉네임입니다.")
				}
			}
		});
	} else {
		alert('적절하지 않은 닉네임 양식입니다.')
	}
}

$("#id").on("change keyup paste", function(){
	$('#chkId').attr('value', 'N');
})

$("#nickname").on("change keyup paste", function(){
	$('#chkNick').attr('value', 'N');
})

</script>
