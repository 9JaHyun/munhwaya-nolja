<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

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
		<form method="post" action="artistRequest" enctype="multipart/form-data" onsubmit="return chk_request()">
			<label id="request-label"><div class="sort">�۾��� �����</div>
				<textarea id="artwork" name="artwork" placeholder="������ �Է��� �ּ���."></textarea>
			</label><br>
			<label><div class="sort">�۾��� ����</div><input type="file" id="file" name="file" accept="image/png, image/jpeg"></label><br>
			<label><div class="sort">��������</div><button onclick='location.href=/user/sms'>�޴��� ����</button></label><br>
	
	<!-- ��û, ��� ��ư -->
	<div align="center" style="margin-bottom: 10px">
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
// 			if(!document.info.identify.value){
// 				alert("���������� �������ּ���.");
// 				return false;
// 			}
			/* if(document.info.file.value){
				alert("��Ƽ��Ʈ �±� ��û�� ��û�߽��ϴ�.");
			return true;
			}	 */
// 				return true;
		}
	
</script>