<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 아티스트 정보 등록, 승급 신청시 버튼 클릭 시 alert창에 각각의 메세지 출력 -->
<input type="hidden" value="${message}" name="message" id="message">
	<script>
		alert(message.value);
		location.href='mypage.do';
	</script>
</body>
</html>