<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
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
                    <h4 style="border-bottom:none;"> 공연리스트 </h4>
				<div class="search_wrap" style="float:right;">
					<div class="search_area">
						<select style="width:70px;">
							<option value="제목">제목
						</select>
						<input type="text" name="keyword" value="${pageMake.cri.keyword }">
						<button class="tbutton small" style="height:32px; width:60px; margin-bottom:10px; font-size:10pt;">검색</button>
					</div>
				</div>
                    <span class="liner" style="margin-top:20px;"></span>
                    <div class="products shop clearfix">
                        <div class="grid_12" style="width:960px;">
                            <c:forEach items="${performances}" var="performances">
                            <div class="product grid_6" onclick="performanceSearch('${performances.id}')" style="width:300px;">
                                	<img class="product_img" src="api/picture/${performances.image }" style="margin-bottom:15px; width:300px; height:330px;">
<%--                                 <img class="product_img_hover" src="${resources}/images/assets/shop/${performances.image}" alt=""> --%>
                                <div class="product_inner" style="margin-bottom:5px;">
                                    <h3>${performances.name }</h3>
                                    <strong> <fmt:formatDate pattern = "MM월 dd일 HH시 mm분" value = "${performances.sdate }" /> ~ 
                                    <fmt:formatDate pattern = "MM월 dd일 HH시 mm분" value = "${performances.edate }" /> </strong>
                                </div>
                            </div><!-- product -->
                            </c:forEach>
                        </div><!-- products -->
                    </div><!-- gridfull -->
                    <div class="pagination-tt clearfix" style="margin-left: auto; margin-left: auto; margin-top:30px; width: 520px;">
        					<ul>
        					<!-- 이전페이지 버튼 -->
                			<c:if test="${pageMake.prev}">
                    			<li><a href="${pageMake.startPage-1}">Previous</a></li>
                			</c:if>
 			    			<!-- 각 번호 페이지 버튼 -->
                			<c:forEach var="num" begin="${pageMake.startPage}" end="${pageMake.endPage}">
                    			<li><a href="#" onclick="paging(${num})" class="deactive">${num}</a></li>
                			</c:forEach>
                			<!-- 다음페이지 버튼 -->
                			<c:if test="${pageMake.next}">
                   				<li><a href="${pageMake.endPage + 1 }">Next</a></li>
                			</c:if>  
        					</ul>
					</div>
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
<div>
	<form id="moveForm" method="get" action="performance">
        <input type="hidden" name="pageNum" value="${pageMake.cri.pageNum }">
        <input type="hidden" name="amount" value="${pageMake.cri.amount }">
        <input type="hidden" name="keyword" value="${pageMake.cri.keyword }">   
	</form>
</div>
<script type="text/javascript">
	function performanceSearch(n) {
		frm.id.value = n;
		frm.submit();
	}
	
	function paging(num) {
	      moveForm.pageNum.value = num;
//         moveForm.attr("action", "performance");
	      moveForm.submit();

	};
	
    $(".pageInfo a").on("click", function(e){
        e.preventDefault();
        moveForm.find("input[name='pageNum']").val($(this).attr("href"));
        moveForm.submit();
    });
    
    $(".search_area button").on("click", function(e){
        e.preventDefault();
        let val = $("input[name='keyword']").val();
        moveForm.keyword.value = val;
        moveForm.pageNum.value = 1;
        moveForm.submit();
    });
</script>