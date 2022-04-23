<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
잔액
<p th:text="${accountBalance.balance_amt}"></p>
은행
<p th:text="${accountBalance.bank_name}"></p>
</body>
</html>