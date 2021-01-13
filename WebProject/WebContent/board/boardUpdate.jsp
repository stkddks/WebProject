<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Travel</title>
</head>
<body>

	<%
	String searchTitle = request.getParameter("searchTitle"); 
	String no = request.getParameter("no"); 
	String title = request.getParameter("uptitle");
	String content = request.getParameter("upcontent");
	String author = request.getParameter("upauthor");
	String nal = request.getParameter("upnal");
	String readcount = request.getParameter("upreadcount"); 
	
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://bbr123.cafe24.com:3306/bbr123?serverTimezone=Asia/Seoul", "bbr123", "alstjr95!");
		//Connection conn = DriverManager.getConnection("jdbc:mysql://bbr123.cafe24.com:3306/bbr123?characterEncoding=utf8", "bbr123", "alstjr95!");
		//Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/bbr123", "bbr123", "alstjr95!");
		
		String sql = "update BoardA set title=?, content=?, author=?, nal=?, readcount=? where title=?";	

		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, title);
		pstmt.setString(2, content);
		pstmt.setString(3, author);
		pstmt.setString(4, nal);
		pstmt.setString(5, readcount); 
		pstmt.setString(6, searchTitle);
		int cnt = pstmt.executeUpdate();
	%>
	<%-- <%
		pstmt.close();
		conn.close();
	%> --%>
	<%response.sendRedirect("../index.jsp?page=board/boardList"); %>
</body>
</html>