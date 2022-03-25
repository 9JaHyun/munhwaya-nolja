<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<script>
function fn_idChk(){
	$.ajax({
		url : "/member/idChk",
		type : "post",
		dataType : "json",
		data : {"id" : $("#id").val()},
		success : function(data){
			if(data == 1){
				alert("중복된 아이디입니다.");
			}else if(data == 0){
				$("#idChk").attr("value", "Y");
				alert("사용가능한 아이디입니다.");
			}
		}
	})
}
</script>
	
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
				<form method="post" id="contactForm" action="processForm.php">
					<div class="clearfix">
						<div>
							<input style="width: 470px; margin-bottom: 10px;" 
							type="email" name="id" id="id"
								placeholder="ID (EMAIL)" class="requiredField" />
						</div>
						<button class="idChk" type="button" id="idChk" onclick="fn_idChk();" value="N">중복확인</button>
						<div>
							<input style="width: 470px; margin-bottom: 30px;"
							type="password" name="password" id="password"
								placeholder="PASSWORD" class="requiredField" />
						</div>
						<div>
							<input style="width: 470px; margin-bottom: 30px;"
							type="password" name="password" id="password"
								placeholder="PASSWORD" class="requiredField" />
						</div>
						<div>
							<input style="width: 470px; margin-bottom: 30px;"
							type="text" name="nickname" id="nickname"
								placeholder="NICKNAME" class="requiredField" />
						</div>
						<div>
							<input style="width: 470px; margin-bottom: 30px;"
							type="text" name="tel" id="tel"
								placeholder="TEL" class="requiredField" />
						</div>
						<select>
							<option>발라드</option>
							<option>댄스</option>
							<option>랩/힙합</option>
							<option>R&B/Soul</option>
						</select>

					</div>
					<input type="submit" id="sendMessage" name="sendMessage"
						value="가입" /> <span> </span>
				</form>
				<!-- end form -->
			</div>
		</div>
	</div>
</div>
<!-- end page content -->
