<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<script>
var title1 = '${musicSelect.title}'
var myPlaylist = [
	{
		mp3:'${musicSelect.fileName}',
		title: title1,
		artist:'${musicSelect.artName}',
		rating: 0,  // album에서 가져오던가, 아예 삭제
		buy:'#',
		price:'',
		duration:'${musicSelect.time}',
		cover:'resources/images/bg/musicBg3.jpg',
		writer:'',
		composing:'',
		arrangement:''
	}
];
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
<script>
jQuery(document).ready(function(){
	$('#writer').html('작사: ${musicSelect.writer}');
	$('#composing').html('작곡: ${musicSelect.composing}');
	$('#arrangement').html('편곡: ${musicSelect.arrangement}');
})
</script>
