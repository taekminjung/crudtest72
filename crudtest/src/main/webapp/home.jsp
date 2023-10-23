<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1> Home</h1>
	<!-- 메뉴 네비게이션 -->
		<a href="<%=request.getContextPath()%>/home.jsp" class="btn btn-primary">홈으로</a>
		<a href="<%=request.getContextPath()%>/empList.jsp" class="btn btn-primary">직원관리</a>
		<a href="<%=request.getContextPath()%>/teamList.jsp" class="btn btn-primary">팀관리</a>
		<a href="<%=request.getContextPath()%>/studentList.jsp" class="btn btn-primary">학생관리</a>
		<a href="<%=request.getContextPath()%>/boardList.jsp" class="btn btn-primary">게시판관리</a>
	<!-- 메인 내용(이미지 : /img/main.jpg) -->
</body>
</html>