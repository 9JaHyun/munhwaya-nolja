<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="resources"
	value="${pageContext.request.contextPath}/resources" />
<script type="text/javascript" src="${resources}/js/jquery.min.js"></script>
<div id="layout" class="full">
	<div class="under_header" style="height: 230px;"></div>
	<!-- under header -->

	<div class="page-content back_to_up">

		<div class="row row-fluid clearfix mbf"
			style="padding-bottom: 100px; padding-left: 0px;">
			<div class="span8 posts">
				<div class="def-block" style="width: 140%;">
					<h4 style="border-bottom: none;">아티스트 승급 신청 리스트</h4>
					<div class="search_wrap" style="float: right;">
						<div class="search_area">
							<select style="width: 90px;">
								<option value="제목">아이디
							</select> <input type="text" name="keyword"
								value="${pageMake.cri.keyword }">
							<button class="tbutton small"
								style="height: 32px; width: 60px; margin-bottom: 10px; font-size: 10pt;">검색</button>
						</div>
					</div>
					<span class="liner" style="margin-top: 20px;"></span>
					<div class="products shop clearfix">
						<div class="grid_12" style="width: 960px;">
							<div class="mbf clearfix">
								<table class="table">
									<thead>
										<tr>
											<th scope="col" style="font-size: 13pt;">신청 회원 아이디</th>
											<th scope="col" style="font-size: 13pt;">신청일</th>
											<th scope="col" style="font-size: 13pt;">확정일</th>
											<th scope="col" style="font-size: 13pt;">처리상태</th>
											<th scope="col" style="font-size: 13pt;">결과</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${requestLists}" var="requestList">
											<tr>
												<td class="selReq" style="color: white;" data-toggle="modal" data-target="#myModal" data-dismiss="modal" aria-label="Close" data-mid="${requestList.memberId }">${requestList.memberId }</td>
												<td style="color: white;"><fmt:formatDate
														pattern="MM월 dd일 HH시 mm분"
														value="${requestList.createdAt }" /></td>
												<td style="color: white;"><fmt:formatDate
														pattern="MM월 dd일 HH시 mm분"
														value="${requestList.updatedAt }" /></td>
												<td class="status" style="color: white;"><c:choose>
														<c:when test="${requestList.status eq 'A01'}">
													승인
												</c:when>
														<c:when test="${requestList.status eq 'A02'}">
													거절
												</c:when>
														<c:when test="${requestList.status eq 'A03'}">
													대기
												</c:when>
													</c:choose></td>
												<td><c:choose>
														<c:when test="${requestList.status eq 'A03'}">
													대기
														</c:when>
														<c:otherwise>
													완료
												</c:otherwise>
													</c:choose></td>

											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
						<!-- products -->
					</div>
					<!-- gridfull -->
					<div class="pagination-tt clearfix"
						style="margin-left: auto; margin-top: 30px; width: 520px;">
						<ul>
							<!-- 이전페이지 버튼 -->
							<c:if test="${pageMake.prev}">
								<li><a href="${pageMake.startPage-1}">Previous</a></li>
							</c:if>
							<!-- 각 번호 페이지 버튼 -->
							<c:forEach var="num" begin="${pageMake.startPage}"
								end="${pageMake.endPage}">
								<li style="border: 1px solid white; margin-left: 5px;"><a
									href="#" onclick="paging(${num})" class="deactive">${num}</a></li>
							</c:forEach>
							<!-- 다음페이지 버튼 -->
							<c:if test="${pageMake.next}">
								<li><a href="${pageMake.endPage + 1 }">Next</a></li>
							</c:if>
						</ul>
					</div>
				</div>
				<!-- def block -->
			</div>
			<!-- span8 posts -->
		</div>
		<!-- row clearfix -->
	</div>
	<!-- end page content -->
</div>
<!-- end layout -->

<div>
	<form id="moveForm" method="get" action="judgeArtist">
		<input type="hidden" name="pageNum" value="${pageMake.cri.pageNum }">
		<input type="hidden" name="amount" value="${pageMake.cri.amount }">
		<input type="hidden" name="keyword" value="${pageMake.cri.keyword }">
	</form>
</div>

<!-- 승인 거절 모달 -->
<div class="modal fade def-block" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="top:30%; display:none;">
  <div class="modal-dialog ">
    <div class="modal-content ">
      <div class="modal-header" id="modalHeader">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span style="color:white" aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">서류, 작업물 확인</h4>
      </div>
      <h5>제출 서류</h5>
      <div><img id="uploadImage"></div>
      <h5>작업물</h5>
      <div id="artworkRead"style="color:white;"></div>
      <div class="modal-footer def-block">
        <button class="tbutton small permit" data-toggle="modal" data-target="#myModal" data-dismiss="modal" aria-label="Close"><span>승인</span></button>
        <button class="tbutton small refuse" data-toggle="modal" data-target="#myModal" data-dismiss="modal" aria-label="Close"><span>거절</span></button>
        <button class="tbutton small" data-dismiss="modal" aria-label="Close"><span>뒤로 가기</span></button>
      </div>
    </div>
  </div>
</div>
<!-- 승인 거절 모달 끝-->
<script type="text/javascript">
	function judgeArtistSearch(n) {
		frm.id.value = n;
		frm.submit();
	}
	
	function paging(num) {
	    moveForm.pageNum.value = num;
	    moveForm.submit();

	};
	
	for(var i = 0; i<document.getElementsByClassName('selReq').length; i++) {
	if(document.getElementsByClassName('selReq')[i].parentElement.childNodes[9].textContent.trim() == '완료')
		document.getElementsByClassName('selReq')[i].parentElement.childNodes[1].removeAttribute('data-toggle');
	}
		
	$('.selReq').on("click", function(e) {
		var id = $(event.target).data("mid");
		$.ajax({
			type:"POST",
			url: "judgeArtistOfMemberId",
			data: {"memberId" : id},
			dataType: "text",
			success: function(res){
				var obj = JSON.parse(res);
				artworkRead.innerHTML = obj.artwork;
				var img = obj.fileGroupId;
				var mid = obj.memberId;
				$('#uploadImage').attr('src', 'api/picture/'+img);
				$('.permit').data('mid', obj.memberId);
				$('.refuse').data('mid', obj.memberId);
    	    },
    	    error: function(error){
				alert("통신 실패!!");
    	    },
		})
	});
	
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
	
    $(".permit").on("click", function(e) {
		var id = $('.permit').data("mid");    	
    	$.ajax({
    	    type: "POST",
    	    url: "judgeResultOfArtist",
    	    data: {"status" : "A01", "memberId" : id},
    	    dataType:"text",
    	    success: function(res){
				alert("공연이 승인되었습니다.");
				location.href="judgeArtist";
    	    },
    	    error: function(error){
				alert("통신 실패!!");
    	    },
    	});
    });
    
    $(".refuse").on("click", function(e) {
		var id = $('.refuse').data("mid");    	
    	$.ajax({
    	    type: "POST",
    	    url: "judgeResultOfArtist",
    	    data: {"status" : "A02", "memberId" : id},
    	    dataType:"text",
    	    success: function(res){
    	    	alert("공연이 거절되었습니다.");
    	    	location.href="judgeArtist";
    	    },
    	    error: function(error){
				alert("통신 실패!!");
    	    },
    	});
    });
    
</script>