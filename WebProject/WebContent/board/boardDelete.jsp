<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>KHJSP</title>
</head>
<body>
<%
   String deleteTitle = request.getParameter("title");
   
   Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://bbr123.cafe24.com:3306/bbr123?serverTimezone=Asia/Seoul", "bbr123", "alstjr95!");
	//Connection conn = DriverManager.getConnection("jdbc:mysql://bbr123.cafe24.com:3306/bbr123?characterEncoding=utf8", "bbr123", "alstjr95!");
	//Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/bbr123", "bbr123", "alstjr95!");
	
String sql = "delete from BoardA where title=?";
PreparedStatement pstmt = conn.prepareStatement(sql);
pstmt.setString(1, deleteTitle);
int cnt=pstmt.executeUpdate();
%>
<%=cnt %>건 게시글이 삭제되었습니다.
<%response.sendRedirect("../index.jsp?page=boardList"); %>


</body>
</html>