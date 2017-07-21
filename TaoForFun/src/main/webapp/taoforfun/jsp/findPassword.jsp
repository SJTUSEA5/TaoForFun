<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Tao For Fun - Password</title>

<%
	String path = request.getContextPath();
%>
<link href="<%=path%>/taoforfun/css/user.css" rel="stylesheet">
</head>
<body>
<%
	String message = "";
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
<div class="full-section-content">
<h2 id="sent-info">Input your email address to change the password.</h2>
<p style="text-align:center"><%=message %></p>

<div class="signinform">
	<form action="forgetPasswordPro" method="post">
		<p>Email<input type="text" name="email"/></p>
		<input type="submit" value="Send"/>
	</form>
<br>
<br>
<br>
<p id=sent></p>
<br><br>
<a href="/TaoForFun/index.jsp">Home page</a>
<br>
</div>
</div>
</div>

<script src="<%=path %>/taoforfun/js/search.js"></script>
</body>
</html>