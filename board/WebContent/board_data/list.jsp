<%@page import="kr.or.ddit.arcodian.vo.BoardVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
[
<%
   List<BoardVO> list = (List<BoardVO>) request.getAttribute("list");
  //servlet 사용시 vo 호출 
   for(int i=0; i<list.size(); i++){
	   BoardVO  vo = list.get(i); 
	   if(i > 0) out.print(",");
%>	{
       "board_no": "<%= vo.getSeq() %>",
       "title" 	: "<%= vo.getSubject().replaceAll("&lt;", "<").replaceAll("&gt;", ">") %>",
       "writer"  : "<%= vo.getWriter() %>",
       "content" : "<%= vo.getContent().replaceAll("\r","").replaceAll("\n","<br>").replaceAll("&lt;", "<").replaceAll("&gt;", ">")%>",
       "wdate"	 : "<%= vo.getWdate() %>",
       "hit"	 : "<%= vo.getHit() %>"
    }	  
<%  } %>

]




