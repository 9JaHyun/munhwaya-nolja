<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>
인증완료화면
<a th:text="${bankReponseToken.access_token}"  th:value="${bankReponseToken.access_token}"></a>
<a type="hidden" th:text="${bankReponseToken.user_seq_no}" th:value="${bankReponseToken.user_seq_no}"></a>
<br>

<form id="acount" method="get" action="/acount/list">
    <input type="hidden" th:text="${bankReponseToken.access_token}" id="token" name="access_token" th:value="${bankReponseToken.access_token}"></input>
    <input type="hidden" th:text="${bankReponseToken.user_seq_no}" id="user_seq_no" name="user_seq_no" th:value="${bankReponseToken.user_seq_no}"></input>
    <input type="hidden" th:text="${bankReponseToken.user_seq_no}" id="include_cancel_yn" name="include_cancel_yn" value="Y"></input>
    <input type="hidden" th:text="${bankReponseToken.user_seq_no}" id="sort_order" name="sort_order" th:value="D"></input>
    <button type="submit">계좌조회</button>
</form>
</body>
</html>