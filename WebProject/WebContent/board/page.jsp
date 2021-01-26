<%@page import="board.PageTo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%-- <%
	PageTo pt = (PageTo) request.getAttribute("page");
	int perPage = pt.getPerPage();
	int totalCount = pt.getTotalCount();
	int totalPage = totalCount / perPage;

	if (totalCount % perPage != 0) {
		++totalPage;
	}

	int curPage = pt.getCurPage();

	for (int i = 1; i <= totalPage; i++) {
		if (curPage != i) { // 출력부분은 out.print보다 html이 더 빠르므로 닫고 열고
		/* 	out.print("<font size=10 color='red'>"+i+"</font>");
		}else {
			out.print("<a href='boardList.do?curPage="+i+"'>" +i+ "</a>&nbsp;&nbsp;");
		} */
	%>
	<a href="list.do?curPage=<%=i%>"> 
		<%=i%>
	</a>&nbsp;&nbsp;
	<%
		} else {
	%>
	<font size="10" color="red"><%=i%></font>
	<%
}
}

%> --%>

<%
      PageTo to  = (PageTo)request.getAttribute("page");      
      int curPage = to.getCurPage();
      int perPage = to.getPerPage();
      int totalCount  = to.getTotalCount();
      int totalPage = totalCount / perPage;  // 보여줄 페이지 번호개수
      if( totalCount  %  perPage  != 0 ) totalPage++;

      for( int i = 1 ; i <=  totalPage ; i++){

          if(  curPage == i ){
          out.print( "<font size=10 color='red'>"+i +"</font>" );            
        }else{
         out.print( "<a href='boardList.bo?curPage="+i+"'>"+i+"</a>&nbsp;" );
        }//end if
      }
%>



</body>
</html>