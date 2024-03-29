<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"
	type="text/javascript"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"
	type="text/javascript"></script>

<style>
.js-load {
	display: none;
}

.js-load.active {
	display: revert;
}

.highlight {
	position: absolute;
	border: 1px solid white;
    border-spacing: 850px;
}

</style>


<div align="right" style="margin-bottom: 50px;">
	<a href="wishlist.do">위시리스트 ></a>
	<h4>${wishlistName}</h4>
</div>

<!-- 위시리스트 곡 리스트 -->
<div align="center">
	<div id="js-load">
		 <table class="table" style="margin-bottom: 50px;">
			<thead>
				<tr style="border-top: 1px solid white;">
					<th scope="col" style="padding-left: 54px;">TITLE</th>
					<th scope="col" style="padding-right: 30px;">ARTIST</th>
					<th scope="col"></th>
				</tr>
			</thead>
			<tbody id="sortable">
				<c:forEach items="${wishMusic}" var="wishlistMusic">
					<tr class="js-load">
						<td>
							<div style="float:left; margin-left: 10px; margin-right: 20px;"><i class="icon-reorder"></i></div>
							<a href="streaming?id=${wishlistMusic.musicId}">${wishlistMusic.title}</a>
						</td>
						<td style="padding-right: 30px;">${wishlistMusic.artName}</td>
						<td style="padding-right: 20px;"><i class="icon-remove"
							id="${wishlistMusic.musicId}"
							onclick="delMusicFnc(${wishlistMusic.musicId})"></i></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

		<!-- 더보기 버튼 -->
		<div id="js-btn-wrap" class="tbutton small">
			<a href="javascript:;" class="button"><span>더보기</span></a>
		</div>
	</div>
</div>

<script>
    $(window).on('load', function () {
        // 기본 갯수
        load('#js-load', '7');
        $("#js-btn-wrap .button").on("click", function () {
            // 증가 갯수
            load('#js-load', '3', '#js-btn-wrap');
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
            $('.button').parent().hide()
        }
        $(list + ":lt(" + total_cnt + ")").addClass("active");
    }

    function delMusicFnc(musicId) {
        let query = window.location.search;
        let param = new URLSearchParams(query);
        let wishId = param.get('id');
        let name = param.get('name');

        $.ajax({
            type: "POST",
            url: "deleteWishlistMusic.do",
            data: {"wishId": wishId, "musicId": musicId, "name": name}

        })
        .done(() => {
            document.getElementById(musicId).parentNode.parentNode.remove();
            load('#js-load', '1');
        });
    }
    
    // drag and drop
    $("#sortable").sortable({
    	axis: "y",
        start: function(e, ui) {
        	$(this).width($(this).width());
        	ui.item.toggleClass("highlight");
            $(this).attr('data-previndex', ui.item.index());
        },
        update: function (e, ui) {
        var to = parseInt(ui.item.index()) + 1;
        var from = parseInt($(this).attr('data-previndex')) + 1;
		$(this).removeAttr('data-previndex');

              // ajax
               $.ajax({
            	 url : "changeOrders.do",
            	 data : {"id" : ${wishlistId},
            		 	"from" : from,
            		 	"to" : to}, 
            	 type : "POST",
            	 beforeSend : function() {
            		 $('html').css('pointer-events', 'none');
            		 $('html').css('cursor', 'wait');
            	 },
            	 complete : function() {
            		 $('html').css('pointer-events', 'auto');
            		 $('html').css('cursor', 'auto');
            	 }
            });
        },
        
        stop: function (event, ui) {
            ui.item.toggleClass("highlight");
    }
     });
    
     $("#sortable").disableSelection();

</script>