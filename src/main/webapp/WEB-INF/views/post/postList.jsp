<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
    #boardTbl > thead > tr > th {
        font-size: 13pt;
    }
</style>
<div class="row row-fluid clearfix mbf" style="padding-bottom:100px;">
    <div class="span7 posts">
        <div class="def-block" style="width: 100%;">
            <h4 style="border-bottom: none;">일반 게시판</h4>
            <div class="search_wrap" style="float: right;">
                <div class="search_area">
                    <select style="width: 70px;">
                        <option value="제목">제목
                    </select> <input type="text" name="keyword"
                                     value="${pageMake.cri.keyword }">
                    <button class="tbutton small"
                            style="height: 32px; width: 60px; margin-bottom: 10px; font-size: 10pt;">
                        검색
                    </button>
                </div>
            </div>
            <span class="liner" style="margin-top: 20px;"></span>
            <div class="grid_12" style="width: 100%;">
                <div class="mbf clearfix">
                    <table id="boardTbl" class="table">
                        <thead>
                        <tr>
                            <th scope="col">제목</th>
                            <th scope="col">글쓴이</th>
                            <th scope="col">게시일</th>
                            <th scope="col">조회수</th>
                        </tr>
                        </thead>
                        <tbody id="posts">
                        <c:forEach items="${posts}" var="post">
                            <tr>
                                <td hidden>${post.id}</td>
                                <td style="color:white;">${post.title}</td>
                                <td style="color:white;">${post.writer}</td>
                                <c:choose>
                                    <c:when test="${now > post.createdAt}}">
                                        <td style="color:white;">
                                            <fmt:formatDate pattern="MM-dd" value="${post.createdAt}"/>
                                        </td>
                                    </c:when>
                                    <c:otherwise>
                                        <td style="color:white;">
                                            <fmt:formatDate pattern="HH:mm" value="${post.createdAt}"/>
                                        </td>
                                    </c:otherwise>
                                </c:choose>


                                <td style="color:white;">${post.hit}</td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                    <button onclick="location.href='posting'">
                        글쓰기
                    </button>
                </div>
            </div>
            <div class="pagination-tt clearfix"
                 style="margin-left: auto; margin-top: 30px; width: 50%;">
                <ul>
                    <!-- 이전페이지 버튼 -->
                    <c:if test="${pageMake.prev}">
                        <li><a href="${pageMake.startPage-1}">Previous</a></li>
                    </c:if>
                    <!-- 각 번호 페이지 버튼 -->
                    <c:forEach var="num" begin="${pageMake.startPage}"
                               end="${pageMake.endPage}">
                        <li><a href="#" onclick="paging(${num})" class="deactive">${num}</a>
                        </li>
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

    <div class="span5 sidebar">
        <div class="def-block widget">
            <h4>상세정보</h4><span class="liner"></span>
            <div class="widget-content">
                <table class="total_w_table" cellspacing="0">
                    <tbody>
                    <tr>
                        <th><strong>내용</strong></th>
                        <td><strong><span class="amount"></span></strong></td>
                    </tr>
                    <tr>
                        <th><strong>첨부파일</strong></th>
                        <td><strong>&nbsp;&nbsp;&nbsp;<span id="itemTotalPrice"></span>
                        </strong></td>
                    </tr>
                    </tbody>
                </table>
                <div style="text-align: center; width: 100%">
                    <button type="button" class="btn btn-success" id="approveBtn"
                            name="update_cart" onclick="payCart()">승인
                    </button>
                    <button type="button" class="btn btn-danger" id="rejectBtn"
                            name="update_cart" onclick="payCart()">거절
                    </button>
                </div>
            </div>
        </div>
    </div>
</div>

<div>
    <form id="moveForm" method="get" action="post">
        <input type="hidden" name="pageNum" value="${pageMake.cri.pageNum }">
        <input type="hidden" name="amount" value="${pageMake.cri.amount }">
        <input type="hidden" name="keyword" value="${pageMake.cri.keyword }">
    </form>
    <form id="postForm" hidden action="post" method="get">
        <input type="hidden" name="id">
    </form>
</div>
<script>
    $('#posts').on('click', function (e) {
        postForm.id.value = e.target.parentNode.firstElementChild.innerHTML;
        postForm.submit();
    })
</script>