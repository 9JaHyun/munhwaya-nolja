<%@ page language="java" contentType="text/html; charset=EUC-KR"
         pageEncoding="EUC-KR" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
    textarea {
        padding-left: 1em;
        width: 70%;
        height: 7em;
        border: none;
        resize: none;
    }

    request-label {
        float: left;
        font-size: 0.5em;
        width: 70%;
    }

    .sort {
        width: 100px;
        margin: 0px;
    }

    label {
        display: block;
    }
</style>
<div align="right" style="margin-bottom: 50px;">
    <h4>아티스트 곡 등록</h4>
    <div class="grid_12 tt" style="margin-top: 70px;">
        <ul class="forum-items" style="text-align: left;">
            <li><i class="icon-comment-alt"></i>아티스트 곡 등록
                <div class="topic-time">아티스트의 곡을 등록합니다.</div>
            </li>
        </ul>
    </div>
</div>
<!-- 아티스트 승급 신청에 필요한 인증 -->
<div style="padding-top: 5%;">
    <div style="margin: 100px 0px 10px 0px; border: none;">
        <br>
        <form id="info" name="info" method="post" action="insertMusic.do"
              enctype="multipart/form-data">
            <div class="title">
				<span>타이틀&nbsp;&nbsp;<input type="text" id="title"
                                            name="title" placeholder="곡의 타이틀을 입력 해주세요"></span>
                &emsp; <br>
            </div>
            <div class="lyric">
                <span>가사&nbsp;&nbsp;</span>
                <textarea id="lyric" name="lyric" placeholder="가사를 입력해 주세요."></textarea>
            </div>
            <div class="genre">
                <span>장르&nbsp;&nbsp;</span> <select id="genre" name="genre">
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

            </select>
            </div>
            <div class="albumId">
                <span>앨범 선택&nbsp;&nbsp;</span>
                <select id="albumId" name="albumId">
                    <c:forEach items="${albumIds}" var="albumId">
                    <option value="${albumId.id }">${albumId.albName }
                        </c:forEach>
                </select>
            </div>
            <div class="time">
                <span>재생시간&nbsp;&nbsp;</span>
                <input type="text" id="time" name="time" placeholder="04:30와 같은 양식으로 작성 해주세요">
            </div>
            <div class="writer">
                <span>작사&nbsp;&nbsp;</span> <input type="text" id="writer"
                                                   name="writer">
            </div>
            <div class="composing">
                <span>작곡&nbsp;&nbsp;</span> <input type="text" id="composing"
                                                   name="composing">
            </div>
            <div class="arrangement">
                <span>편곡&nbsp;&nbsp;</span> <input type="text" id="arrangement"
                                                   name="arrangement">
            </div>
            <div class="fileId">
                곡 파일 <input type="file" id="file" name="file"
                            accept="audio/*"><br>
            </div>
            <!-- 신청, 취소 버튼 -->
            <div align="center" style="margin: 3em 0em 0em 0em;">
                <input type="submit"
                       style="padding: 0.2em 1.1em 0.08em 1em; position: relative; bottom: 8px; margin: 1em 1em 1.1em 0em;"
                       value="신청" class="tbutton small">
                <a href="" class="tbutton small"><span>취소</span></a>
                <!-- 클릭시 뒤로가기-->
            </div>
        </form>
    </div>
</div>
<br>

<script>


</script>