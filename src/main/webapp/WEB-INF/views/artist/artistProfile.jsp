<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<style>
	textarea {
	padding-left:1em;
    width: 55%;
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

<!-- �̹��� �ּ� -->
  <!-- <img src="resources/images/artistFile/click.png" alt="image"
                             style="border-radius: 70%; overflow: hidden; height: 150px; width: 150px;"> -->
                             
<div align="right" style="margin-bottom: 50px;">
	<h4>��Ƽ��Ʈ ���� �Է�</h4>
		<div class="grid_12 tt" style="margin-top: 70px;">
			<ul class="forum-items" style="text-align: left;">
				<li><i class="icon-comment-alt"><a>  ���� ���</a></i>
					<div class="topic-time" style="margin:5px">��Ƽ��Ʈ ������ �Է����ּ���.</div>
			</ul>
		</div>
</div>
<div style="padding-top:5%;">
	<div style="margin: 100px 0px 10px 0px; border: none;"><br> 
		<form action="artistProfile" id="frm" name="frm" onsubmit="return chk_profile()"> <!--  method="post" -->
			<div align="center" style="margin: 20px 0px 100px 0px;">
				<label><div class="sort" style="font-size: 14px; color: white; padding: 0.5em; margin-top:1em;">Ȱ����&emsp;</div><input type="text" id="name" name="name" placeholder=" Ȱ������ �Է��ϼ���."></label><br>
				<label><div class="sort" style="font-size: 14px; color: white; padding: 0.5em; margin-top:1em;">Ȱ������&emsp;</div><input type="file" id="image" name="image" accept="image/png, image/jpeg"></label><br>
			
			
			<ul>
				<label style="font-size: 15px; color: white; padding: 0.5em; margin-top:2em;">Ȱ������ ����</label><!-- ��Ƽ��Ʈ �󼼿� �ѹ��� �ΰ��� ������ ���Ƿ� ��� ���� ó�� -->
					<label style="font-size: 14px; color: white; padding: 0.5em; margin-top:2em;">����<br><select id="gender" name="gender" ></label> <!-- select box ���� ���� -->
											<option>����</option>
											<option value="S01">����</option>
											<option value="S02">����</option>
											<option value="S03">ȥ��</option>
								  </select><br>	
					<label style="font-size: 14px; color: white; padding: 0.5em; margin-top:1em;">Ȱ������<br><select id="type" name="type"></label><br>
											<option>����</option>
											<option value="T01">�ַ�</option>
											<option value="T02">�׷�</option>
								      </select>
			</ul><br>						
	
				<label style="font-size: 14px; color: white; padding: 0.5em; margin-top:1em;">�ֿ�Ȱ�� �帣<br><select id="genre" name="genre"></label>
											<option>����</option>
											<option value="G01">�߶��</option>
											<option value="G02">��</option>
											<option value="G03">��/����</option>
											<option value="G04">R&B/Soul</option>
									   </select><br><br>
				<label style="font-size: 14px; color: white; padding: 0.5em; margin-top:1em;">�Ұ���<br><textarea id="content" name="content" placeholder="������ �Է��� �ּ���."></textarea></label>
		</div>
	</div>
</div>
<br>
		<div align="right" style="margin-top:-6em">
			<input type="submit" style="padding: 0.3em  1em 0.3em 1em; margin: 1em 0.3em 0em 0.3em;" value="���" class="tbutton small" onclick=""/>
			<button style="padding: 0.3em  1em 0.3em 1em; margin: 1em 0.3em 0em 0.3em;" onclick="location.href='mypage.do'" class="tbutton small" >���</button>
		</div>
	</form>
<script>
<!-- ��ȿ�� �˻�-->
function chk_profile(){

	if(document.frm.name.value == ''){
		alert("Ȱ���� ��Ƽ��Ʈ���� �Է��ϼ���.");
		return false;
	}	
	if(document.frm.gender.value == '����'){
		alert("��Ƽ��Ʈ�� ������ �����ϼ���.");
		return false;
	}
	if(document.frm.type.value == '����'){
		alert("Ȱ�������� �����ϼ���.");
		return false;
	}
	if(document.frm.genre.value == '����'){
		alert("�ֿ�Ȱ�� �帣�� �����ϼ���.");
		return false;
	
	}
}


</script>
