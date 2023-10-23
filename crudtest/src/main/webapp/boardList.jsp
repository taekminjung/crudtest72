<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %>
<%@ page import = "java.util.ArrayList" %>
<%@ page import = "vo.Board" %>
<!-- Latest compiled and minified CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<!--  게시판 만들기 -->
<body>
<%
	Class.forName("org.mariadb.jdbc.Driver");		// 마리아db 드라이버 연결
	System.out.println("드라이브 로딩 성공");
	String url = "jdbc:mariadb://localhost:3306/gdj72";		//Db접속
	String dbuser = "root";								//DB 아이디
	String dbpw = "java1234"; 							//DB 비밀번호
	
	Connection conn = DriverManager.getConnection(url, dbuser, dbpw);
	System.out.println("DB접속 성공");
	
	int beginRow = 0;
	int rowPerPage = 10;
	/*
		SELECT board_no boardNo, board_title boardTitle, createdate 
		FROM board 
		ORDER BY createdate DESC 
		LIMIT ?,?
	*/
	String sql = "SELECT board_no boardNo, board_title boardTitle, createdate FROM board ORDER BY createdate DESC LIMIT ?,?";
	PreparedStatement stmt = conn.prepareStatement(sql);
	stmt.setInt(1, beginRow);
	stmt.setInt(2, rowPerPage);
	ResultSet rs = stmt.executeQuery();
	
	ArrayList<Board> list = new ArrayList<Board>();
	while(rs.next()) {
		Board b = new Board();
		b.boardNo = rs.getInt("boardNo");
		b.boardTitle = rs.getString("boardTitle");
		b.createdate = rs.getString("createdate");
		list.add(b);
	}
	// DB자원반납
	rs.close();
	stmt.close();
	conn.close();
	// Model Layer
%>
	<!-- View Layer -->
	<h1>메뉴</h1>
	<!-- 메뉴 네비게이션 -->
		<a href="<%=request.getContextPath()%>/home.jsp" class="btn btn-primary">홈으로</a>
		<a href="<%=request.getContextPath()%>/empList.jsp" class="btn btn-primary">직원관리</a>
		<a href="<%=request.getContextPath()%>/teamList.jsp" class="btn btn-primary">팀관리</a>
		<a href="<%=request.getContextPath()%>/studentList.jsp" class="btn btn-primary">학생관리</a>
		<a href="<%=request.getContextPath()%>/boardList.jsp" class="btn btn-primary">게시판관리</a>
	<h2>게시판</h2>
	<div>
		<a href="<%=request.getContextPath()%>/addBoardForm.jsp">글입력</a>
	</div>
	
	<table border="1">
		<tr>
			<th>제목</th>
			<th>날짜</th>
		</tr>
		<%
			for(Board b : list) {
		%>
				<tr>
					<td>
						<a href="<%=request.getContextPath()%>/boardOne.jsp?boardNo=<%=b.boardNo%>">
							<%=b.boardTitle%>
						</a>
					</td>
					<td>
						<%=b.createdate%>
					</td>
				</tr>
		<%
			}
		%>
	</table>
</body>
</html>