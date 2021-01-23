<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<style type="text/css">
.khmain {
	width: 200px;
	height: 200px;
}

#portfolio {
	top: 130px;
	margin: 0px;
}

.kh01 {
	width: 100%;
	height: 1000px;
}

#news {
	top: 210px;
	left: 1600px;
	text-align: right;
	width: 500px;
	height: 1000px;
	position: fixed;
}
</style>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="kh01">
		<ul id="news">
			<li><a href="#n1">인기여행지: 1. 체코</a></li>
			<li><a href="#n2">인기여행지: 2. 스위스</a></li>
			<li><a href="#n3">인기여행지: 3. 프랑스</a></li>
			<li><a href="#n4">인기여행지: 4. 독일</a></li>
			<li><a href="#n5">인기여행지: 5. 오스트리아</a></li>
			<li><a href="#n6">인기여행지: 6. 이탈리아</a></li>
			<li><a href="#n7">인기여행지: 7. 하하</a></li>
		</ul>
		<ul id="portfolio">
			<a href="#"> <img src="images/czech.jpg" title="체코"
					class="khmain" />
			</a>
			<a href="#"> <img src="images/swiss.jpg" title="스위스"
					class="khmain" />
			</a>
			<a href="#"> <img src="images/paris.jpg" title="프랑스"
					class="khmain" />
			</a>
			<a href="#"> <img src="images/germany.jpg" title="독일"
					class="khmain" />
			</a>
			<a href="#"> <img src="images/venezia.jpg" title="베니스"
					class="khmain" />
			</a>
			<a href="#"> <img src="images/venezia2.jpg" title="베네치아"
					class="khmain" />
			</a>
			<a href="#"> <img src="images/italy.jpg" title="이탈리아"
					class="khmain" />
			</a>
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