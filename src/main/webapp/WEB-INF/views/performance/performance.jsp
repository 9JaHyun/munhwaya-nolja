<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="resources" value="${pageContext.request.contextPath}/resources"/>
<div id="layout" class="full">
    <div class="under_header">
        <img src="${resources}/images/assets/breadcrumbs10.png" alt="#">
    </div><!-- under header -->

    <div class="page-content back_to_up">
        <div class="row clearfix mb">
            <div class="breadcrumbIn">
                <ul>
                    <li><a href="index.html" class="toptip" original-title="Homepage"> <i class="icon-home"></i> </a></li>
                    <li> 공연 </li>
                </ul>
            </div><!-- breadcrumb -->
        </div>

        <div class="row row-fluid clearfix mbf">
            <div class="span8 posts">
                <div class="def-block" style="width:140%;">
                    <h4> 공연리스트 </h4><span class="liner"></span>

                    <div class="products shop clearfix">
                        <div class="grid_12" style="width:960px;">
                            <c:forEach items="${performances}" var="performances">
                            <div class="product grid_6" onclick="performanceSearch('${performances.id}')" style="width:300px;">
                                <img class="product_img" src="${resources}/images/assets/shop/1.jpg" style="margin-bottom:15px;">
<%--                                 <img class="product_img_hover" src="${resources}/images/assets/shop/${performances.image}" alt=""> --%>
                                <div class="product_inner" style="margin-bottom:5px;">
                                    <h3> <a> ${performances.name } </a> </h3>
                                    <strong> ${performances.sdate } ~ ${performances.edate } </strong>
                                </div>
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
	<form id = "frm" action="performanceSelect.do" method="post">
		<input type="hidden" id="id" name="id">
	</form>
</div>
<script type="text/javascript">
	function performanceSearch(n) {
		frm.id.value = n;
		frm.submit();
	}
</script>