<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div align="right" style="margin-bottom: 50px; height: 400px;">
	<h4>지갑 정보</h4>
	
<div class="grid_12 tt" style="border: none; padding-top: 150px; padding-bottom: 30px;">
		<ul class="forum-items">
		<c:choose>
		<c:when test="${role == 'R01'}"> 
			<li><i class="icon-comment-alt"></i> <a
				href="walletInfoSelect.do">마일리지 충전 내역</a>
				<div class="topic-time">현재 보유한 마일리지와 충전내역을 조회합니다.</div></li>
			<li><i class="icon-comment-alt"></i> <a href="usageHistoryOfMusic.do">마일리지
					사용 내역</a>
				<div class="topic-time">회원이 사용한 마일리지 내역을 조회합니다.</div></li>
			<li><i class="icon-comment-alt"></i> <a href="chargeForm.do">마일리지
					충전</a>
				<div class="topic-time">마일리지를 충전 합니다.</div></li>
			<li><i class="icon-comment-alt"></i> <a href="withdrawForm.do">마일리지
					출금</a>
				<div class="topic-time">마일리지를 출금 합니다.</div></li>
		</c:when>
		<c:otherwise>
			<li><i class="icon-comment-alt"></i> <a
				href="walletInfoSelect.do">마일리지 충전 내역</a>
				<div class="topic-time">현재 보유한 마일리지와 충전내역을 조회합니다.</div></li>
			<li><i class="icon-comment-alt"></i> <a href="usageHistoryOfMusic.do">마일리지
					사용 내역</a>
				<div class="topic-time">회원이 사용한 마일리지 내역을 조회합니다.</div></li>
			<li><i class="icon-comment-alt"></i> <a href="chargeForm.do">마일리지
					충전</a>
				<div class="topic-time">마일리지를 충전 합니다.</div></li>
			<li><i class="icon-comment-alt"></i> <a href="withdrawForm.do">마일리지
					출금</a>
				<div class="topic-time">마일리지를 출금 합니다.</div></li>
			<li><i class="icon-comment-alt"></i> <a href="profitHistoryOfMusic.do">수익
					내역</a>
				<div class="topic-time">아티스트의 수익 내역을 조회합니다.</div></li>
		</c:otherwise>
		</c:choose>			
		</ul>
	</div>
	
	<form id="frm" action="walletInfoSelect.do" method="post">
		<input type="hidden" id="memberId" name="memberId">
	</form>
</div>

