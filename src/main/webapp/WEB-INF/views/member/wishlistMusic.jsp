<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	
<div align="right" style="margin-bottom: 50px;">
	<h4>위시리스트</h4>
</div>
	
<!-- 위시리스트 곡 리스트 -->
	<table class="table">
		<thead>
			<tr style="border-top: 1px solid white;">
				<th scope="col">TITLE</th>
				<th scope="col">ARTIST</th>
				<th scope="col"></th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${wishlistMusic}" var="wishlistMusic">
			<tr>
				<td>${wishlistMusic.title}</td>
				<td>${wishlistMusic.artName}</td>
				<td><i class="icon-remove"></i></td>
			</tr>
			</c:forEach>
		</tbody>
	</table>