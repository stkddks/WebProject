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
<title>KHJSP</title>
</head>
<body>

   <%
      String idSearch = request.getParameter("id");
      Class.forName("com.mysql.jdbc.Driver");

      Connection conn = DriverManager.getConnection(
            "jdbc:mysql://bbr123.cafe24.com:3306/bbr123?characterEncoding=utf8", "bbr123", "alstjr95!");

      String sql = "select id,pw,addr,tel from memberSeop where id=?";
      PreparedStatement pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, idSearch);
      ResultSet rs = null;
      rs = pstmt.executeQuery();

      String id = null;
      String pw = null;
      String addr = null;
      String tel = null;

      while (rs.next()) {
         id = rs.getString("id");
         pw = rs.getString("pw");
         addr = rs.getString("addr");
         tel = rs.getString("tel");
      }
      out.print("변경 전 정보 입니다<br>");
      out.print("아이디 : " + id + " 비밀번호 : " + pw + " 주소 : " + addr + " 연락처 : " + tel);
   %>
   <form accept="" method="get"></form>
   <ul>
      <li><label for="아이디">아이디</label> <input type="text" name="id"
         required="required" autofocus="autofocus" placeholder="변경할 아이디 입력"></li>

      <li><label for="비밀번호">비밀번호</label> <input type="password"
         name="pw" placeholder="변경할 비밀번호 입력"></li>

      <li><label for="주소">주소</label> <input type="text" name="addr"
         placeholder="변경할 주소 입력"></li>

      <li><label for="연락처">연락처</label> <input type="text" name="tel"
         placeholder="변경할 연락처 입력"></li>
   </ul>
</body>
</html>