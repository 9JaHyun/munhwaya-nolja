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
	<h4>��Ƽ��Ʈ ���� ���</h4>
		<div class="grid_12 tt" style="margin-top: 70px;">
			<ul class="forum-items" style="text-align: left;">
				<li><i class="icon-comment-alt"></i> <a href="changePassword.do">�����Է�</a>
					<div class="topic-time">��Ƽ��Ʈ ������ �Է����ּ���.</div></li>
			</ul>
		</div>
</div>
<div style="padding-top:5%;">
	<div style="margin: 100px 0px 10px 0px; border: none;"><br> 
		<form action="artistInsert" id="frm" name="frm" method="post">
			<label><div class="sort">Ȱ����&emsp;</div><input type="text" id="name" name="name" value="" placeholder=" Ȱ������ �Է��ϼ���."></label><br>
			<label><div class="sort">Ȱ������&emsp;</div><input type="file" id="image" name="image" accept="image/png, image/jpeg"></label><br>
			<ul>
				<label>Ȱ������ ����</label><!-- ��Ƽ��Ʈ �󼼿� �ѹ��� �ΰ��� ������ ���Ƿ� ��� ���� ó�� -->
					<label>����<br><select id="gender" name="gender" ></label> <!-- select box ���� ���� -->
											<option>����</option>
											<option value="S01">����</option>
											<option value="S02">����</option>
											<option value="S03">ȥ��</option>
									  </select><br>	
					<label>Ȱ������<br><select id="type" name="type"></label><br>
											<option>����</option>
											<option value="T01">�ַ�</option>
											<option value="T02">�׷�</option>
								      </select>
			</ul><br>						
	
				<label>�ֿ�Ȱ�� �帣<br><select id="genre" name="genre"></label>
											<option>����</option>
											<option value="G01">�߶��</option>
											<option value="G02">��</option>
											<option value="G03">��/����</option>
											<option value="G04">R&B/Soul</option>
									   </select><br><br>
				<label>�Ұ���<br><textarea id="content" name="content" placeholder="������ �Է��� �ּ���."></textarea></label>
		</form>
	</div>
</div>
<br>
<div align="left">
		<input type="submit" style="padding: 0.3em  1em 0.3em 1em; margin: 1em 0.3em 0em 0.3em;" value="���" class="tbutton small" onclick="document.getElementById('frm').submit();"/>
		<button style="padding: 0.3em  1em 0.3em 1em; margin: 1em 0.3em 0em 0.3em;" onclick="location.href='home.do'" class="tbutton small" >���</button>
	
		
</div>
<script>
function chk_insert(){

	if(!document.info.name.value){
		alert("Ȱ���� ��Ƽ��Ʈ���� �Է��ϼ���.");
		return false;
	}	
	if(!document.info.gender.value){
		alert("��Ƽ��Ʈ�� ������ �����ϼ���.");
		return false;
	}
	if(!documet.info.type.value){
		alert("Ȱ�������� �����ϼ���.");
		return false;
	}
	if(!documnet.info.genre.vlaue"){
		alert("�ֿ�Ȱ�� �帣�� �����ϼ���.");
		return false;
	}
}



</script>
