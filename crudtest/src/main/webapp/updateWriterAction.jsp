<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int boardNo = Integer.parseInt(request.getParameter("boardNo"));
	String boardTitle = request.getParameter("boardTitle");
	String boardContent = request.getParameter("boardContent");
	String boardWriter = request.getParameter("boardWriter");

	Class.forName("org.mariadb.jdbc.Driver");
	System.out.println("드라이브 로딩 성공");
	String url = "jdbc:mariadb://localhost:3306/gdj72";
	String dbuser = "root";
	String dbpw = "wkqk1234";
	
	Connection conn = DriverManager.getConnection(url, dbuser, dbpw);
	
	String sql = "UPDATE board SET board_title = ?, board_content = ?, board_writer = ?, updatedate = NOW() WHERE board_no=?";
	PreparedStatement stmt = conn.prepareStatement(sql);
	stmt.setString(1,boardTitle);
	stmt.setString(2,boardContent);
	stmt.setString(3,boardWriter);
	stmt.setInt(4,boardNo);
	
	int row = stmt.executeUpdate();
	
	if(row == 1) {
		response.sendRedirect(request.getContextPath()+"/boardList.jsp");
	} else {
		response.sendRedirect(request.getContextPath()+"/updateboardForm.jsp?boardNo="+boardNo);	
	}
	
	stmt.close();
	conn.close();
%>