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
	background-image: url(images/background.jpg);
	font-family: Arial, sans-serif;
	/* font-family: "맑은 고딕"; */
	font-size: 15px;
	
	color: white;
}


#wrap {
	width: 600px;
	height: 500px;
	margin: 50px auto;
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
	margin: 30px auto;
}

.form2 {
	width: 500px;
	/* min-width: 320px; */
	height: auto;
	margin: 20px auto;
}

.form3 {
	margin: 0px; auto;
	padding: 0px 0px;
	text-align: center;
	/*   background:#f00;  */
}
.form3 li {
	float: left;
	margin: 20px;
}
.form3 label {
	width: 100px;
	height: 20px;
	/*  display: block; */
	float: center;
}

.form4 {
	padding: 20px 5px;
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
	width: 19%;
	height: 30px;
	background: skyblue;
	border-radius: 5px;
	/*  width: 140px; */
	font-family: "맑은 고딕";
	margin-top: 20px;
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
td{
width: 4000px;
}
</style>
<meta charset="UTF-8">
<title>Travel</title>
</head>
<body>
	<form action="index.jsp" method="get">

		<div id="wrap">
			<h1 class="title">Board List</h1>
			<div class="form">
				<div class="form2">
					<div class="form3">
						<table border="1" cellspacing="0" cellpadding="0">
							<tr>
								<th>번호</th>
								<th>제목</th>
								<th>내용</th>
								<th>작성자</th>
								<th>날짜</th>
								<th>조회수</th>
							</tr>
							<%
								Class.forName("com.mysql.jdbc.Driver");
								Connection conn = DriverManager.getConnection("jdbc:mysql://bbr123.cafe24.com:3306/bbr123?serverTimezone=Asia/Seoul", "bbr123", "alstjr95!");
								//Connection conn = DriverManager.getConnection("jdbc:mysql://bbr123.cafe24.com:3306/bbr123?characterEncoding=utf8", "bbr123", "alstjr95!");
								//Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/bbr123", "bbr123", "alstjr95!");
								

								String sql = "select * from BoardA";
								PreparedStatement pstmt = conn.prepareStatement(sql);

								ResultSet rs = pstmt.executeQuery();
								int no = 0;
								String title = null;
								String content = null;
								String author = null;
								String nal = null;
								int readcount = 0;
								while (rs.next()) {
									no = rs.getInt("no");
									title = rs.getString("title");
									content = rs.getString("content");
									author = rs.getString("author");
									nal = rs.getString("nal");
									readcount = rs.getInt("readcount");
									out.print("<tr><td>" + no + "</td><td>" + title + "</td><td>" + content + "</td><td>" + author
											+ "</td><td>" + nal + "</td><td>" + readcount + "</td></tr>");

								}
							%>
						</table>
					</div>
					<div class="form4">
					<input type="button" value="글쓰기" onclick='location.href="index.jsp?page=board/boardWrite"'>
					<input type="button" value="검색하기" onclick='location.href="index.jsp?page=boardSearchForm"'>
					<input type="button" value="수정하기" onclick='location.href="index.jsp?page=board/boardUpdateForm"'>
					<input type="button" value="삭제하기" onclick='location.href="index.jsp?page=board/boardDeleteForm"'>
						<input type="button" value="메인페이지" onclick='location.href="index.jsp"'>
						<!-- <a href="student.jsp"></a> <a href="studentList.jsp"></a> -->
					</div>
				</div>
			</div>
		</div>
	</form>

</body>
</html>