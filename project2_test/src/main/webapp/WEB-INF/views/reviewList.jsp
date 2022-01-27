<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>최근 후기</title>
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
<link rel="stylesheet" href="resources/css/reviewList.css"
	type="text/css">
</head>

<body>
	<nav
		class="navbar navbar-default navbar-expand-lg navbar-dark fixed-top">
		<a href="../main/main.html"><img src="resources/image/nav.png"
			width="80" height="80" alt=""> <a class="navbar-brand"
			href="../main/main.html"> MULTI <br> RESTAURANT
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
						href="../reviewList/reviewList.html" style="color: white"><strong>최근
								후기</strong> </a></li>
					<li class="nav-item"><a class="nav-link"
						href="../newList/newList.html" style="color: white"><strong>신규
								개업</strong> </a></li>
				</ul>
				<form class="d-flex">
					<input class="form-control me-2" type="search" placeholder="밥 뭐먹지?"
						aria-label="Search">
					<button class="btn btn-sm btn-outline-light" type="submit">SEARCH</button>
				</form>
			</div>
			</div>

			<ul class="navbar-nav">
				<li class="nav-item dropdown">
					<div class="col-lg-6"></div> <a class href="#" id="navbarDropdown"
					data-toggle="dropdown"><img src="resources/image/login.png"
						alt="Menu" width="80" height="80" /></a>
					</div>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<a class="dropdown-item" href="../login_join/login.html">로그인</a> <a
							class="dropdown-item" href="../login_join/join.html">회원가입</a>
					</div>
					</div>
			</ul>
	</nav>
	<div class="title">
		<div class="title_txt">
			<b>최근 후기</b><br>
		</div>
	</div>
	
	<c:choose>
		<c:when test="${empty reviewListOdd && empty reviewListEven}">
			<div>
				<p align="center">등록된 후기가 없습니다.</p>
			</div>
		</c:when>
		<c:otherwise>
			<div class="row">
				<div class="col1">
					<c:forEach var="review" items="${reviewListlOdd}">
						<div class="ind_review">
						<table>
							<tr>
								<td><img src="../images/burger.jpg" class="profile_img"></td>
								<td>
									<span class="username"><a href="../detail/detail.html"><b>${review.rest_Name}</b></a></span><br>
									<span class="username">${review.user_ID}</span>
									<span class="level">&nbsp;Lv.1 <br></span>
									<span class="star">
										${review.review_Scope}
										<i class="fas fa-star"></i>
										<i class="fas fa-star"></i>
										<i class="fas fa-star"></i>
										<i class="fas fa-star"></i>
										<i class="fas fa-star"></i>
									</span>
									<span class="star_date">&nbsp; ${review.review_Date}</span>
								</td>
							</tr>
						</table>
						<div class="review_contents">${review.review_Text }</div>
						<p class="re_bottom_img">
							<img src="resources/image/sushi.jpg" alt="">
							<img src="resources/image/sushi2.jpg" alt="">
							<img src="resources/image/sushi3.jpg" alt="">
						</p>
					</div>
					</c:forEach>
				</div>
				<div class="col2">
					<c:forEach var="review" items="${reviewListlEven }">
						<div class="ind_review">
						<table>
							<tr>
								<td><img src="../images/burger.jpg" class="profile_img"></td>
								<td>
									<span class="username"><a href="../detail/detail.html"><b>${review.rest_Name}</b></a></span><br>
									<span class="username">${review.user_ID}</span>
									<span class="level">&nbsp;Lv.1 <br></span>
									<span class="star">
										${review.review_Scope}
										<i class="fas fa-star"></i>
										<i class="fas fa-star"></i>
										<i class="fas fa-star"></i>
										<i class="fas fa-star"></i>
										<i class="fas fa-star"></i>
									</span>
									<span class="star_date">&nbsp; ${review.review_Date}</span>
								</td>
							</tr>
						</table>
						<div class="review_contents">${review.review_Text }</div>
						<p class="re_bottom_img">
							<img src="resources/image/sushi.jpg" alt="">
							<img src="resources/image/sushi2.jpg" alt="">
							<img src="resources/image/sushi3.jpg" alt="">
						</p>
					</div>
					</c:forEach>
				</div>
			</div>
		</c:otherwise>
	</c:choose>
	<%-- <div class="row">
		<div class="col1">
			<div class="ind_review">
				<table>
					<tr>
						<td><img src="../images/burger.jpg" class="profile_img"></td>
						<td><span class="username"><a
								href="../detail/detail.html"><b>일조초밥</b></a></span><br> <span
							class="username">미식가</span> <span class="level">&nbsp;Lv.
								1 <br>
						</span> <span class="star"> <i class="fas fa-star"></i><i
								class="fas fa-star"></i><i class="fas fa-star"></i><i
								class="fas fa-star"></i><i class="fas fa-star"></i>
						</span> <span class="star_date">&nbsp;2일 전</span></td>
					</tr>
				</table>
				<div class="review_contents">가격도 적당하고 맛있었어요 조용해서 데이트코스에 넣어도 좋을
					것 같네요 종로 주변에서 먹어본 초밥집중에 제일 괜찮았어요 을지로맛집 추천</div>
				<p class="re_bottom_img">
					<img src="resources/image/sushi.jpg" alt=""><img
						src="resources/image/sushi2.jpg" alt=""><img
						src="resources/image/sushi3.jpg" alt="">
				</p>
			</div>
			<div class="ind_review">
				<table>
					<tr>
						<td><img src="../images/kbbq.jpg" class="profile_img"></td>
						<td><span class="username"><a
								href="../detail/detail.html"><b>파파존스</b></a><br></span> <span
							class="username">고든램지</span> <span class="level">&nbsp;Lv.
								6 <br>
						</span> <span class="star"> <i class="fas fa-star"></i><i
								class="fas fa-star"></i><i class="fas fa-star"></i>
						</span> <span class="star_date">&nbsp;2021년 12월 11일</span></td>
					</tr>
				</table>
				<div class="review_contents">
					가격도 적당하고 맛있었어요 조용해서 데이트코스에 넣어도 좋을 것 같네요 종로 주변에서 먹어본 초밥집중에 제일 괜찮았어요
					을지로맛집 추천<br> 가격도 적당하고 맛있었어요 조용해서 데이트코스에 넣어도 좋을 것 같네요 종로 주변에서
					먹어본 초밥집중에 제일 괜찮았어요 을지로맛집 추천<br> 가격도 적당하고 맛있었어요 조용해서 데이트코스에 넣어도
					좋을 것 같네요 종로 주변에서 먹어본 초밥집중에 제일 괜찮았어요 을지로맛집 추천
				</div>
				<p class="re_bottom_img">
					<img src="../images/pizza.jpg" alt=""><img
						src="../images/pasta.jpg" alt="">
				</p>
			</div>
			<div class="ind_review">
				<table>
					<tr>
						<td><img src="../images/kimbap.jpg" class="profile_img"></td>
						<td><span class="username"><b>버거킹</b><br></span> <span
							class="username">제이미올리버</span> <span class="level">&nbsp;Lv.
								4 <br>
						</span> <span class="star"> <i class="fas fa-star"></i><i
								class="fas fa-star"></i><i class="fas fa-star"></i><i
								class="fas fa-star"></i>
						</span> <span class="star_date">&nbsp;2021년 11월 4일</span></td>
					</tr>
				</table>
				<div class="review_contents">
					가격도 적당하고 맛있었어요 조용해서 데이트코스에 넣어도 좋을 것 같네요 종로 주변에서 먹어본 초밥집중에 제일 괜찮았어요
					을지로맛집 추천<br> 가격도 적당하고 맛있었어요 조용해서 데이트코스에 넣어도 좋을 것 같네요 종로 주변에서
					먹어본 초밥집중에 제일 괜찮았어요 을지로맛집 추천
				</div>
				<p class="re_bottom_img">
					<img src="../images/burger.jpg" alt=""><img
						src="../images/burger.jpg" alt="">
				</p>
			</div>
		</div>
		
		<div class="col2">
			<div class="ind_review">
				<table>
					<tr>
						<td><img src="../images/kimbap.jpg" class="profile_img"></td>
						<td><span class="username"><a
								href="../detail/detail.html"><b>김밥천국</b></a><br></span> <span
							class="username">제이미올리버</span> <span class="level">&nbsp;Lv.
								4 <br>
						</span> <span class="star"> <i class="fas fa-star"></i><i
								class="fas fa-star"></i><i class="fas fa-star"></i><i
								class="fas fa-star"></i>
						</span> <span class="star_date">&nbsp;1일 전</span></td>
					</tr>
				</table>
				<div class="review_contents">
					가격도 적당하고 맛있었어요 조용해서 데이트코스에 넣어도 좋을 것 같네요 종로 주변에서 먹어본 초밥집중에 제일 괜찮았어요
					을지로맛집 추천<br> 가격도 적당하고 맛있었어요 조용해서 데이트코스에 넣어도 좋을 것 같네요 종로 주변에서
					먹어본 초밥집중에 제일 괜찮았어요 을지로맛집 추천
				</div>
				<p class="re_bottom_img">
					<img src="../images/kimbap.jpg" alt=""><img
						src="../images/sushi10.jpg" alt="">
				</p>
			</div>
			<div class="ind_review">
				<table>
					<tr>
						<td><img src="../images/burger.jpg" class="profile_img"></td>
						<td><span class="username"><b>갓덴스시</b><br></span> <span
							class="username">미식가</span> <span class="level">&nbsp;Lv.
								1 <br>
						</span> <span class="star"> <i class="fas fa-star"></i><i
								class="fas fa-star"></i><i class="fas fa-star"></i><i
								class="fas fa-star"></i><i class="fas fa-star"></i>
						</span> <span class="star_date">&nbsp;2021년 12월 1일</span></td>
					</tr>
				</table>
				<div class="review_contents">
					가격도 적당하고 맛있었어요 조용해서 데이트코스에 넣어도 좋을 것 같네요 종로 주변에서 먹어본 초밥집중에 제일 괜찮았어요
					을지로맛집 추천<br> 가격도 적당하고 맛있었어요 조용해서 데이트코스에 넣어도 좋을 것 같네요 종로 주변에서
					먹어본 초밥집중에 제일 괜찮았어요 을지로맛집 추천<br> 가격도 적당하고 맛있었어요 조용해서 데이트코스에 넣어도
					좋을 것 같네요 종로 주변에서 먹어본 초밥집중에 제일 괜찮았어요 을지로맛집 추천
				</div>
				<p class="re_bottom_img">
					<img src="../images/sushi4.jpg" alt=""><img
						src="../images/sushi5.jpg" alt=""><img
						src="../images/sushi6.jpg" alt="">
				</p>
			</div>
		</div>
	</div> --%>

	<footer>
		<div class="column1">

			<h2 class="text-left1">
				About Us <img src="../추천/footer_nav.png" alt="">
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
</body>

</html>