<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<!-- iamport.payment.js -->
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script>
   IMP.init('imp04405403');
   function requestPayCard() {
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
</script>
<body>
	<div class="def-block clearfix" align="center"
			style="color: white; font-size: 20px; margin-top: 50px;">
			충전 할 마일리지&nbsp;&nbsp;&nbsp;<input type="text" id="mileage"
				name="mileage" style="height: 15px; margin-top: 5px;">
		</div>
	출금 폼
	<button onclick="requestPayCard()" style="margin-left: 30px">
		<img src="${path}/prj/resources/images/payment/kakaopay.png"
			width="150" height="80">
	</button>
</body>
</html>