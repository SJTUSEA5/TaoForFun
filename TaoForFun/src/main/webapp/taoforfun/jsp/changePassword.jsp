<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Tao For Fun - Password</title>

<%
	String path = request.getContextPath();
%>
<link rel="stylesheet" type="text/css" href="<%=path%>/taoforfun/css/imgareaselect-default.css" />
<link href="<%=path %>/taoforfun/css/font-awesome.min.css" rel="stylesheet">
<link href="<%=path%>/taoforfun/css/bootstrap.min.css" rel="stylesheet">
<link href="<%=path%>/taoforfun/css/default.css" rel="stylesheet">
<link href="<%=path%>/taoforfun/css/style.css" rel="stylesheet">
</head>
<body>
<%
	int userid = 0;
String message = "";
	if(request.getParameter("userid")!=null)
		userid = Integer.valueOf(request.getParameter("userid"));
	if (session.getAttribute("message")!=null)
		message = (String)session.getAttribute("message");
%>
<nav>
<h2 class="title" id="logo">Tao For Fun!</h2>
<div id="nav-blocks">
	<form id="searchForm" action="searchPro" method="post">	
	</form>
	<input type="text" name="search" placeholder="search something" id="searchthing"/>
	<button class="btn btn-default" id="search-submit" style="margin:0 15px">Search  </button>
	<a href="/TaoForFun/index.jsp" style="margin:15px">  Log in</a>
</div>
</nav>

<div id="page">

<div id="section">
<div class="section-content">
	<form action="updatePasswordPro" method="post">
		<p><%=message %></p>
		<input type="hidden" name="userid" value="<%=userid %>"/>
		<p>New Password<input type="password" name="newpassword"/></p>
		<p>Confirm New Password<input type="password" name="newconfirm"/></p>
		<p><input type="submit" value="Change Password"/>
	</form>
<br>
<br>
<br>

<br><br>
<a href="/TaoForFun/index.jsp">Home page</a>
</div>
</div>
</div>
<script src="https://code.jquery.com/jquery.js"></script>
<script src="<%=path %>/taoforfun/js/bootstrap.min.js"></script>
<script src="<%=path %>/taoforfun/js/user.js"></script>
<script src="<%=path %>/taoforfun/js/search.js"></script>
<script type="text/javascript" src="scripts/jquery.min.js"></script>
<script type="text/javascript" src="scripts/jquery.imgareaselect.pack.js"></script>
<script src='<%=path %>/taoforfun/js/velocity.min.js'></script>
<script src='<%=path %>/taoforfun/js/sideToggleExtended.js'></script>
</body>
</html>