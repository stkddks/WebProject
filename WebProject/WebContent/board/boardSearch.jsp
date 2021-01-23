<%@page import="board.BoardDTO"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="boardSearch" class="board.BoardDAO" scope="page" />
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Travel</title>
</head>
<body>

	<%
		BoardDTO boardDTO = (BoardDTO) request.getAttribute("boardDTO");
		boardSearch.boardReadcount(boardDTO);
	%>
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

	
	<%-- <jsp:forward page='<%=request.getParameter("boardTest")%>'>
		<jsp:param value="<%=no%>" name="no" />
		<jsp:param value="<%=title%>" name="title" />
		<jsp:param value="<%=content%>" name="content" />
		<jsp:param value="<%=author%>" name="author" />
		<jsp:param value="<%=nal%>" name="nal" />
		<jsp:param value="<%=readcount%>" name="readcount" />
	</jsp:forward> --%>



	<%-- <%
		pstmt.close();
		rs.close();
		conn.close();
		%> --%>

</body>
</html>