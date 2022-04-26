<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<script>
var title1 = '${musicSelect.title}'
let	fileId = '${musicSelect.fileId}'
		$.ajax({
			type: "GET", 
			url:"getFiles/"+fileId,
			dataType:"json", 
			error : function(a, b, c){
				alert("통신실패");
			},
			success: pushList
		})
function pushList(result) {
	let fileName = result.sname
	var myPlaylist = [
		{
		writer: '${musicSelect.writer}',
		composing: '${musicSelect.composing}',
		arrangement: '${musicSelect.arrangement}',
		musicId: '${musicSelect.id}',
		mp3 : "${pageContext.request.contextPath}/api/music/"+fileName,
		title : '${musicSelect.title}',
		artist : '${musicSelect.artName}',
		rating: 5,
		buy:'#',
		price:'',
		duration : '${musicSelect.time}',
		cover:'api/picture/${musicSelect.picture }'
	}
];
jQuery(document).ready(function () {
	$('.music-player-list').ttwMusicPlayer(myPlaylist, {
		currencySymbol: '',
		buyText:'구매',
		tracksToShow:1,
		autoplay: false,
		ratingCallback:function(index, playlistItem, rating){
			//some logic to process the rating, perhaps through an ajax call
		},
		jPlayer:{
			swfPath: "http://www.jplayer.org/2.7.0/js/",
			supplied: "mp3",
			volume:  0.8,
			wmode:"window",
			solution: "html,flash",
			errorAlerts: true,
			warningAlerts: true
		}
	})
	
})
}
</script>

<!-- =================================================================== -->
<style>
	xmp {
		color: white;
		font-size: 15px;
		text-align: center;
		line-height: 10px;
	}
	.single_variation_wrap > i{
		 color: white;
	}
	.single_variation_wrap > i:hover{
		 color: #FF0078;
	}
	.highlight{
		max-width:180px; 
		min-width:180px; 
		max-height :180px; 
		min-height:180px;
	}
</style>

	<!--(배경이미지) -->
	<div class="under_header" style="height:70px">
		<img src="resources/images/bg/musicBB.jpg" alt="" style="min-height : 2000px;">
	</div>
		
	<!-- content -->
	<div class="page-content back_to_up">
		<!-- 최상단메인칸 -->
		<div class="row row-fluid clearfix mbf">
			<!-- 검색바 -->
			<div class="little-head row">
				<div class="search">
					<form action="searchResult" id="search" method="get" >
						<input id="title" name="title" type="text"
							style="font-size:small; width: 1000px; height: 60px;"
							placeholder="노래명, 앨범명 입력">
						<button type="submit" style="margin-top:15px; margin-right:10px;">
							<i class="icon-search" style="font-size: 25px;"></i>
						</button>
					</form>
				</div>
			</div>
		</div>
		<!-- 검색바 끝-->
		<!-- 앨범정보 -->
		<div class="row row-fluid clearfix mbf">
				<div class="posts">
					<div class="def-block">
						<div class="post row-fluid clearfix">
							<div class="music-player-list wide-mp3 mbf clearfix">
							</div>
							<!-- Player -->
						</div><!-- post -->
					</div><!-- def block -->
				</div><!-- span8 posts -->
			</div><!-- row clearfix -->
		
		<!-- 가사 -->
		<div class="row row-fluid clearfix mbf">
				<div class="posts">
					<div class="def-block">
						<h4> 가사 </h4><span class="liner"></span>
						<xmp>
${musicSelect.lyric }
						</xmp>
					</div><!-- def block -->
				</div><!-- span8 posts -->
			</div><!-- row clearfix -->
		<!-- 가사 끝 -->
		<!-- 수록앨범 -->
		<div class="row row-fluid clearfix mbf">
			<div class="posts">
					<div class="def-block">
						<h4>수록 앨범</h4>
						<i class="icon-angle-right" style="font-size:large; margin-left: 7px;"></i>
						<span class="liner"></span>
						<ul class="tabs-content">
							<li id="Latest" class="active">
								<div class="video-grid">
									<a href="albumInfo?id=${AlbumSelectByMusicId.id }" class="grid_3">
										<img src="api/picture/${AlbumSelectByMusicId.picture }" alt="#" style="max-width:180px; min-width:180px; max-height :180px; min-height:180px;">
										<span><strong>${AlbumSelectByMusicId.albName }</strong>${AlbumSelectByMusicId.artName }</span>
									</a>
								</div><!-- video grid -->
							</li><!-- tab content -->
						</ul><!-- end tabs -->
					</div><!-- def block -->
				</div><!-- posts -->
			<!-- 왼쪽하단 메인 끝-->	
		</div>
		<!-- 수록앨범 끝 -->
	</div>
	<!-- content끝 -->
<!-- ================================================================ -->
<script>
<!-- 위시리스트 추가 -->

function addWishList(e) {
	let query = window.location.search;
	let param = new URLSearchParams(query);
	let musicId = param.get('id');
	let wishId = $(event.target).data('wishid')
	
	$.ajax({
		type: "POST", //요청 메소드 방식
		url:"addWishList",
		contentType:'application/json;charset=utf-8',
		data: JSON.stringify({"musicId": musicId, "wishId": wishId}),
		dataType:"text", //서버가 요청 URL을 통해서 응답하는 내용의 타입
		error : function(){
			alert("이미 추가한 곡입니다.");
		},
		success: function(result) {
			alert("추가되었습니다");
		}
	})
	
	
}
</script>
<!-- 위시리스트모달 -->
<div class="modal fade def-block" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="top:30%; display:none;">
  <div class="modal-dialog ">
    <div class="modal-content ">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span style="color:white" aria-hidden="true">&times;</span></button>
        <h4 style="border:none;" class="modal-title" id="myModalLabel">위시리스트 선택</h4>
      </div>
      <div id="activeAdd" class="modal-body def-block">
        <c:forEach items="${wishlists}" var="album">
		<div class="mbf clearfix">
			<ul>
				<li>
					<!-- 위시리스트 이름 -->
					<div class="toggle-head" style="padding-bottom:20px;">
						<h5 style="margin:0px;">
							${album.name}
							<button onclick="addWishList()" class="tbutton small" style="float:right;">
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
        <button class="tbutton small" data-toggle="modal" data-target="#myModal2" data-dismiss="modal" aria-label="Close"><span>위시리스트 생성</span></button>
        <button class="tbutton small" data-dismiss="modal" aria-label="Close"><span>확인</span></button>
      </div>
    </div>
  </div>
</div>
	<!-- 위시리스트모달 끝-->
<!-- 위시리스트 추가모달 -->
<div class="modal fade def-block" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="top:30%; display:none;">
  <div class="modal-dialog ">
    <div class="modal-content ">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span style="color:white" aria-hidden="true">&times;</span></button>
        <h4 style="border:none" class="modal-title" id="myModalLabel">위시리스트 생성</h4>
      </div>
      <div class="modal-body def-block">
		<div class="mbf clearfix">
			<ul>
				<li>
					<!-- 위시리스트 이름 -->
					<div class="toggle-head">
							<input type="text" id="name" name="name" style="width:90%;" placeholder="위시리스트 제목 입력">
					</div>
				</li>
			</ul>
		</div>
      </div>
      <div class="modal-footer def-block">
        <button type="submit" class="tbutton small" onclick="createWishList()"><span>생성</span></button>
      </div>
    </div>
  </div>
</div>
	<!-- 위시리스트 추가모달 끝-->
<script>
window.onload =function(){
	$('#writer').html('작사: ${musicSelect.writer}');
	$('#composing').html('작곡: ${musicSelect.composing}');
	$('#arrangement').html('편곡: ${musicSelect.arrangement}');
}
// 위시리스트 생성 버튼 
function createWishList() {
	//onclick시 인풋밸류 보내고 위시리스트 DB에 넣고, alert띄우고, input밸류지우기
	let name = $('#name').val()
	$.ajax({
		url : "createWishList",
        type : "post",
        data : JSON.stringify({"name" : name}),                   
        dataType : "json",
        contentType: 'application/json; charset=utf-8',
        success : result,
        error: function(xhr, status, error){
        	alert("통신실패");
        }
	})
}
function result(data) {
	alert('생성이 완료되었습니다.')
	$('#name').val('')
	$('#activeAdd').append('<div class="mbf clearfix">'+
								'<ul id="addLi">'+
									   '<li>'+
											'<div class="toggle-head" style="padding-bottom:20px;">'+
												'<h5 style="margin:0px;">'+
													data.name+
													'<button onclick="addWishList()" class="tbutton small" style="float:right;">'+
														'<span data-wishid="'+data.id+'">선택</span>'+
													'</button>'+
												'</h5>'+
											'</div>'+
										'</li>'+
								  '</ul>'+
							'</div>')	
}
   <!-- 구매1 -->
 function addCart() {
	  var id = '${musicSelect.id}'
	  
	  if('${buyButton}' == '2') {
		  var confirm1 = confirm('장바구니에 담으시겠습니까?')
	  
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
		  alert("이미 구매한 곡입니다.")
	  }
  }
  </script>