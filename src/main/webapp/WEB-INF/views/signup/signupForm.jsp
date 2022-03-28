<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

		
<div class="under_header">
	<img src="resources/images/assets/breadcrumbs11.png" alt="#">
</div>
<div class="page-content back_to_up">
	<div class="row row-fluid clearfix mbf">
		<div class="def-block clearfix" style="margin-bottom: 200px;">
			<h4>회원가입</h4>
			<span class="liner"></span>
			<div class="grid_6 mt">
				<!-- form -->
					<div style="margin-bottom: 20px;">
						<button class="tbutton color2 small" 
						id="idChk" name="idChk" value="N" onclick="idChkFn();"><span>아이디 중복확인</span></button>
						<button class="tbutton color2 small"
						id="nickChk" name="nickChk" value="N" onclick="nickChkFn();"><span>닉네임 중복확인</span></button> 
					</div>
				<form method="post" id="frm" action="memberSignup.do" onsubmit="return send()">

					<div class="clearfix">
						<div>
							<input style="width: 470px; margin-bottom: 30px;" 
							type="email" name="id" id="id"
								placeholder="ID (EMAIL)" required="required" />
						</div>
						
						<div>
							<input style="width: 470px; margin-bottom: 30px;"
							type="password" name="password" id="password"
								placeholder="PASSWORD (영문, 숫자, 특수문자를 포함한 8~20자리)" required="required" />
						</div>
						<div>
							<input style="width: 470px; margin-bottom: 30px;"
							type="password" name="password2" id="password2"
								placeholder="PASSWORD CHECK" required="required" />
						</div>
						<div>
							<input style="width: 470px; margin-bottom: 30px;"
							type="text" name="nickname" id="nickname"
								placeholder="NICKNAME" required="required" />
						</div>
						<div>
							<input style="width: 470px; margin-bottom: 30px;"
							type="text" name="tel" id="tel"
								placeholder="TEL" required="required" />
						</div>
						<select id="genre" name="genre">
							<option>발라드</option>
							<option>댄스</option>
							<option>랩/힙합</option>
							<option>R&B/Soul</option>
						</select>

					</div>
					<input style="padding: 5px 10px 5px 10px;" 
					type="submit" value="가입" class="sign-btn tbutton small"/>

				</form>
				<!-- end form -->
			</div>
			<img src="resources/images/signup-img.JPG" alt="signup-img" style="margin-left: 30px; float: left;">
		</div>
	</div>
</div>
<!-- end page content -->

<script>

	function send() {
		if(idChk.value == "Y" && nickChk.value == "Y") {
			
			var pw = $("#password").val();
			var pw2 = $("#password2").val();
			var num = pw.search(/[0-9]/g);
			var eng = pw.search(/[a-z]/ig);
			var spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
			
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
				}else {
				 return true;	
				}

		} else {
			alert("아이디와 닉네임 중복확인 후 회원가입이 가능합니다.");
			return false;
		}
		 

	}
	
	function idChkFn() {
		var id = $("#id").val();
		var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		if (id.match(regExp) != null){
		$.ajax({
			url : "idChk",
			type : "POST",
			dataType : "JSON",
			data : {"id" : $("#id").val()},
			success : function(data) {
				if(data == 1) {
					$("#idChk").attr("value", "N");
					alert("중복된 아이디입니다.");
				} else if (data == 0) {
					$("#idChk").attr("value", "Y");
					alert("사용 가능한 아이디입니다.")
				}
			}
		})
		} else {
			alert('사용할 수 없는 아이디 양식입니다.');
		}
		
	}
	
	function nickChkFn() {
		$.ajax({
			url : "nickChk",
			type : "POST",
			dataType : "JSON",
			data : {"nickname" : $("#nickname").val()},
			success : function(data) {
				if(data == 1) {
					$("#nickChk").attr("value", "N");
					alert("중복된 닉네임입니다.");
				} else if (data == 0) {
					$("#nickChk").attr("value", "Y");
					alert("사용 가능한 닉네임입니다.")
				}
			}
		})
	}
	
	$("#id").on("change keyup paste", function(){
		idChk.value = "N";
	})
	
	$("#nickname").on("change keyup paste", function(){
		nickChk.value = "N";
	})
	
</script>
