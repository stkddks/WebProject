<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<style>
.member {
	font-size: 50px;
	text-shadow: 0 0 10px yellow;
	color: #fff;
	margin: 0 auto;
	text-align: center;
	text-transform: capitalize;
	font-family: "맑은 고딕";
	font-style: italic;
}

body {
	background-image: url(images/background.jpg);
	font-family: "맑은 고딕";
	font-size: 15px;
	color: white;
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
#wrap {
	width: 600px;
	height: 500px;
	margin: 100px auto;
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

.member11 {
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
.kh01{
width: 100%;
height: 1000px;

}

.form {
	width: 498px;
	height: 300px;
	border-radius: 25px;
	border: 5px double #999;
	margin: 30px auto;
}

.form2 {
	width: 350px;
	min-width: 320px;
	height: 200px;
	margin: 60px auto;
}

.form3 {
	float: left;
	/*   background:#f00;  */
}

.form3 label {
	width: 100px;
	height: 20px;
	/*  display: block; */
	float: left;
}

.form4 {
	padding: 0px 10px;
}

.clear {
	clear: both;
}

input[type="submit"] {
	float: left;
	/*  display:block; */
	width: 50px;
	height: 50px;
	background: #FFBB00;
	border-radius: 5px;
	border: none;
	font-family: "맑은 고딕";
	margin-left: 10px;
	text-align: center;
}

input[type="button"] {
	width: 45%;
	height: 30px;
	background: skyblue;
	border-radius: 5px;
	/*  width: 140px; */
	font-family: "맑은 고딕";
	margin-top: 10px;
	
}

input[type="checkbox"] {
	margin-top: 20px;
}
</style>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="index.jsp" method="get">
	<div class="member11">
		<a href="index.jsp">홈</a> | <a href="#">회원가입</a> | <a href="#">로그인</a>
	</div>
	<div class="maintitle">
		<ul id="navbar">
			<li><a href="haksainfo.jsp">학사소개 | </a></li>
			<li><a href="#">커뮤니티 | </a></li>
			<li><a href="#">모집과정 | </a></li>
			<li><a href="#">KHB클래스 | </a></li>
		</ul>
	</div>
		<div id="wrap">
			<h1 class="member">member login</h1>
			<div class="form">
				<div class="form2">
					<div class="form3">
						<label for="user">아이디</label><input type="text" id="user">
						<div class="clear"></div>
						<label for="user">비밀번호</label><input type="password" id="user">
					</div>
					<input type="submit" value="로그인">
					<div class="clear"></div>
					<div class="form4">
						<!-- <label><input type="checkbox">아이디저장</label> 
						<label><input type="checkbox">보안접속</label> -->
						<div class="clear"></div>
						<label><input type="button" value="회원가입"></label> 
						&nbsp; &nbsp;
						<label><input type="button" value="아이디찾기"></label>
					</div>
				</div>
			</div>
		</div>
	</form>
</body>
</html>