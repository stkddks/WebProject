<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>

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
	background-image: url(../images/camera.jpg);
	z-index: 10;
}
.kh01{
width: 100%;
height: 1000px;

}

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


.form {
	width: auto;
	height: auto;
	border-radius: 25px;
	border: 5px double #999;
	margin: 30px auto;
}

.form2 {
	width: 380px;
	/* min-width: 320px; */
	height: auto;
	margin: 20px auto;
	
}

.form3 {
	margin: 0px; auto;
	padding: 0px 10px;
	text-align: center;
	/*   background:#f00;  */
}

.form3 label {
	width: 100px;
	height: 20px;
	/*  display: block; */
	float: center;
}

.form4 {
	padding: 20px 50px;
	float: center;
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
table{
border: 1px solid blue;
border-collapse: collapse;
}
th{
border: 1px solid blue;
border-collapse: collapse;
background-color: black;
color: white;
width: 300px

}

</style>
<meta charset="UTF-8">
<title>Travel</title>
</head>
<body>
	<form action="../index.jsp" method="get">
	<div class="member11">
		<a href="../index.jsp">홈</a> | <a href="#">회원가입</a> | <a href="#">로그인</a>
	</div>
	<div class="maintitle">
		<ul id="navbar">
			<li><a href="../haksainfo.jsp">학사소개 | </a></li>
			<li><a href="#">커뮤니티 | </a></li>
			<li><a href="#">모집과정 | </a></li>
			<li><a href="#">KHB클래스 | </a></li>
		</ul>
	</div>
	
		<div id="wrap">
			<h1 class="member">member List</h1>
			<div class="form">
				<div class="form2">
					<div class="form3">
					<table border="1" cellspacing="0" cellpadding="0">
					<tr>
					<th>번호</th>
					<th>이름</th>
					<th>나이</th>
					<th>과목</th>
					</tr>
						<%
							Class.forName("com.mysql.jdbc.Driver");
							//Connection conn = DriverManager.getConnection("jdbc:mysql://bbr123.cafe24.com:3306/bbr123?serverTimezone=Asia/Seoul", "bbr123", "alstjr95!");
							Connection conn = DriverManager.getConnection("jdbc:mysql://bbr123.cafe24.com:3306/bbr123?characterEncoding=utf8", "bbr123", "alstjr95!");
							//Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/bbr123", "bbr123", "alstjr95!");
							
							//Statement stmt = conn.createStatement();
							//String sql = "select * from ProfessorA";
							//ResultSet rs = stmt.executeQuery(sql);

							String sql = "select * from ProfessorA";
							PreparedStatement pstmt = conn.prepareStatement(sql);
						
							ResultSet rs = pstmt.executeQuery();
							
							while (rs.next()) {
								int no = rs.getInt("no");
								String name = rs.getString("name");
								String age = rs.getString("age");
								String subject = rs.getString("subject");
								out.print("<tr><td>" + no + "</td>"+"<td>" + name + "</td>"+"<td>" + age + "</td>"+"<td>" + subject + "</td></tr>");
							}
							pstmt.close();
							conn.close();
						%>
						
						</table>
						</div>
						<div class="form4">
						<input type="button" value="메인페이지" onclick='location.href="../index.jsp"'>
						<!-- <a href="student.jsp"></a> <a href="studentList.jsp"></a> -->
					</div>
				</div>
			</div>
		</div>
	</form>

</body>
</html>