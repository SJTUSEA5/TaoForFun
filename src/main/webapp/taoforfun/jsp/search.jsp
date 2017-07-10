<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="model.User"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Tao For Fun - Search</title>

<%
	String path = request.getContextPath();
%>
<link href="<%=path%>/taoforfun/css/user.css" rel="stylesheet">
</head>
<body>

<%
// 	User user = new User();
//  ArrayList<User> friends = new ArrayList<User>();
//  ArrayList<Weibo> weibos = new ArrayList<Weibo>();
// 	if(request.getSession().getAttribute("user")== null){
// 		response.sendRedirect("homePro");
// 	}
// 	else{
// 		user = (User)request.getSession().getAttribute("user");
//		if(request.getAttribute("friends")!=null)
//			friends = (ArrayList<User>)request.getAttribute("friends");
//		if(request.getAttribute("weibos")!=null)
	//			weibos = (ArrayList<Weibo>)request.getAttribute("weibos");
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
<%-- 	<img src="<%=path%>/taoforfun/img/testGIF.gif" alt="testGIF" style="width:100px;height:100px;"/> --%>
<!-- 	<ul> -->
<%-- 		<li><%=user.getUsername() %></li> --%>
<!-- 		<li><a href="getUserHomePro" class="active">Home</a></li> -->
<!-- 		<li><a href="getUserProfilePro" class="active">Profile</a></li> -->
<!-- 		<li><a href="getUserAccountPro" class="active">Account</a></li> -->
<!-- 		<li><a href="getUserPermissionPro" class="active">Permissions</a></li> -->
<!-- 		<li><a href="logoutPro" class="active">Log out</a></li> -->
<!-- 	</ul> -->
<div>
<a href="writeWeiboPro">Write Weibo</a>
</div>
	<ul>
		<li>Hot Weibos of this Topic</li>
		<li>...</li>
		<li>...</li>
		<li>Hot Interests</li>
		<li>...</li>
		<li>...</li>
	</ul>
</div>

<div class="section">

<!-- 	<ul class="tab"> -->
<!-- 		<li><a href="getMyFriendsPro" class="active">Friends</a></li> -->
<!-- 		<li><a href="getMyWeibosPro" class="active">My Weibos</a></li> -->
<!-- 		<li><a href="getMyMessagesPro" class="active">Messages</a></li> -->
<!-- 		<li><a href="getSettingsPro" class="active">Settings</a></li> -->
<!-- 	</ul> -->
		
		<ul class="message">
			<li>Tag</li>
			<li>introduce</li>
			<li><a href="#">add interest</a></li>
		</ul>

</div>
<%
// }
%>
<script type="text/javascript" src="jquery-1.11.1.min.js"></script>

</body>
</html>