<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.title {
 font-size: 50px;
	text-shadow: 0 0 10px yellow;
	color: #fff;
	margin: 0 auto;
	text-align: center;
	text-transform: capitalize;
	font-family: "맑은 고딕";
	font-style: italic;
}

body {
 font-family: "맑은 고딕";
 font-size: 15px;
}


.form {
 width: 498px;
 height: auto;
 border-radius: 25px;
 border: 5px double #999;
 margin: 30px auto;
}

.form2 {
 width: auto;
	min-width: auto;
	height: auto;
	padding: 50px 50px;
	align-content: center;
	float: center;
}

.form3 {
padding: 20px 0px 20px 15px;
 float: left;
}

.form3 label {
 width: 100px;
 height: 20px;
 /*  display: block; */
 float: left;
 margin: 0px 0px 10px 0px;
}

.form4 {

}
.form4 label{
padding: 0px 30px;
text-align: center;

}

#wrap {
 width: 600px;
 height: 500px;
 margin: 0 auto;
 color: white;
}

.clear {
 clear: both;
}

input[type="submit"] {
	float: right;
	/*  display:block; */
	height: 70px;
	background: #FFBB00;
	border-radius: 5px;
	border: none;
	font-family: "맑은 고딕";
	margin-right: 20px;
	margin-top: 18px;
}

input[type="button"] {
	width: 46%;
	height: 30px;
	background: skyblue;
	border-radius: 5px;
	/*  width: 140px; */
	font-family: "맑은 고딕";
	margin-top: 20px;
	margin-left: 10px;
	
}
input[type="checkbox"] {
 margin-top:20px;
}


</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="members/loginProcess.jsp">
  <div id="wrap">
   <h1 class="title">member login</h1>
   <div class="form">
    <div class="form2">
     <div class="form3">
      <label for="user">아이디</label><input type="text" name="id" id="user">
      <div class="clear"></div>
      <label for="user">비밀번호</label><input type="password" name="pw" id="user">
      <div class="clear"></div>
    
     </div>
     <input type="submit" value="로그인하기">
     <div class="clear"></div>
     <div class="form4">
      <label><input type="checkbox">아이디저장</label> <label><input
       type="checkbox">보안접속</label>
      <div class="clear"></div>
      <input type="button" value="회원가입"> 
      <input type="button" value="아이디/비밀번호 찾기">
     </div>
    </div>
   </div>
  </div>
 </form>

</body>
</html>