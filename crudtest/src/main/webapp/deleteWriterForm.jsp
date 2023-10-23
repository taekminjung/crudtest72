<%@page import="vo.Board"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%

	int boardNo = Integer.parseInt(request.getParameter("boardNo"));

%>
<body>
	<form action="<%=request.getContextPath()%>/deleteWriterForm2.jsp">
		<table border="1">
		<tr>
			<td>비밀번호 입력 : </td>
			<td><input type="password" name="password"></td>
		</tr>
		<tr>
			<td colspan="2"><button type="submit" value="<%=boardNo%>" name="boardNo">누르기</button></td>
		</tr>
	</table>
	</form>
</body>
</html>