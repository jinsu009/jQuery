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
	
	 String id = request.getParameter("id"); //id값 가져오기 
	 String pw = request.getParameter("pw"); //while문안에서 두쌍이 맞는지 검사 
	 String pw2 = request.getParameter("pw2");
	 String name = new String(request.getParameter("name").getBytes("8859_1") ,"UTF-8");
	 String add1 = new String(request.getParameter("add1").getBytes("8859_1") ,"UTF-8");
	 String add2 = new String(request.getParameter("add2").getBytes("8859_1") ,"UTF-8");
	 String tel = request.getParameter("tel");
	 
 Class.forName("oracle.jdbc.driver.OracleDriver");
 conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

 	String sql = "insert into memberjoin values(?,?,?,?,?,?)";        // sql 쿼리

	pstmt = conn.prepareStatement(sql);                          // prepareStatement에서 해당 sql을 미리 컴파일한다.
	
	//rs = pstmt.executeQuery();                                // 쿼리를 실행하고 결과를 ResultSet 객체에 담는다.

		pstmt.setString(1,id);
		pstmt.setString(2,pw);
		pstmt.setString(3,name);
		pstmt.setString(4,add1);
		pstmt.setString(5,add2);
		pstmt.setString(6,tel);
		
		pstmt.executeUpdate();
		out.println("insert 완료");

 
 conn.close();
 //out.println("Oracle jdbc test: connect ok!!");
} catch(Exception e) {
 out.println(e.getMessage());
}
%>
