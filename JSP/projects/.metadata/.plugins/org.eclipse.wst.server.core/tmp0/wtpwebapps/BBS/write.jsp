<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>

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
	%>
BINNY'S BOARD
	<nav id="navbar">
		<ul>
			<li><a class="link" href="main.jsp">메인</a></li>
			<li class="active"><a class="link" href="bbs.jsp">게시판</a></li>
		</ul>
		<%
			if ( userID == null ) {		//login이 되어있지 않은 사람만 접속하기가 뜨도록 
		%>
		
		<ul>
			<li>
			<a class="link" href="#">접속하기</a>
          		<ul class="dropdown">
            		<li><a class="link" href="login.jsp">로그인</a></li>
            		<li><a class="link" href="join.jsp">회원가입</a></li>
          		</ul>
          	</li>
		</ul>
			
		<% 
			} else {	//login이 된 사람이 볼 수 있는 
		%>
			<ul>
			<li>
			<a class="link" href="#">회원관리</a>
          		<ul class="dropdown">
            		<li><a class="link" href="logoutAction.jsp">로그아웃</a></li>
          		</ul>
          	</li>
		</ul>
		<% 
			}
		%>
	</nav>
	
	<div class=container>
		<div class="row">
			<form method="post" action="writeAction.jsp">
				<table style="text-align: center; border: 1px slid #dddddd">
					<thead>
						<tr>
							<th colspan="2" style="background-color: #eeeeee; text-align: center;">게시판 글쓰기 양식</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><input type="text" placeholder="글 제목" name="bbsTitle" maxlength="50"></td>
						</tr>
						<tr>
							<td><textarea placeholder="글 내용" name="bbsContent" maxlength="2048" style="height: 350px;"></textarea></td>
						</tr>
					</tbody>
				</table>
				<input type="submit" value="글쓰기">
			</form>
		</div>
	</div>
	
</body>
</html>