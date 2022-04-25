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
    <h4>��Ƽ��Ʈ �� ���</h4>
    <div class="grid_12 tt" style="margin-top: 70px;">
        <ul class="forum-items" style="text-align: left;">
            <li><i class="icon-comment-alt"></i>��Ƽ��Ʈ �� ���
                <div class="topic-time">��Ƽ��Ʈ�� ���� ����մϴ�.</div>
            </li>
        </ul>
    </div>
</div>
<!-- ��Ƽ��Ʈ �±� ��û�� �ʿ��� ���� -->
<div style="padding-top: 5%;">
    <div style="margin: 100px 0px 10px 0px; border: none;">
        <br>
        <form id="info" name="info" method="post" action="insertMusic.do"
              enctype="multipart/form-data">
            <div class="title">
				<span>Ÿ��Ʋ&nbsp;&nbsp;<input type="text" id="title"
                                            name="title" placeholder="���� Ÿ��Ʋ�� �Է� ���ּ���"></span>
                &emsp; <br>
            </div>
            <div class="lyric">
                <span>����&nbsp;&nbsp;</span>
                <textarea id="lyric" name="lyric" placeholder="���縦 �Է��� �ּ���."></textarea>
            </div>
            <div class="genre">
                <span>�帣&nbsp;&nbsp;</span> <select id="genre" name="genre">
                <option value="G01"
                        <c:if test="${member.genre eq 'G01'}">
                            selected="selected"
                        </c:if>>�߶��
                </option>
                <option value="G02"
                        <c:if test="${member.genre eq 'G02'}">
                            selected="selected"
                        </c:if>>��
                </option>
                <option value="G03"
                        <c:if test="${member.genre eq 'G03'}">
                            selected="selected"
                        </c:if>>��/����
                </option>
                <option value="G04"
                <c:if test="${member.genre eq 'G04'}">
                        selected="selected"
                </c:if>>R&B/Soul

            </select>
            </div>
            <div class="albumId">
                <span>�ٹ� ����&nbsp;&nbsp;</span>
                <select id="albumId" name="albumId">
                    <c:forEach items="${albumIds}" var="albumId">
                    <option value="${albumId.id }">${albumId.albName }
                        </c:forEach>
                </select>
            </div>
            <div class="time">
                <span>����ð�&nbsp;&nbsp;</span>
                <input type="text" id="time" name="time" placeholder="04:30�� ���� ������� �ۼ� ���ּ���">
            </div>
            <div class="writer">
                <span>�ۻ�&nbsp;&nbsp;</span> <input type="text" id="writer"
                                                   name="writer">
            </div>
            <div class="composing">
                <span>�۰�&nbsp;&nbsp;</span> <input type="text" id="composing"
                                                   name="composing">
            </div>
            <div class="arrangement">
                <span>���&nbsp;&nbsp;</span> <input type="text" id="arrangement"
                                                   name="arrangement">
            </div>
            <div class="fileId">
                �� ���� <input type="file" id="file" name="file"
                            accept="audio/*"><br>
            </div>
            <!-- ��û, ��� ��ư -->
            <div align="center" style="margin: 3em 0em 0em 0em;">
                <input type="submit"
                       style="padding: 0.2em 1.1em 0.08em 1em; position: relative; bottom: 8px; margin: 1em 1em 1.1em 0em;"
                       value="��û" class="tbutton small">
                <a href="" class="tbutton small"><span>���</span></a>
                <!-- Ŭ���� �ڷΰ���-->
            </div>
        </form>
    </div>
</div>
<br>

<script>


</script>