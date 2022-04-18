<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div align="right" style="margin-bottom: 50px; height: 400px;">
	<h4>구매한 공연</h4>

	<div class="grid_12 tt"
		style="border: none; padding-top: 50px; padding-bottom: 30px;">
		<c:forEach items="${ticketLists}" var="ticketLists">
			<div class="product grid_6"
				onclick="ticketListSearch(${ticketLists.id})"
				style="border: 1px solid white; width: 610px; margin-bottom: 30px; border-radius: 10px;">
				<div class="product_inner" style="text-align: left; margin-left:20px; margin-bottom:20px; float:left;">
					<br>
					<h3>
						<a> ${ticketLists.performancevo.name }</a>
					</h3>
					<a>시작시간 : <fmt:formatDate pattern="MM월 dd일 HH시 mm분" value="${ticketLists.performancevo.sdate }" /></a>
					<br>
					<a>종료시간 : <fmt:formatDate pattern="MM월 dd일 HH시 mm분" value="${ticketLists.performancevo.edate }" /></a>
					<br>
					<a>예매시간 : <fmt:formatDate pattern="MM월 dd일 HH시 mm분" value="${ticketLists.time }" /></a>
				</div>
					<div style="float:right; margin-top:55px; margin-right:30px; font-size:25pt;">
						<span class="box1">
							<span aria-hidden="true" class="icons-arrow-right"></span>
						</span>
					</div>
				<br>
			</div>
			<!-- product -->
		</c:forEach>
	</div>
	<!-- products -->
</div>
<div>
	<form id="frm" action="ticketListSelect.do" method="post">
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