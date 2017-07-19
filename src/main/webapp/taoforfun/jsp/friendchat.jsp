<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="model.User"%>
<%@ page import="model.Friendpair"%>
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
	User friend = new User();
	if(request.getSession().getAttribute("user")== null){
		response.sendRedirect("homePro");
	}
	else{
		user = (User)request.getSession().getAttribute("user");	
		if(request.getAttribute("friend")!= null)
			friend = (User)request.getAttribute("friend");	
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
	<div class="nav-gap"><p>Friend Name</p></div>
	<div class="nav-list">
		<p><a href="visitFriendHomePro" class="active">Home</a></p>
		<p><a href="getUserProfilePro">Send Message</a></p>
		<p><a href="deleteFriendPro">Delete Friend</a></p>
	</div>
</div>

<div class="section">

<!-- 	<ul class="tab"> -->
<!-- 		<li><a href="getMyFriendsPro" class="active">Friends</a></li> -->
<!-- 		<li><a href="getMyWeibosPro">My Weibos</a></li> -->
<!-- 		<li><a href="getMyMessagesPro">Messages</a></li> -->
<!-- 		<li><a href="getMyNoticesPro">Notices</a></li> -->
<!-- 	</ul> -->
<!-- 	<br> -->
<!-- 	<br> -->
	<div class="dataTable">
		<h2>Friend Chatting</h2>
		<form action="#" method="post" class="Form">
				<textarea rows="12" cols="50" id="TextArea2" name="content"></textarea><br>
				<input type="submit" value="send"/>	
		</form>
	</div>
</div>
<% 
}
%>
<script type="text/javascript" src="jquery-1.11.1.min.js"></script>
</div>
</body>
</html>