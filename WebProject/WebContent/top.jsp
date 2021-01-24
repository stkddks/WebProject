<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Trable</title>
<script type="text/javascript" src="js/jquery-1.10.2.js"></script>
<link href="css/top.css" rel="stylesheet">
</head>
<body>
	<div class="member">
		<a href="index.jsp">홈</a> | <a href="index.jsp?page=members/join">회원가입</a> |
		<%
			String id = (String) session.getAttribute("id");
			if (id != null) {
			//out.print("<a href='members/logout.jsp'>로그아웃</a> | <a href='index.jsp?page=members/bye'>회원탈퇴</a>");
			out.print("<a href='memberLogout.mb'>로그아웃</a> | <a href='index.jsp?page=members/bye'>회원탈퇴</a>");
			} else {
			out.print("<a href='index.jsp?page=members/login'>로그인</a>");
			}
		%>
	</div>
	<div id="ALL">
		<h1>Travel</h1>
		<div class="menu">
			<ul>

				<%
					String id1 = "";
				if (session.getAttribute("id") != null) {
					id1 = (String) session.getAttribute("id");
				}
				if (id1.equals("root")) {
					out.print("<li><a href=index.jsp?page=haksainfo>학사소개</a></li>");
					out.print("<li><a href=boardList.bo>커뮤니티</a></li>");
					out.print("<li><a href=memberList.mb>회원목록보기</a></li>");
				} else if (!(id1.equals(""))) {
					out.print("<li><a href=index.jsp?page=haksainfo>학사소개</a></li>");
					out.print("<li><a href=boardList.bo>커뮤니티</a></li>");

				} else {
					out.print("<li><a href='index.jsp?page=members/login' onclick=alert('로그인하세요')>학사소개</a></li>");
					out.print("<li><a href='index.jsp?page=members/login' onclick=alert('로그인하세요')>커뮤니티</a></li>");
				}
				%>
				<!-- <li><a href="index.jsp?page=haksainfo">학사소개</a></li>
				<li><a href="index.jsp?page=boardList">커뮤니티</a></li>
				<li><a href='index.jsp?page=memberList'>회원목록보기</a></li>  -->
				<li><a href="mail/mailForm.jsp">자바메일</a></li>
				<li><a href="#">KHB클래스</a></li>
				<li><a href="#">기타</a></li>
			</ul>
			<div class="idLogin">
				<%
					if (id1.equals("root")) {
					out.print("관리자님 환영합니다 ᰔ ᩚ");
				} else if (!(id1.equals(""))) {
					out.print(id + "님 환영합니다 ᰔ ᩚ");

				} else {

				}
				%>
			</div>
		</div>
	</div>
	<script src="js/top.js"></script>
</body>
</html>