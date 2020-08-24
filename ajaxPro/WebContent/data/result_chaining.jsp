<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<%
	//post형식으로 파라미터를 받을 경우
	// 클라이언트 요청시 입력한 데이터를 가져와서 처리 ,
	// 처리후에 응답결과를 만든다. 
	// type >> json {"key":"value","key":"value"}
	// 값에대한 객체가 여러개 있을 경우 
	// type >> json [{"key":"value","key":"value"},{"key":"value","key":"value"}]
			
	request.setCharacterEncoding("UTF-8"); 
	
	%>
    <% 
    String str =
    		"{\"name\":\"" +request.getParameter("name")+"\",";
    
    str += 
    		"\"add\":\""+request.getParameter("add")+"\",";
	 str += 
	    		"\"tel\":\""+request.getParameter("tel")+"\"}";
    %>
    <%=str%>
    
    
    
    
    
    