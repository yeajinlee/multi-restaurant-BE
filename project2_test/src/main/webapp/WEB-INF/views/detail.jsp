<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="detail" value="${detailMap.detailVO }"/>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>상세정보</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
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
<link rel="stylesheet" href="${contextPath}/resources/css/detail.css" type="text/css">
</head>
<body>
	<nav
		class="navbar navbar-default navbar-expand-lg navbar-dark fixed-top">
		<a href="${contextPath}/main.do">
			<img src="${contextPath}/resources/image/nav.png" width="80" height="80" alt="">
		</a>
		<a class="navbar-brand" href="${contextPath}/main.do">
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
						href="../main/reco1.html" style="color: white"><strong>&nbsp;&nbsp;&nbsp;추천
								메뉴</strong> </a></li>
					<li class="nav-item"><a class="nav-link"
						href="${contextPath}/reviewList.do" style="color: white"><strong>최근
								후기</strong> </a></li>
					<li class="nav-item"><a class="nav-link"
						href="../newList/newList.html" style="color: white"><strong>신규
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
					data-toggle="dropdown"><img src="${contextPath}/resources/image/login.png"
						alt="Menu" width="80" height="80" /></a>
					</div>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<a class="dropdown-item" href="${contextPath}/loginForm.do">로그인</a> <a
							class="dropdown-item" href="../login_join/join.html">회원가입</a>
					</div>
					</div>
			</ul>
	</nav>
	<section class="top_img">
		<div class="review_img">
			<c:choose>
				<c:when test="${empty detailImg}">
					<p>등록된 리뷰 사진이 없습니다.</p>
				</c:when>
				<c:otherwise>
					<c:forEach var="detailImg" items="${detailImg}" varStatus="cnt">
						<span>
							<img
							src="${pageContext.request.contextPath}/resources/image/${detailImg.img_FileName}"
							class="ind_img" id="${detailImg.img_FileName }" onClick="openTopModal(this.id);">
						</span>
						
						<div id="top_modal_${detailImg.img_FileName}" class="modal">
							<span class="close cursor" onclick="closeTopModal('top_modal_${detailImg.img_FileName}')">&times;</span>
							<div class="modal-content">
								<img src="${contextPath}/resources/image/${detailImg.img_FileName}" style="min-height: 580px;">
							</div>
						</div>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</div>

		<%-- The Modal/Lightbox --%>
		<%-- <c:forEach var="detailImg" items="${detailImg}" varStatus="cnt">
			<div id="top_modal" class="modal">
				<span class="close cursor" onclick="closeTopModal()">&times;</span>
				<div class="modal-content">
					<div class="top_modal_slides">
						<div class="numbertext">${cnt.count} / 10</div>
						<img src="${contextPath}/resources/image/${detailImg.img_FileName}" height="100%">
					</div>
					<a class="prev" onclick="plusSlides(-1)">&#10094;</a>
					<a class="next" onclick="plusSlides(1)">&#10095;</a>
				</div>
			</div>
		</c:forEach> --%>
		

				<%-- <div class="top_modal_slides">
					<div class="numbertext">2 / 10</div>
					<img src="${contextPath}/resources/image/sushi2.jpg" height="100%">
				</div>

				<div class="top_modal_slides">
					<div class="numbertext">3 / 10</div>
					<img src="${contextPath}/resources/image/sushi3.jpg" height="100%">
				</div>

				<div class="top_modal_slides">
					<div class="numbertext">4 / 10</div>
					<img src="${contextPath}/resources/image/sushi4.jpg" height="100%">
				</div>

				<div class="top_modal_slides">
					<div class="numbertext">5 / 10</div>
					<img src="${contextPath}/resources/image/sushi5.jpg" height="100%">
				</div>

				<div class="top_modal_slides">
					<div class="numbertext">6 / 10</div>
					<img src="../images/sushi6.jpg" height="100%">
				</div>

				<div class="top_modal_slides">
					<div class="numbertext">7 / 10</div>
					<img src="../images/sushi7.jpg" height="100%">
				</div>

				<div class="top_modal_slides">
					<div class="numbertext">8 / 10</div>
					<img src="../images/sushi8.jpg" height="100%">
				</div>

				<div class="top_modal_slides">
					<div class="numbertext">9 / 10</div>
					<img src="../images/sushi9.jpg" height="100%">
				</div>

				<div class="top_modal_slides">
					<div class="numbertext">10 / 10</div>
					<img src="../images/sushi10.jpg" height="100%">
				</div> --%>

				<%-- Next/previous controls --%>
				
	</section>


	<aside class='l_map'>
		<span> <iframe
				src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3162.390980157256!2d126.98338321450412!3d37.569410079797336!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357ca2e8bd68ec11%3A0x6ee78e54814af2d9!2z6rCT64207Iqk7Iuc!5e0!3m2!1sko!2skr!4v1641207292048!5m2!1sko!2skr"
				width="300" height="300" style="border: 0;" allowfullscreen=""
				loading="lazy"></iframe> <br>
		</span>
		<div class='map_btn'>
			<%-- <button id="map_view">크게보기</button> --%>
			<button id="myBtn">길찾기</button>

		</div>
	</aside>

	<section class="r_info">
		<div class="detail_info">
			<span class="place_name">${detail.rest_Name }</span>
			<span class="star_wish">
				<i class="fas fa-star"></i>&nbsp; <span><b>${detail.rest_Scope} / 5</b></span>&nbsp;&nbsp;&nbsp;
				<span class="wish_cnt">리뷰 35 찜 12</span>&nbsp; 
				<i class="far fa-heart" id="heart" onclick="setWishList();"></i>
			</span>
			<table>
				<tr>
					<td>주소</td>
					<td>${detail.rest_Address }</td>
				</tr>
				<tr>
					<td>전화번호</td>
					<td>${detail.rest_Phone }</td>
				</tr>
				<tr>
					<td>가격대</td>
					<td>${detail.rest_Price }</td>
				</tr>
				<tr>
					<td>소셜</td>
					<td><a href="https://www.instagram.com/?hl=ko">${detail.rest_Social}</a></td>
				</tr>
				<tr>
					<td>개업일</td>
					<td>${detail.rest_OpenDate }</td>
				</tr>
				<tr>
					<td colspan="2" class="tag"><input type="button" value="오마카세">
						<input type="button" value="데이트"> <input type="button"
						value="조용한"> <input type="button" value="을지로 4가">
						<input type="button" value="종로 맛집"></td>
				</tr>
			</table>
		</div>
	</section>



	<hr>
	<aside class="l_menu">
		<div class="recomm">
			<table>
				<th>주변 추천</th>
				<tr>
					<td><a href="../detail/detail.html"><img
							src="${contextPath}/resources/image/pizza.jpg" alt=""></a></td>
					<td><a href="../detail/detail.html">파파존스</a><br>피자, 파스타<br>을지로<br>0만원~0만원대</td>
					<td><i class="fas fa-star"></i>&nbsp;&nbsp;4.0/5</td>
				</tr>
				<tr>
					<td><img src="${contextPath}/resources/image/kimbap.jpg" alt=""></td>
					<td><a href="#">김밥천국</a><br>분식<br>광희동<br>0천원~0만원대</td>
					<td><i class="fas fa-star"></i>&nbsp;&nbsp;3.5/5</td>
				</tr>
				<tr>
					<td><img src="${contextPath}/resources/image/kbbq.jpg" alt=""></td>
					<td><a href="#">솥뚜껑</a><br>삼겹살<br>종로5가<br>0만원~0만원대</td>
					<td><i class="fas fa-star"></i>&nbsp;&nbsp;4.7/5</td>
				</tr>
				<tr>
					<td><img src="${contextPath}/resources/image/pasta.jpg" alt=""></td>
					<td><a href="#">매드포갈릭</a><br>피자, 파스타<br>을지로<br>0만원~0만원대</td>
					<td><i class="fas fa-star"></i>&nbsp;&nbsp;4.3/5</td>
				</tr>
				<tr>
					<td><img src="${contextPath}/resources/image/burger.jpg" alt=""></td>
					<td><a href="#">버거킹</a><br>햄버거<br>광희동<br>0만원~0만원대</td>
					<td><i class="fas fa-star"></i>&nbsp;&nbsp;3.7/5</td>
				</tr>
			</table>
		</div>
	</aside>

	<section class="review">
		<div>
			<span class="review_cnt"><b>리뷰 (35)</b></span>
			<span class="write">
				<table onclick="openWriteModal()">
					<tr>
						<td>&nbsp;<i class="far fa-edit" id="write_btn"></i></td>
					</tr>
					<tr><td><p>리뷰쓰기<p></td></tr>
				</table>
			</span>
		</div>
		
		<div id="write_modal" class="modal">
            <span class="close cursor" onclick="closeWriteModal()">&times;</span>
            <div class="write_content">
                <form action="#">
                    <table class="write_form">
                        <tr><td><p id="write_title"> <span id="res_name">${detail.rest_Name }</span> 어떠셨나요?</p></td></tr>
                        <tr><td><p id="write_star">
                            <i class="fas fa-star" id="star1" onclick="clickStar(this.id)"><i class="fas fa-star" id="star2" onclick="clickStar(this.id)"><i class="fas fa-star" id="star3" onclick="clickStar(this.id)"><i class="fas fa-star" id="star4" onclick="clickStar(this.id)"><i class="fas fa-star" id="star5" onclick="clickStar(this.id)">
                        </p></td></tr>
                        <tr><td><textarea name="wrtie_review" id="wrtie_review" placeholder="리뷰를 남겨주세요."></textarea></td></tr>
                        <tr><td><input type="file" id="add_file"><p id="add_file_btn" onclick="add_file()"><i class="fas fa-plus"></i></p></td></tr>
                        <tr><td><p id="add_review"><input type="submit" value="리뷰 등록" id="add_review_btn"></p></td></tr>
                    </table>
                </form>
                
            </div>
        </div>
		
		
		<c:forEach var="review" items="${detailReviewList }">
			<div class="ind_review" id="${review.review_NO }"onclick="openReviewModal(this.id)">
				<table>
					<tr>
						<td>
							<c:choose>
								<c:when test="${empty review.user_Profile }">
									<img src="${contextPath}/resources/image/nav.png" class="profile_img">
								</c:when>
								<c:otherwise>
									<img src="${contextPath}/resources/image/${review.user_Profile }" class="profile_img">
								</c:otherwise>
							</c:choose>
						</td>
						<td>
							<span>
								<span class="username"><b>${review.user_Nickname }</b></span>&nbsp;
								<span class="level">Lv. ${review.user_Level }</span><br>
									<span  class="star">
										<c:forEach begin="1" end="${review.review_Scope }">
											<i class="fas fa-star"></i>
										</c:forEach>
									</span>
								&nbsp;<span class="star_date">${review.review_Date }</span>
							</span>
						</td>
					</tr>
				</table>
				<p class="review_contents">${review.review_Text }</p>
				<p class="re_bottom_img">
					<c:forTokens items="${review.images }" delims="/" var="img">
						<img src="${contextPath}/resources/image/${img}" alt="">
					</c:forTokens>
				</p>	
			</div>
			
			<div class="modal" id="review_${review.review_NO }">
            	<span class="close cursor" onclick="closeReviewModal('review_${review.review_NO }')">&times;</span>
            	<div class="review_modal_content">
                	<div id="modal_profile_img">
                		<c:choose>
							<c:when test="${empty review.user_Profile }">
								<img src="${contextPath}/resources/image/nav.png" class="profile_img">
							</c:when>
							<c:otherwise>
								<img src="${contextPath}/resources/image/${review.user_Profile }" class="profile_img">
							</c:otherwise>
						</c:choose>
                	</div>
                	<div id="modal_profile">
                    	<span class="username"><b>${review.user_Nickname }</b></span>
                    	<span class="level">&nbsp;Lv. ${review.review_Scope } <br></span>
                    	<span class="star">
                        	<c:forEach begin="1" end="${review.review_Scope }">
								<i class="fas fa-star"></i>
							</c:forEach>
                    	</span>
                    	<span class="star_date">&nbsp;${review.review_Date }</span>
                	</div>
                	<div class="review_modal_btn">
                		<input type="button" value="수정" id="review_edit"><input type="button" value="삭제" id="review_delete" onclick="check_delete()">
                	</div>
                	<br>
                	<div class="review_contents">
                    	${review.review_Text }
                	</div>
               		<div class="review_modal_img">
                    	<c:forTokens items="${review.images }" delims="/" var="img">
							<img src="${contextPath}/resources/image/${img}" alt="">
						</c:forTokens>
                	</div>
            	</div>
        	</div>
		</c:forEach>
	</section>

	<footer>
		<div class="column1">

			<h2 class="text-left1">
				About Us <img src="${contextPath}/resources/image/footer_nav.png" alt="">
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
        // Open the Modal
        function openTopModal(n) {
          document.getElementById("top_modal_"+n).style.display = "block";
        }
        
        // Close the Modal
        function closeTopModal(n) {
          document.getElementById(n).style.display = "none";
        }
        
        // var slideIndex = 1;
        // showSlides(slideIndex);
        
        // Next/previous controls
        /* function plusSlides(n) {
          showSlides(slideIndex += n);
        }
        
        function currentSlide(n) {
          showSlides(slideIndex = n);
        }

        function showSlides(n) {
          var slides = document.getElementsByClassName("top_modal_slides");
        
          if (n > slides.length) {slideIndex = 1} //마지막 슬라이드에서 1번 슬라이드로
          if (n < 1) {slideIndex = slides.length} //1번 슬라이드에서 마지막 슬라이드로
          for (var i = 0; i < slides.length; i++) { //다음 슬라이드로 넘어가면 앞 슬라이드의 사진이 안보이도록
            slides[i].style.display = "none";
          }
          slides[slideIndex-1].style.display = "block"; //다음 슬라이드를 띄움
        } */
        
        function setWishList() {
            if (document.getElementById('heart').className == 'far fa-heart') {
                document.getElementById('heart').className='fas fa-heart';
                alert("이 가게를 찜했습니다.");
            } else {
                document.getElementById('heart').className='far fa-heart';
                alert("찜 목록에서 삭제되었습니다.");
            }
        }
        function openReviewModal(n) {
            document.getElementById("review_"+n).style.display = "block";
        }
        function closeReviewModal(review_NO) {
            document.getElementById(review_NO).style.display = "none";
        }

        function openWriteModal() {
          document.getElementById("write_modal").style.display = "block";
        }
        
        // Close the Modal
        function closeWriteModal() {
          document.getElementById("write_modal").style.display = "none";
          document.getElementById('star1').style.color="lightgray";
          document.getElementById('star2').style.color="lightgray";
          document.getElementById('star3').style.color="lightgray";
          document.getElementById('star4').style.color="lightgray";
          document.getElementById('star5').style.color="lightgray";
        }

        function add_file() {
            document.getElementById('add_file').click();
        }

        function clickStar1() {
            document.getElementById('star1').style="color:salmon";
        }

        function clickStar(clicked_id) {
            var id = clicked_id;
            if (id == 'star1' ) {
                document.getElementById('star1').style.color="salmon";
            } else if (id == 'star2') {
                document.getElementById('star1').style="color:salmon";
                document.getElementById('star2').style="color:salmon";
            } else if (id == 'star3') {
                document.getElementById('star1').style="color:salmon";
                document.getElementById('star2').style="color:salmon";
                document.getElementById('star3').style="color:salmon";
            } else if (id == 'star4') {
                document.getElementById('star1').style="color:salmon";
                document.getElementById('star2').style="color:salmon";
                document.getElementById('star3').style="color:salmon";
                document.getElementById('star4').style="color:salmon";
            } else if (id == 'star5') {
                document.getElementById('star1').style="color:salmon";
                document.getElementById('star2').style="color:salmon";
                document.getElementById('star3').style="color:salmon";
                document.getElementById('star4').style="color:salmon";
                document.getElementById('star5').style="color:salmon";
            }            
        }

        function check_delete() {
            
        }

    </script>
</body>
</html>