<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
ResultSet rs = null;
String idSearch = request.getParameter("id");
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://bbr123.cafe24.com:3306/bbr123?serverTimezone=Asia/Seoul","bbr123", "alstjr95!");
//Connection conn = DriverManager.getConnection("jdbc:mysql://bbr123.cafe24.com:3306/bbr123?characterEncoding=utf8", "bbr123", "alstjr95!");
//Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/bbr123", "bbr123", "alstjr95!");
String sql="select id from MemberA where id=?";
PreparedStatement pstmt = conn.prepareStatement(sql);
pstmt.setString(1, idSearch);
rs = pstmt.executeQuery();
String id = null;

if (rs.next()) {
    id = rs.getString("id");
    if (id.equals(idSearch)) {
        out.print("아이디 사용 불가능");
    }
} else {
    out.print("아이디 사용 가능");
} 
%>

<input type="button" value="종료" onclick="self.close()">
</body>
</html>