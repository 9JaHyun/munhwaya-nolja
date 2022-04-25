<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <style>
 .clearfix:after { 
     clear: both; 
     content: ""; 
     display: block; 
     height: 0; 
     width:100%; 
 }
 .container { 
  font-family: 'Lato', sans-serif; 
  width: 100vh; 
  margin: 0 auto; 
 } 
 .wrapper { 
  display: table-cell;
  height: 400px;  
  vertical-align: middle; 
 }  
 .pull-right { 
  float: right; 
 } 
  .arrow-steps .step {  
   font-size: 14px;  
   text-align: center;  
   color: #666;  
   cursor: default;  
   margin: 0 3px;  
   padding: 10px 10px 10px 30px;  
   min-width: 120px;  
   float: left;  
   position: relative;  
   background-color: #1f1f1f;  
   -webkit-user-select: none;  
   -moz-user-select: none;  
   -ms-user-select: none;  
   user-select: none;   
    transition: background-color 0.2s ease;  
    font-color: white;
  }  
  .arrow-steps .step:after,  
  .arrow-steps .step:before {  
   content: " ";  
   position: absolute;  
   top: 0;  
   right: -17px;  
   width: 0;  
   height: 0;  
   border-top: 19px solid transparent;  
   border-bottom: 17px solid transparent;  
   border-left: 17px solid #1f1f1f;   
   z-index: 2;  
    transition: border-color 0.2s ease;  
  }  
  .arrow-steps .step:before {  
   right: auto;  
   left: 0;  
   border-left: 17px solid #fff;   
   z-index: 0;  
  }  
  .arrow-steps .step:first-child:before {  
   border: none;  
  }  
  .arrow-steps .step:first-child {  
   border-top-left-radius: 4px;  
   border-bottom-left-radius: 4px;  
  }  
  .arrow-steps .step span {  
   position: relative;  
  }  
  .arrow-steps .step span:before {  
   opacity: 0;  
   content: "✔";  
   position: absolute;  
   top: -2px;  
   left: -20px;  
   color: #06ac77;  
  }  
  .arrow-steps .step.done span:before {  
   opacity: 1;  
   -webkit-transition: opacity 0.3s ease 0.5s;  
   -moz-transition: opacity 0.3s ease 0.5s;  
  -ms-transition: opacity 0.3s ease 0.5s;  
  transition: opacity 0.3s ease 0.5s; 
 }
 .arrow-steps .step.current { 
 background-color: #ff0078;
}
 .arrow-steps .step.current:after { 
  border-left: 17px solid #ff0078; 
 } 
 @media (max-width: 765px) { 
  .arrow-steps .step { 
  min-width: 35px; 
  }
 } 
textarea {
    width:400px;
    height: 100px;
	resize: none;
}

</style>
<h4 style="border:none; padding-bottom:20px; ">승급신청 진행상황</h4>
<span class="liner" style="display:inline-block; "></span>
<div class="container" style="text-align: center;">
<div class="wrapper"> 
<div class="arrow-steps clearfix" style="margin-left:50px; margin-top:6.5em;" >
          <div class="step current" id="step1"><span><a style="font-color: white;">아티스트 신청</a></span> </div>
          <div class="step" id="step2"> <span><a style="font-color: white;">승인대기</a></span></div>
          <input type="hidden" value="${status}" id="wait"/>
          <div class="step" id="step3">
           <span>
        	  <c:choose>
          		<c:when test="${status eq 'A01'}"><a style="font-color: white;">승인완료</a></c:when> 
          		<c:when test="${status eq 'A02'}"><a style="font-color: white;">승인거절</a></c:when>
          		<c:otherwise><a style="font-color: white;">승인완료 / 승인거절</a></c:otherwise>
        	  </c:choose>
	       </span>
	      </div>
 </div>
 
<h5 style="margin-top:30px; margin-left:20px; width:100%;" id="text1"></h5>
 <!-- 아티스트 승급 재신청 -->
 	<br>
 	<div>
		<h3 style="margin-bottom:30px; margin-top:40px;">아티스트 승급 신청한 정보</h3>
		<div style="margin-top:30px;">
	
			<form id="info" name="info" method="post" action="artistRequest" enctype="multipart/form-data" onsubmit="return chk_request()">
				<label id="request-label">
					<div class="sort" style="font-size: 14px; color: white; padding: 0.5em; ">작업물 설명란</div> 
					<textarea id="artwork" name="artwork" placeholder="내용을 입력하세요."></textarea>
				</label>
				<br> 
				<label>
					<div class="sort" style="font-size: 14px; color: white; padding: 0.5em; margin-top:1em;">작업물 인증</div> 
					<input type="file" id="file" name="file" accept="image/png, image/jpeg" disabled ="disabled" >
				</label>
				<br>
					
			<!-- 신청, 취소 버튼 -->
				<div align="right" style="margin-top:2em">
					<input type="submit" style="padding: 0.3em  1em 0.3em 1em; margin: 1em 0.3em 0em 0.3em;" value="재신청" class="tbutton small" onclick=""/>
					<button style="padding: 0.3em  1em 0.3em 1em; margin: 1em 0.3em 0em 0.3em;" onclick="location.href='mypage.do'" class="tbutton small" >취소</button>
				</div>
			</form>
		</div>
	</div>
	
	
</div>
</div>

<script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<script  src="function.js"></script>

<script> 
$(window).load(function(){ 
	if($("#wait").val() == "A03") {
		$("#step1").addClass("current");
		$("#step2").addClass("current");
		$("#text1").html("승인 대기중입니다. 운영자 검토시까지 수일이 소요됩니다.");
	} else if($("#wait").val() == "A02") {
		$("#step1").addClass("current");
		$("#step2").addClass("current");
		$("#step3").addClass("current");
		$("#text1").html("승인 거절되었습니다.");
	} else if($("#wait").val() == "A01") {
		$("#step1").addClass("current");
		$("#step2").addClass("current");
		$("#step3").addClass("current");
		$("#text1").html("승인 완료되었습니다. 카테고리에서 회원클릭에서 정보를 등록하세요.")
	}
	
	if('${status}' == 'A03') {
		$("#artwork").attr("readonly","readonly")
	} 
	
});
function chk_request(){
		if(!document.info.artwork.value){
		alert("작업물 내용을 입력하십시오.");
			return false;
	}
	if(!document.info.file.value){
			alert("작업물 인증 파일을 첨부하십시오.");
			return false;
	}else{
			return true;
		}
	}


</script>
<!-- A01 => 승인 => artis-profile  -->
<!-- A02 => 거절 => 리드온리 풀리고, 폼 채우고, 재신청 버튼 활성화((재신청 되도록)) -->
<!-- A03 => 대기 => 리드온리, 폼 채우고, 파일다운로드 가능하게, 재신청 버튼 X -->