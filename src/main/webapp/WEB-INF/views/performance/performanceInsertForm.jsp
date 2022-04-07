<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="resources" value="${pageContext.request.contextPath}/resources"/>
<body id="fluidGridSystem">
	<div id="layout" class="full">
		<div class="under_header">
			<img src="${resources}/images/assets/breadcrumbs10.png" alt="#">
		</div>
		<!-- under header -->

		<div class="row row-fluid clearfix mbf" style="padding-bottom:300px;">
			<div class="span8 posts">
				<div class="def-block" style="width: 700px; border: 3px solid white; margin-left:180px;">
					<div align="center">
						<div>
							<h1>아티스트 공연 신청</h1>
						</div><br>
						<div>
							<form id="frm" action="performanceInsert.do" method="post">
								<div>
									<table border="1">
										<tr>
											<td width="300">
												<a>아티스트 이름<a></a>
												<input style="width:500px" type="text" value="${artist}" readonly="readonly">
											</td>
										</tr>
										<tr>
											<td width="300">
												<a>공연장소</a>
												<select id="location" name="location" required="required" style="width:515px">
													<option value="대구광역시">대구광역시</option>
												</select>
											</td>
										</tr>
										<tr>
											<td width="300">
												<a>공연 시작 시간</a>
												<input style="width:500px" type="datetime-local" id="sdate" name="sdate" required="required">
											</td>
										</tr>
										<tr>
											<td width="300">
											<a>공연 종료 시간</a>
											<input style="width:500px" type="datetime-local" id="edate" name="edate" required="required">
											</td>
										</tr>
										<tr>
											<td width="300">
												<a>공연 제목</a>
												<input style="width:500px" type="text" id="name" name="name" required="required" placeholder="공연 제목을 입력하세요.">
											</td>
										</tr>
										<tr>
											<td width="300">
												<a>공연 내용</a>
												<textarea rows="7" cols="30" id="content" name="content" required="required" style="width:500px;" placeholder="공연 내용을 입력하세요."></textarea>
											</td>
										</tr>
										<tr>
											<td width="300">
												<a>공연 가격</a>
												<input style="width:500px" type="text" id="price" name="price" required="required" placeholder="공연 가격을 입력하세요.">
											</td>
										</tr>
										<tr>
											<td width="300">
												<a>공연 이미지</a>
												<input style="width:500px; color: red; " type="file" id="image" name="image" required="required">
											</td>
										</tr>
									</table>
								</div>
								<br>
								<div>
									<input type="submit" value="등록" class="tbutton small" style="width:70px; height:30px; font-size:12pt;">&nbsp;&nbsp;&nbsp;
									<input type="button" value="취소" class="tbutton small" style="width:70px; height:30px; font-size:12pt;">
								</div>
							</form>
						</div>
					</div>
				</div>
			</div><!-- span8 posts -->
		</div><!-- row clearfix -->
	</div><!-- end page content -->