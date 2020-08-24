<%@page import="kr.or.ddit.board.vo.BoardVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
[
<%
   BoardVO vo = (BoardVO)request.getAttribute("vo");
  
%>	
	{
       "board_no": "<%= vo.getSeq() %>",
       "subject" : "<%= vo.getSubject() %>",
       "writer"  : "<%= vo.getWriter() %>",
       "content" : "<%= vo.getContent().replaceAll("\r","").replaceAll("\n","<br>") %>",
       "wdate"	 : "<%= vo.getWdate() %>"
    }	
]




