<%@page import="java.sql.PreparedStatement"%>
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
	font-family: "맑은 고딕";
	font-size: 15px;
	color: white;
}


#wrap {
	width: 600px;
	height: 500px;
	margin: 100px auto;
}
#wrap li {
	float: left;
	margin: 20px;
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
	width: 498px;
	height: 200px;
	border-radius: 25px;
	border: 5px double #999;
	margin: 30px auto;
}

.form2 {
	width: 380px;
	min-width: 320px;
	height: 100px;
	margin: 60px auto;
 text-align: center;
}

.form3 {
	float: center;
	/*   background:#f00;  */
}

.form3 label {
	width: 100px;
	height: 20px;
	/*  display: block; */
	float: left;
	text-align: center;
}

.form4 {
	/* padding: 0px 0px 0px 0px; */
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
	width: 100px;
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

<meta charset="UTF-8">
<title>Travel</title>
</head>
<body>

						<%
						String title = request.getParameter("title");
						String content = request.getParameter("content");
						String author =request.getParameter("author");
						String nal = request.getParameter("nal");
						String readcount = request.getParameter("readcount"); 

						%>
						제목 <%=title %> | 내용 <%=content %> | 작성자 <%=author %> | 날짜 <%=nal %> | 
						<%-- 조회수 <%=readcount %> --%>
						<%
						Class.forName("com.mysql.jdbc.Driver");
							Connection conn = DriverManager.getConnection("jdbc:mysql://bbr123.cafe24.com:3306/bbr123?serverTimezone=Asia/Seoul","bbr123", "alstjr95!");
							//Connection conn = DriverManager.getConnection("jdbc:mysql://bbr123.cafe24.com:3306/bbr123?characterEncoding=utf8", "bbr123", "alstjr95!");
							//Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/bbr123", "bbr123", "alstjr95!");

							String sql = "insert into BoardA(title,content,author,nal,readcount) values(?,?,?,?,?)";
							
							PreparedStatement pstmt = conn.prepareStatement(sql);
							
							pstmt.setString(1, title);
							pstmt.setString(2, content);
							pstmt.setString(3, author);
							pstmt.setString(4, nal);
							pstmt.setString(5, readcount); 

							int cnt = pstmt.executeUpdate();
						%>
						<br>
						<%-- <%=author%> 회원님의 글이 등록되었습니다 --%>
						<%
						pstmt.close();
						conn.close();
						%>
						<%response.sendRedirect("../index.jsp?page=board/boardList"); %>
						<br> <br>
					
</body>
</html>