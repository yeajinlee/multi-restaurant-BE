<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MULTI RESTAURANT</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
        integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css">
</head>

<body>

    <nav class="navbar navbar-default navbar-expand-lg navbar-dark fixed-top">
        <a href="main.html"><img src="${pageContext.request.contextPath}/resources/image/nav.png" width="80" height="80" alt="">
            <a class="navbar-brand" href="main.html"> MULTI <br> RESTAURANT</a>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav">
                    <li class="nav-item dropdown">
                        <div class="col-lg-6">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <strong style="color:white">지역별</strong>
                            </a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <a class="dropdown-item" href="#">어디어디</a>
                                <a class="dropdown-item" href="#">지역2</a>
                                <a class="dropdown-item" href="#">지역3</a>
                                <a class="dropdown-item" href="#">지역4</a>
                            </div>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="reco1.html" style="color:white"><strong>추천 메뉴</strong> </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/reviewList.do" style="color:white"><strong>최근 후기</strong> </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="../newList/newList.html" style="color:white"><strong>신규 개업</strong> </a>
                    </li>
                </ul>
            </div>
            </div>

            <ul class="navbar-nav">
                <li class="nav-item dropdown">
                    <div class="col-lg-6"></div>
                    <a class href="#" id="navbarDropdown"
                    data-toggle="dropdown"><img src="${pageContext.request.contextPath}/resources/image/login.png" alt="Menu" width="80" height="80" /></a>
                </div>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <a class="dropdown-item" href="../login_join/login.html">로그인</a>
                    <a class="dropdown-item" href="../login_join/join.html">회원가입</a>
                </div>
            </div>
            </ul>
    </nav>
    <br><br><br>
    <div class="jumbotron">
        <header class="main">
            <div class="container position-relative">
                <div class="row justify-content-center">
                    <div class="col-xl-6">
                        <div class="text-center text-light">
                            <h1 class="mb-5">내 주변의 숨은 맛집 검색하기</h1>
                            <div class="row">
                                      
                            <form name="frmSearch" action="${pageContext.request.contextPath}/searchRest.do" >
                                <div class="col">
                                    <!-- <input class="form-control form-control-lg" id="search"
                                        placeholder="지역, 식당 또는 음식 검색하기" data-sb-validations="required,email" /> -->
                                	<input name="searchWord" class="main_input" type="text"  onKeyUp="keywordSearch()"> 
                                
                                </div>
                                <div class="col-auto">
                            <!--     <button class="btn btn-lg btn-outline-light" id="submitButton"
                                        type="submit">SEARCH</button></div> -->
                                <input type="submit" name="search" class="btn1"  value="검색" >
                         </div></form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </header>
        <!---->
    </div>
    <section class>
        <div class="container px-5 my-5">
            <div class="row gx-5 justify-content-center">
            	<c:forEach var="rest" items="${restList }">
            		<div class="col-lg-6 col-xl-4">
                    <div class="card mb-5 mb-xl-0">
                        <a href="${pageContext.request.contextPath}/detail.do">
                        	<img src="${pageContext.request.contextPath}/resources/image/${imageList.img_FileName}" width="327" height="200" alt="">
                        	<%-- 누가봐도 안될거같이생김... --%>
                        </a>
                        <div class="card-body" >
                            <div class="mb-3">
                                <span><h1><b>${rest.rest_Name }</b></h1></span><br>
                                <ul class="list-unstyled mb-4">
                                    <li class="mb-2">
                                       	 (메뉴)
                                    </li>
                                    <li class="mb-2">
                                        ${rest.rest_Price }
                                    </li>
                                    <li class="mb-2">
                                       	 ${rest.rest_Address }
                                    </li>
                                </ul>
                            </div>
                            <div class="d-grid"><a class="btn btn-outline-primary" href="${pageContext.request.contextPath}/detail.do">보러가기</a></div>
                        </div>
                    </div>
                </div>
            	</c:forEach>
            	
                    </div>
                </div>
    </section>
    <footer>
        <div class="column1">
         
            <h2 class="text-left1">About Us  <img src="${pageContext.request.contextPath}/resources/image/footer_nav.png" alt=""></h2>
            <p>모든 음식점을 위하여</p>
          
        </div>
        <div id="link1" class="column1">
            <h2>Links</h2>
            <ul>
                <li><i class="fa fa-angle-double-right"></i><a href="#">포룸</a></li>
                <li><i class="fa fa-angle-double-right"></i><a href="#">이용약관</a></li>
              
            </ul>
        </div>
        <div id="link1" class="column1">
            <h2>Links</h2>
            <ul>
                <li><i class="fa fa-angle-double-right"></i><a href="#">고객센터</a></li>
                <li><i class="fa fa-angle-double-right"></i><a href="#">자주묻는 질문</a></li>
              
            </ul>
        </div>
        <div id="link2" class="column1">
            <h2 class="text-left1">Address</h2>
        <ul class="address1">
                <li>Email: info@multi.com</li>
                <li>고객센터 (8AM to 10PM):<br/> 031 222 3333</li>
            
            </ul>
        </div>
    </footer> 
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
        integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
        integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
        crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
        integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
        crossorigin="anonymous"></script>
</body>

</html>