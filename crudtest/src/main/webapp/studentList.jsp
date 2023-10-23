<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import ="java.util.ArrayList" %>
<%@ page import="vo.Student" %>
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

	String sql = "SELECT student_no studentNo,student_name studentName,student_birth studentBirth,createdate, updatedate, team_no teamNo FROM student";
	PreparedStatement stmt = conn.prepareStatement(sql);
	ResultSet rs = stmt.executeQuery();
	//모델 레이어
	
	ArrayList<Student> list = new ArrayList<Student>();
		while(rs.next()) {
			Student s = new Student(); 					// 결과행의 수만큼 Emp객체 필요
			s.studentNo = rs.getInt("studentNo");
			s.studentName = rs.getString("studentName");
			s.createdate = rs.getString("createdate");
			s.updatedate = rs.getString("updatedate");
			s.teamNo = rs.getInt("teamNo");
			list.add(s);
		}
%>
	<h1>메뉴</h1>
	<!-- 메뉴 네비게이션 -->
		<a href="<%=request.getContextPath()%>/home.jsp" class="btn btn-primary">홈으로</a>
		<a href="<%=request.getContextPath()%>/empList.jsp" class="btn btn-primary">직원관리</a>
		<a href="<%=request.getContextPath()%>/teamList.jsp" class="btn btn-primary">팀관리</a>
		<a href="<%=request.getContextPath()%>/studentList.jsp" class="btn btn-primary">학생관리</a>
		<a href="<%=request.getContextPath()%>/boardList.jsp" class="btn btn-primary">게시판관리</a>
		
		<h1>학생관리</h1>
		<table border="1">
		<thead>
			<tr>
				<th>studentNo</th>
				<th>studentName</th>
				<th>studentBirth</th>
				<th>screatedate</th>
				<th>updatedate</th>
				<th>teamNo</th>
			</tr>
		</thead>
		<tbody>
			<%		
				for(Student s : list){
				
			%>
				
					<tr>
						<td><%=s.studentNo%></td>
						<td><%=s.teamNo%></td>
						<td><%=s.studentName %></td>
						<td><%=s.studentBirth%></td>
						<td><%=s.createdate%></td>
						<td><%=s.updatedate%></td>
						<td colspan="2">
							<a href="<%=request.getContextPath()%>/updateStudentForm.jsp?studentNo=<%=s.studentNo%>">수정</a>
							<a href="<%=request.getContextPath()%>/deleteStudentAction.jsp?studentNo=<%=s.studentNo%>">삭제</a>
						</td>
						
					</tr>
			<%
				}
			%>
		</tbody>
	</table>
	
</body>
</html>