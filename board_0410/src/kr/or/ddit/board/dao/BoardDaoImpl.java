package kr.or.ddit.board.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import kr.or.ddit.board.vo.BoardVO;

public class BoardDaoImpl  implements IBoardDao{

	Connection  con ;
	PreparedStatement  stmt;
	ResultSet  rs;
	
	private static IBoardDao  dao = new BoardDaoImpl();
	
	public static IBoardDao getInstance(){
		if(dao==null) dao = new BoardDaoImpl();
		return dao;
		
	}
    private BoardDaoImpl(){
    	try {
			//1
			Class.forName("oracle.jdbc.driver.OracleDriver");
			//2
			con = DriverManager.getConnection(
					"jdbc:oracle:thin:@localhost:1521:xe",
					"SEM",
					"java");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }
	
	@Override
	public List<BoardVO> selectAll() throws SQLException {
		
		List<BoardVO> list = new ArrayList<>();
		
		//3
		String sql = "select board_no, board_title, board_writer ," + 
				"		board_content, to_char(board_date, 'YYYY-MM-DD') board_date," + 
				"		board_cnt from jdbc_board" + 
				"		order by board_no desc";
		
		//4
		stmt  = con.prepareStatement(sql);
		
		//5
		
		/*select board_no, board_title, board_writer ,
				board_content, to_char(board_date, 'YYYY-MM-DD') board_date,
				board_cnt from jdbc_board 
		order by board_no desc
		*/
		rs = stmt.executeQuery();
		while(rs.next()){
			/*System.out.println(rs.getString("board_no"));
			System.out.println(rs.getString("board_title"));
			System.out.println(rs.getString("board_writer"));
			System.out.println(rs.getString("board_date"));
			System.out.println(rs.getString("board_content"));
			*/
			BoardVO  vo = new BoardVO();
			vo.setSeq(rs.getInt("board_no"));
			vo.setSubject(rs.getString("board_title"));
			vo.setWriter(rs.getString("board_writer"));
			vo.setWdate(rs.getString("board_date"));
			vo.setContent(rs.getString("board_content"));
			list.add(vo);
	    }
		
		
		rs.close();
		stmt.close();
		
		
		return list;
	}
	@Override
	public BoardVO selectView(int seq) throws SQLException {
		BoardVO vo = null;
		String sql = "select * from jdbc_board where board_no = ?";
		stmt = con.prepareStatement(sql);
		stmt.setInt(1, seq);
		
		rs = stmt.executeQuery();
		if(rs.next()){
			vo = new BoardVO();
			vo.setSeq(rs.getInt("board_no"));
			vo.setWriter(rs.getString("board_writer"));
			vo.setSubject(rs.getString("board_title"));
			//vo.setMail(rs.getString("mail"));
			//vo.setPassword(rs.getString("password"));
			vo.setContent(rs.getString("board_content"));
		}
		rs.close();
		stmt.close();
		return vo;
	}
	@Override
	public int updateBoard(BoardVO vo) throws SQLException {
		int a=0;
		String sql = "update jdbc_board set writer=?, "
				+ " subject =? , mail=?, password=?, content = ? "
				+ " where seq=?";
		stmt = con.prepareStatement(sql);
		stmt.setString(1, vo.getWriter());;
		stmt.setString(2, vo.getSubject());
		stmt.setString(3, vo.getMail());
		stmt.setString(4, vo.getPassword());
		stmt.setString(5, vo.getContent());
		stmt.setInt(6, vo.getSeq());
		
		a = stmt.executeUpdate();
		stmt.close();
		
		return a;
	}
	@Override
	public int insertBoard(BoardVO vo) throws SQLException {
		int result =0;
		System.out.println(vo.getSubject());
		System.out.println(vo.getWriter());
		System.out.println(vo.getContent().replace("<", "&lt;").replace(">", "&gt;"));

		String sql = "insert into jdbc_board" + 
				"(board_no, board_title, board_writer, board_content, board_date, board_cnt)" + 
				"values (seq_board.nextVal, ?,?,?, sysdate, 0)";

		stmt = con.prepareStatement(sql);
		stmt.setString(1, vo.getSubject());
		stmt.setString(2, vo.getWriter());
		stmt.setString(3, vo.getContent().replace("<", "&lt;").replace(">", "&gt;"));
		
		result =stmt.executeUpdate();  
		stmt.close();
		return result;
		
	}
	@Override
	public List<BoardVO> selectAll(Map<String, Integer> map) throws SQLException {
		List<BoardVO>  list = new ArrayList<BoardVO>();
		 		
		String sql = "select A.* from ( " 
                 + "     select rownum as rnum, B.*  from ( "
                 + "          select * from jdbc_board order by board_no desc) B "
                 + "     where rownum <= ?) A "
                 + "  where A.rnum >= ? ";
		
		stmt=con.prepareStatement(sql);
		stmt.setInt(1, map.get("end"));
		stmt.setInt(2, map.get("start"));
		
		rs  = stmt.executeQuery();
		
		while(rs.next()){
			BoardVO  vo = new BoardVO();
			vo.setSeq(rs.getInt("board_no"));
			vo.setWriter(rs.getString("board_writer"));
			vo.setSubject(rs.getString("board_title"));
			//vo.setMail(rs.getString("mail"));
			//vo.setPassword(rs.getString("password"));
			vo.setContent(rs.getString("board_content"));
			
			vo.setWdate(rs.getString("board_date"));
			vo.setHit(rs.getInt("board_cnt"));
			
			list.add(vo);
		}
		rs.close();
		stmt.close();
		
		return list;
	}
	@Override
	public int getListCount() throws SQLException {
		int count = 0;
		
		String sql ="select count(*) cnt from jdbc_board"; 
		
		stmt = con.prepareStatement(sql);
		rs = stmt.executeQuery();
		if(rs.next()){
			count = rs.getInt("cnt");
		}
		
		rs.close();
		stmt.close();
		
		return count;
	}
	@Override
	public int deleteBoard(Map<String, Object> map) throws SQLException {
		int a= 0;
		
		String sql = "delete jdbc_board where seq=? and  password= ?";
		stmt = con.prepareStatement(sql);
		stmt.setInt(1, (int)map.get("board_no"));
		stmt.setString(2, (String)map.get("pass"));
		
		a = stmt.executeUpdate();
		
		stmt.close();
		
		return a;
	}

}



















