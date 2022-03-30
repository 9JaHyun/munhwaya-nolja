<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="resources" value="${pageContext.request.contextPath}/resources"/>
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
						<li><a href="performance.do"> 공연 </a></li>
						<li>공연 상세정보</li>
					</ul>
				</div>
				<!-- breadcrumb -->
			</div>

			<div class="row row-fluid clearfix mbf">
				<div class="span8 posts">
					<div class="def-block" style="width: 140%;">
						<h4>공연 상세정보</h4>
						<span class="liner"></span>

						<div class="products shop clearfix">
							<div class="grid_12">
								<div class="clearfix mbs">
									<div class="grid_6">
										<div class="postslider clearfix flexslider">
											<a><img src="${resources}/images/assets/shop/1.jpg" alt="#"></a>
										</div>
									</div>
									<!-- grid6 -->

									<div class="grid_6">
										<h3 style="font-size:30pt; margin-bottom:30px;">${performance.name }</h3><br>
										<div style="margin-bottom:10px"><strong style="font-size:14pt;">공연장소<a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${performance.location }</a></strong></div><br>
										<div style="margin-bottom:10px"><strong style="font-size:14pt">공연시작일<a>&nbsp;&nbsp;&nbsp;&nbsp;${performance.sdate }</a></strong></div><br>
										<div style="margin-bottom:10px"><strong style="font-size:14pt">공연가격<a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${performance.price }</a></strong></div><br><br>
										<div class="single_variation_wrap">
											<div class="variations_button">
												<button onclick="performanceList('${performance.id}')" type="submit" class="tbutton medium">
													<span>예매하기</span>
												</button>
											</div>
										</div>
										<div>
											<input type="hidden" name="product_id" value="">
										</div>
										</form>
									</div>
									<!-- grid6 -->
								</div>
								<!-- clearfix -->


								<div class="clearfix mbs">
									<ul class="tabs">
										<li><a href="#t-1" class="active">공연내용</a></li>

									</ul>
									<!-- tabs -->

									<ul class="tabs-content">
										<li id="t-1" class="active"><strong>${performance.content }</strong>
										</li>
										<!-- tab content -->


									</ul>
									<!-- end tabs -->
								</div>
								<!-- clearfix -->

							</div>
							<!-- grid12 -->
						</div>
						<!-- products -->
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
<div>
	<form id = "frm" action="performanceList.do" method="get">
		<input type="hidden" id="id" name="id">
</form>
</div>
<script type="text/javascript">
	function performanceList(n) {
		frm.id.value = n;
		frm.submit();
	}
</script>