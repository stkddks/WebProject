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
	String upsearchId = request.getParameter("searchId"); 
	String upid = request.getParameter("id");
	String uppw = request.getParameter("pw");
	String upaddress =request.getParameter("address");
	String uptel = request.getParameter("tel"); 
	
		Class.forName("com.mysql.jdbc.Driver");
		//Connection conn = DriverManager.getConnection("jdbc:mysql://bbr123.cafe24.com:3306/bbr123?serverTimezone=Asia/Seoul", "bbr123", "alstjr95!");
		//Connection conn = DriverManager.getConnection("jdbc:mysql://bbr123.cafe24.com:3306/bbr123?characterEncoding=utf8", "bbr123", "alstjr95!");
		Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/bbr123", "bbr123", "alstjr95!");
		
		String sql = "update MemberA set id=?,pw=?,addr=?,tel=? where id=?";	

		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, upid);
		pstmt.setString(2, uppw);
		pstmt.setString(3, upaddress);
		pstmt.setString(4, uptel);
		pstmt.setString(5, upsearchId); 
		int cnt = pstmt.executeUpdate();
	%>
	<%-- <%
		pstmt.close();
		conn.close();
	%> --%>
	<%response.sendRedirect("../index.jsp?page=members/memberList"); %>
</body>
</html>