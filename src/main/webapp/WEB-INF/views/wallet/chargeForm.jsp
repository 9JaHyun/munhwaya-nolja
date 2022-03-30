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
   IMP.init('imp66890146');
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
    	    			  "memberId" : "test0@gmail.com"
    	    		},
    	    	});
    	    } else {
    	        var msg = '결제에 실패하였습니다.';
    	        msg += '에러내용 : ' + rsp.error_msg;
    	        location.href ="chargeForm";
    	    }
    	    alert(msg);
    		location.href="";
    	});
   }
</script>
<div class="def-block clearfix">
	<div align="right" style="margin-bottom: 50px;">
	<h4>마일리지 충전</h4>
	<div>
		<div class="def-block clearfix" align="center"
			style="color: white; font-size: 20px; margin-top: 50px;">
			충전 할 마일리지&nbsp;&nbsp;&nbsp;<input type="text" id="mileage"
				name="mileage" style="height: 15px; margin-top: 5px;">
		</div>
		<div align="center"
			style="color: white; font-size: 20px; margin-bottom: 100px; margin-top: 50px;">
			충전 수단</div>
		<button onclick="requestPayKaKao()" style="margin-left: 30px">
			<img src="${path}/resources/images/payment/kakaopay.png" width="150"
				height="80">
		</button>
		<button onclick="requestPayKaKao()" style="margin-left: 30px">
			<img src="${path}/resources/images/payment/kakaopay.png" width="150"
				height="80">
		</button>
		<button onclick="requestPayKaKao()" style="margin-left: 30px">
			<img src="${path}/resources/images/payment/kakaopay.png" width="150"
				height="80">
		</button>
	</div>
	<div align="right">
                <a href="walletInfo.do" class="tbutton small" style="margin-top:50px"><span>뒤로가기</span></a>
    </div>
</div>
</div>