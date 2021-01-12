<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
body {
	background-image: url(images/background.jpg);
}

li {
	float: left;
	margin: 20px;
}

a {
	text-decoration: none;
	color: white;
	font-size: 13px;
}

a:hover {
	text-decoration: underline;
}



.member {
	position: absolute;
	top: 20px;
	right: 30px;
	width: 300px;
	height: 30px;
	text-align: right;
	z-index: 100;
}

.maintitle {
	width: 100%;
	height: 200px;
	background-image: url(images/camera.jpg);
	z-index: 10;
}

#title {
	position: absolute;
	top: 100px;
	left: 400px;
}

#news {
	top: 210px;
	left: 1600px;
	text-align: right;
	width: 500px;
	height: 1000px;
	position: fixed;
}

#navbar {
	background-color: black;
	top: 230px;
	margin: 0px;
	padding: 0;
	list-style-type: none;
	position: absolute;
	width: 100%;
	height: 50px;
}
#portfolio{

top: 130px;
margin: 0px;

}
.kh01{
width: 100%;
height: 1000px;

}

</style>

<script src="js/jquery-1.10.2.js"></script>
<script src="js/jquery.innerfade.js"></script>
<!-- 사진이 자동으로 바뀌는 기술이 여기에 정의되어있다 -->
<!-- <link rel="stylesheet" type="text/css" href="css/khstyle.css">-->
<meta charset="UTF-8">
<title>Travel</title>
</head>

<body>

	<div class="member">
		<a href="index.jsp">홈</a> | <a href="#">회원가입</a> | <a href="login.jsp">로그인</a>
	</div>
	<div class="maintitle">
		<ul id="news">
			<li><a href="#n1">인기여행지: 1. 체코</a></li>
			<li><a href="#n2">인기여행지: 2. 스위스</a></li>
			<li><a href="#n3">인기여행지: 3. 프랑스</a></li>
			<li><a href="#n4">인기여행지: 4. 독일</a></li>
			<li><a href="#n5">인기여행지: 5. 오스트리아</a></li>
			<li><a href="#n6">인기여행지: 6. 이탈리아</a></li>
			<li><a href="#n7">인기여행지: 7. 하하</a></li>
		</ul>
	</div>
	<div class="kh01">
		<ul id="navbar">
			<li><a href="haksainfo.jsp">학사소개 | </a></li>
			<li><a href="#">커뮤니티 | </a></li>
			<li><a href="#">모집과정 | </a></li>
			<li><a href="#">KHB클래스 | </a></li>
		</ul>
		<ul id="portfolio">
			<li><a href="#"> <img src="images/czech.jpg" title="체코"
					class="khmain" />
			</a></li>
			<li><a href="#"> <img src="images/swiss.jpg" title="스위스"
					class="khmain" />
			</a></li>
			<li><a href="#"> <img src="images/paris.jpg" title="프랑스"
					class="khmain" />
			</a></li>
			<li><a href="#"> <img src="images/germany.jpg" title="독일"
					class="khmain" />
			</a></li>
			<li><a href="#"> <img src="images/venezia.jpg"
					title="베니스" class="khmain" />
			</a></li>
			<li><a href="#"> <img src="images/venezia2.jpg"
					title="베네치아" class="khmain" />
			</a></li>
			<li><a href="#"> <img src="images/italy.jpg" title="이탈리아"
					class="khmain" />
			</a></li>
		</ul>
	</div>
	
	<script>
		$('#portfolio').innerfade({
			speed : 'slow',
			timeout : 2000,
			type : 'random',
			containerheight : '220px'
		});
		$('.news').innerfade({
			animationtype : 'slide',
			speed : 250,
			timeout : 2000,
			type : 'sequence',
			containerheight : '1em'
		});
		$(function() {
			$('#menu > div').hover(function() {
				var $el = $(this);
				$el.find('.circle').stop().animate({
					'width' : '199px',
					'height' : '199px',
					'opacity' : '0.8',
					'top' : '-25px',
					'left' : '-25px'
				}, 500, 'easeOutBack', function() {
					$(this).parent().find('ul').fadeIn(400);
				});
				$el.find('h2').addClass('active');
			}, function() {
				var $el = $(this);
				$el.find('ul').fadeOut(500);
				$el.find('.circle').stop().animate({
					'width' : '50px',
					'height' : '50px',
					'top' : '0px',
					'left' : '0px',
					'opacity' : '0.1'
				}, 4000, 'easeOutBack');
				$el.find('h2').removeClass('active');
			});
		});
	</script>
</body>
</html>