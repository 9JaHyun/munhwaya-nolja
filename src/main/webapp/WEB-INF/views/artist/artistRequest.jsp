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
/* select, input[type="file"]{ */
/* 	margin-left: 2em; */
/* 	} */
/* input[type="text"]{ */
/* 	margin-left: 3.3em; */
/* } */
/* .selectbox{ */
/* 	margin-left: 1.6em; */
/* 	} */
/*  .laber.textarea{ */
 	
/*  } */
</style>


<div align="right" style="margin-bottom: 50px;">
	<h4>��Ƽ��Ʈ ��û</h4>
		<div class="grid_12 tt" style="margin-top: 70px;">
			<ul class="forum-items" style="text-align: left;">
				<li><i class="icon-comment-alt"></i> <a href="changePassword.do">�����Է�</a>
					<div class="topic-time">��Ƽ��Ʈ ������ �Է����ּ���.</div></li>
			</ul>
		</div>
</div>
<div style="padding-top:5%;">
	<div style="margin: 100px 0px 10px 0px; border: none;"><br> <!-- class="grid_12 tt���� -->
		<form id="info" method="post">
			<label id="request-label"><div class="sort">�۾��� �����</div><textarea id="content" name="content" placeholder="������ �Է��� �ּ���."></textarea></label><br><br>
			<label><div class="sort">�۾��� ����&emsp;</div><input type="file" id="image" name="image" accept="image/png, image/jpeg"></label></div><br>
			<label><div class="sort">��������&emsp;</div></label><br>
			<label><div class="sort">Ȱ����&emsp;</div><input type="text" id="name" name="name" placeholder="Ȱ������ �����ϼ���."></label><br><br>
	
			<ul>
				<label>Ȱ������ ����</label><!-- ��Ƽ��Ʈ �󼼿� �ѹ��� �ΰ��� ������ ���Ƿ� ��� ���� ó�� -->
					<label>����<br><select id="gender" name="gender"></label> <!-- select box ���� ���� -->
											<option>����</option>
											<option>����</option>
											<option>����</option>
											<option>ȥ��</option>
									  </select><br>	
					<label>Ȱ������<br><select id="type" name="type"></label><br>
											<option>����</option>
											<option>�ַ�</option>
											<option>�׷�</option>
								      </select>
			</ul><br>						
	
				<label>�ֿ�Ȱ�� �帣<br><select id="genre" name="genre"></label>
											<option>����</option>
											<option>�߶��</option>
											<option>��</option>
											<option>��/����</option>
											<option>R&B/Soul</option>
									   </select><br><br>
				<label>�Ұ���<br><textarea id="content" name="content" placeholder="������ �Է��� �ּ���."></textarea></label>
		</form>
	</div>
</div><br>
<div align="center" style="margin-bottom: 10px">
	<a onclick="return chk_request()" class="tbutton small"><span>��û</span></a>&emsp;
	<a href="#" class="tbutton small"><span>���</span></a> <!-- �ڷΰ��� ����� -->
</div>
<script>
function chk_request(){
	if(document.get)
	
}
</script>
