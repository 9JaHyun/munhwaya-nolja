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
<div style="padding-top:5%;">
	<div style="margin: 100px 0px 10px 0px; border: none;"><br> <!-- class="grid_12 tt���� -->
		<form name="info" method="post">
			<label id="request-label"><div class="sort">�۾��� �����</div><textarea id="artwork" name="artwork" placeholder="������ �Է��� �ּ���."></textarea></label><br>
			<label><div class="sort">�۾��� ����</div><input type="file" id="file" name="file" accept="image/png, image/jpeg"></label><br>
			<label><div class="sort">��������</div></label><br>
		</form>
	</div>
</div>
<br>
<div align="center" style="margin-bottom: 10px">
	<a href="mypage.do" onclick="return chk_request()" class="tbutton small"><span>��û</span></a>&emsp;
	<a href="javascript:window.history.back();" class="tbutton small"><span>���</span></a> <!-- Ŭ���� �ڷΰ���-->
</div>
<script>
function chk_request(){
	if(!document.info.artwork.value){
		alert("�۾��� ������� ������ �Է��ϼ���.");
		return false;
	}
	if(!document.info.file.value){
		alert("�۾��� �������� ������ ÷���ϼ���.");
		return false;
	}
	if(!document.info.identify.value){
		alert("���������� �������ּ���.");
		return false;
	}	
		
}
</script>