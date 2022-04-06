<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="resources" value="${pageContext.request.contextPath}/resources"/>
<script src="./scripts/jquery-3.2.1.min.js"></script>
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
                            <form action="#" method="post">
                                <div class="bag_table">
                                    <table class="shop_table footable tablet footable-loaded" style="width:100%"
                                           cellspacing="0">
                                        <thead>
                                        <tr>
                                            <th data-hide="phone" class="product-thumbnail">&nbsp;
                                            </th>
                                            <th class="product-song">노래</th>
                                            <th class="product-name">아티스트</th>
                                            <th class="product-subtotal">가격</th>
                                            <th class="product-remove">&nbsp;</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${carts }" var="cart">
                                        <tr class="cart_table_item">
                                            <td class="product-thumbnail" >
                                                <a href="#"><img src="images/assets/shop/thumb2.jpg"
                                                                 alt="#" name="carts"></a>
                                            </td>
                                            <td class="product-name">
                                                <div class="title" id="title">${cart.value.title}</div>
                                                <br><br>
                                            </td>
                                        	<td class="product-name">
												<div class="artName" id="artName">${cart.value.artName }</div>	                                        	
											</td>

                                            <td class="product-name">
                                                <div class="price" id="price">${cart.value.price}</div>
                                            </td>

                                            <td class="product-remove tac">
                                                <a onclick="deleteCart(${cart.key})" class="remove toptip"
                                                   original-title="Remove this item">×</a>
                                            </td>
                                            <td class="product-name">
                                            	<input type="hidden" value="${cart.value.id }">
                                            </td>
                                        </tr>
										</c:forEach>

                                       
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
                                <td><strong><span class="amount">&nbsp;&nbsp;&nbsp;${mileage}</span></strong></td>
                            </tr>
                            <tr class="total">
                                <th><strong>총 가격</strong></th>
                                <td><strong>&nbsp;&nbsp;&nbsp;<span id="itemTotalPrice"></span>
                                	
                                </strong></td>
                            </tr>
                          
                            <tr class="total">
                                <th><strong>잔여 마일리지</strong></th>
                                <td><strong>&nbsp;&nbsp;&nbsp;<span class="amount" id="minusMileage"></span></strong></td>
                            </tr>
                            </tbody>
                        </table>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button type="button" class="tbutton mt medium" name="update_cart" onclick="payCart()">구매하기</button>
                  
                    </div><!-- widget content -->
                </div><!-- widget shop cart -->

            </div><!-- span4 sidebar -->
        </div><!-- row clearfix -->
    </div><!-- end page content -->
</div>

<script>

$(document).ready(function(){
	
	itemTotal();

	});
	
function itemTotal() {
	console.log("토탈들어옴?");
	var price = document.getElementsByClassName("price").innerHTML
	var sum = 0;

	for (var i = 0; i < document.getElementsByClassName("price").length; i++){
		sum += parseInt(document.getElementsByClassName("price")[i].innerHTML)
		
	}
// 	var summ = new Intl.NumberFormat('ko-KR', { style: 'currency', currency: 'KRW' }).format(sum);
	document.getElementById("itemTotalPrice").innerHTML = sum;
	document.getElementById("minusMileage").innerHTML = parseInt(${mileage}) - parseInt(document.getElementById("itemTotalPrice").innerHTML);
/*  $("#totalPrice").val(sum); */	 
}



function deleteCart(n) {
	var del = false;
	$.ajax({
		url : "deleteCart",
		type : "post",
		data : {"id" : n},
		async: false,
		dataType: "text",
		success : function(data) {
			if(data.length > 0) {
				del = true;
			}
		}
	});
	if(del) {
		$(event.target).parent().parent().remove();
		itemTotal();
	} else {
		alert(del + "삭제 실패!!!!");
	}
	
}

function payCart() {
	let list = [];
	
	$("img[name='carts']").each(function(i){
	var tr = $(this).parent().parent().parent();
	var td = $(tr).children();
	var obj = {};
	
	var title = td.eq(1).text().trim(); 
	var artName = td.eq(2).text().trim(); 
	var price = td.eq(3).text().trim();
	var id = td.eq(5).find("input").val();
	
	obj["title"] = title;
	obj["artName"] = artName;
	obj["price"] = price;
	obj["id"] = id;
	
	list.push(obj);
	})	
		$.ajax({
			url : "payCart",
			type : "post",
			data : JSON.stringify(list),
			dataType : "text",
			contentType: 'application/json; charset=utf-8',
	        success : function(data) {
	                alert("결제에 성공하였습니다.")
	                location.href="chargeForm";
	            },
				error: function(request, status, error){
	                alert("결제에 실패하였습니다.");
	            }
	        });
  
// 	var formValues = $("form[name=frm]").serialize();
	
// 	$.ajax({
// 		url : "payCart",
// 		type : "post",
// 		data : formValues,
// 		async : false,
// 		dataType : "text",
//         success : function(data) {
//                 alert("결제에 성공하였습니다.")
//                 location.href="chargeForm";
//             },
// 			error: function(xhr, status, error){
//                 alert(error);
//             }
//         });
    }
</script>
