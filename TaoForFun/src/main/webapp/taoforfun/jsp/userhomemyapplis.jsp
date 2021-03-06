<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="model.User"%>
<%@ page import="model.Friendapplication"%>
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
	ArrayList<Friendapplication> applis = new ArrayList<Friendapplication>();
// 	if(request.getSession().getAttribute("user")== null){
// 		response.sendRedirect("homePro");	
// 	}
// 	else{
		user = (User)request.getSession().getAttribute("user");
		if(request.getSession().getAttribute("applis")!=null)
			applis = (ArrayList<Friendapplication>)request.getSession().getAttribute("applis");
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
	<%
	String headimg = path+"/taoforfun/img/UserHeadImg/";
	String userheadimgname = user.getHeadimg();
	if(userheadimgname == null)userheadimgname = "default.png";
	headimg = headimg + userheadimgname;
%>
	<img src="<%=headimg %>" alt="userPNG"/>
	<ul>
<%-- 		<li><%=user.getUsername() %></li> --%>
		<li><a href="getUserHomePro" class="active">Home</a></li>
		<li><a href="getUserProfilePro">Profile</a></li>
		<li><a href="getUserAccountPro">Account</a></li>
		<li><a href="getUserPermissionPro">Permissions</a></li>
		<li><a href="logoutPro">Log out</a></li>
	</ul>
</div>

<div class="section">

	<ul class="tab">
		<li><a href="getMyFriendsPro">Friends</a></li>
		<li><a href="getMyWeibosPro">My Weibos</a></li>
		<li><a href="getMyMessagesPro" class="active">Messages</a></li>
		<li><a href="getMyNoticesPro">Notices</a></li>
	</ul>
<br>
<br>
	<div class="dataTable message">
	<table>
		<thead>
		<tr><th>My Messages</th></tr>
		</thead>
		<tbody>
<%
// 	int i = 0;
// 	for(; i < applis.size(); i++){
// 		Friendapplication appli = applis.get(i);
%>
			<tr>
<%-- 				<td><%= appli.getUsername2()%></td> --%>
				<td>Friend Application Request</td>
				<td>
					<form action="">
						<input type="submit" value="reply"/>
					</form>
					<form action="">
						<input type="submit" value="ignore"/>
					</form>
				</td>
			</tr>
<% 
// 	}
// }
%>
	</tbody>
	</table>
	</div>
	

</div>
</div>

<script type="text/javascript" src="jquery-1.11.1.min.js"></script>
<script src="<%=path %>/taoforfun/js/search.js"></script>
</body>
</html>