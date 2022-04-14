<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<div align="right" style="margin-bottom: 50px;">
    <a href="memberChangeInfo.do">회원정보 변경 ></a>
    <h4>개인정보 변경</h4>
    <!-- 비밀번호 변경 페이지 -->
    <div class="grid_12 tt" style="margin-top: 70px;">
        <ul class="forum-items" style="text-align: left;">
            <li><i class="icon-comment-alt"></i> <a href="changePassword.do">비밀번호
                변경</a>
                <div class="topic-time">비밀번호를 변경합니다.</div>
            </li>
        </ul>
    </div>
</div>

<!-- 수정폼 -->
<form method="post" id="frm" action="updateInfo.do?id=${member.id}" onsubmit="return send()">
    <div class="grid_12 tt"
         style="margin: 100px 0px 100px 0px; border: none;">
        <a>전화번호 : </a> <input id="tel" name="tel" type="text"
                              value="${member.tel}"><br> <a>관심장르 : </a> <select
            id="genre" name="genre">
        <option value="G01"
                <c:if test="${member.genre eq 'G01'}">
                    selected="selected"
                </c:if>>발라드
        </option>
        <option value="G02"
                <c:if test="${member.genre eq 'G02'}">
                    selected="selected"
                </c:if>>댄스
        </option>
        <option value="G03"
                <c:if test="${member.genre eq 'G03'}">
                    selected="selected"
                </c:if>>랩/힙합
        </option>
        <option value="G04"
                <c:if test="${member.genre eq 'G04'}">
                    selected="selected"
                </c:if>>R&B/Soul
        </option>
    </select>
    </div>
    <div align="right" style="margin-bottom: 10px">
        <button type="submit" class="tbutton small">
            <span>수정</span>
        </button>
    </div>
</form>


<script>
    function send() {
        var tel = $('#tel').val();
        var regPhone = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/;
        if (!tel.match(regPhone)) {
            alert("적절하지 않은 휴대폰번호 양식입니다.");
            return false;
        } else {
            alert("수정 완료되었습니다.");
            return true;
        }
    }

    function sleep(milliseconds) {
        var start = new Date().getTime();
        for (var i = 0; i < 1e7; i++) {
            if ((new Date().getTime() - start) > milliseconds) {
                break;
            }
        }
    }
</script>