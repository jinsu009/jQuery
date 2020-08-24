<%@ page language="java" contentType="text/html; charset=UTF-8"
	    pageEncoding="UTF-8" import="java.sql.*"%>
	    
	    <%
	    	String DB_URL = "jdbc:oracle:thin:@localhost:1521:xe";
	    	String DB_USER = "LSJ";
	    	String DB_PASSWORD = "java";
	    	
	    	Connection conn;
	    	PreparedStatement pstmt = null; 
	    	ResultSet rs; 
	    	try{
	    		Class.forName("oracle.jdbc.driver.OracleDriver");
	    		conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
	    		 
	    		 String result="";
	    		 String sql = "select board_no, board_title, board_writer, board_content, to_char(board_date, 'YYYY-MM-DD') board_date, board_cnt from jdbc_board order by board_no desc";        // sql 쿼리
	    		 	
	    			pstmt = conn.prepareStatement(sql);                          // prepareStatement에서 해당 sql을 미리 컴파일한다.
	    			rs = pstmt.executeQuery();                                // 쿼리를 실행하고 결과를 ResultSet 객체에 담는다.
	    			//executeQuery >> 직접적으로 select의 데이터를 가져오는 부분 .. 
	    			result += "[";
	    			while(rs.next()){ 
	    				String no = rs.getString("board_no");//괄호안의 필드값은 반드시 테이블의 필드값과 동일해야한다.
	    				String title = rs.getString("board_title");
	    				String writer = rs.getString("board_writer");
	    				String content = rs.getString("board_content");
	    				String date = rs.getString("board_date");
	    				String cnt = rs.getString("board_cnt");
	    				result += "{\"board_no\":\"" + no+"\",\"board_title\":\"" +title+"\",\"board_writer\":\"" +writer+"\",\"board_content\":\"" +content+"\",\"board_date\":\"" +date+"\",\"board_cnt\":\"" +cnt+"\"},";
	    			}
	    			result = result.substring(0, result.length()-1);
	    			result +="]";
	    			out.println(result);
		    		conn.close();
		    		
	    		 }catch(Exception e){
	    		out.println(e.getMessage());
	    	}
	    %>