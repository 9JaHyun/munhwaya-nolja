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
.nav {
 margin-top: 40px;
}
.pull-right {
 float: right;
}
a, a:active {
 color: #212121;
 text-decoration: none;
}
a:hover {
 color: #999;
}
.arrow-steps .step {
 font-size: 14px;
 text-align: center;
 color: #666;
 cursor: default;
 margin: 0 3px;
 padding: 10px 10px 10px 30px;
 min-width: 180px;
 float: left;
 position: relative;
 background-color: #b4e7ff;
 -webkit-user-select: none;
 -moz-user-select: none;
 -ms-user-select: none;
 user-select: none; 
  transition: background-color 0.2s ease;
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
 border-left: 17px solid #b4e7ff; 
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
 color: #fff;
 background-color: #ff5050;
}
.arrow-steps .step.current:after {
 border-left: 17px solid #ff5050; 
}
@media (max-width: 765px) {
 .arrow-steps .step {
 min-width: 35px;
 }
}
</style>

   <div class="container"> 
<div class="wrapper"> 
<div class="arrow-steps clearfix">
          <div class="step current"><span>아티스트 신청</span> </div>
          <div class="step" id="step1"> <span>승인대기</span></div>
          <input type="hidden" value="${pro.status}" id="wait"/>
          <div class="step" id="step2">
           <span>
        	  <c:choose>
          		<c:when test="${pro.status eq A01}">승인완료</c:when>
          		<c:when test="${pro.status eq A02}">승인거절</c:when>
          		<c:otherwise></c:otherwise>
        	  </c:choose>
	       </span>
	      </div>
 </div>
 <div class="nav clearfix">
        <a href="#" class="prev">Previous</a>
        <a href="#" class="next pull-right">Next</a>
 </div>
</div>
</div>
 
<script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<script  src="function.js"></script>
<script>

$(function(){
	
	if($("#wait").val() === "A03"){
		document.getElementsById("step1").style.backgroundColor: "#ff5050";

	}
	
	if($("#wait").val() === "A01"){
		document.getElementsById("step2").style.backgroundColor: "#ff5050";)
	
	}
	if($("#wait").val() === "A02"){
		document.getElementsById("step2").style.backgroundColor: "#ff5050";)
		
	
});

</script>