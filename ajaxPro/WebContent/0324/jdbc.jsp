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
	 String id = request.getParameter("id"); //id값 가져오기 
	 String pw = request.getParameter("pw"); //while문안에서 두쌍이 맞는지 검사 
	 
 Class.forName("oracle.jdbc.driver.OracleDriver");
 conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

 	String sql = "SELECT mem_id, mem_pass from member";        // sql 쿼리

	pstmt = conn.prepareStatement(sql);                          // prepareStatement에서 해당 sql을 미리 컴파일한다.
	
	rs = pstmt.executeQuery();                                // 쿼리를 실행하고 결과를 ResultSet 객체에 담는다.

	String result="";
	while(rs.next()){ 
		String mem_id = rs.getString("mem_id");
		String mem_pass = rs.getString("mem_pass");
		//out.println(id+","+pw);
		
		//아이디와 패스워드가 같으면 '로그인되었습니다.' 아니면 '로그인이 실패했습니다' body 태그에 찍어주기 
		if(id.equals(mem_id)&&pw.equals(mem_pass)){
			result = "로그인성공";
			break;
		}else{
			result="로그인실패";
		}
	}
		//out.println("테이블 select 완료 ");        // 성공시 메시지 출력
		out.println(result);
 
 conn.close();
 //out.println("Oracle jdbc test: connect ok!!");
} catch(Exception e) {
 out.println(e.getMessage());
}
%>
