<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="resources" value="${pageContext.request.contextPath}/resources"/>
<div id="layout" class="full">

    <div class="under_header">
        <img src="${resources}/images/assets/breadcrumbs10.png" alt="#">
    </div><!-- under header -->

    <div class="page-content back_to_up">
        <div class="row clearfix mb">
            <div class="breadcrumbIn">
                <ul>
                    <li><a href="index.html" class="toptip" title="Homepage"> <i
                            class="icon-home"></i> </a></li>
                    <li><a href="shop.html"> Shop </a></li>
                    <li> SHOPPING BAG</li>
                </ul>
            </div><!-- breadcrumb -->
        </div>

        <div class="row row-fluid clearfix mbf">
            <div class="span8 posts">
                <div class="def-block">
                    <h4> 쇼핑 카트 </h4><span class="liner"></span>

                    <div class="products shop clearfix">
                        <div class="grid_12">
                            <form id="frm" action="ticketListInsert.do" method="post">
                                <div class="bag_table">
                                    <table class="shop_table footable tablet footable-loaded" style="width:100%"
                                           cellspacing="0">
                                        <thead>
                                        </thead>
                                        <tbody>
                                        <tr class="cart_table_item">
                                            <td class="product-thumbnail">
                                                <a href="#"><img src="images/assets/shop/thumb2.jpg"
                                                                 alt="#"></a>
                                            </td>
                                            <td class="product-name">
                                                <a>${performance.name }</a>
                                            </td>
                                            <td class="product-subtotal">
                                                <a class="amount" style="font-size:18pt">${performance.price }</a>
                                            </td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div><!-- bag table -->
                            </form><!-- end form -->
                        </div><!-- grid12 -->
                    </div><!-- products -->

                </div><!-- def block -->
            </div><!-- span8 posts -->

            <div class="span4 sidebar">

                <div class="def-block widget">
                    <h4> 가격 </h4><span class="liner"></span>
                    <div class="widget-content">
                        <table class="total_w_table" cellspacing="0">
                            <tbody>
                            <tr class="cart-subtotal">
                                <th><strong>보유중인 마일리지 </strong></th>
                                <td><strong><span class="amount">&nbsp;&nbsp;&nbsp;$275.00</span></strong></td>
                            </tr>
                            <tr class="total">
                                <th><strong>공연 가격</strong></th>
                                <td><strong><span class="amount">&nbsp;&nbsp;&nbsp;${performance.price }</span></strong></td>
                            </tr>
                          
                            <tr class="total">
                                <th><strong>잔여 마일리지</strong></th>
                                <td><strong><span class="amount">&nbsp;&nbsp;&nbsp;0</span></strong></td>
                            </tr>
                            </tbody>
                        </table>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <button  onclick="ticketListInsert(${performance.id})" type="button" class="tbutton mt medium" name="update_cart"><span>구매하기</span>
                        </button>
                  
                    </div><!-- widget content -->
                </div><!-- widget shop cart -->

            </div><!-- span4 sidebar -->
        </div><!-- row clearfix -->
    </div><!-- end page content -->
</div>
<div>
	<form id = "ticketFrm" action="ticketListInsert.do" method="get">
		<input type="hidden" id="id" name="id">
	</form>
</div>
<script type="text/javascript">
	function ticketListInsert(n) {
		ticketFrm.id.value = n;
		ticketFrm.submit();
	}
</script>