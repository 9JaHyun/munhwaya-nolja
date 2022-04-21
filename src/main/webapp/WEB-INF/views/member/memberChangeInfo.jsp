<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div align="right" style="margin-bottom: 50px; height: 400px;">
    <h4>회원정보 변경</h4>
    <div class="grid_12 tt" style="border: none; padding-top: 150px; padding-bottom: 150px;">
        <ul class="forum-items">
            <li>
                <i class="icon-comment-alt"></i>
                <c:choose>
                    <c:when test="${member.role  eq 'R01'}">
                        <a href="changeProfile.do">프로필 변경</a>
                    </c:when>
                    <c:otherwise>
                    	 <c:choose>
                    		<c:when test="${artists.name eq null}">
                    			<a href="artistProfileForm">프로필 등록</a>
                    		</c:when>
                    		<c:otherwise>
                    			<a href="changeArtistProfileForm">프로필 수정</a>
                    		</c:otherwise>
                    	</c:choose>
                    </c:otherwise>
                </c:choose>                

                <div class="topic-time">프로필 이미지와 닉네임을 변경합니다.</div>
            </li>
            <li>
                <i class="icon-comment-alt"></i>
                <a href="changeInfo.do">개인정보 변경</a>
                <div class="topic-time">비밀번호와 전화번호, 관심장르를 변경합니다.</div>
            </li>
            <li>
                <i class="icon-comment-alt"></i>
                <a href="dropMember.do">회원탈퇴</a>
                <div class="topic-time">회원을 탈퇴합니다.</div>
            </li>
        </ul>
    </div>
</div>