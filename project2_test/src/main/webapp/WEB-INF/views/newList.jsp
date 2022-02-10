<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>신규개업</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
	integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p"
	crossorigin="anonymous" />
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
	integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
	integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
	integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
	crossorigin="anonymous"></script>
<link rel="stylesheet" href="${contextPath}/resources/css/newList.css"
	type="text/css">
</head>
<body>
	<nav
		class="navbar navbar-default navbar-expand-lg navbar-dark fixed-top">
		<a href="${contextPath}/main.do"><img
			src="${contextPath}/resources/image/nav.png" width="80" height="80"
			alt=""> <a class="navbar-brand" href="${contextPath}/main.do">
				MULTI <br> RESTAURANT
		</a>

			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav">
					<li class="nav-item dropdown">
						<div class="col-lg-6">
							<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
								role="button" data-toggle="dropdown" aria-haspopup="true"
								aria-expanded="false"> <strong style="color: white">지역별</strong>
							</a>
							<div class="dropdown-menu" aria-labelledby="navbarDropdown">
								<a class="dropdown-item" href="#">어디어디</a> <a
									class="dropdown-item" href="#">지역2</a> <a class="dropdown-item"
									href="#">지역3</a> <a class="dropdown-item" href="#">지역4</a>
							</div>
					</li>
					<li class="nav-item"><a class="nav-link"
						href="${contextPath}/reconList.do" style="color: white"><strong>&nbsp;&nbsp;&nbsp;추천
								메뉴</strong> </a></li>
					<li class="nav-item"><a class="nav-link"
						href="${contextPath}/reviewList.do" style="color: white"><strong>최근
								후기</strong> </a></li>
					<li class="nav-item"><a class="nav-link"
						href="${contextPath}/newList.do" style="color: white"><strong>신규
								개업</strong> </a></li>
				</ul>
				<form class="d-flex">
					<input class="form-control me-2" type="search"
						placeholder="밥 뭐 먹지?" aria-label="Search">
					<button class="btn btn-sm btn-outline-light" type="submit">SEARCH</button>
				</form>
			</div>
			</div>

			<ul class="navbar-nav">
				<li class="nav-item dropdown">
					<div class="col-lg-6"></div> <a class href="#" id="navbarDropdown"
					data-toggle="dropdown"><img
						src="${contextPath}/resources/image/login.png" alt="Menu"
						width="80" height="80" /></a>
					</div>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<c:if test="${member == null}">
							<a class="dropdown-item" href="${contextPath}/loginForm.do">로그인</a>
							<a class="dropdown-item" href="${contextPath}/joinForm.do">회원가입</a>
						</c:if>

						<c:if test="${member != null}">
							<a class="dropdown-item" href="${contextPath}/logout.do">로그아웃</a>
							<a class="dropdown-item" href="${contextPath}/mypage.do">마이페이지</a>
						</c:if>
					</div>
					</div>
			</ul>
	</nav>
	<section class="info">
		<div>
			<div class="title">
				<div class="title_txt">
					<b>닉네임님을 기다리고 있는 가게</b><br> 회원님 주변의 새로 개업한 가게들<br>
					<br>
					<br>
					<div class="popup" onclick="popUp()">
						<u>왜 새로 개업한 가게들을 추천할까요?</u> <span class="popuptext" id="myPopup">
							멀티레스토랑은 지역의 외식 상권을 응원합니다!<br>
						<br> 회원님 지역의 새로 개업한 가게에 방문하신 후 리뷰를 남겨 주시면<br> 가게 등급에 따라
							더 많은 포인트가 적립됩니다
						</span>
					</div>

				</div>
			</div>
			<div class="content">
				<!-- <span class="l_map"><img src="../images/placeholder.png" alt="지도 부분"></span> -->
				<div class="map" id="map" style="width: 500px; height: 500px;">
				</div>
				 <span class="r_list">
					<table>
						<th>${newList.rest_Address}</th>

						<c:choose>
							<c:when test="${not empty newList}">
								<c:forEach var="item" items="${newList}">
									<tr>
										<td><a href="../detail/detail.html"><img
												src="resources/image/sushi.jpg" alt=""></a></td>
										<td><a href="../detail/detail.html">${item.rest_Name}</a><br>${item.rest_Address}<br>${item.rest_Price}</td>
										<td><b>후기 0개</b>
											<p class="open_date">개업: 2021.12.23</p></td>
									</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<c:forEach var="itemS" items="${defaultList}">
									<tr>
										<td><a href="../detail/detail.html"><img
												src="resources/image/sushi.jpg" alt=""></a></td>
										<td><a href="../detail/detail.html">${itemS.rest_Name}</a><br>${itemS.rest_Address}<br>${itemS.rest_Price}</td>
										<td><b>후기 0개</b>
											<p class="open_date">개업: 2021.12.23</p></td>
									</tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</table>
				</span>
			</div>

		</div>
	</section>
	<footer>
		<div class="column1">

			<h2 class="text-left1">
				About Us <img src="${contextPath}/resources/image/footer_nav.png"
					alt="">
			</h2>
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
				<li><i class="fa fa-angle-double-right"></i><a href="#">자주묻는
						질문</a></li>

			</ul>
		</div>
		<div id="link2" class="column1">
			<h2 class="text-left1">Address</h2>
			<ul class="address1">
				<li>Email: info@multi.com</li>
				<li>고객센터 (8AM to 10PM):<br /> 031 222 3333
				</li>

			</ul>
		</div>
	</footer>
	<script>
        function popUp() {
          var popup = document.getElementById("myPopup");
          popup.classList.toggle("show");
        }
        </script>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=091ccaf6ebd3685465c663c2218360f5&libraries=services"></script>

	<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨 
    }; 

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

// HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
if (navigator.geolocation) {
    
    // GeoLocation을 이용해서 접속 위치를 얻어옵니다
    navigator.geolocation.getCurrentPosition(function(position) {
        
        var lat = position.coords.latitude, // 위도
            lon = position.coords.longitude; // 경도
            
            console.log(lat,lon);
            
            var geocoder = new kakao.maps.services.Geocoder();

            var coord = new kakao.maps.LatLng(lat, lon);
            var callback = function(result, status) {
                if (status === kakao.maps.services.Status.OK) {
                  console.log(result[0].address_name);
                  var rest=(result[0].address_name)
                  document.getElementById("centerAddr").innerHTML=rest;
                }
            };
            geocoder.coord2RegionCode(coord.getLng(), coord.getLat(), callback);
          
            
          

                   
        
        var locPosition = new kakao.maps.LatLng(lat, lon), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
            message = '<div style="padding:5px;">여기에 계신가요?!</div>'; // 인포윈도우에 표시될 내용입니다
        
        // 마커와 인포윈도우를 표시합니다
        displayMarker(locPosition, message);
            
      });
    
} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
    
    var locPosition = new kakao.maps.LatLng(33.450701, 126.570667),    
        message = 'geolocation을 사용할수 없어요..'
        
    displayMarker(locPosition, message);
}

// 지도에 마커와 인포윈도우를 표시하는 함수입니다
function displayMarker(locPosition, message) {

    // 마커를 생성합니다
    var marker = new kakao.maps.Marker({  
        map: map, 
        position: locPosition
    }); 

    var iwContent = message, // 인포윈도우에 표시할 내용
        iwRemoveable = true;

    // 인포윈도우를 생성합니다
    var infowindow = new kakao.maps.InfoWindow({
        content : iwContent,
        removable : iwRemoveable
    });
    
    // 인포윈도우를 마커위에 표시합니다 
    infowindow.open(map, marker);
    
    // 지도 중심좌표를 접속위치로 변경합니다
    map.setCenter(locPosition);      
}    
var positions = [
    {
        title: '카카오', 
        latlng: new kakao.maps.LatLng(37.514215106406374, 127.06727845927539)
    },
    {
        title: '생태연못', 
        latlng: new kakao.maps.LatLng(37.514215606406344, 127.06727845927539)
    },
    {
        title: '텃밭', 
        latlng: new kakao.maps.LatLng(37.514215606406344, 127.06722645927539)
    },
    {
        title: '근린공원',
        latlng: new kakao.maps.LatLng(33.451393, 126.570738)
    }
];

// 마커 이미지의 이미지 주소입니다
var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
    
for (var i = 0; i < positions.length; i ++) {
    
    // 마커 이미지의 이미지 크기 입니다
    var imageSize = new kakao.maps.Size(24, 35); 
    
    // 마커 이미지를 생성합니다    
    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
    
    // 마커를 생성합니다
    var marker = new kakao.maps.Marker({
        map: map, // 마커를 표시할 지도
        position: positions[i].latlng, // 마커를 표시할 위치
        title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
        image : markerImage // 마커 이미지 
    });
}
</script>
</body>
</html>