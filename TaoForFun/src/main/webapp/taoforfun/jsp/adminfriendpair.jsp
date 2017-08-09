<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="model.User"%>
<%@ page import="model.Friendpair"%>
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
	ArrayList<Friendpair> friendpairlist = new ArrayList<Friendpair>();
	if(request.getSession().getAttribute("user")== null){
		response.sendRedirect("homePro");
	}
	else{
		admin = (User)request.getSession().getAttribute("user");
		if(!admin.getRole().regionMatches(true,0,"admin",0,5)){
			response.sendRedirect("homePro");//undone
		}
		else{
			if(request.getAttribute("friendpairs")!=null)
				friendpairlist = (ArrayList<Friendpair>)request.getAttribute("friendpairs");
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
	String userheadimgname = admin.getHeadimg();
	if(userheadimgname == null)userheadimgname = "default.png";
	headimg = headimg + userheadimgname;
%>
	<img src="<%=headimg %>" alt="userPNG"/>
	<ul>
		<li>*<%=admin.getUsername() %>*</li>
		<li><a href="getAllUsersPro" class="active">Users</a></li>
		<li><a href="getAllWeibosPro" class="active">Weibos</a></li>
		<li><a href="getAllFriendpairsPro" class="active">Friendpairs</a></li>
		<li><a href="getAllMessagesPro" class="active">Messages</a></li>
		<li><a href="logoutPro" class="active">Log out</a></li>
	</ul>
</div>

<div class="section">
	<table>
	<thead>
	<tr>
	<th>Pair ID</th>
	<th>User 1</th>
	<th>User 2</th>
	<th>Operation</th>
	</tr>
	</thead>
	<tbody>
<%
	for(int i = 0; i < friendpairlist.size(); i++){
		Friendpair friendpair = friendpairlist.get(i);	
%>
	<tr>
	<td><%=friendpair.getPairid()%></td>
	<td><%=friendpair.getUsername1()%></td>
	<td><%=friendpair.getUsername2()%></td>
	<td><a href="Javascript: void(0)" class="friendpairDetail" id="<%=friendpair.getPairid()%>">Detail</a></td>
	<td></td>
	</tr>
<%
}
%>
	</tbody>
	</table>
</div>
<%
	}
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
<script src="<%=path %>/taoforfun/js/search.js"></script>
</body>
</html>