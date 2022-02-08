<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
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
<link rel="stylesheet" href="${contextPath}/resources/css/reviewList.css" type="text/css">
</head>
<body>
	<nav class="navbar navbar-default navbar-expand-lg navbar-dark fixed-top">
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
								<a class="dropdown-item" href="#">어디어디</a>
								<a class="dropdown-item" href="#">지역2</a>
								<a class="dropdown-item" href="#">지역3</a>
								<a class="dropdown-item" href="#">지역4</a>
							</div>
						</div>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="${contextPath}/reconList.do" style="color: white">
							<strong>&nbsp;&nbsp;&nbsp;추천 메뉴</strong>
						</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="${contextPath}/reviewList.do" style="color: white">
							<strong>최근 후기</strong>
						</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="${contextPath}/newList.do" style="color: white">
							<strong>신규 개업</strong>
						</a>
					</li>
				</ul>
				<form class="d-flex">
					<input class="form-control me-2" type="search" placeholder="밥 뭐먹지?" aria-label="Search">
					<button class="btn btn-sm btn-outline-light" type="submit">SEARCH</button>
				</form>
			</div>

			<ul class="navbar-nav">
				<li class="nav-item dropdown">
					<div class="col-lg-6"></div>
						<a href="#" id="navbarDropdown" data-toggle="dropdown">
							<img src="${contextPath}/resources/image/login.png" alt="Menu" width="80" height="80" />
						</a>
					</div>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<a class="dropdown-item" href="${contextPath}/loginForm.do">로그인</a>
						<a class="dropdown-item" href="../login_join/join.html">회원가입</a>
					</div>
					</div>
				</li>
			</ul>
	</nav>
	<div class="title">
		<div class="title_txt">
			<b>최근 후기</b><br>
		</div>
	</div>
	<div class="row">
		<div class="col1">
			<c:forEach var="reviewO" items="${reviewListlOdd}">
				<div class="ind_review" id="${reviewO.review_NO }" onclick="openReviewModal(this.id)">
				<table>
					<tr>
						<td>
							<c:choose>
								<c:when test="${empty reviewO.user_Profile }">
									<img src="${contextPath}/resources/image/nav.png" class="profile_img">
								</c:when>
								<c:otherwise>
									<img src="${contextPath}/resources/image/${reviewO.user_Profile }" class="profile_img">
								</c:otherwise>
							</c:choose>
						<td>
							<span class="username"><a href="${contextPath}/detail.do?rest_NO=${reviewO.rest_NO}"><b>${reviewO.rest_Name}</b></a></span><br>
							<span class="username">${reviewO.user_Nickname}</span>
							<span class="level">&nbsp;Lv.${reviewO.user_Level } <br></span>
							<span class="star">				
								<c:forEach begin="1" end="${reviewO.review_Scope }">
									<i class="fas fa-star"></i>
								</c:forEach>
							</span>
							<span class="star_date">&nbsp; ${reviewO.review_Date}</span>
						</td>
					</tr>
				</table>
				<div class="review_contents">${reviewO.review_Text }</div>
				<p class="re_bottom_img">
					<c:forTokens items="${reviewO.images }" delims="/" var="img">
						<img src="${contextPath}/resources/image/${img}" alt="">
					</c:forTokens>
				</p>
			</div>
			
			<div class="modal" id="review_${reviewO.review_NO }">
            	<span class="close cursor" onclick="closeReviewModal('review_${reviewO.review_NO }')">&times;</span>
            	<div class="review_modal_content">
                	<div id="modal_profile_img">
                		<c:choose>
							<c:when test="${empty reviewO.user_Profile }">
								<img src="${contextPath}/resources/image/nav.png" class="profile_img">
							</c:when>
							<c:otherwise>
								<img src="${contextPath}/resources/image/${reviewO.user_Profile }" class="profile_img">
							</c:otherwise>
						</c:choose>
                	</div>
                	<div id="modal_profile">
                		<span style="padding-left: 9px; font-size:20px; color: salmon"><a href="${contextPath}/detail.do?rest_NO=${reviewO.rest_NO}"><b>${reviewO.rest_Name}</b></a></span><br>
                    	<span class="username"><b>${reviewO.user_Nickname }</b></span>
                    	<span class="level">&nbsp;Lv. ${reviewO.review_Scope } <br></span>
                    	<span class="star">
                        	<c:forEach begin="1" end="${reviewO.review_Scope }">
								<i class="fas fa-star"></i>
							</c:forEach>
                    	</span>
                    	<span class="star_date">&nbsp;${reviewO.review_Date }</span>
                	</div>
                	<div class="review_modal_btn">
                		<input type="button" value="수정" id="review_edit"><input type="button" value="삭제" id="review_delete" onclick="check_delete()">
                	</div>
                	<br>
                	<div class="review_contents">
                    	${reviewO.review_Text }
                	</div>
               		<div class="review_modal_img">
                    	<c:forTokens items="${reviewO.images }" delims="/" var="img">
							<img src="${contextPath}/resources/image/${img}" alt="">
						</c:forTokens>
                	</div>
            	</div>
        	</div>
			</c:forEach>
		</div>
		<div class="col2">
			<c:forEach var="reviewE" items="${reviewListlEven}">
				<div class="ind_review" id="${reviewE.review_NO }" onclick="openReviewModal(this.id)">
				<table>
					<tr>
						<td>
							<c:choose>
								<c:when test="${empty reviewE.user_Profile }">
									<img src="${contextPath}/resources/image/nav.png" class="profile_img">
								</c:when>
								<c:otherwise>
									<img src="${contextPath}/resources/image/${reviewE.user_Profile }" class="profile_img">
								</c:otherwise>
							</c:choose>
						<td>
							<span class="username"><a href="${contextPath}/detail.do?rest_NO=${reviewE.rest_NO}"><b>${reviewE.rest_Name}</b></a></span><br>
							<span class="username">${reviewE.user_Nickname}</span>
							<span class="level">&nbsp;Lv. ${reviewE.user_Level } <br></span>
							<span class="star">				
								<c:forEach begin="1" end="${reviewE.review_Scope }">
									<i class="fas fa-star"></i>
								</c:forEach>
							</span>
							<span class="star_date">&nbsp; ${reviewE.review_Date}</span>
						</td>
					</tr>
				</table>
				<div class="review_contents">${reviewE.review_Text }</div>
				<p class="re_bottom_img">
					<c:forTokens items="${reviewE.images }" delims="/" var="img">
						<img src="${contextPath}/resources/image/${img}" alt="">
					</c:forTokens>
				</p>
			</div>
			
			<div class="modal" id="review_${reviewE.review_NO }">
            	<span class="close cursor" onclick="closeReviewModal('review_${reviewE.review_NO }')">&times;</span>
            	<div class="review_modal_content">
                	<div id="modal_profile_img">
                		<c:choose>
							<c:when test="${empty reviewE.user_Profile }">
								<img src="${contextPath}/resources/image/nav.png" class="profile_img">
							</c:when>
							<c:otherwise>
								<img src="${contextPath}/resources/image/${reviewE.user_Profile }" class="profile_img">
							</c:otherwise>
						</c:choose>
                	</div>
                	<div id="modal_profile">
                		<span style="padding-left: 9px; font-size:20px; color: salmon"><a href="${contextPath}/detail.do?rest_NO=${reviewE.rest_NO}"><b>${reviewE.rest_Name}</b></a></span><br>
                    	<span class="username"><b>${reviewE.user_Nickname }</b></span>
                    	<span class="level">&nbsp;Lv. ${reviewE.review_Scope } <br></span>
                    	<span class="star">
                        	<c:forEach begin="1" end="${reviewE.review_Scope }">
								<i class="fas fa-star"></i>
							</c:forEach>
                    	</span>
                    	<span class="star_date">&nbsp;${reviewE.review_Date }</span>
                	</div>
                	<div class="review_modal_btn">
                		<input type="button" value="수정" id="review_edit"><input type="button" value="삭제" id="review_delete" onclick="check_delete()">
                	</div>
                	<br>
                	<div class="review_contents">
                    	${reviewE.review_Text }
                	</div>
               		<div class="review_modal_img">
                    	<c:forTokens items="${reviewE.images }" delims="/" var="img">
							<img src="${contextPath}/resources/image/${img}" alt="">
						</c:forTokens>
                	</div>
            	</div>
        	</div>
			
			</c:forEach>
		</div>
	</div>

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
	<script type="text/javascript">
	function openReviewModal(n) {
    	document.getElementById("review_"+n).style.display = "block";
		}
	function closeReviewModal(review_NO) {
    	document.getElementById(review_NO).style.display = "none";
	}
	</script>
</body>
</html>