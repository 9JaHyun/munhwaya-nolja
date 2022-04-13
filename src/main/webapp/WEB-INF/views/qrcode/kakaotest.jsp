<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
</head>
<body>
<!-- 	<a id="kakao_share"> -->
<!--     카카오톡 -->
<!-- 	</a> -->
	
	<ul class="sns">
  <li class="kakaotalk">
  <a href="#n" id="btnKakao" onclick="fn_sendFB('kakaotalk');return false;" class="kakaotalk" target="_self" title="카카오톡 새창열림"><span class="skip">카카오톡</span></a>
  </li>
</ul>
	
</body>
<script>
// //SDK import
// // SDK import
// import Kakao from '@/common/plugins/kakao.min'

// // SDK init
// if (!Kakao.isInitialized()) {
// 	Kakao.init('5af28610a2211822d22d5668aec3f605')
// }
// //createDefaultButton 함수 호출

// Kakao.Link.createDefaultButton({
//        container: '#kakao_share',
//        objectType: 'commerce',
//        content: {
//               title: param.title,
//               imageUrl,
//               imageWidth,
//               imageHeight,
//               link: {
//                 mobileWebUrl: param.shareUrl,
//                 webUrl: param.shareUrl
//               }
//         },
//         commerce: {
//               regularPrice: param.regularPrice,
//               discountPrice: param.discountPrice,
//               discountRate: param.discountRate
//         },
//         buttons: [
//               {
//                 title: '구매하기',
//                 link: {
//                   mobileWebUrl: param.shareUrl,
//                   webUrl: param.shareUrl
//                 }
//               }
//         ]
// })


function fn_sendFB(sns) {
var thisUrl = document.URL;
var snsTitle = "2021 웹진 [봄]";
 
if( sns == 'kakaotalk' ) {
    // 사용할 앱의 JavaScript 키 설정
    Kakao.init('5af28610a2211822d22d5668aec3f605');
    
    // 카카오링크 버튼 생성
    Kakao.Link.createDefaultButton({
        container: '#btnKakao', // HTML에서 작성한 ID값
        objectType: 'feed',
        content: {
        title: "2021 웹진 [봄]", // 보여질 제목
        description: "2021 웹진 [봄]", // 보여질 설명
        imageUrl: thisUrl, // 콘텐츠 URL
        link: {
            mobileWebUrl: thisUrl,
            webUrl: thisUrl
        }
        }
    });
}
 
</script>
</html>