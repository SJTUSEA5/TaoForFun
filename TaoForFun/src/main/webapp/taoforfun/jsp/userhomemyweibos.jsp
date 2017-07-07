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
	if(request.getSession().getAttribute("user")!= null){
		user = (User)request.getSession().getAttribute("user");
	}
	ArrayList<Weibo>myweibos = new ArrayList<Weibo>();
	if(request.getSession().getAttribute("myweibos")!= null){
		myweibos = (ArrayList<Weibo>)request.getSession().getAttribute("myweibos");
	}
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
		<li>UserName</li>
		<li><a href="getUserHomePro" class="active">Home</a></li>
		<li><a href="getUserProfilePro" class="active">Profile</a></li>
		<li><a href="getUserAccountPro" class="active">Account</a></li>
		<li><a href="getUserPermissionPro" class="active">Permissions</a></li>
		<li><a href="logoutPro" class="active">Log out</a></li>
	</ul>
</div>

<div class="section">
	
	<ul class="tab">
		<li><a href="getMyFriendsPro" class="active">Friends</a></li>
		<li><a href="getMyWeibosPro" class="active">My Weibos</a></li>
		<li><a href="getMyMessagesPro" class="active">Messages</a></li>
		<li><a href="getSettingsPro" class="active">Settings</a></li>
	</ul>
	<button class="btn btn-default" type="button" id="add">write weibo</button>
						
<br>
<br>
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
					<form action="">
						<input type="submit" value="edit"/>
					</form>
					<form action="">
						<input type="submit" value="delete"/>
					</form>
				</td>
			</tr>
<% 
	} 
%>
	</tbody>
	</table>
	</div>
	
</div>

<div class="modal fade" id="modal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title" id="modalTitle"></h4>
				</div>
				<div class="modal-body">
					<div class="row">
						<div class="col-lg-12">
							<form role="form">
								<div class="form-group">
									<label>Username</label> <input class="form-control" name="username">
								</div>
								<div class="form-group">
									<label>Password</label> <input class="form-control"
										name="password">
								</div>
								<div class="form-group">
									<label>Role</label> <input class="form-control" name="role">
								</div>
							</form>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary" id="save">Save</button>
				</div>
			</div>
		</div>
	</div>

	<script src="<%=path%>/taoforfun/js/jquery.min.js"></script>
	<script src="<%=path%>/taoforfun/js/bootstrap.min.js"></script>
	<script src="<%=path%>/taoforfun/js/jquery.dataTables.min.js"></script>
	<script src="<%=path%>/taoforfun/js/dataTables.bootstrap.min.js"></script>
	<script src="<%=path%>/taoforfun/js/bookstore.js"></script>
	<script src="<%=path%>/taoforfun/js/bootbox.min.js"></script>
	<script src="<%=path%>/taoforfun/js/user.js"></script>

	
</body>
</html>