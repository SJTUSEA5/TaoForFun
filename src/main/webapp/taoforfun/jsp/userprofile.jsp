<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="model.User"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Tao For Fun - User Profile</title>

<%
	String path = request.getContextPath();
%>
<link href="<%=path%>/taoforfun/css/user.css" rel="stylesheet">
</head>
<body>

<%
	User user = new User();
	if(request.getSession().getAttribute("user")!= null){
		user = (User)request.getSession().getAttribute("user");
	}
%>

<div class="topbar">
<div class="topbody">
<h2 class="title">Tao For Fun!</h2>
<ul class="toplist">
	<li><form id="search">
		<input type="text" name="search" placeholder="search something"/>
		<input type="submit" value="Search"/>
	</form></li>
	<li><a href="getAllWeibosPro" class="active">Weibos  </a></li>
	<li><a href="getUserHomePro" class="active">  Me</a></li>
</ul>
</div>
</div>

<div class="nav">
	<img src="<%=path%>/taoforfun/img/testGIF.gif" alt="testGIF" style="width:100px;height:100px;"/>
	<ul>
		<li>UserName</li>
		<li><a href="getUserHomePro">Home</a></li>
		<li><a href="getUserProfilePro">Profile</a></li>
		<li><a href="getUserAccountPro">Account</a></li>
		<li><a href="getUserPermissionPro">Permissions</a></li>
		<li><a href="logoutPro">Log out</a></li>
</ul>
</div>

<div class="section">
	<form action="" method="get">
		<p>Name<input type="text" name="username" value="<%=user.getUsername()%>"/></p>
		<p>Gender<input type="text" name="gender" value=""/></p>
		<p>Age<input type="text" name="age" value=""/></p>
		<p>City<input type="text" name="city" value=""/></p>
		<p>Email<input type="text" name="email" value="<%=user.getEmail()%>"/></p>
		<p>Birthday<input type="text" name="birthday" value=""/></p>
		<p>Phone<input type="text" name="phone" value=""/></p>
		<p>Introduction<input type="text" name="intro" value=""/></p>
		<input type="submit" value="Update"/>
	</form>
</div>
	

<script type="text/javascript" src="jquery-1.11.1.min.js"></script>


</body>
</html>