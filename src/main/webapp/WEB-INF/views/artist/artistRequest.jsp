<%@ page language="java" contentType="text/html; charset=EUC-KR"
         pageEncoding="EUC-KR" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"
        integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
        crossorigin="anonymous"></script>
<style>
    textarea {
        padding-left: 1em;
        width: 55%;
        height: 7em;
        border: none;
        resize: none;
    }

    request-label {
        float: left;
        font-size: 0.5em;
        width: 70%;
    }

    .sort {
        width: 100px;
        margin: 0px;
    }

    label {
        display: block;
    }
</style>
<div align="right" style="margin-bottom: 50px;">
    <h4>아티스트 승급신청</h4>
    <div class="grid_12 tt" style="margin-top: 70px;">
			<ul class="forum-items" style="text-align: left;">
				<li><i class="icon-comment-alt"><a>  승급신청</a></i>
					<div class="topic-time" style="margin:5px">아티스트 승급에 필요한 정보를 입력해주세요.</div>
			</ul>
		</div>
</div>
<!-- 아티스트 승급 신청에 필요한 인증 -->
<div style="padding-top: 5%;">
    <div style="margin: 100px 0px 10px 0px; border: none;">
        <br>
        <form id="info" name="info" method="post" action="artistRequest" enctype="multipart/form-data" onsubmit="return chk_request()">
           <div align="center">
            <label id="request-label">
                <div class="sort" style="font-size: 14px; color: white; padding: 0.5em; margin-top:1.5em; margin-left: 1em;">작업물 설명란</div>
                <textarea id="artwork" name="artwork" placeholder="내용을 입력하세요."></textarea>
            </label><br> <label>
            <div class="sort" style="font-size: 14px; color: white; padding: 0.5em; margin-top:1em; margin-left: 5px;">작업물 인증</div>
            <input type="file" id="files" name="files" multiple="multiple" accept="image/*"></label><br>

            <div class="sort"  style="font-size: 14px; color: white; padding-right: 1em; margin-top:1.5em"><본인인증></div>
            <div class="filebox" style="margin-left: 2.5em;">
            <div class="sort" style="font-size: 14px; color: white; padding: 0.5em; margin-top:1em;     margin-right: 2em;">
               <span><a>폰번호 입력</a>
              </div> 
               <input type="text" id="phone"  name="phone"  placeholder="번호를 입력하세요.(-빼고 입력)"></span> &emsp;<p id='phoneChk' class="doubleChk tbutton" style="padding: 3px 6px 1px 5px;">인증번호 받기</p>
            </div>
            <span class="point successPhoneChk" style="color: #FFFFE0;"> 폰 번호 입력 후 인증번호 받기 버튼을 클릭 하세요.</span>
             <br>
             <br>
           
            <div class="filebox">
            	<div>
               		<span><a  style="font-size: 14px; color: white; padding: 0.5em; margin-top:1em; margin-left: 1em;">인증번호 입력</a>
               </div>
               <input type="text" id="phone2" name="phone2" placeholder="인증번호를 입력하세요." disabled required/></span>
                &emsp;
                <p id="phoneChk2" class="doubleChk tbutton" style="padding: 4px 15px 1px 15px;">확인</p>
                <br>
            </div>
            <p><input type="hidden" id="phoneDoubleChk"/></p>
           </div>
            <!-- 신청, 취소 버튼 -->
            <div align="right">
                <input type='submit'  style="padding:0.3em 1em 0.3em 1em; margin: 1em 0.3em 0em 0.3em; position: relative;"
                       value="신청" class="tbutton small">
                <button style="padding: 0.3em 1em 0.3em 1em; margin: 1em 0.3em 0em 0.3em;" onclick="location.href='mypag.do'" class="tbutton small">취소</button>
                <!-- 클릭시 뒤로가기-->
            </div>
            
       <!--   <div align="right" style="margin-top:-5em;">
			<input type="button" style="padding: 0.3em 1em 0.3em 1em; margin: 1em 0.3em 0em 0.3em;" class="tbutton small" value="수정" onclick="send()">
			<button style="padding: 0.3em 1em 0.3em 1em; margin: 1em 0.3em 0em 0.3em;" onclick="location.href='home.do'" class="tbutton small">취소</button>
		</div>-->
        </form>
    </div>
</div>
<br>

<script>
    $(document).ready(function () {
        if ('${pro}' != '') {
            alert('이미 신청을 완료했습니다. 신청현황 페이지로 이동합니다.');
            location.href = 'artStatus';
        }
    })
   
    function chk_request() {
        if (!document.info.artwork.value) {
            alert("작업물 내용을 입력하십시오.");

            return false;
        }
        if (!document.info.files.value) {
            alert("작업물 인증 파일을 첨부하십시오.");

            return false;
        }
        if (phoneDoubleChk.value == false) {
            alert("본인인증을 진행하십시오.");

            return false;
        } else {
            return true;
        }
    }

    var sheduleList = [];

    //휴대폰 번호 인증
    function countdown(elementName, minutes, seconds) {
        var elementName, endTime, hours, mins, msLefg, time;

        function twoDigits(n) {
            return (n <= 9 ? "0" + n : n); // 초
        }

        function updateTimer() {
            msLeft = endTime - (+new Date);
            if (msLeft < 1000) { // 1000ms(밀리세컨드) = 1s(초)
                alert("인증번호 입력시간이 초과되었습니다.\n인증번호를 다시 받으시오.", undefined, undefined, "waring");
                $("" + elementName).remove();
                $("#phone2").attr("disabled", true);
                $("#phoneChk2").css("display", "none");
            } else {
                time = new Date(msLeft);
                hours = time.getUTCHours();
                mins = time.getUTCMinutes();
                isOn = true;
                $("" + elementName).html(
                    (hours ? hours + ':' + twoDigits(mins)
                        : twoDigits(mins))
                    + ':' + twoDigits(time.getUTCSeconds()));
                var goal = setTimeout(updateTimer, time.getUTCMilliseconds() + 500);// setTimeout() : 일정 시간이 지난후 특정 코드를 딱 한번 실행, 두번째 인자의 시간(Milliseconds)이 경과하면 1번째 인자의 함수를 실행합니다.

                sheduleList.push(goal); // push사용하여
                return goal;
            }
        }

        endTime = (+new Date) + 1000 * (60 * minutes + seconds) + 500;
        return updateTimer();
    }

    var timeOutId;

    // 카운트 다운 종료
    function resetCountDown() {
        for (shedule of sheduleList) {
            clearTimeout(shedule);
        }
    }

    var code2 = "";

    $("#phoneChk").on('click',
        function () {
            var phone = $("#phone").val();
            var regPhone = /^01([0|1|6|7|8|9])?([0-9]{3,4})?([0-9]{4})$/; // 휴대폰 번호가 맞는지 검증
            if (regPhone.test(phone) === true) {

                $.ajax({
                    type: "POST",
                    url: "user/sms",
                    data: {
                        phoneNumber: phone
                    },
                    cache: false,
                    success: function (data) {
                        if (data == "error") {
                            alert("휴대폰 번호가 올바르지 않습니다.")
                            $(".successPhoneChk").text("유효한 번호를 입력하십시오.");
                            $(".successPhoneChk").css("color", "red");
                            $("#phone").attr("autofocus", true); // autofocus : 속성을 명시하지 않으면 속성값이 자동으로 false 값을 가지고, 명시하면 자동으로 true 값을 가지게 됨.
                        } else { // data가 err가 아니면 실행
                            alert("인증번호 발송이 완료되었습니다.\n휴대폰에서 인증번호 확인을 하십시오.");
                            $("#phone2").attr("disabled", false); // disabled : true면 비활성화, false면 활성화
                            $("#phoneChk2").css("visibility", "visible"); // 인증확인버튼 활성화
                            //$("#phoneChk2").css("display", "inline-block");
                            $(".successPhoneChk").text("인증번호를 입력한 뒤 확인 버튼을 클릭하십시오.");
                            $(".successPhoneChk").css("color", "green");
                            code2 = data.content;
                            if (timeOutId == null) {
                                $("<div class='timeout'></div>").insertAfter($("#phone"));
                            } else {
                                resetCountDown();
                            }
                            timeOutId = countdown(".timeout", 3, 0);
                        }
                    }
                });
            } else {
                alert("휴대폰 번호를 입력하십시오.");
            }
        });// 본인인증 누르고 성공시 초록색으로 변경, 전화번호 입력은 readonly상태로 data가 code2로 넘어감

    //휴대폰 인증번호 대조
    $("#phoneChk2").click(function () {
        if ($("#phone2").val() == code2) { // 인증번호 일치
            $(".successPhoneChk").text("인증번호가 일치합니다."); // 최초의 첫 문구가 변경
            $(".successPhoneChk").css("color", "green"); // 일치시 글자색 초록색으로 변경
            $("#phoneDoubleChk").val("true"); // 확인버튼 input태그에 true값이 됨
            $("#phone2").attr("disabled", true); // true가되면 인증번호를 입력하세요 문구를 숨김
        } else {
            $(".successPhoneChk").text("인증번호가 일치하지 않거나 입력하지 않았습니다. 인증번호를 확인하십시오.");
            $(".successPhoneChk").css("color", "red");
            $("#phoneDoubleChk").val("false");
            $(this).attr("autofocus", true);
        }
    });

</script>