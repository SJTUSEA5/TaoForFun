<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Tao For Fun - Register</title>

<%
	String path = request.getContextPath();
%>
<link href="<%=path%>/taoforfun/css/user.css" rel="stylesheet">
</head>
<body>

<div class="topbar">
<div class="topbody">
<h2 class="title">Tao For Fun!</h2>
<ul class="toplist">
	<li><form id="search">
		<input type="text" name="search" placeholder="search something"/>
		<input type="submit" value="Search"/>
	</form></li>
	<li><a href="/TaoForFun/index.jsp">  Log in</a></li>
</ul>
</div>
</div>

<div class="section">
<h2>Input your information to join us!</h2>
<h2>${sessionScope.msg}</h2>
<div class="signinform">
	<form action="registerPro" method="post">
		<p>UserName<input type="text" name="username"/></p>
		<p>Email<input type="text" name="email"/></p>
		<p>Password<input type="password" name="password"/></p>
		<p>Confirm Password<input type="password" name="confirmpassword"/></p>
		<input type="submit" value="Sign in"/>
	</form>
	<a href="/TaoForFun/index.jsp">back</a>
</div>
</div>

</body>
</html>