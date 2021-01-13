<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
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

ul{
list-style-type: none;
}

#wrap {
	width: 600px;
	height: 100%;
	margin: 50px auto;
}
.form {
	width: 600px;
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

.form2 li {
	float: left;
	margin: 10px 10px 10px 0px; 
}

.form2 label{
color: white;
text-align: left;
margin-right: 10px;
}

.form4 {
	padding: 20px 30px;
	float: center;
}

.content{
   position: relative;
   top:0px; left:0px;
}
.content1{
   position: relative;
   top:0px; left:0px;
   text-align: center;
}
.content2{
   position: relative;
   top:0px; left:0px;
}
.content3{
   position: relative;
   top:0px; left:0px;
}

/* 
#title {
	position: absolute;
	top: 100px;
	left: 400px;
}
 */

/* .reset{
	position:absolute;
	top:410px;
    width:120px; height:35px;
    background-color: orange;
    border-radius: 20px;
} */

input[type="button"] {
	width: 100%;
	height: 30px;
	background: skyblue;
	border-radius: 5px;
	/*  width: 140px; */
	font-family: "맑은 고딕";
	margin-top: 20px;
	
}

input[type="submit"] {
	width: 100%;
	height: 30px;
	background: skyblue;
	border-radius: 5px;
	/*  width: 140px; */
	font-family: "맑은 고딕";
	margin-top: 20px;
}

</style>

<meta charset="UTF-8">
<title>Travel</title>
</head>
<body>
	<form action="board/boardRegister.jsp" method="get">
		<input type="hidden" name="readcount" value="0">
		<div id="wrap">
			<h1 class="title">Board Write</h1>
			<div class="form">
				<div class="form2">
						<ul>
							<li>
								<label for="제목" class="content">제목&nbsp;&nbsp;&nbsp;</label> 
								<input type="text" name="title" autofocus="autofocus" required="required" placeholder="제목을 입력하세요" size="52" maxlength="100">
							</li>
							<li>
								<label for="내용" class="content1">내용&nbsp;&nbsp;&nbsp;</label> 
								<textarea rows="20" cols="45" name="content" placeholder="내용을입력해주세요" class="content2"></textarea>
							</li>
							<li>
								<label for="작성자" class="content2">작성자</label> 
								<input type="text" name="author" placeholder="작성자입력">
							</li>
							<li>
								<label for="날짜" class="content3">날 &nbsp;&nbsp;짜</label> 
								<input type="text" name="nal">
								<!-- <input type="date" name="nal"> -->
							</li>
						</ul>
					<div class="clear"></div>
					<div class="form4">
						<input type="submit" value="등록하기">
						<!-- <a href="student.jsp"></a> <a href="studentList.jsp"></a> -->
					</div>
				</div>
			</div>
		</div>
	</form>
</body>
</html>