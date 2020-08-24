<%@ page language="java" contentType="text/html; charset=UTF-8"
	    pageEncoding="UTF-8"%>
	    
	    <!-- jsp : java serveling page -->
	    
	    
	<!DOCTYPE html>
	<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>전송 결과 화면</title>
	</head>
	<body>
<%-- 		<%String name = request.getParameter("_name"); %> --%>
		<%String name = new String(request.getParameter("_name").getByte("8859_1"),"UTF-8"); %>
		<%=name %>
		<br>
		<%String email = request.getParameter("email"); %>
		<%=email %>
		
		<!-- 자바코드를 사용한다. 
		_name이라는 값을 요청하여 string name에 담아둔다. 	-->
	</body>
	</html>