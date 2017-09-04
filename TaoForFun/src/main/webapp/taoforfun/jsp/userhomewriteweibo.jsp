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
<link rel="stylesheet" type="text/css" href="<%=path%>/taoforfun/css/imgareaselect-default.css" />
<link href="<%=path %>/taoforfun/css/font-awesome.min.css" rel="stylesheet">
<link href="<%=path%>/taoforfun/css/bootstrap.min.css" rel="stylesheet">
<link href="<%=path%>/taoforfun/css/style.css" rel="stylesheet">
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
	<h2 class="heading">Write Weibo</h2>
	
	<div style="width:100%">
	<div class="weiboForm">
		<div class="writeweibo-box">
			<form action="addPersonalWeiboPro" method="post" class="Form">
				<div class="wordCount" id="wordCount">
					<span id="weibowarn"></span><br>
					<div style="margin:10px 120px;">
		    			<span class="wordage">words remaining: <span id="sy">140</span></span><br>
		    		</div>
					<input type="hidden" name="content" id="submitContent"/><br>
					<div style="text-align:center">
					<textarea rows="12" cols="70" id="weiboContent" onkeyup="checkLength(this);"></textarea><br>
					</div>
					<div style="text-align:right;margin:20px 120px;">
						<input type="submit" value="submit" onclick="return getContent()" class="btn"/>
					</div>
				</div>		
			</form>
		</div>

<script type="text/javascript">
function getContent(){
	var c = document.getElementById("weiboContent").value;
	
	if(c == ""){
		document.getElementById("weibowarn").innerHTML = "Empty content cannot be submitted!";
		return false;
	}
	else{
		if(c.length > 140){
			document.getElementById("weibowarn").innerHTML = "Too many words!";
			return false;
		}
		else{
			document.getElementById("submitContent").value = c;
			return true;
		}
	}
}

function checkLength(which) {
	var maxChars = 140;
	document.getElementById("weibowarn").innerHTML = "";
	if(which.value.length > maxChars){
		document.getElementById("weibowarn").innerHTML = "140 words only!";
		
		//which.value = which.value.substring(0,maxChars);
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

	</div>
	</div>
</div>
</div>

</div>
<% 
}
%>
<script src="https://code.jquery.com/jquery.js"></script>
<script src="<%=path %>/taoforfun/js/bootstrap.min.js"></script>
<script src="<%=path %>/taoforfun/js/user.js"></script>
<script src="<%=path %>/taoforfun/js/search.js"></script>
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
</body>
</html>