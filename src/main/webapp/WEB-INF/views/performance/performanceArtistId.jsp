<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="resources" value="${pageContext.request.contextPath}/resources" />
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<div align="right" style="margin-bottom: 50px; height: 400px;">
	<h4>공연리스트</h4>
		<div class="products shop clearfix">
			<div class="grid_12" style="width: 960px; margin-top:20px;">
				<div class="mbf clearfix">
					<table class="table">
						<thead>
							<tr>
								<th scope="col" style="font-size: 13pt;">공연명</th>
								<th scope="col" style="font-size: 13pt;">공연시작일</th>
								<th scope="col" style="font-size: 13pt;">공연마감일</th>
								<th scope="col" style="font-size: 13pt;">공연장소</th>
								<th scope="col" style="font-size: 13pt;">처리상태</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${pba}" var="pbas">
								<tr onclick="performanceArtist('${pbas.id}')">
									<td style="color: white;">${pbas.name }</td>
									<td style="color: white;"><fmt:formatDate
											pattern="MM월 dd일 HH시 mm분" value="${pbas.sdate }" /></td>
									<td style="color: white;"><fmt:formatDate
											pattern="MM월 dd일 HH시 mm분" value="${pbas.edate }" /></td>
									<td style="color: white;">${pbas.location }</td>
									<td class="status" style="color: white;">${pbas.status }</td>
<!-- 									<td> -->
<%-- 										<button data-pid="${performances.id }" --%>
<!-- 											class="tbutton small success" -->
<!-- 											style="height: 25px; width: 50px;">승인</button> -->
<%-- 										<button data-pid="${performances.id }" --%>
<!-- 											class="tbutton small fail" style="height: 25px; width: 50px;">거절</button> -->
<!-- 									</td> -->
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
			<!-- products -->
		</div>
		<!-- gridfull -->
	</div>	
<div>
	<form id = "frm" action="performanceDetail" method="post">
		<input type="hidden" id="id" name="id">
	</form>
</div>	
<script type="text/javascript">

function performanceArtist(n) {
	frm.id.value = n;
	frm.submit();
}

//     $(".success").on("click", function(e) {
// 		var id = $(event.target).data("pid");    	
//     	$.ajax({
//     	    type: "POST",
//     	    url: "performanceSelect",
//     	    data: {"status" : "A01", "performanceId" : id},
//     	    dataType:"text",
//     	    success: function(res){
// 				alert("공연이 승인되었습니다.");
// 				location.href="performanceList";
//     	    },
//     	    error: function(error){
//     	    	alert("fail");
//     	    },
//     	});
//     });
</script>