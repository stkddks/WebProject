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
		String name = request.getParameter("name");
		String age = request.getParameter("age");
		String hakbun = request.getParameter("hakbun");
		String updateName = request.getParameter("updateName");

		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://bbr123.cafe24.com:3306/bbr123?serverTimezone=Asia/Seoul", "bbr123", "alstjr95!");
		//Connection conn = DriverManager.getConnection("jdbc:mysql://bbr123.cafe24.com:3306/bbr123?characterEncoding=utf8", "bbr123", "alstjr95!");
		//Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/bbr123", "bbr123", "alstjr95!");
		
		//Statement stmt = conn.createStatement();
		//String sql = "update StudentA set name='" + name + "', age= '" + age + "', hakbun='" + hakbun + "' where name='" + updateName + "'";

		String sql = "update StudentA set name=?, age=?, hakbun=? where name=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, name);
		pstmt.setString(2, age);
		pstmt.setString(3, hakbun);
		pstmt.setString(4, updateName);
		int cnt = pstmt.executeUpdate();
	%>

	<%
		pstmt.close();
		conn.close();
	%>
	<%
		response.sendRedirect("studentList.jsp");
	%>


</body>
</html>