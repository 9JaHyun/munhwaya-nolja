<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style>
table {
	border: 1px, solid black;
	width: 1000px;
}

.p {
	width: 10%;
}

table {
	border-collapse: separate;
	border-spacing: 30px 10px;
}

.artist-info {
	width: 700px;
	padding-bottom: 20px;
	float: right;
}

.img {
	width: 600px;
}

.act {
	width: 700px;
	padding-bottom: 10px;
	font-size: initial;
}

size {
	width: 100%;
}

.artist-album {
	width: 30%;
	hight: 200px;
}

.album {
	width: 33%;
	padding: 10px;
	float: center;
	align-content: space-between;
}
</style>

<div class="under_header">
</div>

<!-- under header -->

<div class="page-content back_to_up">
	<div class="row clearfix mb">
		<div class="breadcrumbIn">
			<ul>
				<li><a href="index.html" class="toptip" title="Homepage"> <i
						class="icon-home"></i>
				</a></li>
				<li><a href="mp3s.html"> MP3s </a></li>
				<li><a href="mp3s.html"> Alexander Doe </a></li>
				<li>Album Missing You</li>
			</ul>
		</div>
		<!-- breadcrumb -->
	</div>
	<!-- row -->

<!-- 아티스트 정보 -->
	<div class="row row-fluid clearfix mbf"> <!-- 아티스트 정보 마진 -->
		<div class="posts">
			<div class="def-block">
				<div class="post row-fluid clearfix">
					<div class="music-player-lis t wide-mp3 mbf clearfix">
							<div class="video-grid">
								<a href="albumInfo" class="grid_3"
									style="margin: 0em 0.5em 0em 0.5em; width: 32%; float:left;"> 
									<img src="api/picture/PICHONG.png" alt="#" style=" min-width:200px; max-width:200px;
										  min-height:230px; max-height:230px;">
								</a>
							</div>
							<div class="artist-info" style="float: left; width: 50%; padding-left: 50px;">
								<div class="act">
									<a>활동명</a>&emsp;<a>${artist.name}</a><br>
								</div>
								<div class="act">
									<c:choose>
										<c:when test="${artist.type == 'T01'}">
											<a>활동유형</a>&emsp;솔로</c:when>
										<c:otherwise>
											<a>활동유형</a>&emsp;그룹</c:otherwise>
									</c:choose>
								</div>
								<div class="act">
									<c:choose>
										<c:when test="${artist.genre == 'G01'}">
											<a>주요활동 장르</a>&emsp;발라드</c:when>
										<c:when test="${artist.genre == 'G02'}">
											<a>주요활동 장르</a>&emsp;댄스</c:when>
										<c:when test="${artist.genre == 'G03'}">
											<a>주요활동 장르</a>&emsp;랩/힙합</c:when>
										<c:otherwise>
											<a>활동유형</a>&emsp;R&B/Soul</c:otherwise>
									</c:choose>
								</div>
								<div class="act">
									<a> 소개글</a>&emsp;<a>${artist.content}</a>
								</div>
							</div>
					</div>
				</div>
			</div>
		</div>
	</div>	<!-- page-content back_to_up 닫기 -->

	<!-- 곡 -->
<div class="row row-fluid clearfix mbf"> <!-- 곡 마진 -->
	<div class="posts">
		<div class="def-block">
			<h4>곡(${musicCnt})</h4>
			<i class="icon-angle-right"
				style="font-size: large; margin-left: 7px;"></i> <span class="liner"></span>
			<table>
				<thead>
					<tr style="text-align: center;">
						<th width="3%">NO</td>
						<th width="10%">듣기</td>
						<th width="10%">구매</td>
						<th width="25%">곡명</td>
						<th width="15%">아티스트명</td>
						<th width="10%">앨범</td>
						<th width="10%">위시리스트</td>
					</tr>
				</thead>
				<tbody>
				<!--  c:forEach -->
				 
        			 <c:forEach items="${musicList}" var="music" varStatus="status" >   <!--  items = "${result.music}"-->
           				<tr style="text-align: center;">
             				<td style="text-align:center">${status.count}</td>
               				<td><a href="streaming?id=${music.musicId}"><i class="icon-angle-right" style="font-size: large; margin-left: 7px;"></a></i></td>
               				<td><button data-musicid="${music.musicId}" onclick="buy()">구매</button></td> <!-- 구매버튼만 만들어 연결 -->
               				<td>${music.musicTitle}</td>
               				<td>${music.artName}</td>
              				<td>${music.albName}</td>
             				 <td><button data-toggle="modal" data-target="#myModal" data-musicid="${music.musicId}" data-dismiss="modal" aria-label="Close">담기</button></td>
           				 </tr>
       				  </c:forEach>
				<!-- span8 posts -->
				</tbody>
			</table>
			<br><br><br>
			
			 <div class="pageInfo_wrap">
      			<div class="pageInfo_area" style="text-align: center;">
       				<ul id="pageInfo" class="pageInfo">
            <!-- 이전페이지 버튼 -->
            			<c:if test="${pageMaker.prev}">
              				 <li class="pageInfo_btn previous">
               				<a href="#" onclick="paging(${pageMaker.startPage-1})">Previous</a></li>
            			</c:if>
            <!-- 각 번호 페이지 버튼 -->
            			<c:forEach var="num" begin="${pageMaker.startPage}"
               			end="${pageMaker.endPage}">
               				<li class="pageInfo_btn ${pageMaker.cri.pageNum == num ? "focus":""}">
               				<a href="#" onclick="paging(${num})">${num}</a></li>
         				</c:forEach>
            <!-- 다음페이지 버튼 -->
         				<c:if test="${pageMaker.next}">
        					<li class="pageInfo_btn next">
          			    	<a href="#" onclick="paging(${pageMaker.endPage + 1})">Next</a></li>
       				    </c:if>
     				 </ul>
      			</div>
			  </div>
	
	<form id="moveForm" method="get" action="artistDetail">
      <input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
      <input type="hidden" name="amount" value="${pageMaker.cri.amount }">
      <%--       <input type="hidden" name="keyword" value="${pageMaker.cri.keyword }"> --%>
      <%--       <input type="hidden" name="type" value="${pageMaker.cri.type }"> --%>
   </form>
   
   
		</div> <!-- def block -->
	</div>
</div>
</div>

<!-- post -->

<!-- tags -->
<!--  <span> Tags: </span>
								<a href="#" class="#"> Alexander doe </a>,
								<a href="#" class="#"> Remix </a>
							</p>-->


<!-- 앨범 -->
<div class="row row-fluid clearfix mbf"> <!-- 앨범 마진 -->
	<div class="posts">
		<div class="def-block">
			<h4>앨범(${albumCnt})</h4>
			<i class="icon-angle-right"
				style="font-size: large; margin-left: 7px;"></i> <span class="liner"></span>
			<ul class="tabs-content">
				<li id="Latest" class="active">
					<div class="video-grid">
						<a href="albumInfo" class="grid_3"
							style="margin: 0em 0.5em 0em 0.5em; width: 32%;"> <img
							src="resources/images/bg/musicBg3.jpg" alt="#"> <span><strong>앨범명</strong>아티스트명
								/ 앨범날짜</span>
						</a> <a href="video_single_wide.html" class="grid_3"
							style="margin: 0em 0.5em 0em 0.5em; width: 32%;"> <img
							src="resources/images/bg/musicBg3.jpg" alt="#"> <span><strong>앨범명</strong>아티스트명
								/ 앨범날짜</span>
						</a> <a href="video_single_wide.html" class="grid_3"
							style="margin: 0em 0.5em 0em 0.5em; width: 32%;"> <img
							src="resources/images/bg/musicBg3.jpg" alt="#"> <span><strong>앨범명</strong>아티스트명
								/ 앨범날짜</span>
						</a>

					</div> <!-- video grid -->
				</li>
				<!-- tab content -->
			</ul>
			<!-- end tabs -->
		</div>
		<!-- def block -->
	</div>
	<!-- posts -->
	<!-- 왼쪽하단 메인 끝-->
</div>
<!-- content끝 -->

<!-- 위시리스트모달 -->
<div class="modal fade def-block" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="top:30%; display:none;">
  <div class="modal-dialog ">
    <div class="modal-content ">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span style="color:white" aria-hidden="true">&times;</span></button>
        <h4 style="border:none;" class="modal-title" id="myModalLabel">위시리스트 선택</h4>
      </div>
      <div id="activeAdd" class="modal-body def-block">
        <c:forEach items="${wishList}" var="wishlist">
		<div class="mbf clearfix">
			<ul>
				<li>
					<!-- 위시리스트 이름 -->
					<div class="toggle-head" style="padding-bottom:20px;">
						<h5 style="margin:0px;">
							${wishlist.name}
							<button onclick="addWishList()" class="tbutton small" style="float:right;">
								<span data-wishid="${wishlist.id}">선택</span>
							</button>
						</h5>
					</div>
				</li>
			</ul>
		</div>
	</c:forEach>
      </div>
      <div class="modal-footer def-block">
        <button class="tbutton small" data-dismiss="modal" aria-label="Close"><span>확인</span></button>
      </div>
    </div>
  </div>
</div>
	<!-- 위시리스트모달 끝-->

<!-- end layout -->
<!-- Scripts -->
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/codevz.js"></script>
<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/jquery.prettyPhoto.js"></script>
<script type="text/javascript" src="js/jquery.flexslider-min.js"></script>
<script type="text/javascript" src="js/jquery.jplayer.js"></script>
<script type="text/javascript" src="js/ttw-music-player-min.js"></script>
<script type="text/javascript" src="music/myplaylist.js"></script>
<script type="text/javascript" src="js/jquery.nicescroll.min.js"></script>
<script type="text/javascript" src="js/twitter/jquery.tweet.js"></script>
<script type="text/javascript" src="js/custom.js"></script>

<script type="text/javascript">
	var musicid;
	/* <![CDATA[ */
	// Disqus
	var disqus_shortname = 'remixtemplate';
	(function() {
		var s = document.createElement('script');
		s.async = true;
		s.type = 'text/javascript';
		s.src = '//' + disqus_shortname + '.disqus.com/count.js';
		(document.getElementsByTagName('HEAD')[0] || document
				.getElementsByTagName('BODY')[0]).appendChild(s);
	}());
	/* ]]> */
	
	$(document).ready(function() {     
        $('#myModal').on('show.bs.modal', function(event) {   
        	
        	musicid = $(event.relatedTarget).data('musicid');
        });
    });

	function buy() {
		 var id = $(event.target).data('musicid');
	  $.ajax ({
		        url : "checkBuy",
		        type : "get",
		        data : {"id" : id},                   
		        dataType : "text",
		        success : function resultBuy(result) {
		    		if(result==0){
		    			var confirm1 = confirm("장바구니에 담으시겠습니까?")
		    			if(confirm1) {
		    	      	$.ajax ({
		    		        url : "cart/add",
		    		        type : "post",
		    		        data : {"id" : id},                   
		    		        dataType : "text",
		    		        success : function(data) {
		    		        	alert("장바구니에 담았습니다.");
		    		        },
		    		        error: function(xhr, status, error){
		    		       		alert("이미 장바구니에 담겨있습니다.");
		    		        }
		    	        }) 
		    	       } else {
		    	             alert("삭제취소")
		    	        }
		    		} else {
		    			alert("이미 구매하셨습니다.")
		    		}
		        },
		        error: function(xhr, status, error){
		        	alert("연결실패");
		        }
	        });
		  
	}
	
	 
	
	function paging(num) {
	        moveForm.pageNum.value = num;
	        moveForm.submit();
	     };
	     
	     
	function addWishList() {
		
		let wishId = $(event.target).data('wishid')
		alert(musicid) //musicId를 가져올수가 없음
		
// 		$.ajax({
// 			type: "POST", //요청 메소드 방식
// 			url:"addWishList",
// 			contentType:'application/json;charset=utf-8',
// 			data: JSON.stringify({"musicId": musicId, "wishId": wishId}),
// 			dataType:"text", //서버가 요청 URL을 통해서 응답하는 내용의 타입
// 			error : function(){
// 				alert("이미 추가한 곡입니다.");
// 			},
// 			success: function(result) {
// 				alert("추가되었습니다");
// 			}
// 		})
		
		
	}
	
	function wishlist() {
	
// 		$("[name='selNo']:checked").each(function(i, checkbox){
// 			var tr = $(checkbox).parent().parent();
// 			var td = $(tr).children();
// 			var obj = {};
// 		}
		
//		 var wishlist = td.eq(7).find("button").val();

//		obj["wishlist"] = wishlist;

		var wish = $(event.target).data('musicId');
		
		$.ajax({
			url : "wishlist", //(프로젝트명, 컨트롤러에 호출할 경로)
			type : "post",
			contentType : "application/json",
			data : JSON.stringify(wishlist),
			data

		})
	}
</script>
</html>