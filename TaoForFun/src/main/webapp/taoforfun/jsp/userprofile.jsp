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
<link rel="stylesheet" type="text/css" href="<%=path%>/taoforfun/css/imgareaselect-default.css" />
<link href="<%=path%>/taoforfun/css/bootstrap.min.css" rel="stylesheet">
<link href="<%=path%>/taoforfun/css/user.css" rel="stylesheet">
</head>
<body onload="setgender()">

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
	<li>
		<input type="text" name="search" placeholder="search something" id="searchthing"/>
		<button class="button" id="search-submit">Search</button>
	</li>
	<li><a href="getFriendsWeibosPro" class="active">Weibos  </a></li>
	<li><a href="getUserHomePro" class="active">  Me</a></li>
</ul>
</div>
</div>

<div class="page">

<div class="nav">
	<div class="nav-head">
<%
	String headimg = path+"/taoforfun/img/UserHeadImg/";
	String userheadimgname = user.getHeadimg();
	if(userheadimgname == null)userheadimgname = "default.png";
	headimg = headimg + userheadimgname;
%>
	<img src="<%=headimg %>" alt="userPNG"/>
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
<%
	String intro = "";
	if(user.getIntroduction() != null)intro = user.getIntroduction();
	java.sql.Date birthday = new java.sql.Date(new java.util.Date().getTime());
	if(user.getBirthday() != null)birthday = user.getBirthday();
	String city = "";
	if(user.getCity() != null)city = user.getCity();
	String phone = "";
	if(user.getPhone() != null)phone = user.getPhone();
%>
<div class="section">
	<div class="section-content">
		<form action="updateUserProfilePro" method="post">
			<input type="hidden" name="userid" value="<%=user.getUserid()%>"/>
			<p>Name<input type="text" name="username" value="<%=user.getUsername()%>"/> 
			Gender<select id="select-gender"name="gender" data-value="<%=user.getGender()%>">
					<option value="no" id="select-gender-no">   </option>
					<option value="male" id="select-gender-male">Male</option>
					<option value="female" id="select-gender-female">Female</option>
				</select></p>
			<p>Age<input type="text" name="age" value="<%=user.getAge() %>"/> 
			Birthday<input type="text" name="birthday" value="<%=birthday %>"/></p>
			<p>Phone<input type="text" name="phone" value="<%=phone %>"/> 
			City<input type="text" name="city" value="<%=city %>"/></p>
			<p>Introduction</p>
			<textarea rows="8" cols="40" id="introContent" ><%=intro %></textarea><br>
			<input type="hidden" name="introduction" id="submitContent"/>
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
            	<p>max size:2MB</p>
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
<script src="<%=path %>/taoforfun/js/search.js"></script>
<script type="text/javascript" src="scripts/jquery.min.js"></script>
<script type="text/javascript" src="scripts/jquery.imgareaselect.pack.js"></script>
<script>
function getContent(){
	var c = document.getElementById("introContent").value;
	document.getElementById("submitContent").value = c;
	return true;
}
function setgender(){
	var gender= $("#select-gender").attr("data-value");
	$("#select-gender-"+gender).attr("selected",true);
}
</script>

</body>
</html>