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
	min-width: 320px;
	height: auto;
	padding: 40px 40px;
	align-content: center;
	float: center;
}

.form3 {
padding: 20px 0px 20px 30px;
 float: left;
}


.form3 label {
 width: 100px;
 height: 20px;
 /*  display: block; */
 float: left;
 margin: 0px 0px 5px 0px;
}


.form4 {
padding: 0px 30px;
}
.form4 label{
padding: 20px 30px;

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
	float: left;
	/*  display:block; */
	height: 100px;
	background: #FFBB00;
	border-radius: 5px;
	border: none;
	font-family: "맑은 고딕";
	margin-left: 20px;
	margin-top: 18px;
}

input[type="button"] {
	width: 45%;
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

<script type="text/javascript">
  /*  function win01(idform){
	   //document.write(idform.id.value);
      window.open("idcheckall.jsp?id="+idform.id.value,"win01","width=250 height=250");
   } */
   function idcheck() {
	      var id = $('#id').val();
	      if (id == "") {
	         alert('아이디를 입력해주세요.');
	      } else if (id == " ") {
	         //alert('아이디를 입력해주세요.');
	         return false;
	      } else {
	         window.open("idCheckAll.jsp?id=" + id, "idcheck",
	               "width=400 height=500");
	      }
	      //alert(id);
	   }
   
</script>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="joinProcess.jsp">
  <div id="wrap">
   <h1 class="title">member login</h1>
   <div class="form">
    <div class="form2">
     <div class="form3">
      <label for="user">아이디</label>
      <input type="text" name="id" id="user">
      <input type="button" value="아이디중복확인" onclick="idcheck()">
      <div class="clear"></div>
      <label for="user">비밀번호</label><input type="password" name="pw" id="user">
      <div class="clear"></div>
      <label for="user">주소</label><input type="text" name="address" id="user">
      <div class="clear"></div>
      <label for="user">전화번호</label><input type="tel" name="tel" id="user">
      <div class="clear"></div>
      
    
     </div>
     <input type="submit" value="회원가입">
     <div class="clear"></div>
     <div class="form4">
      <!-- <label><input type="checkbox">아이디저장</label> <label><input
       type="checkbox">보안접속</label> -->
      <div class="clear"></div>
      <input type="button" value="메인페이지" onclick="index.jsp">
      <input type="button" value="아이디/비밀번호 찾기" onclick="index.jsp">
     </div>
    </div>
   </div>
  </div>
 </form>

</body>
</html>