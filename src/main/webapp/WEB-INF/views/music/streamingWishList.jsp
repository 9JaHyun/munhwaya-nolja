<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- <script>
jQuery(document).ready(function(){
	$('#writer').html('작사: ${musicSelect.writer}');
	$('#composing').html('작곡: ${musicSelect.composing}');
	$('#arrangement').html('편곡: ${musicSelect.arrangement}');
})
</script> -->

<!-- 변수에 다 지정 후에 배열하나 만들고 총 배열에 add() 추가 * -->
<script>
var myPlaylist = []
<c:forEach items="${musicSelectListByWishList}" var = "music">
	myPlaylist.push({
					writer: '${music.writer}',
					composing: '${music.composing}',
					arrangement: '${music.arrangement}',
					musicId: '${music.id}',
					mp3 : '${music.fileName}',
					title : '${music.title}',
					artist : '${music.artName}',
					rating: 5,
					buy:'#',
					price:'',
					duration : '${music.time}',
					cover:'resources/images/bg/musicBg3.jpg'
					})
</c:forEach>
jQuery(document).ready(function () {
	$('.music-player-list').ttwMusicPlayer(myPlaylist, {
		currencySymbol: '',
		buyText:'mp3',
		tracksToShow:3,
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
function change() {
	//li"track", span"title", span"duration" a"buy" => 각각 마다 다르게 주기
	var musicId = null;
	if(event.target.className == 'track') {
		console.log('this is li Tag')
		musicId = $(event.target).children().data("musicid")
	} 
	if(event.target.className == 'title') {
		console.log('this is spanTilte Tag')
		musicId = $(event.target).data("musicid")
	} 
	if(event.target.className == 'duration') {
		console.log('this is spanduration Tag')
		musicId = $(event.target).prev().data("musicid")
		console.log(musicId)
	} 
	if(event.target.className == 'buy') {
		return
	}
	
	//뮤직아이디 받아왔으니 아작스로 해당하는 뮤직아이디의 정보를 가져와야함
	$.ajax({
		type: "GET", //요청 메소드 방식
		url:"musicSelectBymusicId/"+musicId,
		dataType:"json", //서버가 요청 URL을 통해서 응답하는 내용의 타입
		error : function(a, b, c){
			alert(a + b + c);
		},
		success: musicSelectResult
	})
	//작사작곡편곡 바꾸기, 가사바꾸기, 수록앨범 바꾸기
 	function musicSelectResult(data) {
		console.log(data.writer)
		$('#writer').html('작사: '+data.writer)
		$('#composing').html('작곡: '+data.composing)
		$('#arrangement').html('편곡: '+data.arrangement)
		$('#lyric').html(data.lyric)
		//음악 사진 작업
		
		$.ajax({
		type: "GET", //요청 메소드 방식
		url:"albumSelectBymusicId/"+data.id,
		dataType:"json", //서버가 요청 URL을 통해서 응답하는 내용의 타입
		error : function(a, b, c){
			alert(a + b + c);
		},
		success: albumSelectResult
	})
		function albumSelectResult(result) {
			$('.grid_3').attr('href','albumInfo?id='+result.id)
			$('#albName').html(result.albName)
			$('#artName').html(result.artName)
			//앨범사진작업
		}
	}
}

//위시리스트 추가
function addWishList() {
	var title = $('#title1').html()
	var artName = $('#artName1').html()
	
	$.ajax({
		type: "POST", //요청 메소드 방식
		url:"addWishList",
		contentType:'application/json;charset=utf-8',
		data: {"title": title, "artName": artName},
		dataType:"json", //서버가 요청 URL을 통해서 응답하는 내용의 타입
		error : function(a, b, c){
			alert(a + b + c);
		},
		success: function(result) {
			console.log(result)
		}
	})
	
}

</script>

<style>
	xmp {
		color: white;
		font-size: 20px;
		text-align: center;
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
										<img id="albImg" src="resources/images/bg/musicBg3.jpg" alt="#">
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
jQuery(document).ready(function(){
	$('#writer').html('작사: ${musicSelectListByWishList[0].writer}');
	$('#composing').html('작곡: ${musicSelectListByWishList[0].composing}');
	$('#arrangement').html('편곡: ${musicSelectListByWishList[0].arrangement}');
	
})
</script>