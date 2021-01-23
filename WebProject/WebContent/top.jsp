<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>대구가톨릭대학교</title>
<script type="text/javascript" src="js/jquery-1.10.2.js"></script>
<style>
body {
	background-image: url(images/background.jpg);
	font-family: Arial, sans-serif;
	font-size: 15px;
	line-height: 1.6;
	color: white;
}

a {
	text-decoration: none;
	color: white;
	font-size: 13px;
}

a:hover {
	text-decoration: underline;
}

#ALL {
	margin: 10px 10px;
	padding: 20px 20px;
	background-image: url(images/camera.jpg);
}

.menu {
	height: 45px;
	background: #000;
}

.menu ul {
	list-style: none;
	padding: 0;
	margin: 0;
}

.menu ul li {
	float: left;
	overflow: hidden;
	text-align: center;
	line-height: 45px;
}

.menu ul li a {
	position: relative;
	display: block;
	width: 110px;
	height: 45px;
	color: #FFF;
	font-family: Arial;
	font-size: 11px;
	font-weight: bold;
	letter-spacing: 1px;
	text-transform: uppercase;
	text-decoration: none;
	cursor: pointer;
}

.menu ul li a span {
	position: absolute;
	top: 0px;
	left: 0;
	width: 110px;
}

.menu ul li a span.over {
	top: -45px;
}

.menu ul li a span.over {
	background: #FFF;
	color: #000;
}

.member {
	position: absolute;
	top: 20px; right: 30px;
	width: auto; height: 30px;
	text-align: center;
	color: white;
	z-index: 100;
	border-radius: 5px;
	background-color: black;
	padding: 0px 20px;
}

.idLogin{
position: absolute;
top : 130px;
right : 30px;
color: white;
font-size: 15px;
border-radius: 10px;
/* background-color: #001659; */
/* background-color: #001659; */
background-color: black;
padding: 0px 20px;
font-weight: bolder;
text-shadow: 0 0 10px yellow;
}
</style>
</head>
<body>
	<div class="member">
		<a href="index.jsp">홈</a> | <a href="index.jsp?page=members/join">회원가입</a> | 
		<%
		String id = (String)session.getAttribute("id");
		if(id!=null){
			out.print("<a href='members/logout.jsp'>로그아웃</a> | <a href='index.jsp?page=members/bye'>회원탈퇴</a>");
		}
		else{
			out.print("<a href='index.jsp?page=members/login'>로그인</a>");
		}
		%>
	
	</div>
	<div id="ALL">
		<h1>Travel</h1>
		<div class="menu">
			<ul>
				
				<%
				String id1 = "";
				if(session.getAttribute("id")!=null){
					id1 = (String)session.getAttribute("id"); 
				}
				
			 	if(id1.equals("root")){
					out.print("<li><a href=index.jsp?page=haksainfo>학사소개</a></li>");
					out.print("<li><a href=index.jsp?page=board/boardList>커뮤니티</a></li>");
					out.print("<li><a href=index.jsp?page=members/memberList>회원목록보기</a></li>");
				} else if(!(id1.equals(""))){
					out.print("<li><a href=index.jsp?page=haksainfo>학사소개</a></li>");
					out.print("<li><a href=index.jsp?page=board/boardList>커뮤니티</a></li>");
					
				} else {
					out.print("<li><a href='index.jsp?page=members/login' onclick=alert('로그인하세요')>학사소개</a></li>");
					out.print("<li><a href='index.jsp?page=members/login' onclick=alert('로그인하세요')>커뮤니티</a></li>");
				}
				
				%>
				<!-- <li><a href="index.jsp?page=haksainfo">학사소개</a></li>
				<li><a href="index.jsp?page=boardList">커뮤니티</a></li>
				<li><a href='index.jsp?page=memberList'>회원목록보기</a></li>  -->
				
				<li><a href="#">KHB클래스</a></li>
				<li><a href="#">기타</a></li>
			</ul>
			<div class="idLogin">
				<%
				if (id1.equals("root")) {
					out.print("관리자님 환영합니다 ᰔ ᩚ");
				} else if (!(id1.equals(""))) {
					out.print(id + "님 환영합니다 ᰔ ᩚ");

				} else {

				}
				%>
			</div> 
		</div>
	</div>

	<script type="text/javascript">
		$(function() {

			$(".menu li a").wrapInner('<span class="out"></span>');

			$(".menu li a").each(
					function() {
						$('<span class="over">' + $(this).text() + '</span>')
								.appendTo(this);
					});

			$(".menu li a").hover(function() {
				$(".out", this).stop().animate({
					'top' : '45px'
				}, 200);
				$(".over", this).stop().animate({
					'top' : '0px'
				}, 200);

			}, function() {
				$(".out", this).stop().animate({
					'top' : '0px'
				}, 200);
				$(".over", this).stop().animate({
					'top' : '-45px'
				}, 200);
			});

		});
	</script>
</body>
</html>