<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="resources" value="${pageContext.request.contextPath}/resources"/>
<jsp:useBean id="now" class="java.util.Date"/>
<fmt:formatDate value="${now}" pattern="yyyyMMdd" var="nowDate"/>
<style>
    #commentList  {
        font-size: 13pt;
        color: white;
    }
</style>
<div class="row row-fluid clearfix mbf">
    <div class="def-block">
        <ul style="float: left; width: 100%; list-style: none">
            <li style="color: white; font-size: 30px;">${post.title}</li>
            <li style="color: white; font-size: 15px; margin-bottom: 0;"><fmt:formatDate
                    pattern="YYYY-MM-dd HH:mm:ss"
                    value="${post.createdAt}"/></li>
            <li id="postId" hidden>${post.id}</li>
        </ul>

        <ul style="width: 100%">
            <span style="color: white; font-size: 15px;">글쓴이: ${post.writer} </span>
            <span style="color: white; font-size: 15px; width: 50%; text-align: right">조회수: ${post.hit},    추천수: ${post.likeIt}</span>
        </ul>

        <span class="liner" style="margin-top: 5px;"></span>
        <div class="grid_12" style="width: 100%;">
            <div class="mbf clearfix" style="color: white; font-size: 15px">
                ${post.content}
            </div>
        </div>
        <c:if test="${userId == post.memberId}">
            <div>
                <button class="tbutton" style="font-size: 18px; width: 50px"> 수정</button>
                <button class="tbutton" style="font-size: 18px; width: 50px"> 삭제</button>
            </div>
        </c:if>
        <div id="comments" class="user-comments mbs">
            <h4> 댓글 </h4><span class="liner"></span>
            <form id="commentform">
                <textarea name="content" rows="4" required=""></textarea>
                <p>
                    <input type="hidden" name="postId" value="${post.id}">
                    <input type="hidden" name="groupId" value="0">
                    <a id="postingComment" class="send-message">댓글 쓰기</a>
                </p>
            </form>
            <br><br><br><br>
            <ul id="commentList" class="showcomments clearfix"></ul>
        </div>
    </div>
</div>

<script>
    $(window).load(() => {
        loadComments(${post.id})
    })

    $('#postingComment').on('click', function () {
        $.ajax({
            url: "comment",
            type: "post",
            data: {
                "postId": commentform.postId.value,
                "content": commentform.content.value,
                "groupId": commentform.groupId.value
            },
            dataType: "text",
            success: function () {
                loadComments(${post.id})
            },
            error: function () {
                alert('입력실패');
            }
        })
    })

    function loadComments(id) {
        $.ajax({
                url: 'comment',
                type: 'get',
                data: {
                    id: id
                },
                success: function (data) {
                    let listHtml = "";
                    for (const i in data) {
                        let id = data[i].id;
                        let content = data[i].content;
                        let groupId = data[i].groupId;
                        let postId = data[i].postId;
                        let memberId = data[i].memberId;
                        let writer = data[i].writer;
                        let writerProfile = data[i].writerProfile;
                        let createdAt = data[i].createdAt;
                        let updatedAt = data[i].updatedAt;
                        let groupOrder = data[i].groupOrder;

                        if (groupOrder == 1) {
                            listHtml += "<li id='" + id + "' data-groupId = '" + groupId + "' class='clearfix'>";
                        } else {
                            listHtml += "<li id='" + id + "' class='child clearfix'>";
                        }

                        listHtml += "<div class='thumb'>";
                        listHtml += showProfile(writerProfile);
                        listHtml += "<div class='reply' value='N'><i class='icon-reply first-i'></i>Reply</div>"
                        listHtml += "</div>";

                        listHtml += "<h5 class='entry-title'>" + writer;
                        listHtml += "<span class='date'>" + createdAt + "</span></h5>";
                        if (content == "" || content == null) {
                            listHtml += "<p>(삭제된 댓글입니다.)</p>"
                        } else {
                            listHtml += "<p>" + content + "</p>"
                        }
                        listHtml + "</li>";

                        $("#commentList").html(listHtml);
                    }

                    $('.reply').on('click', function () {
                        let li = $(this).parent().parent();
                        var replyDiv = $('<div>');
                        replyDiv.attr("width", "100%")
                        replyDiv.attr("height", "50px")

                        var newForm = $('<form></form>');
                        //set attribute (form)
                        newForm.attr("name", "replyForm");
                        newForm.attr("method", "post");
                        newForm.attr("action", "comment");
                        newForm.attr("target", "_blank"); // create element & set attribute (input)
                        newForm.append(
                            $('<input/>', {type: 'hidden', name: 'postId', value: ${post.id}}));
                        newForm.append(
                            $('<input/>', {type: 'hidden', name: 'groupId', value: li.data('groupid')}));
                        newForm.append(
                            $('<textarea/>', {
                                name: 'content',
                                rows: "2",
                                style: 'width: 70%; margin-right: 10px'
                            }));
                        newForm.append(
                            $("<a class='send-message tbutton postingReply' style='height: 100%'>댓글 쓰기</a>"));
                        newForm.append($("<a class='closeBtn'> X</a>"));
                        li.append(replyDiv.append(newForm));

                        $('.closeBtn').on('click', function () {
                            $(this).parent().remove()
                        });
                    });
                },
                //
                // // 삭제버튼을 클릭했을 때
                // $('.reply_delete').on('click', function ()
                //     // 모댓글 삭제일때
                //     if ($(this).attr('grpl') == 0) {
                //         DeleteReply($(this).attr('no'), $(this).attr('bno'));
                //
                //         // 답글 삭제일때
                //     } else {
                //         DeleteReReply($(this).attr('no'), $(this).attr('bno'), $(this).attr('grp'));
                //     }
                //
                // })
                error: function () {
                    alert('서버 에러');
                }
            }
        )
        ;
    }

    function isWriter(memberId) {
        return ('${post.memberId}' == memberId) ? "<i>작성자</i>" : "<i></i>";
    }

    function showProfile(profile) {
        var result;
        if (profile == null || profile.length === 0) {
            result = "<img src='resources/images/basic_profile.png'"
        } else {
            if (profile.indexOf('https://') !== -1) {
                result = "<img src='" + profile + "'>";
            } else {
                result = "<img src='api/picture/" + profile + "'>";
            }
        }
        return result;
    }
</script>