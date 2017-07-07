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
// 	if(request.getSession().getAttribute("user")== null){
// 		response.sendRedirect("homePro");
// 	}
// 	else{
// 		user = (User)request.getSession().getAttribute("user");	
// 		if(request.getSession().getAttribute("myweibos")!= null)
// 			myweibos = (ArrayList<Weibo>)request.getSession().getAttribute("myweibos");
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

</div>
	<div class="weiboForm">
	<h2>Write Weibo</h2>
	<form action="addWeiboPro" method="post" class="Form">
		<div class="wordCount" id="wordCount">
	    	<p>words remaining</p>
	    	<span class="wordage"><span id="sy">140</span></span><br>
				<textarea rows="12" cols="50" id="TextArea1" onkeyup="checkLength(this);" name="content">
				</textarea><br>
				<input type="submit" value="submit"/>
		</div>		
	</form>
	

<script type="text/javascript">
function checkLength(which) {
	var maxChars = 140; //
	if(which.value.length > maxChars){
		alert("140 words only!");
		
		which.value = which.value.substring(0,maxChars);
		return false;
	}else{
		var curr = maxChars - which.value.length; 
		document.getElementById("sy").innerHTML = curr.toString();
		return true;
	}
}
function clearDefault(el) { 
	if (el.defaultValue==el.value) el.value = "" 
	   } 
</script>	

<%-- <%  --%>
<!-- } -->
<%-- %> --%>

	</div>

</div>

<!-- <script type="text/javascript" src="jquery-1.11.1.min.js"></script> -->
<script src="http://lib.sinaapp.com/js/jquery/1.10.2/jquery-1.10.2.min.js"></script>
</body>
</html>