<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="resources" value="${pageContext.request.contextPath}/resources"/>
<script src="./scripts/jquery-3.2.1.min.js"></script>
<style>
td {
	vertical-align: middle; 
}

tr {
	margin-bottom:20px;
}
</style>
<div id="layout" class="full">

    <div class="under_header">
        <img src="${resources}/images/assets/breadcrumbs1.png" alt="#">
    </div><!-- under header -->

    <div class="page-content back_to_up">
        <div class="row clearfix mb">
            <div class="breadcrumbIn">
                <ul>
                    <li><a href="home.do" class="toptip" title="Homepage"> <i
                            class="icon-home"></i> </a></li>
                    <li><a href="chart"> 차트 순위 </a></li>
                    <li>쇼핑 카트</li>
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
                                    <table id="cartTable"class="shop_table footable tablet footable-loaded" style="width:100%"
                                           cellspacing="0">
                                        <thead>
                                        <tr style="height:50px; color:white;">
                                       		<th class="product-selectAll"><input type="checkbox" id="chkAll" style="float:left" onclick='selectAll(this)'></th>
                                            <th data-hide="phone" class="product-thumbnail" style="width:100px;">&nbsp;
                                            </th>
                                            <th class="product-song">곡 제목</th>
                                            <th class="product-name">아티스트</th>
                                            <th class="product-genre">장르</th>
                                            <th class="product-subtotal">가격</th>
                                            <th class="product-remove">삭제</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${carts }" var="cart">
                                        <tr class="cart_table_item" style="height:50px; color:white;">
                                        	<td class="product-select">
                                        		<input type="checkbox" name="selId" value="${cart.value.price}" onclick="changeSum()">
                                        	</td>
                                            <td class="product-thumbnail" >
                                                <a href="#"><img src="api/picture/${cart.value.picture }"
                                                                 alt="#" name="carts"  style="width:100px; height:100px; object-fit: cover;"></a>
                                            </td>
                                            <td class="product-name" style="text-align:center;">
                                                <div class="title" id="title">${cart.value.title}</div>
                                            </td>
                                        	<td class="product-name" style="text-align:center;">
												<div class="artName" id="artName">${cart.value.artName }</div>	                                        	
											</td>
											<td class="product-name" style="text-align:center;">
												<div class="genre" id="genre">
												 <c:choose>
                                                       <c:when test="${cart.value.genre eq 'G01'}">발라드</c:when>
                                                       <c:when test="${cart.value.genre eq 'G02'}">댄스</c:when>
                                                       <c:when test="${cart.value.genre eq 'G03'}">랩/힙합</c:when>
                                                       <c:when test="${cart.value.genre eq 'G04'}">R&B/Soul</c:when>
                                                 </c:choose> 
												</div>
											</td>
                                            <td class="product-name" style="text-align:center;">
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
                                <td><strong><span class="amount" id="sessionMileage">&nbsp;&nbsp;&nbsp;${mileage}</span></strong></td>
                            </tr>
                            <tr class="total">
                                <th><strong>총 가격</strong></th>
                                <td><strong>&nbsp;&nbsp;&nbsp;<span id="itemTotalPrice"></span>
                                	
                                </strong></td>
                            </tr>
                          
                            <tr class="total">
                                <th><strong>잔여 마일리지</strong></th>
                                <td>&nbsp;&nbsp;&nbsp;<strong><span class="amount" id="minusMileage"></span></strong></td>
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
function selectAll(selectAll)  {
	  const checkboxes 
	       = document.getElementsByName('selId');
	  
	  checkboxes.forEach((checkbox) => {
	    checkbox.checked = selectAll.checked;
	  })
	  itemTotal();
	}

$(document).ready(function(){
	
	itemTotal();

	});
	
function itemTotal() {
//  var price = document.getElementsByClassName("price").innerHTML
	var sum = 0;

	for (var i=0; i<$("[name='selId']:checked").length; i++) {
	 	sum += parseInt($("[name='selId']:checked")[i].getAttribute('value'));
	}
	
	document.getElementById("itemTotalPrice").innerHTML = sum;
	document.getElementById("minusMileage").innerHTML = parseInt(${mileage}) - parseInt(document.getElementById("itemTotalPrice").innerHTML);
	
	var sumMileage = document.getElementById('itemTotalPrice').innerHTML;
	var sumMileage2 = sumMileage.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	document.getElementById('itemTotalPrice').innerHTML = sumMileage2+'원';
	
	var minusMileage = document.getElementById('minusMileage').innerHTML;
	var minusMileage2 = minusMileage.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	document.getElementById('minusMileage').innerHTML = minusMileage2+'원';
}

function changeSum() {
	itemTotal();
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
	if($("[name='selId']:checked").length == 0 ){
		alert('구매할 곡이 없습니다. 카트에 곡을 담아주세요.');
	} else {
	var str = document.getElementById("itemTotalPrice").innerHTML.slice(0, -1);
	var str2 = str.replace(",", "");
 	if(${mileage} < str2) {
	alert("잔액이 부족합니다.")		
	location.href="chargeForm.do";
} else {
	let list = [];
	$("[name='selId']:checked").each(function(i, checkbox){
	
	var tr = $(checkbox).parent().parent();
	var td = $(tr).children();
	var obj = {};
	
	var title = td.eq(2).text().trim(); 
	var artName = td.eq(3).text().trim(); 
	var price = td.eq(5).text().trim();
	var price2 = price.substring(0, price.length - 1);
	var id = td.eq(7).find("input").val();
	
	obj["title"] = title;
	obj["artName"] = artName;
	obj["price"] = price2;
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
	                location.href="usageHistoryOfMusic.do";
	            },
				error: function(request, status, error){
	                alert("결제에 실패하였습니다.");
	            }
	        });
  
    }}
}
	var sessionMileage = document.getElementById('sessionMileage').textContent
	var sessionMileage2 = sessionMileage.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	document.getElementById('sessionMileage').textContent = sessionMileage2+'원';

	for (var i=0; i<document.getElementsByClassName('price').length; i++) {
		var listMileage = document.getElementsByClassName('price')[i].textContent
		var listMileage2 = listMileage.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		document.getElementsByClassName('price')[i].textContent = listMileage2+'원';
 	}
</script>
