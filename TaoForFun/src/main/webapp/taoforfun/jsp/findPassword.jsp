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

<div class="full-section">
<div class="full-section-content">
<h2>Input your email address to change the password.</h2>
<div class="signinform">
	<form action="" method="post">
		<p>Email<input type="text" name="email"/></p>
		<input type="submit" value="Send" onclick="psfunc()"/>
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

<script>
function psfunc(){
	alert("We've sent an email to your email address. Please check it.");
}
</script>

</body>
</html>