<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="rootPath" value="${pageContext.request.contextPath}"/>
<script type="text/javascript"
        src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<!-- iamport.payment.js -->
<script type="text/javascript"
        src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script>
    function requestPayKaKao() {
        // IMP.request_pay(param, callback) 결제창 호출
        if ($('#mileage').val() == 0) {
            alert('충전할 금액을 입력 해주세요.');
        } else {
            IMP.request_pay({ // param
                pg: "kakaopay",
                pay_method: "card",
                merchant_uid: 'merchant_' + new Date().getTime(),
                name: "마일리지 충전",
                amount: mileage.value,
                buyer_email: document.getElementById('memberId').value,
                buyer_name: "테스트",
                buyer_tel: "테스트",
                buyer_addr: "테스트",
            }, function (rsp) {
                if (rsp.success) {
                    var msg = '결제가 완료되었습니다.';
                    msg += '결제 상품명 : ' + "마일리지 충전";
                    msg += '결제 금액 : ' + rsp.paid_amount;

                    $.ajax(
                        {
                            url: "charge",
                            type: "post",
                            data: {
                                "mileage": mileage.value,
                                "memberId": document
                                .getElementById('memberId').value,
                                "type": "P01"
                            },
                        }).done(function () {
                        location.href = "walletInfoSelect.do";
                    });
                } else {
                    var msg = '결제에 실패하였습니다.';
                    msg += '에러내용 : ' + rsp.error_msg;
                }
                alert(msg);
            });
        }
    }

    function requestPaySmilePay() {
        if ($('#mileage').val() == 0) {
            alert('충전할 금액을 입력 해주세요.');
        } else {
            IMP.request_pay({ // param
                pg: "smilepay",
                pay_method: "card",
                merchant_uid: 'merchant_' + new Date().getTime(),
                name: "마일리지 충전",
                amount: mileage.value,
                buyer_email: document.getElementById('memberId').value,
                buyer_name: "테스트",
                buyer_tel: "테스트",
                buyer_addr: "테스트",
            }, function (rsp) {
                if (rsp.success) {
                    var msg = '결제가 완료되었습니다.';
                    msg += '결제 상품명 : ' + "마일리지 충전";
                    msg += '결제 금액 : ' + rsp.paid_amount;

                    $
                    .ajax({
                        url: "charge",
                        type: "post",
                        data: {
                            "mileage": mileage.value,
                            "memberId": document
                            .getElementById('memberId').value,
                            "type": "P02"
                        },
                    });
                    location.href = "walletInfoSelect.do";
                } else {
                    var msg = '결제에 실패하였습니다.';
                    msg += '에러내용 : ' + rsp.error_msg;
                }
                alert(msg);
            });
        }
    }

    function requestPayCard() {
        if ($('#mileage').val() == 0) {
            alert('충전할 금액을 입력 해주세요.');
        } else {
            IMP.request_pay({ // param
                pg: "html5_inicis",
                pay_method: "card",
                merchant_uid: 'merchant_' + new Date().getTime(),
                name: "마일리지 충전",
                amount: mileage.value,
                buyer_email: document.getElementById('memberId').value,
                buyer_name: "테스트",
                buyer_tel: "테스트",
                buyer_addr: "테스트",
            }, function (rsp) {
                if (rsp.success) {
                    var msg = '결제가 완료되었습니다.';
                    msg += '결제 상품명 : ' + "마일리지 충전";
                    msg += '결제 금액 : ' + rsp.paid_amount;

                    $
                    .ajax({
                        url: "charge",
                        type: "post",
                        data: {
                            "mileage": mileage.value,
                            "memberId": document
                            .getElementById('memberId').value,
                            "type": "P03"
                        },
                    });
                    location.href = "walletInfoSelect.do";
                } else {
                    var msg = '결제에 실패하였습니다.';
                    msg += '에러내용 : ' + rsp.error_msg;
                }
                alert(msg);
            });
        }
    }
</script>
<div class="def-block clearfix">
    <div align="right" style="margin-bottom: 50px;">
        <h4>마일리지 충전</h4>
        <div>
            <div class="def-block clearfix" align="center"
                 style="color: white; font-size: 20px;">
                충전 할 마일리지<input type="text" id="mileage" name="mileage"
                                placeholder="충전할 금액을 입력 해주세요."
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
            <div id="paylist" align="center"></div>
        </div>
        <div align="right">
            <a href="walletInfo.do" class="tbutton small"
               style="margin-top: 50px"><span>목록으로</span></a>
        </div>
        <input type="hidden" id="memberId" value="${memberId }">
    </div>
</div>
<script>
    function payChange() {
        var value = document.getElementById('pay').value
        if (value == 'imp66890146') {
            IMP.init('imp66890146');
            $('#kakaoPay').remove();
            $('#smilePay').remove();
            $('#kgInicis').remove();

            var btn = $("<button>").attr('id', 'kakaoPay').attr('onclick',
                'requestPayKaKao()').attr('style', 'margin-left: 30px');
            var kakaoPay = $('<img>').attr('src',
                '${rootPath}/resources/images/payment/kakaopay.png').attr(
                'style', 'width:150px; height:75px;');
            btn.append(kakaoPay);
            $('#paylist').append(btn);
        } else if (value == 'imp04405403') {
            IMP.init('imp04405403');
            $('#kakaoPay').remove();
            $('#smilePay').remove();
            $('#kgInicis').remove();

            var btn2 = $("<button>").attr('id', 'smilePay').attr('onclick',
                'requestPaySmilePay()').attr('style', 'margin-left: 30px');
            var smilePay = $('<img>').attr('src',
                '${rootPath}/resources/images/payment/smilepay.png').attr(
                'style', 'width:150px; height:75px;');
            btn2.append(smilePay);
            $('#paylist').append(btn2);
        } else if (value == 'imp00514439') {
            IMP.init('imp00514439');
            $('#kakaoPay').remove();
            $('#smilePay').remove();
            $('#kgInicis').remove();

            var btn3 = $("<button>").attr('id', 'kgInicis').attr('onclick',
                'requestPayCard()').attr('style', 'margin-left: 30px');
            var kgInicis = $('<img>').attr('src',
                '${rootPath}/resources/images/payment/kginicis.jpg').attr(
                'style', 'width:150px; height:75px;');
            btn3.append(kgInicis);
            $('#paylist').append(btn3);
        }
    }
</script>