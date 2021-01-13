<%@page import="javax.security.auth.login.LoginContext"%>
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
<script type="text/javascript"> 
function goPage() { location.href="login.jsp"; } 
</script>

 <%
        // 인코딩 처리
        request.setCharacterEncoding("euc-kr"); 
		String sessionString=null;
        // 로그인 화면에 입력된 아이디와 비밀번호를 가져온다
        String userId= request.getParameter("id");
        String userPw = request.getParameter("pw");
        
        // DB에서 아이디, 비밀번호 확인
       Class.forName("com.mysql.jdbc.Driver");
		//Connection conn = DriverManager.getConnection("jdbc:mysql://bbr123.cafe24.com:3306/bbr123?serverTimezone=Asia/Seoul","bbr123", "alstjr95!");
							//Connection conn = DriverManager.getConnection("jdbc:mysql://bbr123.cafe24.com:3306/bbr123?characterEncoding=utf8", "bbr123", "alstjr95!");
							Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/bbr123", "bbr123", "alstjr95!");

            String sql = "select id, pw from MemberA where id=? ";

            PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			/* pstmt.setString(2, userPw); */
			ResultSet rs = null;
			rs = pstmt.executeQuery();
			String id=null;
	        String pw=null;
	        
            while (rs.next()) {
               id = rs.getString("id");
               pw = rs.getString("pw");
            }
            if (!(userId.equals(id))) {			 // 아이디 틀렸을 때
               out.print("<script> alert('없는 아이디입니다. 회원이 아니시면 회원가입부터 해주세요.'); history.back(); </script>"); 
            } else if (userId.equals(id) && !(userPw.equals(pw))) {			// 비밀번호 틀렸을 때
               out.print("<script> alert('잘못된 비밀번호입니다.다시 확인해주세요.'); history.back(); </script>"); 
               /* out.print("<script> alert('비밀번호가 틀렸습니다'); location.href='index.jsp?page=login'; </script>");  */ 
            } else if (userId.equals(id) && userPw.equals(pw)) {
               out.print("환영합니다" + userId + "님!! 로그인되었습니다");
               session.setAttribute("id", userId);
               response.sendRedirect("../index.jsp?page=center");
            }
            
           /*  response.sendRedirect("index.jsp?page=center"); */
      
    %> 

</body>
</html>