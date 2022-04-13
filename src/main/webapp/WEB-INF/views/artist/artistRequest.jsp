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
	<h4>��Ƽ��Ʈ �±޽�û</h4>
		<div class="grid_12 tt" style="margin-top: 70px;">
			<ul class="forum-items" style="text-align: left;">
				<li><i class="icon-comment-alt"></i> <a href="changePassword.do">�±� ��û</a>
					<div class="topic-time">��Ƽ��Ʈ �±޿� �ʿ��� ���������� �Է����ּ���.</div></li>
			</ul>
		</div>
</div>
<!-- ��Ƽ��Ʈ �±� ��û�� �ʿ��� ���� -->
<div style="padding-top:5%;">
	<div style="margin: 100px 0px 10px 0px; border: none;"><br> 
		<form id="info" name="info" method="post" action="artistRequest" enctype="multipart/form-data" onsubmit="return chk_request()">
			<label id="request-label"><div class="sort">�۾��� �����</div>
				<textarea id="artwork" name="artwork" placeholder="������ �Է��� �ּ���."></textarea>
			</label><br>
			<label><div class="sort">�۾��� ����</div><input type="file" id="file" name="file" accept="image/png, image/jpeg"></label><br>

	
				
				<div class="sort"><label>��������</label></div>
					<span>����ȣ �Է�&emsp;&emsp;<input type="text" id="phone" name="phone" placeholder="��ȣ�� �Է����ּ���(-���� �Է�)" ></span>	
						<button id='phoneChk' class="doubleChk">������ȣ ����</button><br>
					<span>������ȣ �Է�&emsp;<input type="text" id="phone2" name="phone2" placeholder="������ȣ�� �Է����ּ���"  disabled required/></span>	
						<button id="phoneChk2" class="doubleChk">�����Ϸ�</button><br>
					<span class="point successPhoneChk" style="color:#FFFFE0;">&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;! �޴��� ��ȣ �Է� �� ������ȣ ������ Ŭ�� �ϼ���.</span>
					<p><input type="hidden" id="phoneDoubleChk"/></p>



			<!-- ��û, ��� ��ư -->
				<div align="center" style="margin: 3em 0em 0em 0em;">
					<input type="submit" style="padding: 0.2em 1.1em 0.08em 1em; position: relative; bottom: 8px; margin: 1em 1em 1.1em 0em;" value="��û" class="tbutton small">
			<!-- <a href="mypage.do" onsubmit="return chk_request()" class="tbutton small"><span>��û</span></a>&emsp; -->
					<a href="javascript:window.history.back();" class="tbutton small"><span>���</span></a> <!-- Ŭ���� �ڷΰ���-->
				</div>
		</form>

	</div>
</div>
<br>


<script>
	<!-- ��ȿ�� �˻�-->
		function chk_request(){
			
			if(!document.info.artwork.value){
				alert("�۾��� ������ �Է��ϼ���.");
				return false;
			}
			if(!document.info.file.value){
				alert("�۾��� ���� ������ ÷���ϼ���.");
				return false;
			}
			if(!document.info.identify.value){
				alert("���������� �������ּ���.");
				return false;
			}else{
				return true;
			}
			/* if(document.info.file.value){
				alert("��Ƽ��Ʈ �±� ��û�� ��û�߽��ϴ�.");
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
		
		
		//�޴��� ��ȣ ����
		
		var code2 = "";
		$("#phoneChk").on('click', function(){
			var phone = $("#phone").val();
			
			var regPhone = /^01([0|1|6|7|8|9])?([0-9]{3,4})?([0-9]{4})$/; 
		      if (regPhone.test(phone) === true) {
				alert("������ȣ �߼��� �Ϸ�Ǿ����ϴ�.\n�޴������� ������ȣ Ȯ���� ���ֽʽÿ�.");
		    	  $.ajax({ 
						type:"POST", 
						url: "user/sms",
						data: {phoneNumber: phone},
						cache : false,
						success:function(data){ 
							if(data == "error"){ 
								alert("�޴��� ��ȣ�� �ùٸ��� �ʽ��ϴ�.") 
								$(".successPhoneChk").text("��ȿ�� ��ȣ�� �Է����ּ���."); 
								$(".successPhoneChk").css("color","red"); 
								$("#phone").attr("autofocus",true); // autofocus : �Ӽ��� ������� ������ �Ӽ����� �ڵ����� false ���� ������, ����ϸ� �ڵ����� true ���� ������ ��.
							}else{  // data�� err�� �ƴϸ� ����
								$("#phone2").attr("disabled",false); // disabled : true�� ��Ȱ��ȭ, false�� Ȱ��ȭ
								$("#phoneChk2").css("display","inline-block");  
								$(".successPhoneChk").text("������ȣ�� �Է��� �� ���������� �����ֽʽÿ�.");  
								$(".successPhoneChk").css("color","green");
								$("#phone").attr("readonly",true);  // readonly�� �� ���� �� ����, ������ �Ұ�.
								code2 = data.content;
								} 
							} 
					}); 
		      }else{
		    	  alert("��ȣ�� �ٽ� Ȯ�ιٶ��ϴ�.");
		      }
		      
			
		});// �������� ������ ������ �ʷϻ����� ����, ��ȭ��ȣ �Է��� readonly���·� data�� code2�� �Ѿ

		//�޴��� ������ȣ ���� 
		
		$("#phoneChk2").click(function(){
			if($("#phone2").val() == code2){ // ���� ��ġ
				$(".successPhoneChk").text("������ȣ�� ��ġ�մϴ�.");
				$(".successPhoneChk").css("color","green");
				$("#phoneDoubleChk").val("true");
				$("#phone2").attr("disabled",true);
			}else{ 
				$(".successPhoneChk").text("������ȣ�� ��ġ���� �ʽ��ϴ�.");
				$(".successPhoneChk").css("color","red");
				$("#phoneDoubleChk").val("false");
				$(this).attr("autofocus",true);
				}
		});

		
</script>