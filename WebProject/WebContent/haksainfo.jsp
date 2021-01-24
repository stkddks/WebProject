<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="js/jquery-1.10.2.js"></script>
<script src="js/jquery.effects.core.js"></script>
<link href="css/haksainfo.css" rel="stylesheet">
<meta charset="UTF-8">
<title>Travel</title>
</head>
<body>
	<div id="menu">
		<div class="item daegu1">
			<img src="images/Apple.png" title="" class="circle" /> <a href="#"
				class="icon"></a>
			<h2>register</h2>
			<ul>
				<li><a href="student/register_form.jsp">Student</a></li>
				<li><a href="professor/register_form1.jsp">Professor</a></li>
				<li><a href="manager/register_form2.jsp">Manager</a></li>
			</ul>
		</div>
		<div class="item daegu2">
			<img src="images/Apple.png" title="" class="circle" /> <a href="#"
				class="icon"></a>
			<h2>search</h2>
			<ul>
				<li><a href="student/search_form.jsp">Student</a></li>
				<li><a href="professor/search_form1.jsp">Professor</a></li>
				<li><a href="manager/search_form2.jsp">Manager</a></li>
			</ul>
		</div>
		<div class="item daegu3">
			<img src="images/Apple.png" title="" class="circle" /> <a href="#"
				class="icon"></a>
			<h2>delete</h2>
			<ul>
				<li><a href="student/delete_form.jsp">Student</a></li>
				<li><a href="professor/delete_form1.jsp">Professor</a></li>
				<li><a href="manager/delete_form2.jsp">Manager</a></li>
			</ul>
		</div>
		<div class="item daegu4">
			<img src="images/Apple.png" title="" class="circle" /> <a href="#"
				class="icon"></a>
			<h2>list</h2>
			<ul>
				<li><a href="studentList.do">Student</a></li>
				<li><a href="professor/professorList.jsp">Professor</a></li>
				<li><a href="manager/managerList.jsp">Manager</a></li>
				<li><a href="index.jsp?page=board/boardList">BoardList</a></li>
			</ul>
		</div>
		<div class="item daegu5">
			<img src="images/Apple.png" title="" class="circle" /> <a href="#"
				class="icon"></a>
			<h2>update</h2>
			<ul>
				<li><a href="student/update_form.jsp">Student</a></li>
				<li><a href="professor/update_form1.jsp">Professor</a></li>
				<li><a href="manager/update_form2.jsp">Manager</a></li>
			</ul>
		</div>
	</div>
	<script src="js/haksainfo.js"></script>
</body>
</html>