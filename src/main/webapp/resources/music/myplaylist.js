/*
	For Edit This File Please Read Documentation
*/
	
	//var myPlayList = List<PlayListVO> => 의 MusicList.serialize()
	var myPlaylist = [
		
		{
			mp3:'1.mp3',
			title: "111",
			artist:'Alexandra',
			rating:5,  // album에서 가져오던가, 아예 삭제
			buy:'#',
			price:'17',
			duration:'0:38',
			cover:'music/1.jpg'	
		},
		{
			mp3:'2.mp3',
			title:'Track 2',
			artist:'BlueFoxMusic',
			rating:4,
			buy:'#',
			price:'17',
			duration:'2:51',
			cover:'music/2.jpg'	
		},
		{
			mp3:'1.mp3',
			title:'Track 3',
			artist:'Alexandra',
			rating:5,
			buy:'#',
			price:'17',
			duration:'0:38',
			cover:'music/1.jpg'	
		},
		{
			mp3:'2.mp3',
			title:'Track 4',
			artist:'BlueFoxMusic',
			rating:4,
			buy:'#',
			price:'17',
			duration:'2:51',
			cover:'music/2.jpg'	
		},
		{
			mp3:'1.mp3',
			title:'Track 5',
			artist:'Alexandra',
			rating:5,
			buy:'#',
			price:'17',
			duration:'0:38',
			cover:'music/1.jpg'	
		},
		{
			mp3:'2.mp3',
			title:'Track 6',
			artist:'BlueFoxMusic',
			rating:4,
			buy:'#',
			price:'17',
			duration:'2:51',
			cover:'music/2.jpg'	
		},
		{
			mp3:'1.mp3',
			title:'Track 7',
			artist:'Alexandra',
			rating:5,
			buy:'#',
			price:'17',
			duration:'0:38',
			cover:'music/1.jpg'	
		},
		{
			mp3:'2.mp3',
			title:'Track 8',
			artist:'BlueFoxMusic',
			rating:4,
			buy:'#',
			price:'17',
			duration:'2:51',
			cover:'music/2.jpg'	
		},
	];
	jQuery(document).ready(function ($) {
		$('.music-player-list').ttwMusicPlayer(myPlaylist, {
			currencySymbol:'$',
			buyText:'BUY',
			tracksToShow:3,
			autoplay:true,
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
		});
	});
