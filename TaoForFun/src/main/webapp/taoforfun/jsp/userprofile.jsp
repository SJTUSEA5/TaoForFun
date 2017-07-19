<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="model.User"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Tao For Fun - User Profile</title>

<%
	String path = request.getContextPath();
%>
<link href="<%=path%>/taoforfun/css/user.css" rel="stylesheet">
<link href="<%=path%>/taoforfun/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<%
	User user = new User();
	if(request.getSession().getAttribute("user")== null){
		response.sendRedirect("homePro");
	}
	else{
		user = (User)request.getSession().getAttribute("user");
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
	<img src="<%=path %>/taoforfun/img/UserHeadImg/<%=user.getHeadimg() %>" alt="userPNG" style="width:100px;height:100px;"/>
	</div>
	<div class="nav-gap"><p><%=user.getUsername() %></p></div>
	<div class="nav-list">
			<p><a href="getUserHomePro">Home</a></p>
			<p><a href="getUserProfilePro">Profile</a></p>
			<p><a href="getUserAccountPro">Account</a></p>
			<p><a href="getUserPermissionPro">Permissions</a></p>
			<p><a href="logoutPro">Log out</a></p>
	</div>
</div>

<div class="section">
	<div class="section-content">
		<form action="updateUserProfilePro" method="post">
			<input type="hidden" name="userid" value="<%=user.getUserid()%>"/>
			<p>Name<input type="text" name="username" value="<%=user.getUsername()%>"/> Gender<input type="text" name="gender" value=""/></p>
			<p>Age<input type="text" name="age" value=""/> Birthday<input type="text" name="birthday" value=""/></p>
			<p>Email<input type="text" name="email" value="<%=user.getEmail()%>"/> Phone<input type="text" name="phone" value=""/></p>
			<p>City<input type="text" name="city" value=""/></p>
			<p>Introduction</p>
			<textarea rows="8" cols="40" id="introContent" ></textarea><br>
			<input type="hidden" name="intro" id="submitContent"/>
			<input type="submit" value="Update" onclick="return getContent()"/>
		</form>
			<br>
			<button class="btn btn-primary btn-lg" data-toggle="modal" data-target="#picModal">Upload Head Portrait</button>
	</div>
</div>



<div class="modal fade" id="picModal" tabindex="-1" role="dialog" aria-labelledby="picModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="picModalLabel">Upload A Picture</h4>
            </div>
            <div class="modal-body">
            	<p>nax size:2MB</p>
	            <div class="img-body">
	            	<form enctype="multipart/form-data" method="post" name="headimgform" id="headimgform">
	            		<input type="file" name="pic" id="picpath" accept="image/*" />
	            	</form>
	            	<span class="close close-img" style="display:none">&times;</span>
	            	<img src="" class="img1" />
					
				</div>
				<div class="img-view">
					<img src="" class="img1" />
				</div>
			</div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary" id="pic-save">Save</button>
            </div>
        </div>
    </div>
</div>

<%
}
%>	

</div>
<script src="https://code.jquery.com/jquery.js"></script>
<script src="<%=path %>/taoforfun/js/bootstrap.min.js"></script>
<script src="<%=path %>/taoforfun/js/user.js"></script>
<script>
function getContent(){
	var c = document.getElementById("introContent").value;
	document.getElementById("submitContent").value = document.getElementById("introContent").value;
	return true;
}

// $(document).ready(function() {
// 	$('#picModal').modal({
//         keyboard: true
//     });
// });
</script>

</body>
</html>