<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="model.User"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Tao For Fun - User Home</title>

<%
	String path = request.getContextPath();
%>
<link href="<%=path%>/taoforfun/css/user.css" rel="stylesheet">
</head>
<body>

<%
	User user = new User();
	ArrayList<User>friends = new ArrayList<User>();
	if(request.getSession().getAttribute("user")== null){
		response.sendRedirect("homePro");
	}
	else{
		user = (User)request.getSession().getAttribute("user");	
		if(request.getAttribute("friends")!= null)
			friends = (ArrayList<User>)request.getAttribute("friends");	
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

	<ul class="tab">
		<li><a href="getMyFriendsPro" class="active">Friends</a></li>
		<li><a href="getMyWeibosPro">My Weibos</a></li>
		<li><a href="getMyMessagesPro">Messages</a></li>
		<li><a href="getMyNoticesPro">Notices</a></li>
	</ul>
<br>
<br>
<div class="section-content">
<div id="dataTables">
	<h2>My Friends</h2>
<%
	for(int i = 0; i < friends.size(); i++){
		User friend = friends.get(i);
%>

<div class="message firendForm">
	<div class="section-data-header">
		<p>Friend Name: <%= friend.getUsername()%></p>
	</div>
	<div class="section-data-body"></div>
	<div class="section-data-footer">
		<form action="messageFriendPro" method="post">
			<input type="hidden" name="userid" value="<%=friend.getUserid() %>"/>
			<input type="submit" value="Message"/>
		</form>
		<form action="visitFriendHomePro" method="post">
			<input type="hidden" name="userid" value="<%=friend.getUserid() %>"/>
			<input type="submit" value="Visit"/>
		</form>
	</div>
</div>
<% 
	} 
%>

</div>
</div>
</div>	

</div>
<script type="text/javascript" src="jquery-1.11.1.min.js"></script>
<%} %>
</body>
</html>