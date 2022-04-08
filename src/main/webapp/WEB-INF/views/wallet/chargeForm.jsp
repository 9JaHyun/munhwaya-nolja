<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<!-- iamport.payment.js -->
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script>
   
   function requestPayKaKao() {
      // IMP.request_pay(param, callback) 결제창 호출
      IMP.request_pay({ // param
         pg : "kakaopay",
         pay_method : "card",
         merchant_uid : 'merchant_' + new Date().getTime(),
         name : "마일리지 충전",
         amount : mileage.value,
         buyer_email : "test0@gmail.com",
<%--         	"<%=(String)session.getAttribute("id")%>", --%>
         buyer_name : "테스트",
         buyer_tel : "테스트",
         buyer_addr : "테스트",
      }, function(rsp) {
    	    if ( rsp.success ) {
    	    	var msg = '결제가 완료되었습니다.';
//      	        msg += '고유ID : ' + rsp.imp_uid;
//      	        msg += '상점 거래ID : ' + rsp.merchant_uid;
//      	        msg += '결제 상품명 : ' + "마일리지 충전";
     	        msg += '결제 금액 : ' + rsp.paid_amount;
     	        
    	    	$.ajax({
    	    		url: "charge",
    	    		type:"post",
    	    		data:{"mileage" : mileage.value,
    	    			  "memberId" : "test1@gmail.com",
    	    			  "type" : "P01"
    	    		},
    	    	}).done(function() {
			    	location.href="walletInfoSelect.do";
    	    	});
    	    } else {
    	        var msg = '결제에 실패하였습니다.';
    	        msg += '에러내용 : ' + rsp.error_msg;
    	    	location.href ="chargeForm.do";
    	    }
    	    alert(msg);
    	});
      
   }
   
   function requestPaySmilePay() {
      // IMP.request_pay(param, callback) 결제창 호출
      IMP.request_pay({ // param
         pg : "smilepay",
         pay_method : "card",
         merchant_uid : 'merchant_' + new Date().getTime(),
         name : "마일리지 충전",
         amount : mileage.value,
         buyer_email : "test0@gmail.com",
<%--         	"<%=(String)session.getAttribute("id")%>", --%>
         buyer_name : "테스트",
         buyer_tel : "테스트",
         buyer_addr : "테스트",
      }, function(rsp) {
    	    if ( rsp.success ) {
    	    	var msg = '결제가 완료되었습니다.';
//      	        msg += '고유ID : ' + rsp.imp_uid;
//      	        msg += '상점 거래ID : ' + rsp.merchant_uid;
//      	        msg += '결제 상품명 : ' + "마일리지 충전";
     	        msg += '결제 금액 : ' + rsp.paid_amount;
     	        
    	    	$.ajax({
    	    		url: "charge",
    	    		type:"post",
    	    		data:{"mileage" : mileage.value,
    	    			  "memberId" : "test1@gmail.com",
    	    			  "type" : "P02"
    	    		},
    	    	});
    	    	location.href="walletInfoSelect.do";
    	    } else {
    	        var msg = '결제에 실패하였습니다.';
    	        msg += '에러내용 : ' + rsp.error_msg;
    	    	location.href ="chargeForm.do";
    	    }
    	    alert(msg);
    	});
      
   }
   
   function requestPayCard() {
	      // IMP.request_pay(param, callback) 결제창 호출
	      IMP.request_pay({ // param
	         pg : "html5_inicis",
	         pay_method : "card",
	         merchant_uid : 'merchant_' + new Date().getTime(),
	         name : "마일리지 충전",
	         amount : mileage.value,
	         buyer_email : "test0@gmail.com",
	<%--         	"<%=(String)session.getAttribute("id")%>", --%>
	         buyer_name : "테스트",
	         buyer_tel : "테스트",
	         buyer_addr : "테스트",
	      }, function(rsp) {
	    	    if ( rsp.success ) {
	    	    	var msg = '결제가 완료되었습니다.';
//	      	        msg += '고유ID : ' + rsp.imp_uid;
//	      	        msg += '상점 거래ID : ' + rsp.merchant_uid;
//	      	        msg += '결제 상품명 : ' + "마일리지 충전";
	     	        msg += '결제 금액 : ' + rsp.paid_amount;
	     	        
	    	    	$.ajax({
	    	    		url: "charge",
	    	    		type:"post",
	    	    		data:{"mileage" : mileage.value,
	    	    			  "memberId" : "test1@gmail.com",
	    	    			  "type" : "P03"
	    	    		},
	    	    	});
	    	    	location.href="walletInfoSelect.do";
	    	    } else {
	    	        var msg = '결제에 실패하였습니다.';
	    	        msg += '에러내용 : ' + rsp.error_msg;
	    	    	location.href ="chargeForm.do";
	    	    }
	    	    alert(msg);
	    	});
	      
	   }
</script>
<div class="def-block clearfix">
	<div align="right" style="margin-bottom: 50px;">
		<h4>마일리지 충전</h4>
		<div>
<!-- 			<div class="def-block clearfix" align="center" -->
<!-- 				style="color: white; font-size: 20px; margin-top: 50px;"> -->
<!-- 				현재 보유중인 마일리지<input type="text" id="mileage" name="mileage" -->
<!-- 					style="height: 15px; margin-top: 5px; margin-left: 20px;" required="required"> -->
<!-- 			</div> -->
			<div class="def-block clearfix" align="center"
				style="color: white; font-size: 20px;">
				충전 할 마일리지<input type="text" id="mileage" name="mileage"
					style="height: 15px; margin-top: 5px; margin-left: 20px;">
			</div>
			<div class="def-block clearfix" align="center"
				style="color: white; font-size: 20px; padding-top: 0px;">
				충전 수단 &nbsp;<select id="pay" name="pay" onchange="payChange()"
					style="height: 30px; margin-top: 5px; margin-left: 75px;">
					<option value="">충전 수단을 선택해주세요</option>
					<option value="imp66890146">카카오 페이</option>
					<option value="imp04405403">스마일 페이</option>
					<option value="imp00514439">카드 결제(KG 이니시스)</option>
				</select>
			</div>
			<!-- 		<div align="center" -->
			<!-- 			style="color: white; font-size: 20px; margin-bottom: 100px; margin-top: 50px;"> -->
			<!-- 			충전 수단</div> -->
			<button onclick="requestPayKaKao()" style="margin-left: 30px"
				id="kakaoPay" value="imp66890146">
				<img src="${path}/resources/images/payment/kakaopay.png" style="width:150px; height:75px;">
			</button>
			<button onclick="requestPaySmilePay()" style="margin-left: 30px"
				id="smilePay" value="imp04405403">
				<img src="${path}/resources/images/payment/smilepay.png" style="width:150px; height:75px;">
			</button>
			<button onclick="requestPayCard()" style="margin-left: 30px"
				id="smilePay" value="imp00514439">
				<img src="${path}/resources/images/payment/kginicis.jpg" style="width:150px; height:75px;">
			</button>
		</div>
		<div align="right">
			<a href="walletInfo.do" class="tbutton small"
				style="margin-top: 50px"><span>뒤로가기</span></a>
		</div>
		
	</div>
</div>
<script>
function payChange() {
	var value = document.getElementById('pay').value
	if (value == 'imp66890146') {
		IMP.init('imp66890146');
// 		requestPayKaKao();
	} else if (value == 'imp04405403') {
		IMP.init('imp04405403');
// 		requestPaySmilePay();
	} else if (value == 'imp00514439') {
		IMP.init('imp00514439');
	}
	}	
</script>