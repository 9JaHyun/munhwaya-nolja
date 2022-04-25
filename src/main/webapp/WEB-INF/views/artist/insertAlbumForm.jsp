<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
textarea {
	padding-left: 1em;
	width: 70%;
	height: 7em;
	border: none;
	resize: none;
}

request-label {
	float: left;
	font-size: 0.5em;
	width: 70%;
}

.sort {
	width: 100px;
	margin: 0px;
}

label {
	display: block;
}
</style>
<div align="right" style="margin-bottom: 50px;">
	<h4>��Ƽ��Ʈ �ٹ� ���</h4>
	<div class="grid_12 tt" style="margin-top: 70px;">
		<ul class="forum-items" style="text-align: left;">
			<li><i class="icon-comment-alt"></i>��Ƽ��Ʈ �ٹ� ���
				<div class="topic-time">��Ƽ��Ʈ�� �ٹ��� ����մϴ�.</div></li>
		</ul>
	</div>
</div>
<div style="padding-top: 5%;">
	<div style="margin: 100px 0px 10px 0px; border: none;">
		<br>
		<form id="info" name="info" method="post" action="insertAlbum.do"
		enctype="multipart/form-data">
			<div class="name">
				<span>�ٹ� ����&nbsp;&nbsp;<input type="text" id="albName"
					name="albName" placeholder="�ٹ��� ������ �Է� ���ּ���"></span> &emsp; <br>
			</div>
			<div class="releaseAt">
				<span>�߸��� &nbsp;&nbsp;</span> <input type="date" id="releaseAt"
					name="releaseAt">
			</div>
			<div class="genre">
				<span>�帣&nbsp;&nbsp;</span> <select id="genre" name="genre">
					<option value="G01"
						<c:if test="${member.genre eq 'G01'}">
                    selected="selected"
                </c:if>>�߶��
					</option>
					<option value="G02"
						<c:if test="${member.genre eq 'G02'}">
                    selected="selected"
                </c:if>>��
					</option>
					<option value="G03"
						<c:if test="${member.genre eq 'G03'}">
                    selected="selected"
                </c:if>>��/����
					</option>
					<option value="G04"
						<c:if test="${member.genre eq 'G04'}">
                    selected="selected"
                </c:if>>R&B/Soul
				</select>
			</div>
			<div class="content">
				<span>����&nbsp;&nbsp;</span>
				<textarea id="content" name="content"
					placeholder="�ٹ��� ���� ������ �Է��� �ּ���."></textarea>
			</div>
			<div class="picture">
				<span>�ٹ� ����&nbsp;&nbsp;</span>
				<input type="file" id="picture" name="picture"
					accept="image/png, image/jpeg"><br>
			</div>
			<!-- ��û, ��� ��ư -->
			<div align="center" style="margin: 3em 0em 0em 0em;">
				<input type="submit"
					style="padding: 0.2em 1.1em 0.08em 1em; position: relative; bottom: 8px; margin: 1em 1em 1.1em 0em;"
					value="��û" class="tbutton small"> <a href=""
					class="tbutton small"><span>���</span></a>
				<!-- Ŭ���� �ڷΰ���-->
			</div>
		</form>
	</div>
</div>
<br>

<script>
	
</script>