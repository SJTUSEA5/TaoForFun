<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="model.User"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Tao For Fun - User Account</title>

<%
	String path = request.getContextPath();
%>
<link rel="stylesheet" type="text/css" href="<%=path%>/taoforfun/css/imgareaselect-default.css" />
<link href="<%=path %>/taoforfun/css/font-awesome.min.css" rel="stylesheet">
<link href="<%=path%>/taoforfun/css/bootstrap.min.css" rel="stylesheet">
<link href="<%=path%>/taoforfun/css/style.css" rel="stylesheet">
</head>
<body>
<%
	User admin = new User();
	ArrayList<User> userlist = new ArrayList<User>();
	if(request.getSession().getAttribute("user")== null){
		response.sendRedirect("homePro");
	}
	else{
		admin = (User)request.getSession().getAttribute("user");
		if(!admin.getRole().regionMatches(true,0,"admin",0,5)){
			response.sendRedirect("homePro");//undone
		}
		else{
			if(request.getAttribute("users")!=null)
				userlist = (ArrayList<User>)request.getAttribute("users");
%>
<nav>
<h2 class="title" id="logo">Tao For Fun!</h2>
<div id="nav-blocks">
	<input type="text" name="search" placeholder="search something" id="searchthing"/>
	<button class="btn btn-default" id="search-submit" style="margin:0 15px">Search  </button>
	<a href="getFriendsWeibosPro" class="active" style="margin:15px">  Weibos  </a>
	<a id="sideMenu" style="cursor:pointer;margin:15px">  Me</a>
</div>
</nav>

<div id="page">

<div id="sideMenuContainer">
	<div id="side-head">
<%
	String headimg = path+"/taoforfun/img/UserHeadImg/";
	String userheadimgname = admin.getHeadimg();
	if(userheadimgname == null)userheadimgname = "default.png";
	headimg = headimg + userheadimgname;
%>
	<img src="<%=headimg %>" alt="userPNG" style="width:100px;height:100px;border-radius:50%;cursor:pointer"
	 data-toggle="modal" data-target="#picModal"/>
	</div>
	<div id="side-gap"><p><%=admin.getUsername() %></p></div>
	<div id="side-list">
		<p><a href="getAllUsersPro">Users</a></p>
		<p><a href="getAllWeibosPro">Weibos</a></p>
		<p><a href="getAllFriendpairsPro">Friendpairs</a></p>
		<p><a href="getAllMessagesPro">Messages</a></p>
		<p><a href="getUserProfilePro">Admin Quit</a></p>
		<p><a href="logoutPro">Log out</a></p>
	</div>
</div>

<div id="section">
<div class="section-content">
<h2 class="heading">Users</h2>
	<table style="font-size:16px;">
	<thead>
	<tr>
	<th>User ID</th>
	<th>User Name</th>
	<th>Password</th>
	<th>Email</th>
	<th>Role</th>
	<th>Operation</th>
	</tr>
	</thead>
	<tbody>
<%
	for(int i = 0; i < userlist.size(); i++){
		User user = userlist.get(i);	
%>
	<tr>
	<td><%=user.getUserid()%></td>
	<td><%=user.getUsername()%></td>
	<td><%=user.getPassword()%></td>
	<td><%=user.getEmail()%></td>
	<td><%=user.getRole()%></td>
	<td><a href="Javascript: void(0)" class="user-delete btn-small" data-userid="<%=user.getUserid()%>">Delete</a></td>
	</tr>
<%
}
%>
	</tbody>
	</table>
</div>
</div>
<%
	}
%>
<script src="https://code.jquery.com/jquery.js"></script>
<script src="<%=path %>/taoforfun/js/bootstrap.min.js"></script>
<script src="<%=path %>/taoforfun/js/user.js"></script>
<script src="<%=path %>/taoforfun/js/search.js"></script>
<script src="<%=path%>/taoforfun/js/admin.js"></script>
<script type="text/javascript" src="scripts/jquery.min.js"></script>
<script type="text/javascript" src="scripts/jquery.imgareaselect.pack.js"></script>
<script src='<%=path %>/taoforfun/js/velocity.min.js'></script>
<script src='<%=path %>/taoforfun/js/sideToggleExtended.js'></script>
<script>
$(document).ready(function(){
	  $('#sideMenu').sideToggle({
		moving: '#sideMenuContainer',
		direction: 'right'
	  });

	});
</script>

<%
}
%>
</div>
</body>
</html>