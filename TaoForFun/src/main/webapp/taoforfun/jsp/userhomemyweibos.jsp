<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="model.User"%>
<%@ page import="model.Weibo"%>
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
	ArrayList<Weibo>myweibos = new ArrayList<Weibo>();
	if(request.getSession().getAttribute("user")== null){
		response.sendRedirect("homePro");
	}
	else{
		user = (User)request.getSession().getAttribute("user");	
		if(request.getSession().getAttribute("myweibos")!= null)
			myweibos = (ArrayList<Weibo>)request.getSession().getAttribute("myweibos");
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
		<li><%=user.getUsername() %></li>
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
		<li><a href="getMyWeibosPro" class="active">My Weibos</a></li>
		<li><a href="getMyMessagesPro">Messages</a></li>
		<li><a href="getMyNoticesPro">Notices</a></li>
	</ul>
<br>
<br>
<div>
<a href="">Write Weibo</a>
</div>
	<div class="dataTable">
	<table>
		<thead>
		<tr><th>My Weibos</th></tr>
		</thead>
		<tbody>
<%
	int i = 0;
	for(; i < myweibos.size(); i++){
		Weibo myweibo = myweibos.get(i);
%>
			<tr>
				<td><%= myweibo.getTime()%></td>
				<td><%= myweibo.getAdder()%></td>
				<td><%= myweibo.getContent()%></td>
				<td>
					<form action="deleteWeiboPro">
						<input type="hidden" name="weiboid" value="<%=myweibo.getWeiboid() %>"/>
						<input type="submit" value="delete"/>
					</form>
				</td>
			</tr>
<% 
	}
}
%>
	</tbody>
	</table>
	</div>
	

</div>

<script type="text/javascript" src="jquery-1.11.1.min.js"></script>

</body>
</html>