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
	<h4>아티스트 신청</h4>
	<div class="grid_12 tt" style="margin-top: 70px;">
		<ul class="forum-items" style="text-align: left;">
			<li><i class="icon-comment-alt"></i> <a href="changePassword.do">정보입력</a>
				<div class="topic-time">아티스트 정보를 입력해주세요.</div></li>
		</ul>
	</div>
</div>
<div style="margin: 100px 0px 10px 0px; border: none;"> <!-- class="grid_12 tt삭제 -->
	<a>작업물 설명란</a>&emsp;<textarea placeholder="내용을 입력해 주세요."></textarea> <br>
	<a>작업물 인증</a>&emsp;<input type="file" name="file" id="files" accept="image/png, image/jpeg"><br>
	<a>본인인증</a>&emsp;<br>
	<a>활동명</a>&emsp;<br>
	<div style="font-color:white;">활동정보<br> <!-- 아티스트 상세에 한번에 두개의 내용이 들어가므로 목록 묶음 처리 -->
	&emsp;<a>성별</a>	&emsp;<select id="genre" name="genre"><br> <!-- select box 수직 정렬 -->
						<option>남자</option>
						<option>여자</option>
						<option>혼성</option>
					</select><br>
	&emsp;<a>활동유형</a>&emsp;&emsp;<select id="genre" name="genre"><br>
						<option>솔로</option>
						<option>그룹</option>
					</select><br>
	</div>
	<a>주요활동 장르</a>&emsp;<select id="genre" name="genre">
						<option>발라드</option>
						<option>댄스</option>
						<option>랩/힙합</option>
						<option>R&B/Soul</option>
					</select><br>
	<a>소개글</a>&emsp;<textarea placeholder="내용을 입력해 주세요."></textarea>
</div><br>
<div align="center" style="margin-bottom: 10px">
	<a href="#" class="tbutton small"><span>신청</span></a>&emsp;
	<a href="#" class="tbutton small"><span>취소</span></a> <!-- 뒤로가기 만들기 -->
</div>
