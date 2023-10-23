<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import = "java.util.ArrayList" %>
<%@ page import = "vo.Team" %>
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
<body>
<%
	Class.forName("org.mariadb.jdbc.Driver");
	System.out.println("드라이브 로딩 성공");
	String url="jdbc:mariadb://localhost:3306/gdj72";
	String dbuser= "root";
	String dbpw= "java1234";
	
	Connection conn = DriverManager.getConnection(url, dbuser, dbpw);
	System.out.println("db 접속 성공");
	
	String sql = "SELECT team_no AS teamNo,team_name AS teamName,team_count AS teamCount,team_begin AS teamBegin,team_end AS teamEnd,createdate,updatedate FROM team";
	PreparedStatement stmt = conn.prepareStatement(sql);
	ResultSet rs = stmt.executeQuery();
	// <-- 모델 레이어
		// 자원해제? 자원을 뷰에서 사용하는데? 해제전에 ResultSet -> ArrayList로 변형카피 -> 자원해제
		// DB Emp테이블 행의 집합(ResultSet)을 -> JAVA Emp클래스 타입의 집합(ArrayList)으로		
		ArrayList<Team> list = new ArrayList<Team>();
		while(rs.next()) {
			Team t = new Team(); // 결과행의 수만큼 Emp객체 필요
			t.teamNo = rs.getInt("teamNo");
			t.teamName = rs.getString("teamName");
			t.teamBegin = rs.getString("teamBegin");
			t.createdate = rs.getString("createdate");
			t.updatedate = rs.getString("updatedate");
			list.add(t);
		}
%>
		<h1>메뉴</h1>
	<!-- 메뉴 네비게이션 -->
		<a href="<%=request.getContextPath()%>/home.jsp" class="btn btn-primary">홈으로</a>
		<a href="<%=request.getContextPath()%>/empList.jsp" class="btn btn-primary">직원관리</a>
		<a href="<%=request.getContextPath()%>/teamList.jsp" class="btn btn-primary">팀관리</a>
		<a href="<%=request.getContextPath()%>/studentList.jsp" class="btn btn-primary">학생관리</a>
		<a href="<%=request.getContextPath()%>/boardList.jsp" class="btn btn-primary">게시판관리</a>
	
	<h1>팀 리스트</h1>
	<div>
		<a href="<%=request.getContextPath() %>/addTeamForm.jsp">팀 추가</a>	
	</div>
	<table border="1">
		<thead>
			<tr>
				<th>team_no</th>
				<th>team_name</th>
				<th>team_count</th>
				<th>team_begin</th>
				<th>team_end</th>
				<th>createdate</th>
				<th>updatedate</th>
			</tr>
		</thead>
		<tbody>
			<%
				for(Team t : list){
			%>
					<tr>
						<td><%=t.teamNo%></td>
						<td><%=t.teamName %></td>
						<td><%=t.teamCount %></td>
						<td><%=t.teamBegin%></td>
						<td><%=t.teamEnd%></td>
						<td><%=t.createdate%></td>
						<td><%=t.updatedate%></td>
						<td>
							<a href="<%=request.getContextPath()%>/updateTeamForm.jsp?teamNo=<%=t.teamNo%>">수정</a>
						</td>
						<td>
							<a href="<%=request.getContextPath()%>/deleteTeamAction.jsp?teamNo=<%=t.teamNo%>">삭제</a>
						</td>
					</tr>
			<%
				}
			%>
		</tbody>
	</table>
</body>
</html>