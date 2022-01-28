<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lnag="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,hight=device-width, initial-scale=1.0">
    <title>로그인</title>
    <link rel="stylesheet" href="resources/css/login_join.css" type="text/css">
    <script src="js/jquery-3.3.1.min.js"></script>

<script>
	$(function() {
		$("#btnLogin").click(function() {
			userid = $("#userid").val();
			var passwd = $("#passwd").val();
			if (userid == "") {
				alert("아이디를 입력하세요");
				$("#userid").focus(); //입력포커스 이동

				return; //함수 종료
			}
			if (passwd == "") {
				alert("비밀번호를 입력하세요");
				$("#passwd").focus();
				return;
			}
			//폼 내부의 데이터를 전송할 주소
			document.form1.action = "${path}/member/login_check.do";
			document.form1.submit(); //제출
		});
	});
</script>


</head>

<body>
    <!-- header -->
    <div id="header">
        <a href="../main/main.html" target="_self" title="메인 페이지로"><img src="resources/image/logo.png" id="logo"></a>
    </div>

	<form name="form1" method="post">
    <!-- wrapper -->
    <div id="wrapper">

        <!-- content-->
        <div id="content">
        <form>
            <!-- ID -->
            <div>
                <br>
                <span class="box int_id">
                    <input type="text" id="id" class="int" maxlength="20" placeholder="아이디">
                </span>
                <!-- <span class="error_next_box"></span> -->
            </div>

            <!-- PW1 -->
            <div>
                <br>
                <span class="box int_pass">
                    <input type="password" id="pswd1" class="int" maxlength="20" placeholder="비밀번호">
                    
                </span>
                <!-- <span class="error_next_box"></span> -->
            </div>

            <!-- Check Box -->
            <div>
                <h3 class="join_title"><input type="checkbox">로그인 상태 유지</h3>
                <div class="clear"></div>
            </div>
 
            <!-- LOGIN BTN-->
            <div class="btn_area">
                <button type="button" id="btnLogin" onclick="submit_check()">
                    <span>로그인</span>
                </button>
                <c:if test="${message == 'error'}">
                                <div style="color:red;"> 아이디 또는 비밀번호가 일치하지 않습니다.
                                </div>
                </c:if>
                <c:if test="${message == 'logout'}">
                                <div style="color:red;"> 로그아웃되었습니다.
                                </div>
                </c:if>
            </div>
            

            <!-- JOIN TEXT -->
            <hr>
            <div id="loginBack">
                <a href="join.html"><h4>회원가입</h4></a>

            </div>
        </form>
        </div>
        <!-- content-->

    </div>
    <!-- wrapper -->
    </form>
    <script src="join_js.js"></script>
    
</body>

</html>