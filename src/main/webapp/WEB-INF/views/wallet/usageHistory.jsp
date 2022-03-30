<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="def-block clearfix">
	<div align="right" style="margin-bottom: 50px;">
		<h4>마일리지 사용 내역</h4>

		<div class="mbf clearfix" style="font-size: 20px;">
			<table class="table">
				<thead>
					<tr>
						<th scope="col">충전 일자</th>
						<th scope="col">충전 금액</th>
						<th scope="col">충전 수단</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${charges }" var="charge">
						<tr>
							<td>${charge.chargeAt}</td>
							<td>${charge.mileage }</td>
							<td>${charge.commonCodevo.name }</td>
						</tr>
					</c:forEach>
				</tbody>
				<tfoot>
					<tr>
						<td colspan="6">Footer Note: Lorem ipsum dolor sit amet</td>
					</tr>
				</tfoot>
			</table>
		</div>
		<div align="right">
			<a href="walletInfo.do" class="tbutton small"
				style="margin-top: 50px"><span>뒤로가기</span></a>
		</div>
	</div>
</div>