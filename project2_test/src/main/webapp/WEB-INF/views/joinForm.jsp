<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lnag="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,hight=device-width, initial-scale=1.0">
    <title>회원가입</title>
    <link rel="stylesheet" href="resources/css/login_join.css" type="text/css">
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

            <!-- ID -->
            <div>
                <h3 class="join_title">
                    <label for="id">아이디</label>
                </h3>
                <span class="box int_id">
                    <input type="text" id="id" class="int" maxlength="20">
                </span>
                <span class="error_next_box"></span>
            </div>

            <!-- PW1 -->
            <div>
                <h3 class="join_title"><label for="pswd1">비밀번호</label></h3>
                <span class="box int_pass">
                    <input type="password" id="pswd1" class="int" maxlength="20">
                    <span id="alertTxt">사용불가</span>
                </span>
                <span class="error_next_box"></span>
            </div>

            <!-- PW2 -->
            <div>
                <h3 class="join_title"><label for="pswd2">비밀번호 재확인</label></h3>
                <span class="box int_pass_check">
                    <input type="password" id="pswd2" class="int" maxlength="20">
                </span>
                <span class="error_next_box"></span>
            </div>

            <!-- NAME -->
            <div>
                <h3 class="join_title"><label for="name">이름</label></h3>
                <span class="box int_name">
                    <input type="text" id="name" class="int" maxlength="20">
                </span>
                <span class="error_next_box"></span>
            </div>

            <!-- BIRTH -->
            <div>
                <h3 class="join_title"><label for="yy">생년월일</label></h3>

                <div id="bir_wrap">
                    <!-- BIRTH_YY -->
                    <div id="bir_yy">
                        <span class="box">
                            <input type="text" id="yy" class="int" maxlength="4" placeholder="년(4자)">
                        </span>
                    </div>

                    <!-- BIRTH_MM -->
                    <div id="bir_mm">
                        <span class="box">
                            <select id="mm" class="sel">
                                <option>월</option>
                                <option value="01">1</option>
                                <option value="02">2</option>
                                <option value="03">3</option>
                                <option value="04">4</option>
                                <option value="05">5</option>
                                <option value="06">6</option>
                                <option value="07">7</option>
                                <option value="08">8</option>
                                <option value="09">9</option>
                                <option value="10">10</option>
                                <option value="11">11</option>
                                <option value="12">12</option>
                            </select>
                        </span>
                    </div>

                    <!-- BIRTH_DD -->
                    <div id="bir_dd">
                        <span class="box">
                            <input type="text" id="dd" class="int" maxlength="2" placeholder="일">
                        </span>
                    </div>

                </div>
                <span class="error_next_box"></span>
            </div>

            <!-- GENDER -->
            <div>
                <h3 class="join_title"><label for="gender">성별</label></h3>
                <span class="box gender_code">
                    <select id="gender" class="sel">
                        <option>성별</option>
                        <option value="M">남자</option>
                        <option value="F">여자</option>
                    </select>
                </span>
                <span class="error_next_box"></span>
            </div>

            <!-- CITY -->
            <div>
                <h3 class="join_title"><label for="gender">지역</label></h3>
                <span class="box gender_code">
                    <select id="gender" class="sel">
                        <option>지역</option>
                        <option value="seoul">서울</option>
                        <option value="gyeonggi">경기</option>
                        <option value="insheon">인천</option>
                        <option value="gangwon">강원</option>
                        <option value="daejeon">대전</option>
                        <option value="chungbuk">충북</option>
                        <option value="chungnam">충남</option>
                        <option value="deagu">대구</option>
                        <option value="ulsan">울산</option>
                        <option value="gyeongbuk">경북</option>
                        <option value="busan">부산</option>
                        <option value="gyeongnam">경남</option>
                        <option value="gwangju">광주</option>
                        <option value="jeonbuk">전북</option>
                        <option value="jeonnam">전남</option>
                        <option value="jeju">제주</option>
                    </select>
                </span>
                <span class="error_next_box"></span>
            </div>

            <!-- EMAIL -->
            <div>
                <h3 class="join_title"><label for="email">본인확인 이메일<span class="optional">(선택)</span></label></h3>
                <span class="box int_email">
                    <input type="text" id="email" class="int" maxlength="100" placeholder="선택입력">
                </span>
                <span class="error_next_box"></span>
            </div>

            <!-- MOBILE -->
            <div>
                <h3 class="join_title"><label for="phoneNo">휴대전화</label></h3>
                <span class="box int_mobile">
                    <input type="tel" id="mobile" class="int" maxlength="16" placeholder="전화번호 입력">
                </span>
                <span class="error_next_box"></span>
            </div>


            <!-- JOIN BTN-->
            <div class="btn_area">
                <button type="button" id="btnJoin" onclick="submit_check()">
                    <span>가입하기</span>
                </button>
            </div>

            <!-- JOIN TEXT -->
            <div id="loginBack">
                <hr>
                <a href="login.html"><h4>로그인 페이지로</h4></a>
            </div>


        </div>
        <!-- content-->

    </div>
    <!-- wrapper -->
    <script src="join_js.js"></script>

</body>

</html>