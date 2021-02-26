<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<%
		session.invalidate();	// 현재 이 페이지에 접속한 회원이 세션이 빼앗기도록 
	%>
	<script>
		location.href = 'main.jsp';
	</script>
</body>
</html>