<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<style>
	textarea {
    width: 70%;
    height: 7em;
    border: none;
    resize: none;
  }

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
<div style="margin: 100px 0px 10px 0px; border: none;"> <!-- class="grid_12 tt���� -->
	<a>�۾��� �����</a>&emsp;<textarea placeholder="������ �Է��� �ּ���."></textarea> <br>
	<a>�۾��� ����</a>&emsp;<input type="file" name="file" id="files" accept="image/png, image/jpeg"><br>
	<a>��������</a>&emsp;<br>
	<a>Ȱ����</a>&emsp;<br>
	<div style="font-color:white;">Ȱ������<br> <!-- ��Ƽ��Ʈ �󼼿� �ѹ��� �ΰ��� ������ ���Ƿ� ��� ���� ó�� -->
	&emsp;<a>����</a>	&emsp;<select id="genre" name="genre"><br> <!-- select box ���� ���� -->
						<option>����</option>
						<option>����</option>
						<option>ȥ��</option>
					</select><br>
	&emsp;<a>Ȱ������</a>&emsp;&emsp;<select id="genre" name="genre"><br>
						<option>�ַ�</option>
						<option>�׷�</option>
					</select><br>
	</div>
	<a>�ֿ�Ȱ�� �帣</a>&emsp;<select id="genre" name="genre">
						<option>�߶��</option>
						<option>��</option>
						<option>��/����</option>
						<option>R&B/Soul</option>
					</select><br>
	<a>�Ұ���</a>&emsp;<textarea placeholder="������ �Է��� �ּ���."></textarea>
</div><br>
<div align="center" style="margin-bottom: 10px">
	<a href="#" class="tbutton small"><span>��û</span></a>&emsp;
	<a href="#" class="tbutton small"><span>���</span></a> <!-- �ڷΰ��� ����� -->
</div>
