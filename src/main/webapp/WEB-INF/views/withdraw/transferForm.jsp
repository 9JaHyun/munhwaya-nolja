<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<div class="container">
    <table class="table">
        <thead>
        <tr>
            <th scope="col">계좌번호</th>
            <th scope="col">은행</th>
            <th scope="col">소유주</th>
        </tr>
        </thead>
        <tbody>
        <tr c:each="account : ${bankAccounts.getRes_list()}">
            <th c:text="${account.getAccount_num_masked()}"></th>
            <td c:text="${account.account_num}"></td>
            <td c:text="${account.getBank_name()}"></td>
            <td c:text="${account.getAccount_holder_name()}"></td>
            <td c:if="${account.account_num_masked=='5234234***'}">주계좌</td>
            <td>
                <c:if test="${account.account_num_masked}=='5234234***'">
                    <form method="get" action="/transfer">
                        <input type="hidden" name="access_token" value="${access_token}"></input>
                        <input type="hidden" name="fintech_use_num"
                               value="${account.fintech_use_num}"></input>
                        <input type="hidden" name="account_num"
                               value="${account.account_num_masked}"></input>
                        <input type="hidden" name="bank_tran_id" value="${useCode}+U"></input>
                        <input type="hidden" name="req_client_name"
                               value="${account.account_holder_name}"></input>
                        <button type="submit">이 계좌로 입금하기</button>
                    </form>
                </c:if>
            </td>
        </tr>
        </tbody>
    </table>
    <a type="button" onclick="location.href='../'">뒤로가기</a>
</div>
