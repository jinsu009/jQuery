	<%@ page language="java" contentType="text/html; charset=UTF-8"
	    pageEncoding="UTF-8" import="java.sql.*"%>
	
	<%
	String DB_URL = "jdbc:oracle:thin:@localhost:1521:xe";
	String DB_USER = "LSJ";
	String DB_PASSWORD= "java";
	
	Connection conn;
	PreparedStatement pstmt = null;
	ResultSet rs;
	
	
	
	try {
		
		//data.jsp를 거치지 않고 내가 input에 입력한 값을 그대로 들고온다. 
		// String id = request.getParameter("id"); //id값 가져오기 
		 //String pw = request.getParameter("pw"); //while문안에서 두쌍이 맞는지 검사 
		 
	 Class.forName("oracle.jdbc.driver.OracleDriver");
	 conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
	
	 String flag = request.getParameter("flag");
	 
	 if(flag.equals("1")){
	 String result="";
	 String sql = "select lprod_gu, lprod_nm from lprod";        // sql 쿼리
	 	
		pstmt = conn.prepareStatement(sql);                          // prepareStatement에서 해당 sql을 미리 컴파일한다.
		rs = pstmt.executeQuery();                                // 쿼리를 실행하고 결과를 ResultSet 객체에 담는다.
	
		result += "[";
		while(rs.next()){ 
			String lprod_gu = rs.getString("lprod_gu");
			String lprod_nm = rs.getString("lprod_nm");
			result += "{\"lprod_gu\":\"" + lprod_gu+"\",\"lprod_nm\":\"" +lprod_nm+"\"},";
		}
		result = result.substring(0, result.length()-1);
		result +="]";
		out.println(result);
	 }
	 if(flag.equals("2")){
		String result="";
		 
		String lprod_gu = request.getParameter("lprod_gu");
		 String sql = "select prod_id, prod_name, prod_lgu, prod_buyer, prod_cost from prod" 
			 		+" where prod_lgu=?";        // sql 쿼리
		 	
			pstmt = conn.prepareStatement(sql);                          // prepareStatement에서 해당 sql을 미리 컴파일한다.
			pstmt.setString(1,lprod_gu);
			rs = pstmt.executeQuery();                                // 쿼리를 실행하고 결과를 ResultSet 객체에 담는다.
		
			result += "[";
			while(rs.next()){ 
				String prod_id = rs.getString("prod_id");
				String prod_name = rs.getString("prod_name");
				String prod_lgu = rs.getString("prod_lgu");
				String prod_buyer = rs.getString("prod_buyer");
				String prod_cost = rs.getString("prod_cost");
				
				result += "{\"prod_id\":\""+prod_id+"\",\"prod_name\":\""+prod_name+"\",\"prod_lgu\":\"" +prod_lgu+"\",\"prod_buyer\":\""+prod_buyer+"\",\"prod_cost\":\""+prod_cost+"\"},";
			}
			result = result.substring(0, result.length()-1);
			result +="]";
			out.println(result);
	 }
	 if(flag.equals("3")){
		 
		 String result ="";
		 String prod_id0 = request.getParameter("prod_id");
		 String sql = "select prod_id, prod_name, prod_lgu, prod_buyer, prod_cost from prod" 
			 		+" where prod_id=?";
		 
		 pstmt = conn.prepareStatement(sql);
		 pstmt.setString(1,prod_id0);
		 rs = pstmt.executeQuery();
		 
		 result += "[";
			while(rs.next()){ 
				String prod_id = rs.getString("prod_id");
				String prod_name = rs.getString("prod_name");
				String prod_lgu = rs.getString("prod_lgu");
				String prod_buyer = rs.getString("prod_buyer");
				String prod_cost = rs.getString("prod_cost");
				
				result += "{\"prod_id\":\""+prod_id+"\",\"prod_name\":\""+prod_name+"\",\"prod_lgu\":\"" +prod_lgu+"\",\"prod_buyer\":\""+prod_buyer+"\",\"prod_cost\":\""+prod_cost+"\"},";
			}
			result = result.substring(0, result.length()-1);
			result += "]";
			out.println(result);
	 }
	
	 conn.close();
	} catch(Exception e) {
	 out.println(e.getMessage());
	}
	%>
