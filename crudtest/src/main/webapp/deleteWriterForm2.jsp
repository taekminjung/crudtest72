<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String password = request.getParameter("password");
	int boardNo = Integer.parseInt(request.getParameter("boardNo"));
	if (password.equals("1234")) {
		

		Class.forName("org.mariadb.jdbc.Driver");
		System.out.println("드라이브 로딩 성공");
		String url = "jdbc:mariadb://localhost:3306/gdj72";
		String dbuser = "root";
		String dbpw = "wkqk1234";
		
		Connection conn = DriverManager.getConnection(url, dbuser, dbpw);
		String sql = "DELETE FROM board WHERE board_no=?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1,boardNo);
		System.out.println(stmt + " <-- stmt");
		
		stmt.close();
		conn.close();
		
		response.sendRedirect(request.getContextPath()+"/boardList.jsp");
		
	} else { 
		response.sendRedirect(request.getContextPath()+"/boardList.jsp");	
	}
	
	
%>

</body>
</html>