<%@page import="member.MemberDTO"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
body {
	background-image: url(images/background.jpg);
	font-family: "맑은 고딕";
	font-size: 15px;
	color: white;
}

.title {
	font-size: 50px;
	text-shadow: 0 0 10px yellow;
	color: #fff;
	margin: 0 auto;
	text-align: center;
	text-transform: capitalize;
	font-family: "맑은 고딕";
	font-style: italic;
}

#wrap li {
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

.kh01 {
	width: 100%;
	height: 1000px;
}

.form {
	width: 498px;
	height: auto;
	border-radius: 25px;
	border: 5px double #999;
	margin: 30px auto;
}

.form2 {
	width: 380px;
	height: auto;
	margin: 80px auto;
	text-align: center;
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

.form5{
margin-top: 20px;
}

.clear {
	clear: both;
	margin: 5px;
}

input[type="submit"] {
	float: left;
	/*  display:block; */
	height: 40px;
	background: #FFBB00;
	border-radius: 5px;
	border: none;
	font-family: "맑은 고딕";
	margin-left: 20px;
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

table {
	border: 1px solid blue;
	border-collapse: collapse;
}

th {
	border: 1px solid blue;
	border-collapse: collapse;
	background-color: black;
	color: white;
	width: 300px
}

td {
	width: 4000px;
}
</style>
<meta charset="UTF-8">
<title>Travel</title>
</head>
<body>
	<form action="index.jsp" method="get">

		<div id="wrap">
			<h1 class="title">Member Search</h1>
			<div class="form">
				<div class="form2">
					<div class="form3">
						<%
							MemberDTO memberDTO = (MemberDTO) request.getAttribute("memberDTO");
						/* memberSearch.memberReadcount(memberDTO); */
						%>
						<table border="1" cellspacing="0" cellpadding="0">
							<tr>
								<th>아이디</th>
								<th>비번</th>
								<th>주소</th>
								<th>전화번호</th>
							</tr>
							<tr>
								<td><%=memberDTO.getId()%></td>
								<td><%=memberDTO.getPw()%></td>
								<td><%=memberDTO.getAddr()%></td>
								<td><%=memberDTO.getTel()%></td>
							</tr>
						</table>
					</div>
					<div class="form4">
						<input type="button" value="메인페이지"
							onclick='location.href="index.jsp"'>
						<input type="button" value="로그인하기"
							onclick='location.href="index.jsp?page=members/login"'>
						<input type="button" value="수정하기"
							onclick='location.href="index.jsp?page=members/memberUpdateForm"'>
						<!-- <a href="student.jsp"></a> <a href="studentList.jsp"></a> -->
					</div>
				</div>
			</div>
		</div>
	</form>
</body>
</html>