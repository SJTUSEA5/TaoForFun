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
<link href="<%=path%>/taoforfun/css/user.css" rel="stylesheet">
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
	<div class="nav-gap"><p>*<%=admin.getUsername() %>*</p></div>
	<div class="nav-list">	
		<p><a href="getAllUsersPro" class="active">Users</a></p>
		<p><a href="getAllWeibosPro" class="active">Weibos</a></p>
		<p><a href="getAllFriendpairsPro" class="active">Friendpairs</a></p>
		<p><a href="getAllMessagesPro" class="active">Messages</a></p>
		<p><a href="logoutPro" class="active">Log out</a></p>
	</div>
</div>

<div class="section">
<div class="section-content">
<h2>Users</h2>
	<table>
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
	<td><a href="Javascript: void(0)"  id="<%=user.getUserid()%>">Delete</a></td>
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
<script>
function warnDelete(){
	if(confirm("Are you sure to delete your account and all related information?")){
		return true;
	}else{
		return false;
	}
		
}
</script>
<%
}
%>
</div>
</body>
</html>