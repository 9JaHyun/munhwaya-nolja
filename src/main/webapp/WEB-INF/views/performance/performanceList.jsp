<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="resources" value="${pageContext.request.contextPath}/resources"/>
<div id="layout" class="full">

    <div class="under_header">
        <img src="${resources }images/assets/breadcrumbs10.png" alt="#">
    </div><!-- under header -->

    <div class="page-content back_to_up">
        <div class="row clearfix mb">
            <div class="breadcrumbIn">
                <ul>
                    <li><a href="index.html" class="toptip" title="Homepage"> <i
                            class="icon-home"></i> </a></li>
                    <li><a href="shop.html"> 공연 </a></li>
                    <li><a href="performanceSelect.do"> 공연 상세정보 </a></li>
                    <li> 예매 </li>
                </ul>
            </div><!-- breadcrumb -->
        </div>

        <div class="row row-fluid clearfix mbf">
            <div class="span8 posts">
                <div class="def-block">
                    <h4> 공연 예매하기 </h4><span class="liner"></span>
                    <div style="border-bottom: 1px solid #FF0078;">
                    <div class="products shop clearfix" style="margin-bottom:20px;">
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
                                                <img src="api/picture/${performance.image }" style="height: 150px; width:130px; margin-left:20px;">
                                            </td>
                                            <td class="product-name" style="vertical-align : middle;">
                                                <a style="font-size:20pt;">${performance.name }</a>
                                            </td>
                                            <td class="product-subtotal" style=" vertical-align : middle;">
                                                <a class="amount" style="font-size:18pt">${performance.price }</a>
                                            </td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div><!-- bag table -->
                            </form><!-- end form -->
                        </div><!-- grid12 -->
                        </div>
                        <div style="float:right; margin-right:10px; margin-top:10px;">
                            <Strong style="font-size:15pt;">남은 좌석수 : <a>${performance.person}</a></Strong>
                        </div>
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