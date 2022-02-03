<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lnag="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,hight=device-hight, initial-scale=1.0">
    <title>로그인</title>
    <link rel="stylesheet" href="resources/css/login_join.css" type="text/css">
    <script src="js/jquery-3.3.1.min.js"></script>

<!-- <script>
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
			document.form1.action = "${path}/member/login.do";
			document.form1.submit(); //제출
		});
	});
</script> -->


</head>

<body>
    <!-- header -->
    <div id="header">
        <a href="${pageContext.request.contextPath}/main.do" target="_self" title="메인 페이지로"><img src="resources/image/logo_to_main.png" id="logo"></a>
    </div>

	<form action="${pageContext.request.contextPath}/login.do" method="post" target="_self">
    <!-- wrapper -->
    <div id="wrapper">

        <!-- content-->
        <div id="content">
        <form>
            <!-- ID -->
            <div>
                <br>
                <span class="box int_id">
                    <input type="text" name="user_ID" id="user_ID" class="int" maxlength="20" placeholder="아이디">
                </span>
                <!-- <span class="error_next_box"></span> -->
            </div>

            <!-- PW1 -->
            <div>
                <br>
                <span class="box int_pass">
                    <input type="password" name="user_PW" id="user_PW" class="int" maxlength="20" placeholder="비밀번호">
                    
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
                <button type="submit" id="btnLogin" onclick="submit_check()">
                    <span>로그인</span>
                </button>
                <c:if test="${msg == false}">
					<p style="color: red;">로그인 실패! 아이디와 비밀번호 확인해주세요.</p>
				</c:if>
                <c:if test="${message == 'error'}">
                                <div style="color:red;"> 아이디 또는 비밀번호가 일치하지 않습니다.
                                </div>
                </c:if>
                <c:if test="${!empty LOGIN_EXCEPTION}">
    				<p>${LOGIN_EXCEPTION}</p>
				</c:if>
            </div>
            

            <!-- JOIN TEXT -->
            <hr>
            <div id="loginBack">
                <a href="${pageContext.request.contextPath}/joinForm.do" target="_self"><h4>회원가입</h4></a>

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