<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="rootPath" value="${pageContext.request.contextPath}"/>
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
<div id="fluidGridSystem">
    <div id="layout" class="full">
        <div class="under_header">
            <img src="${rootPath}/resources/images/assets/breadcrumbs13.png" alt="#">
        </div>

        <div class="page-content back_to_up">
            <div class="row row-fluid clearfix mbf">
                <div class="posts">
                    <div class="def-block">
                        <div class="tac error-page clearfix">
                            <i class="icon-warning-sign"></i>
                            <h2 class="tac"> 페이지를 찾을 수 없습니다.
                                <small>해당 페이지는 이전에 삭제되었거나 변경되었습니다</small>
                            </h2>
                            <div><input type="text" id="mileage" name="mileage" ></div>
                            <div><button onclick="requestPayKaKao()"><img src="${rootPath}/resources/images/payment/kakaopay.png" width="100" height="80"></button></div>
                            <div>
                            	<a href="requestPayKaKao()">
                            	
                            	</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>