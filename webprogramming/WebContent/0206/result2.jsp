	<%@ page language="java" contentType="text/html; charset=UTF-8"
	    pageEncoding="UTF-8"%>
	<!DOCTYPE html >
	<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	</head>
	<body>
	<%String name = request.getParameter("name"); %>
		<%=name %>
		<br>
		<%String add = request.getParameter("add"); %>
		<%=add %>
		<br>
		<%String email = request.getParameter("email"); %>
		<%=email %>
		<br>
		<%String gender = request.getParameter("gender"); %>
		<%=gender %>
		
	</body>
	</html>