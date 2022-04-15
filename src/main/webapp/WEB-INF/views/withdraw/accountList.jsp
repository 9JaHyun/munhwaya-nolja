<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<body>
계좌조회성공
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
    <tr th:each="account : ${bankAccounts.getRes_list()}">
        <th th:text="${account.getAccount_num_masked()}"></th>
        <td th:text="${account.account_num}"> </td>
        <td th:text="${account.getBank_name()}"> </td>
        <td th:text="${account.getAccount_holder_name()}"></td>
        <td><form method="get" action="/balance">
            <input type="hidden" id="access_token"
                   name="access_token" th:value="${access_token}"></input>
            <input type="hidden" name="bank_tran_id" th:value="${useCode}+U"></input>
            <input type="hidden" id="fintech_use_num"
                   name="fintech_use_num" th:value="${account.fintech_use_num}"></input>
            <button type="submit">잔액조회</button>
        </form>
        </td>
        <td th:if="${account.account_num_masked=='5234234***'}" th:text="주계좌">     </td>
        <td>
            <form method="get" action="/transfer" th:if="${account.account_num_masked}=='5234234***'">
                <input type="hidden" name="access_token" th:value="${access_token}"></input>
                <input type="hidden" name="fintech_use_num" th:value="${account.fintech_use_num}"></input>
                <input type="hidden" name="account_num" th:value="${account.account_num_masked}"></input>
                <input type="hidden" name="bank_tran_id" th:value="${useCode}+U"></input>
                <input type="hidden" name="req_client_name" th:value="${account.account_holder_name}"></input>
                <button type="submit">간편송금</button>
        </form>
        </td>
    </tr>
    </tbody>
</table>
    <a type="button" th:href="@{/}">뒤로가기</a>
</div>
</body>
</html>