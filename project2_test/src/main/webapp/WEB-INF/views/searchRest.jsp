<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<!DOCTYPE html>

<html lang="en">

<head>
   
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
    integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous" />
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
    integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
    crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
    integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
    crossorigin="anonymous"></script>

 <link rel="stylesheet" href="resources/css2/contents.css" type="text/css">
    <title>Document</title>
    
</head>

<body>
    <nav class="heading">
    <nav class="navbar navbar-default navbar-expand-lg navbar-dark fixedtop">
        <a href="../main/main.html"><img src="./nav.png" width="80" height="80" alt="">
            <a class="navbar-brand" href="../main/main.html"> MULTI <br> RESTAURANT</a>

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
                        <a class="nav-link" href="../main/reco1.html" style="color:white"><strong>&nbsp;&nbsp;&nbsp;추천 메뉴</strong> </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="../reviewList/reviewList.html" style="color:white"><strong>최근 후기</strong> </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="../newList/newList.html" style="color:white"><strong>신규 개업</strong> </a>
                    </li>
                </ul>
                <form class="d-flex">
                    <input class="form-control me-2" type="search" placeholder="밥 뭐 먹지?" aria-label="Search">
                    <button class="btn btn-sm btn-outline-light" type="submit">SEARCH</button>
                </form>
            </div>
            </div>

            <ul class="navbar-nav">
                <li class="nav-item dropdown">
                    <div class="col-lg-6"></div>
                    <a class href="#" id="navbarDropdown"
                    data-toggle="dropdown"><img src="./login.png" alt="Menu" width="80" height="80" /></a>
                </div>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <a class="dropdown-item" href="../login_join/login.html">로그인</a>
                    <a class="dropdown-item" href="../login_join/join.html">회원가입</a>
                </div>
            </div>
            </ul>
    </nav>
</nav>
<div class="space"></div>
 <main>
        <div class='search'>
            <h1>""검색결과</h1>
        </div>

        <div id="buttons">
            <button class="bv" onclick="filter('all')">#전체</button> <!--  //필터기능 추가예정 -->
            <button class="bv" onclick="filter('pasta')">#파스타</button>
            <button class="bv" onclick="filter('stake')">#스테이크</button>
            <button class="bv" onclick="filter('don')">#돈가스</button>
        </div>
        <div class="side">
            <h4 class="map">지도</h4>
            <div>
                <iframe
                    src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3162.390980157256!2d126.98338321450412!3d37.569410079797336!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357ca2e8bd68ec11%3A0x6ee78e54814af2d9!2z6rCT64207Iqk7Iuc!5e0!3m2!1sko!2skr!4v1641207292048!5m2!1sko!2skr"
                    width="300" height="300" style="border:0;" allowfullscreen="" loading="lazy" ></iframe>
                   <h5>관련맛집</h5>
            </div>
            <div> <a href="items.html"><img src="./1.jpg" alt=""><div class="sidepic">일식집best</div></a> 
            <a href="items.html"> <img src="./2.jpg" alt=""><div class="sidepic">일식집best</div></a>
            <a href="items.html"><img src="./3.jpg" alt=""><div class="sidepic">일식집best</div></a>
            <a href="items.html"><img src="./6.jpg" alt=""><div class="sidepic">일식집best</div></a>
            <a href="items.html"> <img src="./7.jpg" alt=""><div class="sidepic">일식집best</div></a></div>
            </div>
       
        <div class="main">
           
            <div class="row1">
            <c:forEach var="category" items="${restList}" >
                <div>
                    <a href="${contextPath}/detail.do?rest_Id=${category.rest_Id}">
                        <div class="bottom-left3">
                            <img src="./1.jpg${category.main_image}" alt="">
                            <div class="bottom-left2">
                                <h4>정통 분식 베스트 ${category.name}</h4>없어질예정
                            </div>
                        </div>
                    </a>
                    <h3><a href="${contextPath}/reviewList.do?rest_Id=${category.rest_Id}">참된돈가스</a></h3>
                    <h6>신사/압구정-이자캬야/오뎅/꼬치${category.address}-${category.menu}</h6>
                </div>
              </c:forEach>
              
              
                <div>
                    <a href="items.html">
                        <div class="bottom-left3">
                            <img src="./4.jpg" alt="">
                            <div class="bottom-left2">
                                <h4>NEW 탐험가가 뽑은 BEST</h4>
                            </div>
                        </div>
                        <h3><a href="items.html">참된돈가스</a></h3>
                        <h6>신사/압구정-이자캬야/오뎅/꼬치</h6>
                </div>
 

         
                <div>
                    <a href="items.html">
                        <div class="bottom-left3">
                            <img src="./3.jpg" alt="">
                            <div class="bottom-left2">
                                <h4>먹어보니 맛있다 베스트</h4>
                            </div>
                        </div>
                    </a>
                    <h3><a href="items.html">참된돈가스</a></h3>
                    <h6>신사/압구정-이자캬야/오뎅/꼬치</h6>
                </div>

                <div>
                    <a href="items.html">
                    <div class="bottom-left3">
                        <img src="./2.jpg" alt="">
                        <div class="bottom-left2">
                            <h4>장소</h4>
                        </div>
                    </div>
                    </a>
                    <h3><a href="items.html">참된돈가스</a></h3>
                    <h6>신사/압구정-이자캬야/오뎅/꼬치</h6>
                </div>
      
                <div>
                    <a href="items.html">
                        <div class="bottom-left3">
                            <img src="./9.jpg" alt="">
                            <div class="bottom-left2">
                                <h4>모두가 찾는 음식점들</h4>
                            </div>
                        </div>
                    </a>
                    <h3><a href="items.html">참된돈가스</a></h3>
                    <h6>신사/압구정-이자캬야/오뎅/꼬치</h6>
                </div>

                <div>
                    <a href="items.html">
                        <div class="bottom-left3">
                            <img src="./8.jpg" alt="">
                            <div class="bottom-left2">
                                <h4>할말없다 여기가 강남이다</h4>
                            </div>
                        </div>
                    </a>
                    <h3><a href="items.html">참된돈가스</a></h3>
                    <h6>신사/압구정-이자캬야/오뎅/꼬치</h6>
                </div>
           

           
                <div>
                    <a href="items.html">
                        <div class="bottom-left3">
                            <img src="./3.jpg" alt="">
                            <div class="bottom-left2">
                                <h4>할말없다 여기가 서울이다</h4>
                            </div>
                        </div>
                    </a>
                    <h3><a href="items.html">참된돈가스</a></h3>
                    <h6>신사/압구정-이자캬야/오뎅/꼬치</h6>
                </div>

                <div>
                    <a href="items.html">
                        <div class="bottom-left3">
                            <img src="./6.jpg" alt="">
                            <div class="bottom-left2">
                                <h4>이유있는 맛집 BEST</h4>
                            </div>
                        </div>
                    </a>
                    <h3><a href="items.html">참된돈가스</a></h3>
                    <h6>신사/압구정-이자캬야/오뎅/꼬치</h6>
                </div>


            </div>
            <div class="pagination">
                <ul>
                    <li class="btn prev"><span><i class="fas fa-angle-left"></i>Prev</span></li>
                    <li class="numb active"><span>1</span></li>
                    <li class="numb"><span>2</span></li>
                    <li class="dots"><span>...</span></li>
                    <li class="numb"><span>4</span></li>
                    <li class="numb"><span>5</span></li>
                    <li class="dots"><span>...</span></li>
                    <li class="numb"><span>7</span></li>
                    <li class="btn next"><span>Next<i class="fas fa-angle-right"></i></span></li>
                </ul>
            </div>
       </div>
     </main>
    <footer>
        <div class="column1">
         
            <h2 class="text-left1">About Us  <img src="./footer_nav.png" alt=""></h2>
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
</body>
</html>