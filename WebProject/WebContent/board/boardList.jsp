<%@page import="board.BoardDTO"%>
<%@page import="java.util.ArrayList"%>
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
								//ArrayList<BoardDTO> boardList=new ArrayList<BoardDTO>();
							ArrayList<BoardDTO> boardList = (ArrayList<BoardDTO>) request.getAttribute("boardList");
							//getParameter는 서브밋에서 폼에서 전송할때 받을때 쓰는 것이여
							//객체를 이름과 값으로 쌍으로 묶에서 값을 불러올때는 getAttribute를 쓴다
							// 페이지도 움직이면서 값도 보내줘야 할때는 getAttribute를 써야한다.
							//왜 ArrayList타입으로 바꿔줘야해? 형변환 왜해줘?
							for (int i = 0; i < boardList.size(); i++) {
								BoardDTO boardDTO = boardList.get(i);
								//boardDTO.setNo(no);
							%>
							<tr>
								<td><%=boardDTO.getNo()%></td>
								<td><%=boardDTO.getTitle()%></td>
								<td><%=boardDTO.getContent()%></td>
								<td><%=boardDTO.getAuthor()%></td>
								<td><%=boardDTO.getNal()%></td>
								<td><%=boardDTO.getReadcount()%></td>
								<td><a href="boardDelete.bo?no=<%=boardDTO.getNo()%>">삭제</a></td>
							</tr>
							<%
								}
							%>

						</table>
					</div>
					<div class="form4">
						<input type="button" value="글쓰기"
							onclick='location.href="index.jsp?page=board/boardWrite"'>
						<input type="button" value="검색하기"
							onclick='location.href="index.jsp?page=board/boardSearchForm"'>
						<input type="button" value="수정하기"
							onclick='location.href="index.jsp?page=board/boardUpdateForm"'>
						<input type="button" value="삭제하기"
							onclick='location.href="index.jsp?page=board/boardDeleteForm"'>
						<input type="button" value="메인페이지"
							onclick='location.href="index.jsp"'>
						<!-- <a href="student.jsp"></a> <a href="studentList.jsp"></a> -->
					</div>
				</div>
			</div>
		</div>
	</form>

</body>
</html>