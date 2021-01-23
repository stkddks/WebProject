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
	background-image: url(../images/background.jpg);
	font-family: "맑은 고딕";
	font-size: 15px;
	color: white;
}
ul{
list-style-type: none;
}
.form4 li {
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
	margin: 100px auto auto auto;
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
	background-image: url(../images/camera.jpg);
	z-index: 10;
}

.kh01 {
	width: 100%;
	height: 1000px;
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

.form {

	width: auto;
    height: auto;
	border-radius: 25px;
	border: 5px double #999;
	margin: 30px auto auto auto;
}

.form2 {
	width: 500px;
	/* min-width: 320px; */
	height: auto;
	margin: auto auto;
	text-align: center;
}

.form3 {
	margin: 0px; auto;
	padding: 0px 0px;
	text-align: center;
	/*   background:#f00;  */
}

.form3 label {
	width: 100px;
	height: 20px;
	/*  display: block; */
	float: left;
}

.form4 {
	padding: 20px 0px 20px 50px;
 float: left;
 width: 100%;
	/* align-content: center;
	float: center; */
}
.form4 label {
 width: 100px;
 height: 20px;
 /*  display: block; */
 float: left;
 margin: 0px 0px 0px 0px;
}

.clear {
	clear: both;
	margin: 5px;
}

input[type="submit"] {
	width: 100%;
	height: 30px;
	background: skyblue;
	border-radius: 5px;
	/*  width: 140px; */
	font-family: "맑은 고딕";
	margin: 10px 0px 30px;
}
input[type="button"] {
	width: 100%;
	height: 30px;
	background: skyblue;
	border-radius: 5px;
	/*  width: 140px; */
	font-family: "맑은 고딕";
	margin-top: 20px;
	
}

input[type="checkbox"] {
	margin-top: 20px;
}

table {
	border: 1px solid blue;
	border-collapse: collapse;
	margin: 0 10px;
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
	<form action="memberUpdateFinal.mb" method="get">
		
		<div id="wrap">
			<h1 class="title">member update</h1>
			<div class="form">
				<div class="form2">
					<div class="form3">
					<%
							MemberDTO memberDTO = (MemberDTO) request.getAttribute("memberDTO");
						/* memberSearch.memberReadcount(memberDTO); */
						%>
						<h1>최종 변경하기 전 내용입니다</h1>
						<hr>
						<br>
						<table border="1" cellspacing="0" cellpadding="0">
							<tr>
								<th>아이디</th>
								<th>비밀번호</th>
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
						<br>
						<hr>
						<br> <br>
					</div>
					<div class="form4">
						
						<label for="user">아이디</label><input type="text" size="30" name="id" id="user" required="required" autofocus="autofocus" placeholder="변경할 아이디 입력">
      					<input type="hidden" name="searchId" value="<%=memberDTO.getId()%>">
      					<div class="clear"></div>
      					<label for="user">비밀번호</label><input type="password" size="30" name="pw" id="user">
      					<div class="clear"></div>
      					<label for="user">주소</label><input type="text" name="addr" size="30" id="user">
      					<div class="clear"></div>
      					<label for="user">전화번호</label><input type="tel" name="tel" size="30" id="user">
      					<div class="clear"></div>
								<!-- <input type="date" name="nal"> -->
					</div>
					<input type="submit" value="수정하기">

					<!-- <input type="submit" value="삭제하기" onClick="location.href='studentList.jsp'" > -->
				</div>
			</div>
		</div>
	</form>

</body>
</html>