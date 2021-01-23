<%@page import="board.BoardDTO"%>
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
	height: 2000px;
}

ul {
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
	/* width: auto;*/
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
	text-align: left;
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
	padding: 0px 10px 0px 0px;
	/* align-content: center;
	float: center; */
}

.form4 li {
	float: left;
	margin: 10px 10px;
}

.form4 label {
	color: white;
	text-align: left;
	margin-right: 10px;
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
	margin-top: 20px;
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
<%
BoardDTO boardDTO = (BoardDTO) request.getAttribute("boardDTO");
%>
	<form action="boardUpdateFinal.bo" method="get">

		<div id="wrap">
			<h1 class="title">member update</h1>
			<div class="form">
				<div class="form2">
					<div class="form3">
						<h1>최종 변경하기 전 내용입니다</h1>
						<hr>
						<br>
						<table border="1" cellspacing="0" cellpadding="0">
							<tr>
								<th>번호</th>
								<th>제목</th>
								<th>내용</th>
								<th>작성자</th>
								<th>날짜</th>
								<th>조회수</th>
							</tr>
							<tr>
								<td><%=boardDTO.getNo()%></td>
								<td><%=boardDTO.getTitle()%></td>
								<td><%=boardDTO.getContent()%></td>
								<td><%=boardDTO.getAuthor()%></td>
								<td><%=boardDTO.getNal()%></td>
								<td><%=boardDTO.getReadcount()%></td>
							</tr>
						</table>
						<br>
						<hr>
						<br>
					</div>
					<div class="form4">
						<ul>
							<li>
							<label for="번호">번호&nbsp;&nbsp;&nbsp;</label> 
							<input type="number" name="no" readonly="readonly" value="<%=boardDTO.getNo()%>"> 
							</li>
							<li>
							<label for="제목" class="content">제목&nbsp;&nbsp;&nbsp;</label>
								<input type="text" name="uptitle" autofocus="autofocus" required="required" placeholder="제목을 입력하세요" size="47" maxlength="100"> 
								<input type="hidden" name="searchTitle" value="<%=boardDTO.getTitle()%>">
								</li>
							<li>
							<label for="내용" class="content1">내용&nbsp;&nbsp;&nbsp;</label>
								<textarea rows="20" cols="40" name="upcontent" placeholder="내용을입력해주세요" class="content2"></textarea></li>
							<li>
							<label for="작성자" class="content2">작성자</label> 
							<input type="text" name="upauthor" size="47" placeholder="작성자입력">
							</li>
							<li>
							<label for="날짜" class="content3">날 &nbsp;&nbsp;짜</label>
								<input type="text" name="upnal" size="18"> <!-- <input type="date" name="nal"> -->
							</li>
							<li>
							<label for="조회수">조회수</label> 
							<input type="number" name="upreadcount" size="15" placeholder="변경할 조회수를 입력해 주세요">
							</li>
						</ul>
						<!-- <input type="date" name="nal"> -->
					</div>
					<input type="submit" value="수정하기"><br> <br> <br>

					<!-- <input type="submit" value="삭제하기" onClick="location.href='studentList.jsp'" > -->
				</div>
			</div>
		</div>
	</form>

</body>
</html>