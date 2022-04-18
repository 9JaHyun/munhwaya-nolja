<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="resources" value="${pageContext.request.contextPath}/resources"/>
<div id="layout" class="full">
    <div class="under_header">
        <img src="${resources}/images/assets/breadcrumbs1.png" alt="#">
    </div><!-- under header -->

    <div class="page-content back_to_up">
        <div class="row clearfix mb">
            <div class="breadcrumbIn">
                <ul>
                    <li><a href="index.html" class="toptip" original-title="Homepage"> <i class="icon-home"></i> </a></li>
                    <li> 구매리스트 </li>
                </ul>
            </div><!-- breadcrumb -->
        </div>

        <div class="row row-fluid clearfix mbf">
            <div class="span8 posts">
                <div class="def-block" style="width:140%;">
                    <h4> 구매리스트 </h4><span class="liner"></span>

                    <div class="products shop clearfix">
                        <div class="grid_12">
                            <c:forEach items="${ticketLists}" var="ticketLists">
                            <div class="product grid_6" onclick="ticketListSearch(${ticketLists.id})" style="border: 1px solid white; width: 930px; margin-bottom:30px; border-radius: 10px;">
<%--                                 <img class="product_img" src="${resources}/images/assets/shop/${ticketList.performancevo.}" alt=""><!-- featured thumbnail --> --%>
<%--                                 <img class="product_img_hover" src="${resources}/images/assets/shop/${ticketList.qrcode}" alt=""><!-- featured thumbnail hover --> --%>
 								<div class="product_inner"><br>
                                    <h3> &nbsp;&nbsp;&nbsp;&nbsp;<a> ${ticketLists.performancevo.name } </a> </h3>
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<fmt:formatDate pattern = "MM월 dd일 HH시 mm분" value = "${ticketLists.performancevo.sdate }" /><br>
<%--                                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a>${ticketList.performancevo.edate }</a> --%>
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a>${ticketLists.performancevo.location }</a>
                                </div><br>
                            </div><!-- product -->
                            </c:forEach>
                        </div><!-- products -->
                    </div><!-- gridfull -->
                </div><!-- def block -->
            </div><!-- span8 posts -->
        </div><!-- row clearfix -->
    </div><!-- end page content -->
</div><!-- end layout -->
<div>
	<form id = "frm" action="ticketListSelect.do" method="post">
		<input type="hidden" id="id" name="id">
	</form>
</div>
<script type="text/javascript">
	function ticketListSearch(n) {
		console.log(n);
		frm.id.value = n;
		frm.submit();
	}
</script>