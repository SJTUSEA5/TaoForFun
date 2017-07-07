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
	User friend = new User();
	if(request.getSession().getAttribute("user") == null){
		response.sendRedirect("homePro");
	}
	else{
		user = (User)request.getSession().getAttribute("user");
		if(request.getSession().getAttribute("friend") != null)
			friend = (User)request.getSession().getAttribute("friend");
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
		<li><%=friend.getUsername() %></li>
		<li><a href="getUserHomePro" class="active">Home</a></li>
		<li><a href="getMessageBoxPro" class="active">Send Message</a></li>
		<li><a href="deleteFriendPro" class="active">Delete Friend</a></li>
	</ul>
</div>



<div class="section">
	<ul>
		<li>Name: <%=friend.getUsername()%></li>
		<li>Gender: </li>
		<li>Age: </li>
		<li>City: </li>
		<li>Email: <%=friend.getEmail()%></li>
		<li>Birthday: </li>
		<li>Phone: </li>
		<li>Introduction: </li>
	</ul>
	<h2>Latest Weibos</h2>
	<br>
<%
	ArrayList<Weibo> fweibos = new ArrayList<Weibo>();
	int i = 0;
	for(;i < fweibos.size();i++){
		Weibo fweibo = fweibos.get(i);
		
%>	
	<ul>
	<li><%=fweibo.getTime() %></li>
	<li><%=fweibo.getContent() %></li>
	</ul>
</div>
<%
		}
	}
%>
<script type="text/javascript" src="jquery-1.11.1.min.js"></script>

</body>
</html>