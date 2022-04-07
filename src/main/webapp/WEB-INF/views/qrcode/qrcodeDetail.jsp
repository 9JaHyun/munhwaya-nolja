<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<style>
/*
 *	TICKET
 *	---------------------------------------------
 */

.ticket-wrap {
	text-align: center;
}

.ticket {
	display: inline-block;
	margin: 0 auto;
	border: 2px solid #9facbc;
	font-family: "Variable Bahnschrift", "FF DIN", "Franklin Gothic", "Helvetica Neue", sans-serif;
	font-feature-settings: "kern" 1;
	background: #fff;
}

.ticket__header {
	margin: 0;
	padding: 1.5em;
	background: #f4f5f6;
}

.ticket__co span,
.ticket__route span {
	display: block;
}

.ticket__co {
	display: inline-block;
	position: relative;
	padding-left: 5em;
	line-height: 1;
	color: #5e7186;
}

.ticket__co-icon {
	position: absolute;
	top: 50%;
	margin-top: -2em;
	left: 0;
	width: 4em;
	height: auto;
}

.ticket__co-name {
	font-size: 2.5em;
	font-variation-settings: "wght" 500, "wdth" 75;
	letter-spacing: -.01em;
}

.ticket__co-subname {
	font-variation-settings: "wght" 700;
	color: #506072;
}

.ticket__body {
	padding: 2rem 1.25em 1.25em;
}

.ticket__route {
	font-variation-settings: "wght" 300;
	font-size: 2em;
	line-height: 1.1;
}

.ticket__description {
	margin-top: .5em;
	font-variation-settings: "wght" 350;
	font-size: 1.125em;
	color: #506072;
}

.ticket__timing {
	display: flex;
	align-items: center;
	margin-top: 1rem;
	padding: 1rem 0;
	border-top: 2px solid #9facbc;
	border-bottom: 2px solid #9facbc;
	text-align: left;
}

.ticket__timing p {
	margin: 0 1rem 0 0;
	padding-right: 1rem;
	border-right: 2px solid #9facbc;
	line-height: 1;
}

.ticket__timing p:last-child {
	margin: 0;
	padding: 0;
	border-right: 0;
}

.ticket__small-label {
	display: block;
	margin-bottom: .5em;
	font-variation-settings: "wght" 300;
	font-size: .875em;
	color: #506072;
}

.ticket__detail {
	font-variation-settings: "wght" 700;
	font-size: 1.25em;
	color: #424f5e;
}

.ticket__admit {
	margin-top: 2rem;
	font-size: 2.5em;
	font-variation-settings: "wght" 700, "wdth" 85;
	line-height: 1;
	color: #657990;
}

.ticket__fine-print {
	margin-top: 1rem;
	font-variation-settings: "wdth" 75;
	color: #666;
}

.ticket__barcode {
	margin-top: 1.25em;
	width: 299px;
	max-width: 100%;
}

@media (min-width: 36em) {
	.ticket-wrap {
		margin-bottom: 4em;
		text-align: center;
	}

	.ticket {
		margin: 0 auto;
		transform: rotate(6deg);
	}

	.ticket__header {
		margin: 0;
		padding: 2em;
	}

	.ticket__body {
		padding: 3rem 2em 2em;
	}

	.ticket__detail {
		font-size: 1.75em;
	}

	.ticket__admit {
		margin-top: 2rem;
	}
}

@supports (display: grid) {
	@media (min-width: 72em) {
		.ticket-info,
		.ticket-wrap {
			align-self: center;
		}

		.ticket-wrap {
			order: 2;
			margin-bottom: 0;
		}

		.ticket-info {
			order: 1;
		}
	}
}
</style>
<title>Insert title here</title>
</head>
<body>
	<div class="l-col-right ticket-wrap" aria-label="A fake boat ticket demonstrating mixing font weights and widths" style="margin-top:100px;">
  <div class="ticket" aria-hidden="true">
    <div class="ticket__header">
      <div>
        <span class="ticket__co-name" style="margin-left: 10px;">모바일티켓</span><br>
        <span class="u-upper ticket__co-subname">yedam cinema</span>
      </div>
    </div>
    <div class="ticket__body">
      <p class="ticket__route" style="margin-top:0px;">${ticket.performancevo.name }</p>
      <p class="ticket__description">${ticket.performancevo.location }</p>
      <div class="ticket__timing">
        <p>
          <span class="u-upper ticket__small-label">공연일</span>
          <span class="ticket__detail"><fmt:formatDate pattern = "E요일 dd" value = "${ticket.performancevo.sdate }" /></span>
        </p>
        <p>
          <span class="u-upper ticket__small-label">공연시작시간</span>
          <span class="ticket__detail"><fmt:formatDate pattern = "HH시 mm분" value = "${ticket.performancevo.sdate }" /></span>
        </p>
        <p>
          <span class="u-upper ticket__small-label">공연종료시간</span>
          <span class="ticket__detail"><fmt:formatDate pattern = "HH시 mm분" value = "${ticket.performancevo.edate }" /></span>
        </p>
      </div><br>
      <a><MARQUEE behavior="scroll" bgColor="black" style="color:white; height:40px; font-size:20pt;">입장이 완료되었습니다.</MARQUEE></a>
      <p class="ticket__fine-print" style="text-align: left;">ㆍ공연취소/변경은 불가능합니다</p>
      <p class="ticket__fine-print" style="text-align: left;">ㆍ아티스트의 사정에 의해 본 공연 시작이<br>&nbsp;&nbsp;&nbsp;10여분 정도 차이 날 수 있습니다.</p>
      <p class="ticket__fine-print" style="text-align: left;">ㆍ공연관 에티켓을 준수하여 즐거운 관람하세요.</p>
      <span id="dpTime">현재시각 01:44:40</span>
    </div>
  </div>
</div>
<script type="text/javascript">
setInterval("dpTime()",1000);
function dpTime(){ var now = new Date();
hours = now.getHours();
minutes = now.getMinutes();
seconds = now.getSeconds();

if (hours > 12){
	hours -= 12;
ampm = "오후 ";
}else{
	ampm = "오전 ";
}
if (hours < 10){
	hours = "0" + hours;
}
if (minutes < 10){
	minutes = "0" + minutes;
}
if (seconds < 10){
	seconds = "0" + seconds;
}
document.getElementById("dpTime").innerHTML = ampm + hours + ":" + minutes + ":" + seconds; }
</script>
</body>
</html>