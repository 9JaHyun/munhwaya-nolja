<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<script>
var title1 = '${musicSelect.title}'
var myPlaylist = [
	{
		writer: '${musicSelect.writer}',
		composing: '${musicSelect.composing}',
		arrangement: '${musicSelect.arrangement}',
		musicId: '${musicSelect.id}',
		mp3 : '${musicSelect.fileName}',
		title : '${musicSelect.title}',
		artist : '${musicSelect.artName}',
		rating: 5,
		buy:'#',
		price:'',
		duration : '${musicSelect.time}',
		cover:'resources/images/bg/musicBg3.jpg'
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
</script>
<script>
jQuery(document).ready(function(){
	$('#writer').html('작사: ${musicSelect.writer}');
	$('#composing').html('작곡: ${musicSelect.composing}');
	$('#arrangement').html('편곡: ${musicSelect.arrangement}');
})
</script>
<!-- =================================================================== -->
<style>
	xmp {
		color: white;
		font-size: 20px;
		text-align: center;
	}
	.single_variation_wrap > i{
		 color: white;
	}
	.single_variation_wrap > i:hover{
		 color: #FF0078;
	}
</style>

	<!--(배경이미지) -->
	<div class="under_header" style="height:70px">
		<img src="resources/images/bg/musicBg.jpg" alt="#" style="height: 1500px;">
	</div>
		
	<!-- content -->
	<div class="page-content back_to_up">
		<!-- 최상단메인칸 -->
		<div class="row row-fluid clearfix mbf">
			<!-- 검색바 -->
			<div class="little-head row">
				<div class="search">
					<form action="searchResult" id="search" method="get" >
						<input  id="id" name="id" type="text"
							style="font-size:small; width: 1000px; height: 60px; " value=""
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
										<img src="resources/images/bg/musicBg3.jpg" alt="#">
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
<!-- 위시리스트 추가 -->
<script>
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
        <h4 class="modal-title" id="myModalLabel">위시리스트 선택</h4>
      </div>
      <div class="modal-body def-block">
        <c:forEach items="${wishlists}" var="wishlist">
		<div class="mbf clearfix">
			<ul>
				<li>
					<!-- 위시리스트 이름 -->
					<div class="toggle-head">
						<h5 style="margin:0px;">
							${wishlist.name}
							<button onclick="addWishList()" class="tbutton small" style="margin-left:90%">
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

<script>
   <!-- 구매1 -->
   function addCart() {
	   
	  var id = '${musicSelect.id}'
	  var title = '${musicSelect.title}'
	  var price = '${musicSelect.price}'
      var artName = '${musicSelect.artName}'
      var genre = '${musicSelect.genre}'
      var lyric = '${musicSelect.lyric}'
      var likeIt = '${musicSelect.likeIt}'
      var fileName = '${musicSelect.fileName}'
      var albumId = '${musicSelect.albumId}'
      var time = '${musicSelect.time}'
      var writer = '${musicSelect.writer}'
      var composing = '${musicSelect.composing}'
      var arrangement = '${musicSelect.arrangement}'
      
	  var confirm1 = confirm('장바구니에 담으시겠습니까?')
	  
      if(confirm1) {
      	$.ajax ({
	        url : "cart/test/add",
	        type : "post",
	        data : JSON.stringify({"id" : id, "title" : title, "price" : price, "artName" : artName,"genre" : genre,
	        	"lyric" : lyric, "likeIt" : likeIt, "fileName" : fileName, "albumId" : albumId, "time" : time, 
	        	"writer" : writer,   "composing" : composing, "arrangement" : arrangement}),                   
	        dataType : "text",
	        contentType : 'application/json',
	        success : function(data) {
	        console.log(data);
	        alert("장바구니에 담았습니다.");
	        },
	        error: function(xhr, status, error){
	        alert(error);
	        }
        }) 
       } else {
             alert("삭제취소")
        }
     }
   <!-- 구매2 -->
   function addCart2() {
	  var confirm1 = confirm('장바구니에 담으시겠습니까?')
	  var musicId= $(event.target).prev().prev().data("musicid")
	   if(confirm1) {
	      	$.ajax ({
		        url : "musicSelectBymusicId/"+musicId,
		        type : "get",
		        data : {"musicId" : musicId},               
		        dataType : "json",
		        success :addCart2Result,
		        error: function(xhr, status, error){
		        alert("통신실패");
		        }
	        }) 
	        
	       } else {
	             alert("삭제취소")
	        }
	}
	function addCart2Result(result) {
			var id = result.id
	  		var title = result.title
	  		var price = result.price
      		var artName = result.artName
      		var genre = result.genre
      		var lyric = result.lyric
      		var likeIt = result.likeIt
      		var fileName = result.fileName
      		var albumId = result.albumId
      		var time = result.time
      		var writer = result.writer
      		var composing = result.composing
      		var arrangement = result.arrangement
	        $.ajax ({
		        url : "cart/test/add",
		        type : "post",
		        data : JSON.stringify({"id" : id, "title" : title, "price" : price, "artName" : artName,"genre" : genre,
		        	"lyric" : lyric, "likeIt" : likeIt, "fileName" : fileName, "albumId" : albumId, "time" : time, 
		        	"writer" : writer,   "composing" : composing, "arrangement" : arrangement}),                   
		        dataType : "text",
		        contentType : 'application/json',
		        success : function(data) {
		        console.log(data);
		        alert("장바구니에 담았습니다.");
		        },
		        error: function(xhr, status, error){
		        alert("통신실패2");
		        }
	        })  
	}
	
   <!-- 좋아요기능 -->
   function likeIt() {
	   var musicId = '${musicSelect.id}'
	   $.ajax ({
		   url : "updateLike",
		   type : "POST",
		   data : {"musicId" : musicId},
		   dataType : "text",
		   success : function(result) {
		   		alert(result);
		   },
		   error: function(a,b,c){
		   		alert("통신실패")
		   }
	   }) 
   }
  </script>