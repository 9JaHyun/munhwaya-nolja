<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<script
  src="https://code.jquery.com/jquery-3.6.0.min.js"
  integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
  crossorigin="anonymous"></script>
<style>
	textarea {
	padding-left:1em;
    width: 70%;
    height: 7em;
    border: none;
    resize: none;
    }
    request-label{
    float: left;
    font-size:0.5em;
    width:70%;
    
    }
    .sort {
    width: 100px;
    margin: 0px;
    }
 
 label{
 	display: block;
 }

</style>


<div align="right" style="margin-bottom: 50px;">
	<h4>아티스트 승급신청</h4>
		<div class="grid_12 tt" style="margin-top: 70px;">
			<ul class="forum-items" style="text-align: left;">
				<li><i class="icon-comment-alt"></i> <a href="changePassword.do">승급 신청</a>
					<div class="topic-time">아티스트 승급에 필요한 인증사항을 입력해주세요.</div></li>
			</ul>
		</div>
</div>
<!-- 아티스트 승급 신청에 필요한 인증 -->
<div style="padding-top:5%;">
	<div style="margin: 100px 0px 10px 0px; border: none;"><br> 
		<form id="info" name="info" method="post" action="artistRequest" enctype="multipart/form-data" onsubmit="return chk_request()">
			<label id="request-label"><div class="sort">작업물 설명란</div>
				<textarea id="artwork" name="artwork" placeholder="내용을 입력해 주세요."></textarea>
			</label><br>
			<label><div class="sort">작업물 인증</div><input type="file" id="file" name="file" accept="image/png, image/jpeg"></label><br>

	
				
				<div class="sort"><label>본인인증</label></div>
					<span>폰번호 입력&emsp;&emsp;<input type="text" id="phone" name="phone" placeholder="번호를 입력해주세요(-빼고 입력)" ></span>	
						<button id='phoneChk' class="doubleChk">인증번호 전송</button><br>
					<span>인증번호 입력&emsp;<input type="text" id="phone2" name="phone2" placeholder="인증번호를 입력해주세요"  disabled required/></span>	
						<button id="phoneChk2" class="doubleChk">인증완료</button><br>
					<span class="point successPhoneChk" style="color:#FFFFE0;">&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;! 휴대폰 번호 입력 후 인증번호 전송을 클릭 하세요.</span>
					<p><input type="hidden" id="phoneDoubleChk"/></p>



			<!-- 신청, 취소 버튼 -->
				<div align="center" style="margin: 3em 0em 0em 0em;">
					<input type="submit" style="padding: 0.2em 1.1em 0.08em 1em; position: relative; bottom: 8px; margin: 1em 1em 1.1em 0em;" value="신청" class="tbutton small">
			<!-- <a href="mypage.do" onsubmit="return chk_request()" class="tbutton small"><span>신청</span></a>&emsp; -->
					<a href="javascript:window.history.back();" class="tbutton small"><span>취소</span></a> <!-- 클릭시 뒤로가기-->
				</div>
		</form>

	</div>
</div>
<br>


<script>
	<!-- 유효성 검사-->
		function chk_request(){
			
			if(!document.info.artwork.value){
				alert("작업물 내용을 입력하세요.");
				return false;
			}
			if(!document.info.file.value){
				alert("작업물 인증 파일을 첨부하세요.");
				return false;
			}
			if(!document.info.identify.value){
				alert("본인인증을 진행해주세요.");
				return false;
			}else{
				return true;
			}
			/* if(document.info.file.value){
				alert("아티스트 승급 신청을 요청했습니다.");
			return true;
			}	 */
// 				return true;
		}
/* 		function smsrequest() {
			console.log('request');
			$.ajax({
				url: 'user/sms',
				type: 'POST',
				data: {phoneNumber: }
			})
		} */
		
		
		//휴대폰 번호 인증
		
		var code2 = "";
		$("#phoneChk").on('click', function(){
			var phone = $("#phone").val();
			
			var regPhone = /^01([0|1|6|7|8|9])?([0-9]{3,4})?([0-9]{4})$/; 
		      if (regPhone.test(phone) === true) {
				alert("인증번호 발송이 완료되었습니다.\n휴대폰에서 인증번호 확인을 해주십시오.");
		    	  $.ajax({ 
						type:"POST", 
						url: "user/sms",
						data: {phoneNumber: phone},
						cache : false,
						success:function(data){ 
							if(data == "error"){ 
								alert("휴대폰 번호가 올바르지 않습니다.") 
								$(".successPhoneChk").text("유효한 번호를 입력해주세요."); 
								$(".successPhoneChk").css("color","red"); 
								$("#phone").attr("autofocus",true); // autofocus : 속성을 명시하지 않으면 속성값이 자동으로 false 값을 가지고, 명시하면 자동으로 true 값을 가지게 됨.
							}else{  // data가 err가 아니면 실행
								$("#phone2").attr("disabled",false); // disabled : true면 비활성화, false면 활성화
								$("#phoneChk2").css("display","inline-block");  
								$(".successPhoneChk").text("인증번호를 입력한 뒤 본인인증을 눌러주십시오.");  
								$(".successPhoneChk").css("color","green");
								$("#phone").attr("readonly",true);  // readonly로 값 전달 후 보임, 수정은 불가.
								code2 = data.content;
								} 
							} 
					}); 
		      }else{
		    	  alert("번호를 다시 확인바랍니다.");
		      }
		      
			
		});// 본인인증 누르고 성공시 초록색으로 변경, 전화번호 입력은 readonly상태로 data가 code2로 넘어감

		//휴대폰 인증번호 대조 
		
		$("#phoneChk2").click(function(){
			if($("#phone2").val() == code2){ // 인증 일치
				$(".successPhoneChk").text("인증번호가 일치합니다.");
				$(".successPhoneChk").css("color","green");
				$("#phoneDoubleChk").val("true");
				$("#phone2").attr("disabled",true);
			}else{ 
				$(".successPhoneChk").text("인증번호가 일치하지 않습니다.");
				$(".successPhoneChk").css("color","red");
				$("#phoneDoubleChk").val("false");
				$(this).attr("autofocus",true);
				}
		});

		
</script>