<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="model.User"%>
<%@ page import="model.Weibo"%>
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
	ArrayList<Weibo> weibolist = new ArrayList<Weibo>();
	if(request.getSession().getAttribute("user")== null){
		response.sendRedirect("homePro");
	}
	else{
		admin = (User)request.getSession().getAttribute("user");
		if(!admin.getRole().regionMatches(true,0,"admin",0,5)){
			response.sendRedirect("homePro");//undone
		}
		else{
			if(request.getAttribute("weibos")!=null)
				weibolist = (ArrayList<Weibo>)request.getAttribute("weibos");
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

<div class="nav">
	<img src="<%=path%>/taoforfun/img/user.png" alt="userPNG" style="width:100px;height:100px;"/>
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
	<th>Weibo ID</th>
	<th>Adder</th>
	<th>Content</th>
	<th>Time</th>
	<th>Detail</th>
	<th>Operation</th>
	</tr>
	</thead>
	<tbody>
<%
	for(int i = 0; i < weibolist.size(); i++){
		Weibo weibo = weibolist.get(i);	
%>
	<tr>
	<td><%=weibo.getWeiboid()%></td>
	<td><%=weibo.getAdder()%></td>
	<td><%=weibo.getContent()%></td>
	<td><%=weibo.getTime()%></td>
	<td><a href="Javascript: void(0)" class="weiboDetail" id="<%=weibo.getWeiboid()%>">Detail</a></td>
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
</body>
</html>