<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
			<li><a class="link" href="main.jsp">메인</a></li>
			<li><a class="link" href="bbs.jsp">게시판</a></li>
			<li>
          		<a class="link" href="#">접속하기</a>
          		<ul class="dropdown">
            		<li><a class="link" href="login.jsp">로그인</a></li>
            		<li><a class="link" href="join.jsp">회원가입</a></li>
          		</ul>
        	</li>
		</ul>
	</nav>
	
	<form method="post" action="joinAction.jsp">
		<h3>회원가입</h3>
		<input type="text" placeholder="아이디" name="userID" maxlength="20">
		<input type="password" placeholder="비밀번호" name="userPassword">
		<input type="text" placeholder="이름" name="userName">
		<div class="btn-group">
		<input type="radio" name="userGender" autocomplete="off" value="남자" checked>남자
		<input type="radio" name="userGender" autocomplete="off" value="여자">여자
		</div>
		<input type="email" placeholder="이메일" name="userEmail">
		<input type="submit" value="회원가입">
	</form>
</body>
</html>