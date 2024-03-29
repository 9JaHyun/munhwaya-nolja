<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<style>
.pageInfo {
  	 list-style: none;
   	 display: inline-block;
	}
	
	.pageInfo li {
	   float: left;
	   font-size: 1px;
	   padding: 7px;
	   font-weight: 500;
	}
	
	a:link {
	   color: white;
	   text-decoration: none;
	}
	
	a:visited {
	   color: white;
	   text-decoration: none;
	}
	
	a:hover {
	   color: white;
	   text-decoration: underline;
	}
	
	.active {
	   background-color: #cdd5ec;
	}
	
	.search_area {
	   display: inline-block;
	   margin-top: 30px;
	   margin-left: 260px;
	}
	
	.search_area input {
	   height: 30px;
	   width: 250px;
	}
	
	.search_area button {
	   width: 100px;
	   height: 36px;
	}
	div,tbody, td, tr, table{
		vertical-align: middle;
		color: white;
	}
	
	tr {
	margin-bottom: 100px;
	}
</style>
	<!--(배경이미지) -->
	<div class="under_header" style="height:70px">
		<img src="resources/images/bg/musicBB.jpg" alt="" style="height: 1700px;">
	</div>
	<!-- content -->
	<div class="page-content back_to_up">
		<!-- 최상단메인칸 -->
		<div class="row row-fluid clearfix mbf">
			<!-- 검색바 -->
			<div class="little-head row">
				<div class="search">
					<form action="searchResult" id="search" method="get" >
						<input id="title" name="title" type="text"
							style="font-size:small; width: 1000px; height: 60px; "
							placeholder="노래명, 앨범명 입력">
						<button type="submit" style="margin-top:15px; margin-right:10px;">
							<i class="icon-search" style="font-size: 25px;"></i>
						</button>
					</form>
				</div>
			</div>
		</div>
		<!-- 검색바 끝-->
		<div class="row row-fluid clearfix mbf">
				<div class="posts">
					<div class="def-block">
						<h4> 검색결과 </h4>
						<button type="button" class="tbutton medium" onclick="ListaddCart()" style="font-size:10px; margin-bottom:7px; margin-left: 7px">
							<span>선택구매</span>
						</button>
						<span class="liner"></span>
						<div class="products shop clearfix">
							<div class="grid_12">
									<div class="bag_table">
										<table class="shop_table footable tablet footable-loaded" style="width:100%;">
											<thead>
												<tr>
													<th style="width: 50px;" ><input style="margin-right:30px" type="checkbox" id="allCheck"></th>
													<th></th>
													<th style="width: 300px;"><h4>제목</h4></th>
													<th><h4>가수</h4></th>
													<th><h4>앨범</h4></th>
													<th><h4>구매</h4></th>
												</tr>
											</thead>
											<tbody>
												<c:forEach var="music" items="${musicSelectListByTitle1}">
												<tr class="cart_table_item" style="text-align: center; font-size:medium;">
													<c:choose>
					                            		<c:when test="${!music.purchase }">
															<td style="vertical-align: middle;"><input class="all" style="margin-right:30px" name="buyCheck" type="checkbox" value="${music.id }"></td>
														</c:when>
														<c:otherwise>
				                                           <td></td>
				                                    	</c:otherwise>
												</c:choose>
													<td class="product-thumbnail" style="width:70px;">
													<a href="streaming?id=${music.id }"><img src="api/picture/${music.picture }" alt="#" style="max-width:70px; min-width:70px; max-height :80px; min-height:80px; margin: 10px 0px 10px 0px;"></a>
													</td>
													<td class="product-name">
														<a href="streaming?id=${music.id }">${music.title}</a>
													</td>
													<td class="product-name">
														<a href="artistDetail?artId=${music.artId }">${music.artName }</a>
													</td>
													<td class="product-name">
														${music.title }
													</td>
													<td class="product-name">
														<c:choose>
				                                            <c:when test="${!music.purchase }">
				                                                <button type="button" class="tbutton medium" onclick="addCart()" style="font-size:10px">
				                                             		<span data-musicid="${music.id }">구매</span>
				                                                </button>
				                                            </c:when>
			                                            	<c:otherwise>
			                                            		<span>이미 구매하셨습니다.</span>
			                                            	</c:otherwise>
                                            			 </c:choose>
													</td>
												</tr>
												</c:forEach>
											</tbody>
										</table>
									</div><!-- bag table -->
							</div><!-- grid12 -->
						</div><!-- products -->

					</div><!-- def block -->
				</div><!-- span8 posts -->
			</div><!-- row clearfix -->
			<!-- 크기지정  post 끝-->
			<!-- 왼쪽 상단메인 끝 -->
	<!--페이지 -->
	<div class="pageInfo_wrap">
      <div class="pageInfo_area" style="text-align: center;">
         <ul id="pageInfo" class="pageInfo">
            <!-- 이전페이지 버튼 -->
            <c:if test="${pageMaker.prev}">
               <li class="pageInfo_btn previous"><a href="#"
                  onclick="paging(${pageMaker.startPage-1})">Previous</a></li>
            </c:if>
            <!-- 각 번호 페이지 버튼 -->
            <c:forEach var="num" begin="${pageMaker.startPage}"
               end="${pageMaker.endPage}">
               <li class="pageInfo_btn ${pageMaker.cri.pageNum == num ? "active":""}"><a
                  href="#" onclick="paging(${num})">${num}</a></li>
            </c:forEach>
            <!-- 다음페이지 버튼 -->
            <c:if test="${pageMaker.next}">
               <li class="pageInfo_btn next"><a href="#"
                  onclick="paging(${pageMaker.endPage + 1})">Next</a></li>
            </c:if>
         </ul>
      </div>
   </div>
</div>
		<!-- content끝 -->
<form id="moveForm" method="get" action="searchResultMusic">
	  <input type="hidden" name="title" value="${title }">
      <input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
      <input type="hidden" name="amount" value="${pageMaker.cri.amount }">
      <%--       <input type="hidden" name="keyword" value="${pageMaker.cri.keyword }"> --%>
      <%--       <input type="hidden" name="type" value="${pageMaker.cri.type }"> --%>
   </form>
<script>
    function addCart() {
        var id = $(event.target).data("musicid")

        var confirm1 = confirm('장바구니에 담으시겠습니까?')
        if (confirm1) {
            $.ajax({
                url: "cart/add",
                type: "post",
                data: {"id": id},
                dataType: "text",
                success: function (data) {
                    alert("장바구니에 담았습니다.");
                },
                error: function (xhr, status, error) {
                    alert("이미 장바구니에 담겨있습니다.");
                }
            })

        } else {
            alert("삭제취소")
        }
    }
    function paging(num) {
        moveForm.pageNum.value = num;
        moveForm.submit();
     };
     
     $('#allCheck').change( function(){
 	    var imChecked = $(this).is(":checked");
 	    if(imChecked){
 	        $('.all').prop('checked',true);
 	    } else {
 	        $('.all').prop('checked',false);
 	    }
 	});

 	function ListaddCart() {
 		let idList = []
 		$('.all').each(function(index, item){
 			if($(this).is(":checked")) {
 				idList.push($(this).val())
 			} 
 		})
 		var confirm1 = confirm('장바구니에 담으시겠습니까?')
 	     if(confirm1) {
 	          $.ajax ({
 	            url : "cart/add",
 	            type : "post",
 	            contentType:'application/x-www-form-urlencoded;charset=utf-8',
 	    		traditional:true,
 	            data : {"id" : idList},                   
 	            dataType : "text",
 	            success : function(data) {
 	            	 alert(data);
 	            },
 	            error: function(xhr, status, error){
 	            	alert("통신실패"); 	            }
 	         }) 
 	         
 	      } else {
 	         alert("취소")
 	      }
 	}
</script>	