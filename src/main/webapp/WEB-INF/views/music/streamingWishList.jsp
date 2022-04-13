<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<style>
	xmp {
		color: white;
		font-size: 20px;
		text-align: center;
	}
	#b1, #s1 {
		visibility:hidden;
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
		<img src="resources/images/bg/musicBB.jpg" alt="" style="height: 1700px;">
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
						<xmp id="lyric">
${musicSelectListByWishList[0].lyric}
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
									<a href="albumInfo?id=${albumSelectByWishList.id }" class="grid_3">
										<img id="albImg" src="api/picture/${albumSelectByWishList.picture }" alt="#">
										<span><strong id="albName"> ${albumSelectByWishList.albName }</strong><span id="artName">${albumSelectByWishList.artName }</span></span>
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

<script>
//파일아이디로 sname가져오기
var myPlaylist = []
let fileId = 0;

<c:forEach items="${musicSelectListByWishList}" var = "music">
	fileId = '${music.fileId}'
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
	console.log(fileName)
	myPlaylist.push({
					writer: '${music.writer}',
					composing: '${music.composing}',
					arrangement: '${music.arrangement}',
					musicId: '${music.id}',
					mp3 : "/prj/api/file/"+fileName,
					title : '${music.title}',
					artist : '${music.artName}',
					rating: 5,
					buy:'#',
					price:'',
					duration : '${music.time}',
					cover:'api/picture/${music.picture }'
					})
	} 
</c:forEach>
jQuery(document).ready(function () {
	$('.music-player-list').ttwMusicPlayer(myPlaylist, {
		currencySymbol: '',
		buyText:'구매',
		tracksToShow:6,
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

//상태 업뎃
function change() {
	//li"track", span"title", span"duration" a"buy" => 각각 마다 다르게 주기
	let musicId = 0;
	if(event.target.className == 'track') {
		//console.log('this is li Tag')
		musicId = $(event.target).children().data("musicid")
	} 
	if(event.target.className == 'title') {
		//console.log('this is spanTilte Tag')
		musicId = $(event.target).data("musicid")
	} 
	if(event.target.className == 'duration') {
		//console.log('this is spanduration Tag')
		musicId = $(event.target).prev().data("musicid")
	} 
	if(event.target.className == 'buy') {
		return;
	}
	
	$.ajax({
		type: "GET", 
		url:"musicSelectBymusicId/"+musicId,
		dataType:"json", 
		error : function(a, b, c){
			alert(a + b + c);
		},
		success: musicSelectResult
	})
}
	//작사작곡편곡 바꾸기, 가사바꾸기, 수록앨범 바꾸기
function musicSelectResult(data) {
	$('#writer').html('작사: '+data.writer)
	$('#composing').html('작곡: '+data.composing)
	$('#arrangement').html('편곡: '+data.arrangement)
	$('#lyric').html(data.lyric)
	//음악 사진 작업
	
	$.ajax({
	type: "GET", 
	url:"albumSelectBymusicId/"+data.id,
	dataType:"json", 
	error : function(a, b, c){
		alert(a + b + c);
	},
	success: albumSelectResult
	})
}
	function albumSelectResult(result) {
		$('.grid_3').attr('href','albumInfo?id='+result.id)
		$('#albName').html(result.albName)
		$('#artName').html(result.artName)
		//앨범사진작업
	}

jQuery(document).ready(function(){
	$('#writer').html('작사: ${musicSelectListByWishList[0].writer}');
	$('#composing').html('작곡: ${musicSelectListByWishList[0].composing}');
	$('#arrangement').html('편곡: ${musicSelectListByWishList[0].arrangement}');
})

<!-- 구매1 -->
function addCart() {
	   var title=$('#title1').html()
	   var artName=$('#artName1').html()
	$.ajax ({
	        url : "musicSelectByArtName",
	        type : "get",
	        data : {"title" : title, "artName" : artName},                   
	        dataType : "json", 
	        success : result1,
	        error: function(xhr, status, error){
	        	alert("통신실패");
	        }
  }) 
}
function result1(result) {
	  if(result.purchased == 1) {
		  alert('이미 구매한 곡입니다.')
	  } else {
		  	var confirm1 = confirm('장바구니에 담으시겠습니까?')
	  		var id = result.id
	  
	   		if(confirm1) {
				$.ajax ({
				        url : "cart/test/add",
				        type : "post",
				        data : {"id" : id},                   
				        dataType : "text",
				        success : function(data) {
				        console.log(data);
				        alert("장바구니에 담았습니다.");
				        },
				        error: function(xhr, status, error){
				        	alert("통신실패");
				        }
			     }) 
		    } else {
		          alert("구매취소")
		     }
	  }
}

</script>
