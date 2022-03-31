<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
			
<style> 
table{ 
		border:1px,	solid black;
		width:1000px; 
	} 


.p{
 width : 10%;
}
table { 
 		border-collapse: separate; 
 		border-spacing:30px 10px; 
 		} 

.artist-info{
		width: 700px;
		padding-bottom: 20px;
}
.img{
		width: 600px;
		
}
.act{
	width: 700px;
	padding-bottom: 10px;
	font-size: initial;
}

.artist-album{
		width:30%;
		hight: 200px;
		
}
.album{
	
	width:33%;
	padding: 10px;
	float:center;
	align-content: space-between;
}





 </style>


		<div class="under_header">
			<img src="images/assets/breadcrumbs12.png" alt="#">
		</div><!-- under header -->

		<div class="page-content back_to_up">
			<div class="row clearfix mb">
				<div class="breadcrumbIn">
					<ul>
						<li><a href="index.html" class="toptip" title="Homepage"> <i class="icon-home"></i> </a></li>
						<li><a href="mp3s.html"> MP3s </a></li>
						<li><a href="mp3s.html"> Alexander Doe </a></li>
						<li> Album Missing You </li>
					</ul>
				</div><!-- breadcrumb -->
			</div><!-- row -->

			<div class="row row-fluid clearfix mbf">
				<div class="posts">
					<div class="def-block">
						<div class="post row-fluid clearfix">
							<div class="music-player-lis t wide-mp3 mbf clearfix">
								<div class="ttw-music-player" style="opacity: 1;">
							
								<div class="album-cover"></div>
									<span class="img" style="opacity: 0;"></span>
								</div>
							
							<div class="artist-info" style="float: right;">
								<div class="act">
									<a>활동명</a>&emsp;<a>${artist.name}</a><br>
								</div>
								<div class="act" >
								<a>활동유형</a>&emsp;<a>${artist.type}</a><br>
								</div>
								<div class="act">
								<a>주요활동 장르</a>&emsp;<a>${artist.genre}</a><br>
								</div>
								<div class="act">
								<a> 소개글</a>&emsp;<a>${artist.content}</a>
								</div>
							</div>
						</div>
					</div>	
				</div>		
			</div>
			
			
							<!-- Player -->

							
								<caption>인기순(or 최신순)</caption>
								<table>
									<tr>
										<td width="3%"><input type="checkbox"></td>
										<td width="3%">NO</td>
										<td width="10%">듣기</td>
										<td width="10%">다운</td>
										<td width="25%">곡명</td>
										<td width="15%">아티스트명</td>
										<td width="10%">앨범</td>
										<td width="9%">좋아요</td>
										<td width="10%">위시리스트</td>
									</tr>
									<!--  c:forEach -->
									<tr>
										<td><input type="checkbox"></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td>
							<div class="like-post">
								<div id="fb-root"></div>
								<script>(function(d, s, id) { 			<!--계정연결 변경하기-->
								  var js, fjs = d.getElementsByTagName(s)[0];
								  if (d.getElementById(id)) return;
								  js = d.createElement(s); js.id = id;
								  js.src = "//connect.facebook.net/en_US/all.js#xfbml=1";
								  fjs.parentNode.insertBefore(js, fjs);
								}(document, 'script', 'facebook-jssdk'));</script>
								<div class="fb-like" data-href="http://developers.facebook.com/docs/reference/plugins/like" data-width="80" data-layout="button_count" data-show-faces="false" data-send="false"></div>
							</div><!-- like --></td>
										<td></td>
									</tr>
									<!-- /c:forEach -->
							</table>
							<br>
							<br>
							<br>
					<!--  div class="set">	
							<div class="albums">
								<span class="img style="opacity: 0;">
								</span>
							
							</div>-->
							
			<div class="row row-fluid clearfix mbf">
				<div class="posts">
					<div class="album">
					<div class="def-block">
						<div class="post row-fluid clearfix">
							<div class="music-player-lis t wide-mp3 mbf clearfix">
								<div class="ttw-music-player" style="opacity: 1;">
							
								<div class="album-cover"></div>
									<span class="img" style="opacity: 0;"></span>
								</div>
							
							
								<div class="artist-album" style="float: right;">
									<a>앨범명</a>&nbsp;<a herf=""> </a><br>
									<a>아티스트명</a><br>
									<a>앨범날짜</a>
								</div>
							</div>
							
							<div class="music-player-lis t wide-mp3 mbf clearfix">
								<div class="ttw-music-player" style="opacity: 1;">
							
								<div class="album-cover"></div>
									<span class="img" style="opacity: 0;"></span>
								</div>
							
							
								<div class="artist-album" style="float: right;">
									<a>앨범명</a>&nbsp;<a herf=""> </a><br>
									<a>아티스트명</a><br>
									<a>앨범날짜</a>
								</div>
							</div>
							
							<div class="music-player-lis t wide-mp3 mbf clearfix">
								<div class="ttw-music-player" style="opacity: 1;">
							
								<div class="album-cover"></div>
									<span class="img" style="opacity: 0;"></span>
								</div>
							
							
								<div class="artist-album" style="float: right;">

									<a>앨범명</a>&nbsp;<a herf=""> </a><br>
									<a>아티스트명</a><br>
									<a>앨범날짜</a>
								</div>
							</div>
							
						</div>
					</div>
							
			
							
					</div><!-- def block -->
				</div><!-- span8 posts -->

			</div><!-- row clearfix -->
		</div><!-- end page content -->
	</div><!-- post -->
		
					<!-- tags -->
								<!--  <span> Tags: </span>
								<a href="#" class="#"> Alexander doe </a>,
								<a href="#" class="#"> Remix </a>
							</p>--> 

						
						


		
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
	
	/* <![CDATA[ */
	// Disqus
		var disqus_shortname = 'remixtemplate'; 
		(function () {
			var s = document.createElement('script'); s.async = true;
			s.type = 'text/javascript';
			s.src = '//' + disqus_shortname + '.disqus.com/count.js';
			(document.getElementsByTagName('HEAD')[0] || document.getElementsByTagName('BODY')[0]).appendChild(s);
		}());
	/* ]]> */
	</script>
</html>