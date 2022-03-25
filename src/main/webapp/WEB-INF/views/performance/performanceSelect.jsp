<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<body id="fluidGridSystem">
	<div id="layout" class="full">
		<div class="under_header">
			<img src="images/assets/breadcrumbs10.png" alt="#">
		</div><!-- under header -->

		<div class="page-content back_to_up">
			<div class="row clearfix mb">
				<div class="breadcrumbIn">
					<ul>
						<li><a href="index.html" class="toptip" title="Homepage"> <i class="icon-home"></i> </a></li>
						<li><a href="shop.html"> Shop </a></li>
						<li> Shop Product </li>
					</ul>
				</div><!-- breadcrumb -->
			</div>

			<div class="row row-fluid clearfix mbf">
				<div class="span8 posts">
					<div class="def-block" style="width:140%;">
						<h4> Shop Product </h4><span class="liner"></span>

						<div class="products shop clearfix">
							<div class="grid_12">
						<div class="clearfix mbs">
							<div class="grid_6">
								<div class="postslider clearfix flexslider">
									<a><img src="images/assets/shop/shop_product.jpg" alt="#"></a>
								</div>
							</div><!-- grid6 -->
	
							<div class="grid_6">
								<h3> ${performance.name } </h3>
								<strong>공연명<a>&nbsp&nbsp&nbsp&nbsp  ${performance.name }</a></strong><br>
								<strong>공연장소<a>&nbsp&nbsp&nbsp&nbsp  ${performance.location }</a></strong><br>
								<strong>공연시작일<a>&nbsp&nbsp&nbsp&nbsp  ${performance.sdate }</a></strong><br>
								<strong>공연가격<a>&nbsp&nbsp&nbsp&nbsp  ${performance.price }</a></strong><br><br>
									<div class="single_variation_wrap">
										<div class="variations_button">
											<button type="submit" class="tbutton medium"><span>예매하기</span></button>
										</div>
									</div>
									<div><input type="hidden" name="product_id" value=""></div>
								</form>
							</div><!-- grid6 -->
						</div><!-- clearfix -->

						<div class="clearfix mbs">
							<ul class="tabs">
								<li><a href="#t-1" class="active">공연내용</a></li>

							</ul><!-- tabs -->
			
							<ul class="tabs-content">
								<li id="t-1" class="active">
									<strong>${performance.content }</strong>
								</li><!-- tab content -->
			

							</ul><!-- end tabs -->
						</div><!-- clearfix -->

							</div><!-- grid12 -->
						</div><!-- products -->
					</div><!-- def block -->
				</div><!-- span8 posts -->
			</div><!-- row clearfix -->
		</div><!-- end page content -->
	</div><!-- end layout -->