<%@ page language="java" contentType="text/html; charset=UTF-8"
	    pageEncoding="UTF-8" import="java.sql.*"%>
	    
	    <%
	    	String DB_URL = "jdbc:oracle:thin:@localhost:1521:xe";
	    	String DB_USER = "LSJ";
	    	String DB_PASSWORD = "java";
	    	
	    	Connection conn;
	    	PreparedStatement pstmt = null; 
	    	ResultSet rs; 
	    	
	    	String temp = request.getParameter("temp");
	    	try{
	    		Class.forName("oracle.jdbc.driver.OracleDriver");
	    		conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
	    		String result = "";
	    		
	    		String mem_id = request.getParameter("mem_id");
	    		String mem_pass = request.getParameter("mem_pass");
	    		String mem_name = new String(request.getParameter("mem_name").getBytes("8859_1") ,"UTF-8");
	    		String mem_gender = request.getParameter("mem_gender");
	    		String mem_birth = request.getParameter("year")+"/"+request.getParameter("month")+"/"+request.getParameter("day");
	    		String mem_email = request.getParameter("mem_email01")+"@"+request.getParameter("mem_email02");
	    		String mem_zip = request.getParameter("mem_jsb");
	    		String mem_addr1 = new String(request.getParameter("mem_juso").getBytes("8859_1") ,"UTF-8");
	    		String mem_addr2 = new String(request.getParameter("mem_ssjs").getBytes("8859_1") ,"UTF-8");
	    		String mem_hp = new String(request.getParameter("mem_hp").getBytes("8859_1") ,"UTF-8");
	    		
	    		//1 . html에서 조건에 넣을 값을 가져오고    		
	    		
	    		//insert : id, pw, name, gender, birth, email, hp
	    		String sql = "insert into memberjoin values (?,?,?,?,?,?,?,?,?,?)";
	    		
	    		pstmt = conn.prepareStatement(sql);
	    		
	    		// 2. 값을 차례로 넣어준다. 
	    		pstmt.setString(1,mem_id);
	    		pstmt.setString(2,mem_pass);
	    		pstmt.setString(3,mem_name);
	    		pstmt.setString(4,mem_addr1);
	    		pstmt.setString(5,mem_addr2);
	    		pstmt.setString(6,mem_hp);
	    		pstmt.setString(7,mem_gender);
	    		pstmt.setString(8,mem_birth);
	    		pstmt.setString(9,mem_email);
	    		pstmt.setString(10,mem_zip);
	    		
	    		pstmt.executeUpdate();
	    		
	    		out.println(result); // 값이 잘 넘어오는지 검사
	    	}catch(Exception e){
	    		out.println(e.getMessage());
	    	}
	    
	    %>
	    <div>가입을 환영합니다</div>
	    		