<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<div id="layout" class="full">
	<div class="under_header">
		<img src="images/assets/breadcrumbs10.png" alt="#">
	</div>
	<!-- under header -->

	<div class="page-content back_to_up">
		<div class="row clearfix mb">
			<div class="breadcrumbIn">
				<ul>
					<li><a href="index.html" class="toptip" title="Homepage">
							<i class="icon-home"></i>
					</a></li>
					<li><a href="ticketList.do"> 구매리스트 </a></li>
					<li>입장표</li>
				</ul>
			</div>
			<!-- breadcrumb -->
		</div>

		<div class="row row-fluid clearfix mbf">
			<div class="span8 posts">
				<div class="def-block" style="width: 140%; background-Color: black;">
					<h4>입장표</h4>
					<span class="liner"></span>
					<div class="products shop clearfix">
						<div class="grid_12">
							<div class="clearfix mbs">
								<div class="grid_6">
									<img src="api/picture/${ticketList.qrcode }" alt="#">
								</div>
								<!-- grid6 -->

								<div class="grid_6">
									<div style="margin-bottom: 10px">
										<strong style="font-size: 14pt;">구매자명<a style="font-size: 13pt;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${memberId }</a></strong>
									</div>
									<br>
									<div style="margin-bottom: 10px">
										<strong style="font-size: 14pt">공연명<a style="font-size: 13pt;">
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										${ticket.performancevo.name }</a></strong>
									</div>
									<br>
									<div style="margin-bottom: 10px">
										<strong style="font-size: 14pt">공연시작일&nbsp;&nbsp;&nbsp;&nbsp;<fmt:formatDate pattern = "MM월 dd일 HH시 mm분" value = "${ticket.performancevo.sdate }" /></strong>
									</div>
									<br>
									<div style="margin-bottom: 10px">
										<strong style="font-size: 14pt">공연종료일&nbsp;&nbsp;&nbsp;&nbsp;<fmt:formatDate pattern = "MM월 dd일 HH시 mm분" value = "${ticket.performancevo.edate }" /></strong>
									</div>
									<br>
									<div style="margin-bottom: 10px">
										<strong style="font-size: 14pt">공연장소<a style="font-size: 13pt;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${ticket.performancevo.location }</a></strong>
									</div>
								</div>
								<!-- grid6 -->
							</div>
							<!-- clearfix -->




						</div>
						<!-- def block -->
					</div>
					<!-- span8 posts -->
				</div>
				<!-- row clearfix -->
			</div>
			<!-- end page content -->
		</div>
		<!-- end layout -->