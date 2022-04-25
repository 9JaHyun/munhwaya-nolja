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
    <h4>��Ƽ��Ʈ �±޽�û</h4>
    <div class="grid_12 tt" style="margin-top: 70px;">
			<ul class="forum-items" style="text-align: left;">
				<li><i class="icon-comment-alt"><a>  �±޽�û</a></i>
					<div class="topic-time" style="margin:5px">��Ƽ��Ʈ �±޿� �ʿ��� ������ �Է����ּ���.</div>
			</ul>
		</div>
</div>
<!-- ��Ƽ��Ʈ �±� ��û�� �ʿ��� ���� -->
<div style="padding-top: 5%;">
    <div style="margin: 100px 0px 10px 0px; border: none;">
        <br>
        <form id="info" name="info" method="post" action="artistRequest" enctype="multipart/form-data" onsubmit="return chk_request()">
           <div align="center">
            <label id="request-label">
                <div class="sort" style="font-size: 14px; color: white; padding: 0.5em; margin-top:1.5em; margin-left: 1em;">�۾��� �����</div>
                <textarea id="artwork" name="artwork" placeholder="������ �Է��ϼ���."></textarea>
            </label><br> <label>
            <div class="sort" style="font-size: 14px; color: white; padding: 0.5em; margin-top:1em; margin-left: 5px;">�۾��� ����</div>
            <input type="file" id="files" name="files" multiple="multiple" accept="image/*"></label><br>

            <div class="sort"  style="font-size: 14px; color: white; padding-right: 1em; margin-top:1.5em"><��������></div>
            <div class="filebox" style="margin-left: 2.5em;">
            <div class="sort" style="font-size: 14px; color: white; padding: 0.5em; margin-top:1em;     margin-right: 2em;">
               <span><a>����ȣ �Է�</a>
              </div> 
               <input type="text" id="phone"  name="phone"  placeholder="��ȣ�� �Է��ϼ���.(-���� �Է�)"></span> &emsp;<p id='phoneChk' class="doubleChk tbutton" style="padding: 3px 6px 1px 5px;">������ȣ �ޱ�</p>
            </div>
            <span class="point successPhoneChk" style="color: #FFFFE0;"> �� ��ȣ �Է� �� ������ȣ �ޱ� ��ư�� Ŭ�� �ϼ���.</span>
             <br>
             <br>
           
            <div class="filebox">
            	<div>
               		<span><a  style="font-size: 14px; color: white; padding: 0.5em; margin-top:1em; margin-left: 1em;">������ȣ �Է�</a>
               </div>
               <input type="text" id="phone2" name="phone2" placeholder="������ȣ�� �Է��ϼ���." disabled required/></span>
                &emsp;
                <p id="phoneChk2" class="doubleChk tbutton" style="padding: 4px 15px 1px 15px;">Ȯ��</p>
                <br>
            </div>
            <p><input type="hidden" id="phoneDoubleChk"/></p>
           </div>
            <!-- ��û, ��� ��ư -->
            <div align="right">
                <input type='submit'  style="padding:0.3em 1em 0.3em 1em; margin: 1em 0.3em 0em 0.3em; position: relative;"
                       value="��û" class="tbutton small">
                <button style="padding: 0.3em 1em 0.3em 1em; margin: 1em 0.3em 0em 0.3em;" onclick="location.href='mypag.do'" class="tbutton small">���</button>
                <!-- Ŭ���� �ڷΰ���-->
            </div>
            
       <!--   <div align="right" style="margin-top:-5em;">
			<input type="button" style="padding: 0.3em 1em 0.3em 1em; margin: 1em 0.3em 0em 0.3em;" class="tbutton small" value="����" onclick="send()">
			<button style="padding: 0.3em 1em 0.3em 1em; margin: 1em 0.3em 0em 0.3em;" onclick="location.href='home.do'" class="tbutton small">���</button>
		</div>-->
        </form>
    </div>
</div>
<br>

<script>
    $(document).ready(function () {
        if ('${pro}' != '') {
            alert('�̹� ��û�� �Ϸ��߽��ϴ�. ��û��Ȳ �������� �̵��մϴ�.');
            location.href = 'artStatus';
        }
    })
   
    function chk_request() {
        if (!document.info.artwork.value) {
            alert("�۾��� ������ �Է��Ͻʽÿ�.");

            return false;
        }
        if (!document.info.files.value) {
            alert("�۾��� ���� ������ ÷���Ͻʽÿ�.");

            return false;
        }
        if (phoneDoubleChk.value == false) {
            alert("���������� �����Ͻʽÿ�.");

            return false;
        } else {
            return true;
        }
    }

    var sheduleList = [];

    //�޴��� ��ȣ ����
    function countdown(elementName, minutes, seconds) {
        var elementName, endTime, hours, mins, msLefg, time;

        function twoDigits(n) {
            return (n <= 9 ? "0" + n : n); // ��
        }

        function updateTimer() {
            msLeft = endTime - (+new Date);
            if (msLeft < 1000) { // 1000ms(�и�������) = 1s(��)
                alert("������ȣ �Է½ð��� �ʰ��Ǿ����ϴ�.\n������ȣ�� �ٽ� �����ÿ�.", undefined, undefined, "waring");
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
                var goal = setTimeout(updateTimer, time.getUTCMilliseconds() + 500);// setTimeout() : ���� �ð��� ������ Ư�� �ڵ带 �� �ѹ� ����, �ι�° ������ �ð�(Milliseconds)�� ����ϸ� 1��° ������ �Լ��� �����մϴ�.

                sheduleList.push(goal); // push����Ͽ�
                return goal;
            }
        }

        endTime = (+new Date) + 1000 * (60 * minutes + seconds) + 500;
        return updateTimer();
    }

    var timeOutId;

    // ī��Ʈ �ٿ� ����
    function resetCountDown() {
        for (shedule of sheduleList) {
            clearTimeout(shedule);
        }
    }

    var code2 = "";

    $("#phoneChk").on('click',
        function () {
            var phone = $("#phone").val();
            var regPhone = /^01([0|1|6|7|8|9])?([0-9]{3,4})?([0-9]{4})$/; // �޴��� ��ȣ�� �´��� ����
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
                            alert("�޴��� ��ȣ�� �ùٸ��� �ʽ��ϴ�.")
                            $(".successPhoneChk").text("��ȿ�� ��ȣ�� �Է��Ͻʽÿ�.");
                            $(".successPhoneChk").css("color", "red");
                            $("#phone").attr("autofocus", true); // autofocus : �Ӽ��� ������� ������ �Ӽ����� �ڵ����� false ���� ������, ����ϸ� �ڵ����� true ���� ������ ��.
                        } else { // data�� err�� �ƴϸ� ����
                            alert("������ȣ �߼��� �Ϸ�Ǿ����ϴ�.\n�޴������� ������ȣ Ȯ���� �Ͻʽÿ�.");
                            $("#phone2").attr("disabled", false); // disabled : true�� ��Ȱ��ȭ, false�� Ȱ��ȭ
                            $("#phoneChk2").css("visibility", "visible"); // ����Ȯ�ι�ư Ȱ��ȭ
                            //$("#phoneChk2").css("display", "inline-block");
                            $(".successPhoneChk").text("������ȣ�� �Է��� �� Ȯ�� ��ư�� Ŭ���Ͻʽÿ�.");
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
                alert("�޴��� ��ȣ�� �Է��Ͻʽÿ�.");
            }
        });// �������� ������ ������ �ʷϻ����� ����, ��ȭ��ȣ �Է��� readonly���·� data�� code2�� �Ѿ

    //�޴��� ������ȣ ����
    $("#phoneChk2").click(function () {
        if ($("#phone2").val() == code2) { // ������ȣ ��ġ
            $(".successPhoneChk").text("������ȣ�� ��ġ�մϴ�."); // ������ ù ������ ����
            $(".successPhoneChk").css("color", "green"); // ��ġ�� ���ڻ� �ʷϻ����� ����
            $("#phoneDoubleChk").val("true"); // Ȯ�ι�ư input�±׿� true���� ��
            $("#phone2").attr("disabled", true); // true���Ǹ� ������ȣ�� �Է��ϼ��� ������ ����
        } else {
            $(".successPhoneChk").text("������ȣ�� ��ġ���� �ʰų� �Է����� �ʾҽ��ϴ�. ������ȣ�� Ȯ���Ͻʽÿ�.");
            $(".successPhoneChk").css("color", "red");
            $("#phoneDoubleChk").val("false");
            $(this).attr("autofocus", true);
        }
    });

</script>