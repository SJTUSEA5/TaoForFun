<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="model.User"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Tao For Fun - User Account</title>

<%
	String path = request.getContextPath();
%>
<link href="<%=path%>/taoforfun/css/user.css" rel="stylesheet">
</head>
<body>
<%
	User user = new User();
	if(request.getSession().getAttribute("user")== null){
		response.sendRedirect("homePro");
	}
	else{
		user = (User)request.getSession().getAttribute("user");
%>
<div class="topbar">
<div class="topbody">
<h2 class="title">Tao For Fun!</h2>
<ul class="toplist">
	<li><form id="search">
		<input type="text" name="search" placeholder="search something"/>
		<input type="submit" value="Search"/>
	</form></li>
	<li><a href="getFriendsWeibosPro" class="active">Weibos  </a></li>
	<li><a href="getUserHomePro" class="active">  Me</a></li>
</ul>
</div>
</div>

<div class="page">

<div class="nav">
	<div class="nav-head">
	<img src="<%=path%>/taoforfun/img/user.png" alt="userPNG" style="width:100px;height:100px;"/>
	</div>
	<div class="nav-gap"><p><%=user.getUsername() %></p></div>
	<div class="nav-list">
			<p><a href="getUserHomePro">Home</a></p>
			<p><a href="getUserProfilePro">Profile</a></p>
			<p><a href="getUserAccountPro">Account</a></p>
			<p><a href="getUserPermissionPro">Permissions</a></p>
			<p><a href="logoutPro">Log out</a></p>
	</div>
</div>

<div class="section">	
<div class="section-content">
	<form action="updateUserProfilePro" method="post">
		<p>New Password<input type="password" name="newpassword"/></p>
		<p>Confirm New Password<input type="password" name="confirmnew"/></p>
		<p><input type="submit" value="Change Password"/>
	</form>
	
	<p><a href="findPasswordPro">forget the old password?</a></p>
	
	<form action="deleteAccountPro" method="post">
		<input type="hidden" name="userid" value="<%=user.getUserid()%>"/>
		<input type="submit" value="Delete Account" onclick="return warnDelete()"/>Warning: This operation cannot be undone!
	</form>
	<a href="getAllUsersPro">Admin-Users</a>
</div>
</div>
<%
}
%>
<script>
function warnDelete(){
	if(confirm("Are you sure to delete your account and all related information?")){
		return true;
	}else{
		return false;
	}
		
}
</script>
</div>
</body>
</html>