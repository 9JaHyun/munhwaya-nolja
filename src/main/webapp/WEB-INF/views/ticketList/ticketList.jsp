<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<style>
    .js-load {
        display: none;
        margin-bottom: -10px;
    }

    .js-load.active {
        display: revert;
    }
</style>
<div align="right" style="margin-bottom: 20px;">
    <h4>구매한 공연</h4>
</div>

<div class="grid_12 tt" style="border: none; padding-top: 50px; padding-bottom: 30px;">
    <div id="js-load">
        <c:if test="${empty likeArtists}">
            <div style="margin: 250px 0px 200px 0px;">
                <h5>구매한 공연이 존재하지 않습니다.</h5>
                <a onclick="location.href='performance'" style="cursor: pointer">
                    공연 보러 가기
                </a>
            </div>
        </c:if>
        <c:forEach items="${ticketLists}" var="ticketLists">
            <div class="product grid_6 js-load" onclick="ticketListSearch(${ticketLists.id})"
                 style="border: 1px solid white; width: 610px; margin-bottom: 30px; border-radius: 10px;">
                <div class="product_inner"
                     style="text-align: left; margin-left:20px; margin-bottom:20px; float:left;">
                    <br>
                    <h3>
                        <a> ${ticketLists.performancevo.name }</a>
                    </h3>
                    <a>시작시간 : <fmt:formatDate pattern="MM월 dd일 HH시 mm분"
                                              value="${ticketLists.performancevo.sdate }"/></a>
                    <br>
                    <a>종료시간 : <fmt:formatDate pattern="MM월 dd일 HH시 mm분"
                                              value="${ticketLists.performancevo.edate }"/></a>
                    <br>
                    <a>예매시간 : <fmt:formatDate pattern="MM월 dd일 HH시 mm분"
                                              value="${ticketLists.time }"/></a>
                </div>
                <div style="float:right; margin-top:55px; margin-right:30px; font-size:25pt;">
						<span class="box1">
							<span aria-hidden="true" class="icons-arrow-right"></span>
						</span>
                </div>
                <br>
            </div>
            <!-- product -->
        </c:forEach>
    </div>
    <div id="js-btn-wrap" class="tbutton small">
        <a href="javascript:;" class="button"><span>더보기</span></a>
    </div>
</div>
<!-- products -->
</div>
<div>
    <form id="frm" action="ticketListSelect.do" method="post">
        <input type="hidden" id="id" name="id">
    </form>
</div>
<script type="text/javascript">
    function ticketListSearch(n) {
        frm.id.value = n;
        frm.submit();
    }

    $(window).on('load', function () {
        // 기본 갯수
        load('#js-load', '2');
        $("#js-btn-wrap .button").on("click", function () {
            // 증가 갯수
            load('#js-load', '2', '#js-btn-wrap');
        })
    });

    function load(id, cnt, btn) {
        var list = id + " .js-load:not(.active)";
        var length = $(list).length;
        var total_cnt;
        if (cnt < length) {
            total_cnt = cnt;
        } else {
            total_cnt = length;
            $('.button').parent().hide();
        }
        $(list + ":lt(" + total_cnt + ")").addClass("active");
    }
</script>