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
	width: 45%;
	height: 30px;
	background: skyblue;
	border-radius: 5px;
	/*  width: 140px; */
	font-family: "맑은 고딕";
	margin-top: 20px;
	margin-left: 10px;
}

input[type="button"] {
	width: 45%;
	height: 30px;
	background: skyblue;
	border-radius: 5px;
	/*  width: 140px; */
	font-family: "맑은 고딕";
	margin-top: 20px;
	margin-left: 10px;
}
input[type="checkbox"] {
	margin-top: 20px;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%

/* if (session!=null) {
   System.out.print("로그인중입니다 ");
   continue;
} */
String id = request.getParameter("id");
String pw = request.getParameter("pw");
String address =request.getParameter("address");
String tel = request.getParameter("tel");


Class.forName("com.mysql.jdbc.Driver");
//Connection conn = DriverManager.getConnection("jdbc:mysql://bbr123.cafe24.com:3306/bbr123?serverTimezone=Asia/Seoul","bbr123", "alstjr95!");
//Connection conn = DriverManager.getConnection("jdbc:mysql://bbr123.cafe24.com:3306/bbr123?characterEncoding=utf8", "bbr123", "alstjr95!");
Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/bbr123?serverTimezone=Asia/Seoul","bbr123", "alstjr95!");
String sql = "insert into MemberA (id, pw, addr ,tel)values(?,?,?,?)";

PreparedStatement pstmt = conn.prepareStatement(sql);

pstmt.setString(1, id);
pstmt.setString(2, pw);
pstmt.setString(3, address);
pstmt.setString(4, tel);

int cnt = pstmt.executeUpdate();

pstmt.close();
conn.close();
%>
<%-- 
<%response.sendRedirect("index.jsp?page=login");  %> --%>
<script type="text/javascript">
 var result = confirm("회원가입이 완료되었습니다.로그인하시겠습니까?");

if(result)
{
	location.href="../index.jsp?page=members/login"
}
else
{
	alert("메인페이지로 돌아갑니다")
	location.href="../index.jsp"
}
 

/* function doPopupopen() {
	window.open('login.jsp', 'popup01', 'width=300, height=400, scrollbars= 0, toolbar=0, menubar=no');
} */
</script>

 <form action="login.jsp" method="get">
		<input type="hidden" name="readcount" value="0">
		<div id="wrap">
			<h1 class="title">Member Register</h1>
			<div class="form">
				<div class="form2">
					<%=id%> 회원님이 등록되었습니다. 환영합니다 :)
					<div class="clear"></div>
					<div class="form4">
						<!-- <input type="button" value="로그인하기" onclick="window.open('login.jsp', 'popup01', 'width=300, height=400, scrollbars= 0, toolbar=0, menubar=no');"> -->
					<input type="button" value="로그인하기">
					<input type="submit" value="메인페이지">
						<!-- <a href="student.jsp"></a> <a href="studentList.jsp"></a> -->
					</div>
				</div>
			</div>
		</div>
	</form> 
</body>
</html>