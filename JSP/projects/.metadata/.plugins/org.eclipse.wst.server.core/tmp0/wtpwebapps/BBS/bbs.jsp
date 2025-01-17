<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="bbs.BbsDAO" %>
<%@ page import="bbs.Bbs" %>
<%@ page import="java.util.ArrayList" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BINNY'S BOARD</title>
<style>
	a, a:hover {
		color: #000000;
		text-decoration: none;
	}
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
	int pageNumber = 1; //기본 페이지 
	if ( request.getParameter("pageNumber") != null ) {
		pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
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
			<table style="text-align: center; border: 1px slid #dddddd">
				<thead>
					<tr>
						<th style="background-color: #eeeeee; text-align: center;">번호</th>
						<th style="background-color: #eeeeee; text-align: center;">제목</th>
						<th style="background-color: #eeeeee; text-align: center;">작성자</th>
						<th style="background-color: #eeeeee; text-align: center;">작성일</th>
					</tr>
				</thead>
				<tbody>
					<%
						BbsDAO bbsDAO = new BbsDAO();
						ArrayList<Bbs> list = bbsDAO.getList(pageNumber);
						for ( int i = 0; i < list.size(); i++ ) {
					%>
					<tr>
						<td><%= list.get(i).getBbsID() %></td>
						<td><a href="view.jsp?bbsID=<%=list.get(i).getBbsID()%>"><%=list.get(i).getBbsTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>")%></a></td>
						<td><%= list.get(i).getUserID() %></td>
						<td><%= list.get(i).getBbsDate().substring(0, 11) + list.get(i).getBbsDate().substring(11, 13) + "시" +  list.get(i).getBbsDate().substring(14, 16) + "분" %></td>
					</tr>
					<% }
					%>
					
				</tbody>
			</table>
			<%
				if (pageNumber != 1) {
			%>
				<a href="bbs.jsp?pageNumber=<%=pageNumber-1%>">이전</a>
			<%
			} if (bbsDAO.nextPage(pageNumber+1)) {
			%>
				<a href="bbs.jsp?pageNumber=<%=pageNumber+1%>">다음</a>
			<% 
				}
			%>
			<button type="button" onclick="location.href='write.jsp' ">글쓰기</button>
		</div>
	</div>
	
</body>
</html>