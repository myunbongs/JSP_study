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
BINNY'S BOARD
	<nav id="navbar">
		<ul>
			<li class="active"><a class="link" href="main.jsp">메인</a></li>
			<li><a class="link" href="bbs.jsp">게시판</a></li>
		</ul>
		<ul>
			<li>
			<a class="link" href="#">접속하기</a>
          		<ul class="dropdown">
            		<li><a class="link" href="login.jsp">로그인</a></li>
            		<li><a class="link" href="join.jsp">회원가입</a></li>
          		</ul>
          	</li>
		</ul>
	</nav>
	
	<form method="post" action="loginAction.jsp">
		<h3>로그인</h3>
		<input type="text" placeholder="아이디" name="userID" maxlength="20">
		<input type="password" placeholder="비밀번호" name="userPassword">
		<input type="submit" value="로그인">
	</form>
</body>
</html>