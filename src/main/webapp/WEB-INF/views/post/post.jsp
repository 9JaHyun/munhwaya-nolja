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
        <div>
            <button class="tbutton" style="font-size: 18px; width: 50px"> 수정 </button>
            <button class="tbutton" style="font-size: 18px; width: 50px"> 삭제 </button>
        </div>
    </div>
</div>