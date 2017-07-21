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
	User user = new User();
//  ArrayList<User> friends = new ArrayList<User>();
//  ArrayList<Weibo> weibos = new ArrayList<Weibo>();
	if(request.getSession().getAttribute("user")== null){
		response.sendRedirect("homePro");
	}
	else{
		user = (User)request.getSession().getAttribute("user");
//		if(request.getAttribute("friends")!=null)
//			friends = (ArrayList<User>)request.getAttribute("friends");
//		if(request.getAttribute("weibos")!=null)
	//			weibos = (ArrayList<Weibo>)request.getAttribute("weibos");
%>

<div class="topbar">
<div class="topbody">
<h2 class="title">Tao For Fun!</h2>
<ul class="toplist">
	<li>
		<input type="text" name="search" placeholder="search something" id="searchthing"/>
		<button class="button" id="search-submit">Search</button>
	</li>
	<li><a href="getFriendsWeibosPro" class="active">Weibos  </a></li>
	<li><a href="getUserHomePro" class="active">  Me</a></li>
</ul>
</div>
</div>

<div class="nav">
	<div class="write-weibo">
	<a href="<%=path%>/taoforfun/jsp/userhomewriteweibo.jsp">
		<img src="<%=path%>/taoforfun/img/write.PNG" alt="writeWeibo" style="width:100px;height:100px;"/>
	</a>
	</div>
	<div class="nav-list">
		<p>Hot Weibos of this Topic</p>
		<p>...</p>
		<p>...</p>
		<p>Hot Interests</p>
		<p>...</p>
		<p>...</p>
	</div>
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
}
%>
<script src="https://code.jquery.com/jquery.js"></script>
<script src="<%=path %>/taoforfun/js/search.js"></script>

</body>
</html>