<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<body id="fluidGridSystem">
	<div id="layout" class="full">
		<div class="under_header">
			<img src="images/assets/breadcrumbs10.png" alt="#">
		</div>
		<!-- under header -->

		<div class="row row-fluid clearfix mbf">
			<div class="span8 posts">
				<div class="def-block" style="width: 140%; border: 3px solid white">
					<div align="center">
						<div>
							<h1>아티스트 공연 신청</h1>
						</div><br>
						<div>
							<form id="frm" action="performanceInsert.do" method="post">
								<div>
									<table border="1">
										<tr>
											<th width="200"><strong>아티스트 이름</strong></th>
											<td width="300"><input style="width:500px" type="text" id=artistId name="artistId" required="required"></td>
										</tr>
										<tr>
											<th width="200"><strong>공연 장소</strong></th>
											<td width="300">
<!-- 											<input style="width:500px" type="text" id="location" name="location" required="required"> -->
												<select id="location" name="location" required="required" style="width:515px">
													<option value="대구광역시">대구광역시</option>
												</select>
											</td>
										</tr>
										<tr>
											<th width="200"><strong>공연 시작 시간</strong></th>
											<td width="300"><input style="width:500px" type="datetime-local" id="sdate" name="sdate" required="required"></td>
										</tr>
										<tr>
											<th width="200"><strong>공연 종료 시간</strong></th>
											<td width="300"><input style="width:500px" type="datetime-local" id="edate" name="edate" required="required"></td>
										</tr>
										<tr>
											<th width="200"><strong>공연 제목</strong></th>
											<td width="300"><input style="width:500px" type="text" id="name" name="name" required="required"></td>
										</tr>
										<tr>
											<th width="200"><strong>공연 내용</strong></th>
											<td width="300"><textarea rows="7" cols="30" id="content" name="content" required="required" style="width:500px;"></textarea></td>
										</tr>
										<tr>
											<th width="200"><strong>공연 가격</strong></th>
											<td width="300"><input style="width:500px" type="text" id="price" name="price" required="required"></td>
										</tr>
									</table>
								</div>
								<br>
								<div>
									<input type="submit" value="등록">&nbsp;&nbsp;&nbsp;
									<input type="button" value="취소">
								</div>
							</form>
						</div>
					</div>
				</div>
			</div><!-- span8 posts -->
		</div><!-- row clearfix -->
	</div><!-- end page content -->