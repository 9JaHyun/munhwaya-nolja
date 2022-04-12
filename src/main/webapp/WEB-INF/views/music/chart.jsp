<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
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
	
	.focus {
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
    div, tbody, td, tr, table {
        vertical-align: middle;
        color: white;
    }

    tr {
        margin-bottom: 100px;
    }

    .img1 {
        width: 80px;
        height: 80px;
        object-fit: cover;
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
                <form action="searchResult" id="search" method="get">
                    <input id="id" name="id" type="text"
                           style="font-size:x-small; width: 1000px; height: 60px; " value=""
                           placeholder="노래명, 앨범명 입력">
                    <button type="submit" style="margin-top:15px; margin-right:10px;">
                        <i class="icon-search" style="font-size: 25px;"></i>
                    </button>
                </form>
            </div>
        </div>
    </div>
    <!-- 검색바 끝-->
    <!-- 음원 리스트 -->
    <div class="row row-fluid clearfix mbf">
        <div class="posts">
            <div class="def-block">
                <h4> 차트순위 </h4><span class="liner"></span>
                <div class="products shop clearfix">
                    <div class="grid_12">
                        <form action="#" method="post">
                            <div class="bag_table">
                                <table class="shop_table footable tablet footable-loaded"
                                       style="width:100%;">
                                    <thead>
                                    <tr>
                                        <th><h4>순위</h4></th>
                                        <th></th>
                                        <th style="width: 200px;"><h4>제목</h4></th>
                                        <th><h4>가수</h4></th>
                                        <th><h4>장르</h4></th>
                                        <th><h4>다운로드</h4></th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="music" items="${musicChartList}" begin="0"
                                               end="14" varStatus="status">
                                        <tr class="cart_table_item"
                                            style="text-align: center; font-size:small ;">
                                            <td>${status.count}</td>
                                            <td class="product-thumbnail" style="width:70px;">
                                                <a href="#"><img class="img1"
                                                                 src="resources/images/bg/musicBg3.jpg"
                                                                 alt="#"
                                                                 style="margin: 10px 0px 10px 0px; width:100%; height:100%; object-fit: cover;"></a>
                                            </td>
                                            <td class="product-name">
                                                    ${music.title }
                                            </td>
                                            <td id="artName" class="product-name">
                                                    ${music.artName }
                                            </td>
                                            <td class="product-name">
                                                    <c:choose>
                                                    	<c:when test="${music.genre eq 'G01'}">발라드</c:when>
                                                    	<c:when test="${music.genre eq 'G02'}">댄스</c:when>
                                                    	<c:when test="${music.genre eq 'G03'}">랩/힙합</c:when>
                                                    	<c:when test="${music.genre eq 'G04'}">R&B/Soul</c:when>
                                                    </c:choose> 
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
                        </form><!-- end form -->
                    </div><!-- grid12 -->
                </div><!-- products -->

            </div><!-- def block -->
        </div><!-- span8 posts -->
    </div><!-- row clearfix -->
</div>
<!-- content끝 -->
<!-- 카트담기 -->
<script>
    function addCart() {
        var id = $(event.target).data("musicid")

        var confirm1 = confirm('장바구니에 담으시겠습니까?')
        if (confirm1) {
            $.ajax({
                url: "cart/test/add",
                type: "post",
                data: {"id": id},
                dataType: "text",
                success: function (data) {
                    console.log(data);
                    alert("장바구니에 담았습니다.");
                },
                error: function (xhr, status, error) {
                    alert("통신실패");
                }
            })

        } else {
            alert("삭제취소")
        }
    }
</script>