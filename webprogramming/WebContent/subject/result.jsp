	<%@ page language="java" contentType="text/html; charset=UTF-8"
	    pageEncoding="UTF-8"%>
	<!DOCTYPE html>
	<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	</head>
	<body>
	
		<%String id = request.getParameter("id"); %>
		<%=id %>
		<br>
		<%String password = request.getParameter("password"); %>
		<%=password %>
		<br>
		<%String pass_re = request.getParameter("pass_re"); %>
		<%=pass_re %>
		<br>
		<%String name = request.getParameter("_name"); %>
		<%=name %>
		<br>
		<%String gender = request.getParameter("gender"); %>
		<%=gender %>
		<br>
		<%String year = request.getParameter("year"); %>
		<%=year %>
		<br>
		<%String month = request.getParameter("month"); %>
		<%=month %>
		<br>
		<%String day = request.getParameter("day"); %>
		<%=day %>
		<br>
		<%String email = request.getParameter("email"); %>
		<%=email %>
		<br>
		<%String email2 = request.getParameter("email"); %>
		<%=email2 %>
		<br>
		<%String tel = request.getParameter("tel"); %>
		<%=tel %>
		<br>
		<%String confirm = request.getParameter("confirm"); %>
		<%=confirm %>
		<br>
		<%String connum = request.getParameter("connum"); %>
		<%=connum %>
		<br>
	
	</body>
	</html>