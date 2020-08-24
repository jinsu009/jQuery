<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    



	<% 
// 		request.setCharacterEncoding("UTF-8");
//post형식으로 파라미터를 받은경우 
	%>
	
	<% 
// 	String str = new String(request.getParameter("name")
// 		.getBytes("8859_1"), "UTF-8");
		 String str = request.getParameter("name"); 
		 str += request.getParameter("age");
	%>

	<%=str%>