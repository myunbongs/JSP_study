<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="bbs.Bbs" %>
<%@ page import="bbs.BbsDAO" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BINNY'S BOARD</title>
<style>
	#navbar {
		height: 30px;
		width: 850px;
	}
	#navbar ul li {
		list-style: none; 
		color: white;
		background-color: black;
		float: left;
		line-height: 30px;
		vertical-align: middle; /* 잘 모르겠구만 */
		text-align: center;
	}
	#navbar .link {
		text-decoration: none;
		color: white;
		display: block;
		width: 150px;
		font-size: 15px;
		font-weight: bold;
	}
	
	#navbar .link:hover {
		color: black;
		background-color: white;
	}
	
	#navbar .dropdown {
		position: absolute;
		display: none;
	}
	
	#navbar li:hover ul  {
		display: block;
	}
	
	#navbar ul li li {
		float: none;
		width: 150px;
	}
	
</style>
</head>
<body>
	<%
	String userID = null;
	if (session.getAttribute("userID") != null ) {
		userID = (String) session.getAttribute("userID");
	}
	
	int bbsID = 0;
	
	if ( request.getParameter("bbsID") != null ) {	// 매개변수로 넘어온 bbsID가 존재한다면
		bbsID = Integer.parseInt(request.getParameter("bbsID"));
	}
	
	if (userID == null) {
		PrintWriter script = response.getWriter();  
		script.println("<script>");	
		script.println("alert('로그인을 하세용')");
		script.println("location.href = 'login.jsp'"); 
		script.println("</script>");	
	}
	
	if (bbsID == 0) {
		PrintWriter script = response.getWriter();  
		script.println("<script>");	
		script.println("alert('유효하지 않은 글입니다!')");
		script.println("location.href = 'bbs.jsp'"); 
		script.println("</script>");	
	}
	Bbs bbs = new BbsDAO().getBbs(bbsID);
	
	if (!userID.equals(bbs.getUserID())) {
		PrintWriter script = response.getWriter();  
		script.println("<script>");	
		script.println("alert('권한이 없습니다..')");
		script.println("location.href = 'bbs.jsp'"); 
		script.println("</script>");	
	}
	%>
BINNY'S BOARD
	<nav id="navbar">
		<ul>
			<li><a class="link" href="main.jsp">메인</a></li>
			<li class="active"><a class="link" href="bbs.jsp">게시판</a></li>
		</ul>
			<ul>
			<li>
			<a class="link" href="#">회원관리</a>
          		<ul class="dropdown">
            		<li><a class="link" href="logoutAction.jsp">로그아웃</a></li>
          		</ul>
          	</li>
		</ul>
	</nav>
	
	<div class=container>
		<div class="row">
			<form method="post" action="updateAction.jsp?bbsID=<%=bbsID%>">
				<table style="text-align: center; border: 1px slid #dddddd">
					<thead>
						<tr>
							<th colspan="2" style="background-color: #eeeeee; text-align: center;">게시판 글 수정 양식</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><input type="text" placeholder="글 제목" name="bbsTitle" maxlength="50" value="<%=bbs.getBbsTitle()%>"></td>
						</tr>
						<tr>
							<td><textarea placeholder="글 내용" name="bbsContent" maxlength="2048" style="height: 350px; value="<%=bbs.getBbsContent()%>"></textarea></td>
						</tr>
					</tbody>
				</table>
				<input type="submit" value="수정">
			</form>
		</div>
	</div>
	
</body>
</html>