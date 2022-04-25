<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="page-content back_to_up">
    <div class="row clearfix mb"></div>

    <div class="row row-fluid clearfix mbf">
        <div class="def-block">
            <h4> 글쓰기 </h4><span class="liner"></span>
            <form id="dto" action="posting" method="post" enctype="multipart/form-data">
                <h4>제목</h4>
                <input type="text" id="title" name="title" style="width: 100%">
                <div style="margin-bottom: 30px">
                <textarea name="content" style="width: 100%; height: 500px"></textarea>
                </div>

                <div style="margin-bottom: 30px">
                    첨부파일 &nbsp;<input type="file" id="files" name="files" multiple>
                </div>

                <div style="text-align: center">
                    <button type="submit" class="btn btn-outline-secondary tbutton"
                            style="width: 80px; font-weight: bold">
                        등 록
                    </button>
                    <button type="submit" class="btn btn-outline-secondary tbutton"
                            style="width: 80px; font-weight: bold">
                        취 소
                    </button>
                </div>
            </form>
        </div>
    </div>
</div>