package com.crud.dao;

import java.io.File;
import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;
import java.util.stream.StreamSupport;

import com.crud.bean.BoardVO;
import com.crud.common.JDBCUtil;

public class BoardDAO {
	
	Connection conn = null;
	PreparedStatement stmt = null;
	ResultSet rs = null;

	private final String BOARD_INSERT = "insert into BLOG_TABLE (title, content, privacy, subject) values (?,?,?,?)";
	private final String BOARD_UPDATE = "update BLOG_TABLE set title=?, content=? where id=?";
	private final String BOARD_DELETE = "delete from BLOG_TABLE  where id=?";
	private final String BOARD_GET = "select * from BLOG_TABLE  where id=?";
	private final String BOARD_LIST = "select * from BLOG_TABLE order by id desc";

	public int insertBoard(BoardVO vo) {
		System.out.println("===> JDBC로 insertBoard() 기능 처리");
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(BOARD_INSERT);
			stmt.setString(1, vo.getTitle());
			stmt.setString(2, vo.getContent());
			stmt.setInt(3, vo.getPrivacy());
			stmt.setString(4, vo.getSubject());

			return 1;
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("Poop!");
		return 0;
	}

	// 글 삭제
	public void deleteBoard(BoardVO vo) {
		System.out.println("===> JDBC로 deleteBoard() 기능 처리");
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(BOARD_DELETE);
			stmt.setInt(1, vo.getId());
			stmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public int updateBoard(BoardVO vo) {
		System.out.println("===> JDBC로 updateBoard() 기능 처리");
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(BOARD_UPDATE);
			stmt.setString(1, vo.getTitle());
			stmt.setString(2, vo.getContent());
			stmt.setInt(3, vo.getId());
			
			
			System.out.println(vo.getTitle() + "-" + vo.getContent() + "-" + vo.getId());
			stmt.executeUpdate();
			return 1;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}	
	
	public BoardVO getBoard(int id) {
		BoardVO one = new BoardVO();
		System.out.println("===> JDBC로 getBoard() 기능 처리");
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(BOARD_GET);
			stmt.setInt(1, id);
			rs = stmt.executeQuery();
			if(rs.next()) {
				one.setId(rs.getInt("id"));
				one.setTitle(rs.getString("title"));
				one.setContent(rs.getString("content"));
				one.setPrivacy(rs.getInt("privacy"));
				one.setSubject(rs.getString("subject"));

			}
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return one;
	}
	
	public List<BoardVO> getBoardList(){
		List<BoardVO> list = new ArrayList<BoardVO>();
		System.out.println("===> JDBC로 getBoardList() 기능 처리");
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(BOARD_LIST);
			rs = stmt.executeQuery();
			while(rs.next()) {
				BoardVO one = new BoardVO();
				one.setId(rs.getInt("id"));
				one.setTitle(rs.getString("title"));
				one.setContent(rs.getString("content"));
				one.setPrivacy(rs.getInt("privacy"));
				list.add(one);
			}
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return list;
	}
}
