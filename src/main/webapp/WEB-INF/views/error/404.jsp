<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="rootPath" value="${pageContext.request.contextPath}"/>
<div id="fluidGridSystem">
    <div id="layout" class="full">
        <%-- 에러 백그라운드 이미지--%>
        <div class="under_header">
            <img src="${rootPath}/resources/images/assets/breadcrumbs13.png" alt="#">
        </div>

        <div class="page-content back_to_up">
            <div class="row row-fluid clearfix mbf">
                <div class="posts">
                    <div class="def-block">
                        <div class="tac error-page clearfix">
                            <i class="icon-warning-sign"></i>
                            <h2 class="tac"> 페이지를 찾을 수 없습니다.
                                <small>해당 페이지는 이전에 삭제되었거나 변경되었습니다</small>
                            </h2>
                            <a href="/prj" class="tbutton medium"><span>홈페이지로 가기</span></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>