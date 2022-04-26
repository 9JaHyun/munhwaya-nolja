<%@ page language="java" contentType="text/html; charset=EUC-KR"
         pageEncoding="UTF-8" %>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<style>
/* table { */
/* 	border: 1px, solid black; */
/* 	width: 1000px; */
/* } */

table{
	width:100%;
	border-collapse: separate;
    border-spacing: 1em;
}

.p {
	width: 10%;
}

/* table { */
/* 	border-collapse: separate; */
/* 	border-spacing: 30px 10px; */
/* } */

.artist-info {
	width: 700px;
	padding-bottom: 20px;
	margin-top: 5em;
	float: right;
	float: left; 
	width: 50%;
	
}

.tbutton.small {
	padding: 0.1em 0.5em 0.1em 0.5em;
}

	
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


.pageInfo {
	   list-style: none;
	   display: inline-block;
		}
	
.pageInfo li {
	   float: left;
	   font-size: 1px;
	   padding: 7px;
	   font-weight: 500;
	}

	
	a:hover {
	   color: white;
	   text-decoration: underline;
	}
	
	.focus {
	   background-color: #cdd5ec;
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
td{
	color: white;
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
				<li><a href="#"> music </a></li>
				<li><a href="#"> 아티스트 </a></li>
				<li> 아티스트 정보 상세 </li>
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
									<img src="api/picture/${artist.image}" alt="#" style=" min-width:240px; max-width:240px;
										  min-height:270px; max-height:270px; margin-left: 3em; margin-top: 4em;">
								</a>
							</div>
							<div class="artist-info">
								<div class="act">
									<a>활동명</a>&emsp;<a>${artist.name}</a><br>
									<button class="tbutton medium" onclick="followArtist()">팔로우</button>
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
			<div style="text-align:center; width:100%;">
			<table>
				<thead>
						<tr style="text-align: center;">
						<th width="3%">NO</th>
						<th width="5%">&ensp;듣기</th>
						<th width="10%">구매</th>
						<th width="18%">곡명</th>
						<th width="20%">아티스트명</th>
						<th width="18%">앨범</th>
						<th width="10%">위시리스트</th>
						</tr>
					</div>
				</thead>
				<tbody>
				<!--  c:forEach -->
				 
        			 <c:forEach items="${musicList}" var="music" varStatus="status" >  
           				<tr style="text-align: center;">
             				<td style="text-align:center">${status.count}</td>
               				<td><a href="streaming?id=${music.musicId}"><i class="icon-play-circle" style="font-size: large; margin-left: 7px;"></a></i></td>
               				<td><button class="tbutton small" data-musicid="${music.musicId}" onclick="buy()">구매</button></td> 
               				<td><a href="streaming?id=${music.musicId}">${music.musicTitle}</a></td>
               					<td>${music.artName}</td>
              					<td><a href="albumInfo?id=${music.albId }">${music.albName}</a></td>
             				<td><button class="tbutton small" data-toggle="modal" data-target="#myModal" data-musicid="${music.musicId}" data-dismiss="modal" aria-label="Close" class="wishBtn">담기</button></td>
           				 </tr>
       				  </c:forEach>
       				  <br>
				</tbody>
			</table>
			<br><br><br>
			
			<!-- 곡 페이징처리 -->
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
               				<li class="pageInfo_btn ${pageMaker.cri.pageNum == num ? "focus":""}" style="display:inline;">
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
      <input type="hidden" name="albumPageNum" value="${pageMaker2.cri.pageNum }">
      <input type="hidden" name="albumAmount" value="${pageMaker2.cri.amount }">
      <input type="hidden" name="musicPageNum" value="${pageMaker.cri.pageNum }">
      <input type="hidden" name="musicAmount" value="${pageMaker.cri.amount }">
      <%--       <input type="hidden" name="keyword" value="${pageMaker.cri.keyword }"> --%>
      <%--       <input type="hidden" name="type" value="${pageMaker.cri.type }"> --%>
   </form>
   
   
		</div> <!-- def block -->
	</div>
</div>
</div>

<!-- post -->

<!-- tags -->
<!-- <span> Tags: </span>
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
			<ul class="tabs-content" style="margin-left: 5.2em; margin-top: 5em;">
				<li id="Latest" class="active">
					<div class="video-grid">
					  <c:forEach items="${album}" var="album">
						<a href="albumInfo?id=${album.id }" class="grid_3"
							style="margin: 0em 0.5em 0em 0.5em; width: 32%;">
							 <img src="api/picture/PICHONG.png" alt="#"> 
							 <span><strong>앨범명${album.albName}</strong>아티스트명${album.artName} / 앨범날짜${album.releaseAt}</span>
						</a>
						</c:forEach> 

					</div> <!-- video grid -->
				</li>
				<!-- tab content -->
			</ul>
			<!-- end tabs -->
			<br><br><br>
			
			<!-- 앨범 페이징처리 -->
			 <div class="pageInfo_wrap">
      			<div class="pageInfo_area" style="text-align: center;">
       				<ul id="pageInfo" class="pageInfo">
            <!-- 이전페이지 버튼 -->
            			<c:if test="${pageMaker2.prev}">
              				 <li class="pageInfo_btn previous">
               				<a href="#" onclick="paging2(${pageMaker2.startPage-1})">Previous</a></li>
            			</c:if>
            <!-- 각 번호 페이지 버튼 -->
            			<c:forEach var="num" begin="${pageMaker2.startPage}"
               			end="${pageMaker2.endPage}">
               				<li class="pageInfo_btn ${pageMaker2.cri.pageNum == num ? "focus":""}" style="display:inline;">
               				<a href="#" onclick="paging2(${num})">${num}</a></li>
         				</c:forEach>
            <!-- 다음페이지 버튼 -->
         				<c:if test="${pageMaker2.next}">
        					<li class="pageInfo_btn next">
          			    	<a href="#" onclick="paging2(${pageMaker2.endPage + 1})">Next</a></li>
       				    </c:if>
     				 </ul>
      			</div>
			  </div>
	
	<form id="moveForm2" method="get" action="artistDetail">
      <input type="hidden" name="albumPageNum" value="${pageMaker2.cri.pageNum }">
      <input type="hidden" name="albumAmount" value="${pageMaker2.cri.amount }">
      <input type="hidden" name="musicPageNum" value="${pageMaker.cri.pageNum }">
      <input type="hidden" name="musicAmount" value="${pageMaker.cri.amount }">
      <%--       <input type="hidden" name="keyword" value="${pageMaker2.cri.keyword }"> --%>
      <%--       <input type="hidden" name="type" value="${pageMaker2.cri.type }"> --%>
   </form>
		</div>
		<!-- def block -->
	</div>
	<!-- posts -->
	<!-- 왼쪽하단 메인 끝-->
</div>
<!-- content끝 -->

<!-- 위시리스트모달 -->
<div class="modal fade def-block" id="myModal" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel" aria-hidden="true" style="top:30%; display:none;">
    <div class="modal-dialog ">
        <div class="modal-content ">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        style="color:white" aria-hidden="true">&times;</span></button>
                <h4 style="border:none;" class="modal-title" id="myModalLabel">위시리스트 선택</h4>
            </div>
            <div id="activeAdd" class="modal-body def-block">
                <c:forEach items="${wishLists}" var="album">
                    <div class="mbf clearfix">
                        <ul>
                            <li>
                                <!-- 위시리스트 이름 -->
                                <div class="toggle-head" style="padding-bottom:20px;">
                                    <h5 style="margin:0px;">
                                            ${album.name}
                                        <button onclick="addWishList()" class="tbutton small"
                                                style="float:right;">
                                            <span data-wishid="${album.id}">선택</span>
                                        </button>
                                    </h5>
                                </div>
                            </li>
                        </ul>
                    </div>
                </c:forEach>
            </div>
            <div class="modal-footer def-block">
                <button class="tbutton small" data-dismiss="modal" aria-label="Close">
                    <span>확인</span></button>
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
    (function () {
        var s = document.createElement('script');
        s.async = true;
        s.type = 'text/javascript';
        s.src = '//' + disqus_shortname + '.disqus.com/count.js';
        (document.getElementsByTagName('HEAD')[0] || document
        .getElementsByTagName('BODY')[0]).appendChild(s);
    }());
    /* ]]> */

    $(document).ready(function () {
        $('#myModal').on('show.bs.modal', function (event) {

            musicid = $(event.relatedTarget).data('musicid');
        });
    });

    function buy() {
        var id = $(event.target).data('musicid');
        $.ajax({
            url: "checkBuy",
            type: "get",
            data: {"id": id},
            dataType: "text",
            success: function resultBuy(result) {
                if (result == 0) {
                    var confirm1 = confirm("장바구니에 담으시겠습니까?")
                    if (confirm1) {
                        $.ajax({
                            url: "cart/add",
                            type: "post",
                            data: {"id": id},
                            dataType: "text",
                            success: function (data) {
                                alert("장바구니에 담았습니다.");
                            },
                            error: function (xhr, status, error) {
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
            error: function (xhr, status, error) {
                alert("연결실패");
            }
        });

    }

    function paging(num) {
        moveForm.musicPageNum.value = num;
        moveForm.submit();
    };

    function paging2(num) {
        moveForm2.albumPageNum.value = num;
        moveForm2.submit();
    };

    //위시리스트
    //뮤직아이디 가져오기
    var id;
    $(document).ready(function () {     //페이지를 틀면 바로 실행
        $('.wishBtn').on('click', function (event) {   //담기버튼을 클릭하면 담기버튼안의 musicid가 var id;에 들어간다 그리고 저장되고 밑에 addwish()메소드에서 사용할거다
            //인풋폼
            id = $(this).data("musicid");
        });
    });

    //위시리스트 추가
    function addWishList() {
        let wishId = $(event.target).data('wishid')

        $.ajax({
            type: "POST", //요청 메소드 방식
            url: "addWishList",
            contentType: 'application/json;charset=utf-8',
            data: JSON.stringify({"musicId": id, "wishId": wishId}),
            dataType: "text", //서버가 요청 URL을 통해서 응답하는 내용의 타입
            error: function () {
                alert("이미 추가한 곡입니다.");
            },
            success: function (result) {
                alert("추가되었습니다");
            }
        })
    }

    function followArtist() {
        $.ajax({
            url: "follow",
            type: "post",
            contentType: 'application/x-www-form-urlencoded;charset=utf-8',
            traditional: true,
            data: {"artistId": ${artist.id}},
            dataType: "text",
            success: function (data) {
                alert("성공!");
            },
            error: function (data) {
                alert("실패!");
            }
        })
    }
</script>