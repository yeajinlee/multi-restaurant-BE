<!DOCTYPE html>
<html lnag="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,hight=device-width, initial-scale=1.0">
    <title>로그인</title>
    <link rel="stylesheet" href="join_css.css">
    <script src="js/jquery-3.3.1.min.js"></script>


</head>

<body>
    <!-- header -->
    <div id="header">
        <a href="../main/main.html" target="_self" title="메인 페이지로"><img src="img/logo.png" id="logo"></a>
    </div>


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
    <script src="join_js.js"></script>
    
</body>

</html>