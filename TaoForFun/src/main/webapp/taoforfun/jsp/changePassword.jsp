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
<link href="<%=path%>/taoforfun/css/user.css" rel="stylesheet">
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
<div class="topbar">
<div class="topbody">
<h2 class="title">Tao For Fun!</h2>
<ul class="toplist">
	<li>
		<input type="text" name="search" placeholder="search something" id="searchthing"/>
		<button class="button" id="search-submit">Search</button>
	</li>
	<li><a href="/TaoForFun/index.jsp">  Log in</a></li>
</ul>
</div>
</div>

<div class="full-section">
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
<script src="<%=path %>/taoforfun/js/search.js"></script>
</body>
</html>