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
<link rel="stylesheet" type="text/css" href="<%=path%>/taoforfun/css/imgareaselect-default.css" />
<link href="<%=path %>/taoforfun/css/font-awesome.min.css" rel="stylesheet">
<link href="<%=path%>/taoforfun/css/bootstrap.min.css" rel="stylesheet">
<link href="<%=path%>/taoforfun/css/default.css" rel="stylesheet">
<link href="<%=path%>/taoforfun/css/style.css" rel="stylesheet">t">
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

<nav>
<h2 class="title" id="logo">Tao For Fun!</h2>
<div id="nav-blocks">
	<form id="searchForm" action="searchPro" method="post">	
	</form>
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
	String userheadimgname = user.getHeadimg();
	if(userheadimgname == null)userheadimgname = "default.png";
	headimg = headimg + userheadimgname;
%>
	<img src="<%=headimg %>" alt="userPNG" style="width:100px;height:100px;border-radius:50%;cursor:pointer"
	 data-toggle="modal" data-target="#picModal"/>
	</div>
	<div id="side-gap"><p><%=user.getUsername() %></p></div>
	<div id="side-list">
			<p><a href="getUserProfilePro">Profile</a></p>
			<p><a href="getMyWeibosPro" class="active">My Weibos</a></p>
			<p><a href="getMyFriendsPro">Friends</a></p>
			<p><a href="getMyMessagesPro">Messages</a></p>
			<p><a href="getMyNoticesPro">Notices</a></p>
			<p><a href="getUserAccountPro">Account</a></p>
			<p><a href="getUserPermissionPro">Permissions</a></p>
			<p><a href="logoutPro">Log out</a></p>
	</div>
</div>

<div id="section">

<div class="section-content">
<h2 class="heading">My Friends</h2>
<div id="dataTables">
	
<%
	for(int i = 0; i < friends.size(); i++){
		User friend = friends.get(i);
%>

<div class="message firendForm">
	<div class="section-data-header">
	<%
	String fimg = path+"/taoforfun/img/UserHeadImg/";
	String fheadimgname = friend.getHeadimg();
	if(fheadimgname == null)fheadimgname = "default.png";
	fimg = fimg + fheadimgname;
%>
	<img class="friend-head-img" src="<%=fimg %>" alt="userPNG"/><%= friend.getUsername()%></p>
	</div>
	<div class="section-data-body">
<!-- 		<h4>Latest Weibo</h4> -->
	</div>
	<div class="section-data-footer">
	<div style="text-align:right">
		<form action="messageFriendPro" method="post" name="messageForm">
			<input type="hidden" name="receiveid" value="<%=friend.getUserid() %>"/>
		</form>
		<form action="visitFriendHomePro" method="post" name="visitForm">
			<input type="hidden" name="userid" value="<%=friend.getUserid() %>"/>
		</form>
		<button onclick="JavaScript:document.messageForm.submit();" class="btn-small">Message</button>
		<button onclick="JavaScript:document.visitForm.submit();" class="btn-small">Visit</button>
	</div>
	</div>
</div>
<% 
	} 
%>

</div>
</div>
</div>	

</div>
<%} %>
<script src="https://code.jquery.com/jquery.js"></script>
<script src="<%=path %>/taoforfun/js/bootstrap.min.js"></script>
<script src="<%=path %>/taoforfun/js/user.js"></script>
<script src="<%=path %>/taoforfun/js/search.js"></script>
<script type="text/javascript" src="scripts/jquery.min.js"></script>
<script type="text/javascript" src="scripts/jquery.imgareaselect.pack.js"></script>
<script src='<%=path %>/taoforfun/js/velocity.min.js'></script>
<script src='<%=path %>/taoforfun/js/jquery.jebox.js'></script>
<script src='<%=path %>/taoforfun/js/jquery.jebox.min.js'></script>
<script src='<%=path %>/taoforfun/js/jquery-1.7.2.js'></script>
<script src='<%=path %>/taoforfun/js/sideToggleExtended.js'></script>
<script>
$(document).ready(function(){
  $('#sideMenu').sideToggle({
	moving: '#sideMenuContainer',
	direction: 'right'
  });

});

</script>
</body>
</html>