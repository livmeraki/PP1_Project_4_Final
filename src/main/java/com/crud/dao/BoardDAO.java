package com.crud.dao;

import java.io.*;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.jar.JarFile;
import java.util.logging.Logger;
import java.util.stream.StreamSupport;

import com.crud.bean.BoardVO;
import com.crud.common.JDBCUtil;
import org.apache.commons.io.FileUtils;

import javax.swing.*;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.Base64;

public class BoardDAO {
	
	Connection conn = null;
	PreparedStatement stmt = null;
	ResultSet rs = null;

	private final String BOARD_INSERT = "insert into BLOG_TABLE (title, writer, content, privacy, subject, color, views, font) values (?,?,?,?,?,?,?,?)";
	private final String BOARD_UPDATE = "update BLOG_TABLE set title=?, writer=?, content=?, privacy=?, subject=?, color=?, font=? where id=?";
	private final String BOARD_UPDATEVIEW = "update BLOG_TABLE set views=? where id=?";
	private final String BOARD_DELETE = "delete from BLOG_TABLE  where id=?";
	private final String BOARD_GET = "select * from BLOG_TABLE  where id=?";
	private final String BOARD_LIST = "select * from BLOG_TABLE order by id desc";

	public int insertBoard(BoardVO vo) {
		System.out.println("===> JDBC로 insertBoard() 기능 처리");
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(BOARD_INSERT);
			stmt.setString(1, vo.getTitle());
			stmt.setString(2, vo.getWriter());
			stmt.setString(3, vo.getContent());
			stmt.setInt(4, vo.getPrivacy());
			stmt.setString(5, vo.getSubject());
			stmt.setString(6, vo.getColor());
			stmt.setInt(7, 0);
			stmt.setString(8, vo.getFont());

			String currentDir = System.getProperty("user.dir");
			System.out.println("Current dir using System:" + currentDir);

			/*
			File file = vo.getImage();
			//FileInputStream fis = new FileInputStream(file);
			//FileInputStream in = new FileInputStream(file);
			byte[] fileContent = FileUtils.readFileToByteArray(file);
			String encodedString = Base64.getEncoder().encodeToString(fileContent);

			stmt.setString(7, encodedString);
			*/

			//System.out.println(vo.getImage());
			stmt.executeUpdate();
			return 1;
		} catch (Exception e) {
			e.printStackTrace();
		}
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

			stmt.setInt(8, vo.getId());
			stmt.setString(1, vo.getTitle());
			stmt.setString(2, vo.getWriter());
			stmt.setString(3, vo.getContent());
			stmt.setInt(4, vo.getPrivacy());
			stmt.setString(5, vo.getSubject());
			stmt.setString(6, vo.getColor());
			stmt.setString(7, vo.getFont());

			System.out.println(vo.getTitle() + "-" + vo.getContent() + "-" + vo.getId());
			stmt.executeUpdate();
			return 1;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}
	public int updateViews(BoardVO vo) {
		System.out.println("===> JDBC로 updateBoard() 기능 처리");
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(BOARD_UPDATEVIEW);
			stmt.setInt(1, vo.getViews());
			stmt.setInt(2, vo.getId());
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
				one.setWriter(rs.getString("writer"));
				one.setContent(rs.getString("content"));
				one.setSubject(rs.getString("subject"));
				one.setColor(rs.getString("color"));
				one.setDatetime(rs.getString("datetime"));
				one.setViews(rs.getInt("views"));
				one.setFont(rs.getString("font"));

/*
				Blob blob=rs.getBlob("image");
				InputStream inputStream = blob.getBinaryStream();
				File targetFile = new File("image_file"+rs.getInt("id")+".tmp");
				OutputStream outStream = new FileOutputStream(targetFile);
				byte[] buffer = new byte[8 * 1024];
				int bytesRead;
				while ((bytesRead = inputStream.read(buffer)) != -1) {
					outStream.write(buffer, 0, bytesRead);
				}
				one.setImage(targetFile);

 */
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
				one.setWriter(rs.getString("writer"));
				one.setContent(rs.getString("content"));
				one.setSubject(rs.getString("subject"));
				one.setColor(rs.getString("color"));
				one.setDatetime(rs.getString("datetime"));
				one.setViews(rs.getInt("views"));
				one.setFont(rs.getString("font"));

/*
				Blob blob=rs.getBlob("image");
				InputStream inputStream = blob.getBinaryStream();
				File targetFile = new File("image_file"+rs.getInt("id")+".tmp");
				OutputStream outStream = new FileOutputStream(targetFile);
				byte[] buffer = new byte[8 * 1024];
				int bytesRead;
				while ((bytesRead = inputStream.read(buffer)) != -1) {
					outStream.write(buffer, 0, bytesRead);
				}
				one.setImage(targetFile);
*/
				list.add(one);
			}
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return list;
	}
}
