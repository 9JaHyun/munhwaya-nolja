<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="resources" value="${pageContext.request.contextPath}/resources"/>
<div class="under_header">
    <img src="${resources}/images/assets/breadcrumbs1.png" alt="#">
</div>
<!-- under header -->

<div class="page-content back_to_up">
    <div class="row clearfix mb">
        <div class="breadcrumbIn">
            <ul>
                <li><a href="index.html" class="toptip" title="Homepage">
                    <i class="icon-home"></i>
                </a></li>
                <li><a href="performance.do"> 공연 </a></li>
                <li>공연 상세정보</li>
            </ul>
        </div>
        <!-- breadcrumb -->
    </div>

    <div class="row row-fluid clearfix mbf">
        <div class="span8 posts">
            <div class="def-block" style="width:600px;">
                <h4>공연 상세정보</h4>
                <span class="liner"></span>

                <div class="products shop clearfix">
                    <div class="grid_12">
                        <div class="clearfix mbs">
                            <div class="grid_6"
                                 style="border: 1px solid white; width: 250px; height: 300px; margin-top:30px;">
                                <div>
                                    <img src="api/picture/${performance.image }"
                                         style="width: 250px; height: 300px;">
                                </div>
                            </div>
                            <!-- grid6 -->

                            <div class="grid_6" style="margin-left:33px;">
                                <h3 style="font-size: 25pt; margin-bottom: 30px;">${performance.name }</h3>
                                <br>
                                <div style="margin-bottom: 10px">
                                    <strong style="font-size: 14pt;">아티스트</strong>
                                    <span style="margin-left:30px; color:white; font-size:13pt;">${artistname }</span>
                                </div>
                                <br>
                                <div style="margin-bottom: 10px">
                                    <strong style="font-size: 14pt;">공연장소</strong>
                                    <span style="margin-left:30px; color:white; font-size:13pt;">${performance.location }</span>
                                </div>
                                <br>
                                <div style="margin-bottom: 10px">
                                    <strong style="font-size: 14pt">공연시작일</strong>
                                    <span style="margin-left:13px; color:white; font-size:13pt;"><fmt:formatDate
                                            pattern="MM월 dd일 HH시 mm분"
                                            value="${performance.sdate }"/></span>
                                </div>
                                <br>
                                <div style="margin-bottom: 10px">
                                    <strong style="font-size: 14pt">공연종료일</strong>
                                    <span style="margin-left:13px; color:white; font-size:13pt;"><fmt:formatDate
                                            pattern="MM월 dd일 HH시 mm분"
                                            value="${performance.edate }"/></span>
                                </div>
                                <br>
                                <div style="margin-bottom: 10px">
                                    <strong style="font-size: 14pt;">공연가격</strong>
                                    <span id="gMileage"
                                          style="margin-left:30px; color:white; font-size:13pt;">${performance.price }</span>
                                </div>
                            </div>
                            <!-- grid6 -->
                        </div>
                        <!-- clearfix -->


                        <div class="clearfix mbs">
                            <ul class="tabs">
                                <li><a href="#t-1" class="active">공연내용</a></li>
                            </ul>
                            <!-- tabs -->

                            <ul class="tabs-content">
                                <li id="t-1" class="active"><strong>${performance.content }</strong>
                                </li>
                                <!-- tab content -->
                            </ul>
                            <!-- end tabs -->
                        </div>
                        <!-- clearfix -->

                    </div>
                    <!-- grid12 -->
                </div>
                <!-- products -->
            </div>
            <!-- def block -->
        </div>
        <!-- span8 posts -->

        <div class="span4 sidebar">
            <div class="def-block widget">
                <h4>가격</h4>
                <span class="liner"></span>
                <div class="widget-content">
                    <table class="total_w_table" cellspacing="0">
                        <tbody>
                        <tr class="cart-subtotal">
                            <th><strong>보유중인 마일리지</strong></th>
                            <td><span id="currentMileage"
                                      style="margin-left:10px; color:white; font-size:13pt;">${mileage }</span>
                            </td>
                        </tr>
                        <tr class="total">
                            <th><strong>결제 금액</strong></th>
                            <td><span id="price"
                                      style="margin-left:10px; color:white; font-size:13pt;">0</span>
                            </td>
                        </tr>
                        <tr class="total">
                            <th><strong>잔여 마일리지</strong></th>
                            <td><span id="totalMileage"
                                      style="margin-left:10px; color:white; font-size:13pt;">${mileage }</span>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                    <br><br><br>
                    <h4>티켓수량</h4>
                    <span class="liner"></span>
                    <select id="option" name="select" style="width:275px; margin-bottom:20px;"
                            onchange="changeMileage(this.value)">
                        <option value="" selected>수량 선택</option>
                        <c:choose>
                            <c:when test="${performance.performancepersonalvo.personal > 45}">
                                <c:forEach var="i" begin="1"
                                           end="${50 - performance.performancepersonalvo.personal}">
                                    <option value="${i}">${i}매</option>
                                </c:forEach>
                            </c:when>
                            <c:otherwise>
                                <c:forEach var="i" begin="1" end="5">
                                    <option value="${i}">${i}매</option>
                                </c:forEach>
                            </c:otherwise>
                        </c:choose>
                    </select>

                    <span class="liner"></span>
                    <c:choose>
                        <c:when test="${performance.performancepersonalvo.personal >= 50}">
                            <button class="tbutton mt medium" style="width:275px;">
                                <span>품절되었습니다.</span>
                            </button>
                        </c:when>
                        <c:otherwise>
                            <button onclick="ticketListInsert(${performance.id})"
                                    type="button" class="tbutton mt medium" name="update_cart"
                                    style="width:275px;">
                                <span>구매하기</span>
                            </button>
                        </c:otherwise>
                    </c:choose>
                </div>
                <!-- widget content -->
            </div>
            <!-- widget shop cart -->
        </div>
        <!-- span4 sidebar -->
        
                <div class="span4 sidebar">

            <div class="def-block widget">
                <h4>좌석배치도</h4>
                <span class="liner"></span>
                <div>
                	<img src="api/picture/좌석배치도.jpg">
                </div>
            </div>
            <!-- span4 sidebar -->
        </div>
        
        
    </div>
    <!-- end page content -->
</div>
<!-- end layout -->
<div>
    <form id="ticketFrm" action="ticketListInsert.do" method="get">
        <input type="hidden" id="id" name="id">
        <input type="hidden" id="person" name="person">
    </form>
</div>
<script type="text/javascript">
    var currentMileage = ${mileage};
    var currentWon = currentMileage.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
    document.getElementById('currentMileage').innerHTML = currentWon + '원';
    document.getElementById('totalMileage').innerHTML = currentWon + '원';
    
    var gMileage = ${performance.price};
    var gMileageWon = gMileage.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
    document.getElementById('gMileage').innerHTML = gMileageWon + '원';

    function changeMileage(value) {
        let price = '${performance.price }' * value
        var won = price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
        $("#price").html(won + '원')
        let mileage = '${mileage}' - price
        var totalWon = mileage.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
        $("#totalMileage").html(totalWon + '원')
    }

    function ticketListInsert(n) {
    	var str = document.getElementById("price").innerHTML.slice(0, -1);
    	var str2 = str.replace(",", "");
    	if(${mileage} < str2) {
        	alert("잔액이 부족합니다.")		
        	location.href="chargeForm.do";
    	} else {
        ticketFrm.id.value = n;
        var num = $('#option').val();
        ticketFrm.person.value = num;
        ticketFrm.submit();
        alert("예매가 완료되었습니다.");
    	}
    }
    
</script>