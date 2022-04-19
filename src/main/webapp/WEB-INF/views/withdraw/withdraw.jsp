<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<script>
    var state = random
    function getCode() {
        var tmpWindow = window.open('about:blank')
        tmpWindow.location = "https://testapi.openbanking.or.kr/oauth/2.0/authorize?" +
            "response_type=code&" +
            "client_id=c3619757-3986-4ce0-9540-498dc7b2132a&" + //
            "redirect_uri=http://localhost/prj/auth/openbank&" +
            "scope=login inquiry transfer&" +
            "state=b80BLsfigm9OokPTjy03elbJqRHOfGSY&" +
            "auth_type=0"
    }
</script>
<%-- 에러 백그라운드 이미지--%>
<div class="under_header">
    <img src="${path}/resources/images/assets/breadcrumbs13.png" alt="#">
</div>

<div class="page-content back_to_up">
    <div class="row row-fluid clearfix mbf">
        <div class="posts">
            <div class="def-block">
                <div class="tac error-page clearfix">
                    <i class="icon-warning-sign"></i>
                    <form id="frm" action="matching" method="post">
                        <input type="text" id="account_holder_name" name="account_holder_name"
                               placeholder="예금주">
                        <input type="text" id="account_num" name="account_num"
                               placeholder="계좌번호 숫자만 입력">
                        <select name="bank_code_std" id="bank_code_std">
                            <option value=011>NH 농협은행</option>
                            <option value="002">KDB 산업은행</option>
                            <option value="003">IBK 기업은행</option>
                            <option value="004">KB 국민은행</option>
                            <option value="007">수협은행</option>
                            <option value="020">우리은행</option>
                            <option value="023">SC 제일은행</option>
                            <option value="027">한국씨티은행</option>
                            <option value="031">대구은행</option>
                            <option value="032">부산은행</option>
                            <option value="034">광주은행</option>
                            <option value="035">제주은행</option>
                            <option value="037">전북은행</option>
                            <option value="039">경남은행</option>
                            <option value="081">하나은행</option>
                            <option value="088">신한은행</option>
                            <option value="089">케이뱅크</option>
                            <option value="090">카카오뱅크</option>
                        </select>
                        <button type="submit" onclick="getCode()">인증하기</button>
                    </form>
                    <a href="home.do" class="tbutton medium"><span>홈페이지로 가기</span></a>
                </div>
            </div>
        </div>
    </div>
</div>