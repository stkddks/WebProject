<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String pagefile = request.getParameter("page");
	if (pagefile == null) {
		pagefile = "center";
	}
%>

<!DOCTYPE html>
<html>
<head>
<style type="text/css">
#top {
	position: absolute;
	top: 0px; left: 10px;
	width: 100%; height: 200px;
}

#center {
	position: absolute;
	top: 200px; left: 40px;
	width: 100%; height: 3000px;
	
}

#bottom {
 	position: fixed; 
	bottom: 10px; left: 10px;
	width: 100%; height: 150px;
}

</style>

<meta charset="UTF-8">
<title>Trable</title>
</head>
<body>

	<div id="top">
		<jsp:include page="top.jsp" />
	</div>
	<div id="left">
		<jsp:include page="left.jsp" />
	</div>
	<div id="center">
		<jsp:include page='<%=pagefile + ".jsp"%>' />
	</div>
	<div id="bottom">
		<jsp:include page="bottom.jsp" />
	</div>
</body>
</html>