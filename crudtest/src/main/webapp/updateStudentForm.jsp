<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.sql.Connection" %>
<%@ page import ="java.sql.DriverManager" %>
<%@ page import ="java.sql.PreparedStatement" %>
<%@ page import ="vo.Student" %>
<%
	int studentNo = Integer.parseInt(request.getParameter("studentNo"));
	String studentName = request.getParameter("studentName");
	String studentBirth  = request.getParameter("studentBirth");
	String sCreatedate  = request.getParameter("sCreatedate");
	String sUpdatedate  = request.getParameter("sUpdatedate");
	int teamNo = Integer.parseInt(request.getParameter("teamNo"));
	
	Class.forName("org.mariadb.jdbc.Driver");
	String url="jdbc:mariadb://localhost:3306/gdj72";
	String dbuser= "root";
	String dbpw= "java1234";
	
	Connection conn = DriverManager.getConnection(url, dbuser, dbpw);
	
	String sql = "UPDATE student SET student_no = ?, student_name = ?,student_gender, student_birth = ?, createdate = NOW(), updatedate = NOW() WHERE student_no = ?";
	PreparedStatement stmt = conn.prepareStatement(sql);
	stmt.setInt(1, studentNo);
	stmt.setString(2, studentName);
	stmt.setString(3, studentBirth);
	stmt.setInt(4, studentNo);
	
	
	int row = stmt.executeUpdate();
	// DB 자원 해제
		stmt.close();
		conn.close();
			
	if(row == 1){
		response.sendRedirect(request.getContextPath()+"/studentList.jsp");
	}else{
		response.sendRedirect(request.getContextPath()+"/updateStudentForm.jsp?studentNo="+studentNo); //실패 시 이전으로
	}
	
%>