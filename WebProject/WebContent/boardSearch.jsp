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

<meta charset="UTF-8">
<title>Travel</title>
</head>
<body>
	<!-- <form>
		<div id="wrap">
			<h1 class="member">member List</h1>
			<div class="form">
				<div class="form2">
					<div class="form3"> -->
					<%
					request.setCharacterEncoding("utf-8");
					response.setContentType("text/html;charset=utf-8");
					
					%>
						<%
						String searchTitle = request.getParameter("title");
						Class.forName("com.mysql.jdbc.Driver");
						//Connection conn = DriverManager.getConnection("jdbc:mysql://bbr123.cafe24.com:3306/bbr123?serverTimezone=Asia/Seoul", "bbr123", "alstjr95!");
						//Connection conn = DriverManager.getConnection("jdbc:mysql://bbr123.cafe24.com:3306/bbr123?characterEncoding=utf8", "bbr123", "alstjr95!");
						Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/bbr123", "bbr123", "alstjr95!");
						
						String sql = "select * from BoardA where title=?";
						PreparedStatement pstmt = conn.prepareStatement(sql);
						pstmt.setString(1, searchTitle);
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
						}
						%>
						<jsp:forward page='<%=request.getParameter("boardTest") %>'>
						<jsp:param value="<%=no %>" name="no"/>
						<jsp:param value="<%=title %>" name="title"/>
						<jsp:param value="<%=content %>" name="content"/>
						<jsp:param value="<%=author %>" name="author"/>
						<jsp:param value="<%=nal%>" name="nal"/>
						<jsp:param value="<%=readcount%>" name="readcount"/>
						</jsp:forward>
						
					
				
		<%-- <%
		pstmt.close();
		rs.close();
		conn.close();
		%> --%>
	
</body>
</html>