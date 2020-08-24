	<%@ page language="java" contentType="text/html; charset=UTF-8"
	    pageEncoding="UTF-8" import="java.sql.*"%>
	    
	    <%
	    	String DB_URL = "jdbc:oracle:thin:@localhost:1521:xe";
	    	String DB_USER = "LSJ";
	    	String DB_PASSWORD = "java";
	    	
	    	Connection conn;
	    	PreparedStatement pstmt = null; 
	    	ResultSet rs; 
	    	
// 	    	String temp = request.getParameter("temp");
	    	try{
	    		
	    		Class.forName("oracle.jdbc.driver.OracleDriver");
	    		conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
	    			String result="";
	    			String mem_id = request.getParameter("mem_id");
	    			String sql = "select count(*) as cnt from memberjoin where mem_id=?";
	    			pstmt = conn.prepareStatement(sql);
	    			pstmt.setString(1,mem_id);
	    			rs = pstmt.executeQuery();
	    			
	    			String cnt="";
	    			String str="";
	    			
	    			while(rs.next()){
	    				cnt = rs.getString("cnt");
	    				
	    			}
	    			if(cnt.equals("1")){
// 	    				result="1";
	    				str += "{\"mem_id\":\"" + mem_id +" 는 탈퇴한 회원이거나 현재 사용중인 아이디 입니다. \"}";
	    			}else{
// 	    				result="0";
	    				str += "{\"mem_id\":\"" + mem_id +" 는 사용가능한 아이디입니다.\"}";
	    			}
	    			
// 	    			out.println(result); //flag안에서는 data로 넘어간다. 
	    			out.println(str);
// 	    		}
	    	}catch(Exception e){
	    		out.println(e.getMessage());
// 	    		e.printStackTrace();
	    	}
	    
	    %>
	