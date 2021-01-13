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
						String searchId = request.getParameter("id");
						Class.forName("com.mysql.jdbc.Driver");
						//Connection conn = DriverManager.getConnection("jdbc:mysql://bbr123.cafe24.com:3306/bbr123?serverTimezone=Asia/Seoul", "bbr123", "alstjr95!");
						//Connection conn = DriverManager.getConnection("jdbc:mysql://bbr123.cafe24.com:3306/bbr123?characterEncoding=utf8", "bbr123", "alstjr95!");
						Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/bbr123", "bbr123", "alstjr95!");
						
						String sql = "select * from MemberA where id=?";
						PreparedStatement pstmt = conn.prepareStatement(sql);
						pstmt.setString(1, searchId);
						ResultSet rs = pstmt.executeQuery();
						

						String id = null;
						String pw = null;
						String address = null;
						String tel = null;
						
						while (rs.next()) {
							id = rs.getString("id");
					    	pw = rs.getString("pw");
					    	address = rs.getString("addr");
					    	tel = rs.getString("tel");
							out.print("<tr><td>" + id + "</td><td>" + pw + "</td><td>" + address + "</td><td>" + tel + "</td></tr>");
						}
						%>
						<jsp:forward page='<%=request.getParameter("memberTest") %>'>
						<jsp:param value="<%=id %>" name="id"/>
						<jsp:param value="<%=pw %>" name="pw"/>
						<jsp:param value="<%=address %>" name="address"/>
						<jsp:param value="<%=tel %>" name="tel"/>
						</jsp:forward>
						
					
				
		<%-- <%
		pstmt.close();
		rs.close();
		conn.close();
		%> --%>
	
</body>
</html>