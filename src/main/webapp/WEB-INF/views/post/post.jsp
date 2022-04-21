<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="resources" value="${pageContext.request.contextPath}/resources"/>
<jsp:useBean id="now" class="java.util.Date"/>
<fmt:formatDate value="${now}" pattern="yyyyMMdd" var="nowDate"/>
<style>
    #boardTbl > thead > tr > th {
        font-size: 13pt;
    }
</style>
<div class="row row-fluid clearfix mbf">
    <div class="def-block">
        <ul style="float: left; width: 100%; list-style: none">
            <li style="color: white; font-size: 30px;">${post.title}</li>
            <li style="color: white; font-size: 15px; margin-bottom: 0;"><fmt:formatDate
                    pattern="YYYY-MM-dd HH:mm:ss"
                    value="${post.createdAt}"/></li>
            <li id="postId" hidden>${post.id}</li>
        </ul>

        <ul style="width: 100%">
            <span style="color: white; font-size: 15px;">글쓴이: ${post.writer} </span>
            <span style="color: white; font-size: 15px; width: 50%; text-align: right">조회수: ${post.hit},    추천수: ${post.likeIt}</span>
        </ul>

        <span class="liner" style="margin-top: 5px;"></span>
        <div class="grid_12" style="width: 100%;">
            <div class="mbf clearfix" style="color: white; font-size: 15px">
                ${post.content}
            </div>
        </div>
        <c:if test="${sessionScope.id == post.memberId}">
            <div>
                <button class="tbutton" style="font-size: 18px; width: 50px"> 수정 </button>
                <button class="tbutton" style="font-size: 18px; width: 50px"> 삭제 </button>
            </div>
        </c:if>

        <div id="comments" class="user-comments mbs">
            <h4> Comments 2 </h4><span class="liner"></span>
            <ul class="showcomments clearfix">
                <li class="clearfix">
                    <div class="thumb">
                        <a href="#"><img src="images/assets/user1.jpg" alt="#"></a>
                        <div class="reply"><a href="#"><i class="icon-reply first-i"></i> Reply</a></div>
                    </div>
                    <h5 class="entry-title"><a href="#" class="title">Jessica Alba</a><i>said:</i> <span class="date">30 September, 2022</span></h5>
                    <p>Nam vitae tellus lectus. Vivamus et ultrices urna. Morbi et elit odio, vel cursus sapien. Curabitur ac turpis et velit hendrerit commodo. Curabitur orci erat.</p>
                </li>
                <li class="child admin-comment clearfix">
                    <div class="thumb">
                        <a href="#"><img src="images/assets/user2.jpg" alt="#"></a>
                        <div class="reply"><a href="#"><i class="icon-reply first-i"></i> Reply</a></div>
                    </div>
                    <h5 class="entry-title"><a href="#" class="title">Alexander Cruise</a><i>author</i> <span class="date">31 September, 2022</span></h5>
                    <p>Nam vitae tellus lectus. Vivamus et ultrices urna. Morbi et elit odio, vel cursus sapien. Curabitur ac turpis et velit hendrerit commodo. Curabitur orci erat.</p>
                </li>
            </ul>
        </div>
    </div>
</div>

<script>
    $(window).load(() => {
        var postId = ${post.id}
        console.log(postId);
    })
</script>