<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.util.Set"%>
<%@ page import="model.User"%>
<%@ page import="model.Weibo"%>
<%@ page import="model.Comment"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Tao For Fun - User Home</title>

<%
	String path = request.getContextPath();
%>
<link href="<%=path%>/taoforfun/css/user.css" rel="stylesheet">
<link href="<%=path%>/taoforfun/css/bootstrap.min.css" rel="stylesheet">
<%-- <link href="<%=path%>/taoforfun/css/dataTables.bootstrap.css"rel="stylesheet"> --%>
<%-- <link href="<%=path%>/taoforfun/css/dataTables.responsive.css"rel="stylesheet"> --%>
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

	<ul class="tab">
		<li><a href="getMyFriendsPro">Friends</a></li>
		<li><a href="getMyWeibosPro" class="active">My Weibos</a></li>
		<li><a href="getMyMessagesPro">Messages</a></li>
		<li><a href="getMyNoticesPro">Notices</a></li>
	</ul>
<br>
<br>
<div>
<a href="<%=path %>/taoforfun/jsp/userhomewriteweibo.jsp">Write Weibo</a>
</div>
<div class="section-content">
<div id="dataTables">
	<h2>My Weibos</h2>
<%
	int i = 0;
	for(; i < myweibos.size(); i++){
		Weibo myweibo = myweibos.get(i);
		Set<Comment> comments = myweibo.getComments();
%>
	<div  class="message weiboForm">
		<div class="section-data-header">
			<p><%= myweibo.getAdder()%>   <%= myweibo.getTime()%></p>
		</div>
		<div class="section-data-body">
			<p><%= myweibo.getContent()%></p>
		</div>
		<div class="section-data-body">
			<h4>Comment</h4>
<%
		Iterator iterator = comments.iterator();     
		while(iterator.hasNext()){
			Comment comment = (Comment)iterator.next();
%>
			<p><%=comment.getAdder() %>: <%=comment.getContent() %></p>
<%} %>
		</div>
		<div class="section-data-footer">
			<a href="deleteMyWeiboPro?weiboid=<%=myweibo.getWeiboid()%>&&username=<%=myweibo.getAdder()%>">
				<button>delete</button>
			</a>
			<button>like</button>
			<button class="btn btn-primary btn-lg" data-toggle="modal" data-target="#commentModal"
			 data-weiboid="<%=myweibo.getWeiboid()%>">
			comment</button>
		</div>			
	</div>
	<br>
<% 
	}
}
%>
</div>

</div>
</div>

<div class="modal fade" id="commentModal" tabindex="-1" role="dialog" aria-labelledby="commentModalLabel" aria-hidden="true">
<div class="modal-dialog">
<div class="modal-content">
<div class="modal-header">
	<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	<h4 class="modal-title" id="commentModalLabel">COMMENT</h4><span id="commentwarn"></span>
</div>
<div class="modal-body"><textarea rows="5" cols="45" placeholder="Comment something!" class="promote" id="commentContent"></textarea></div>
<div class="modal-footer">
	<input id="comment-weiboid" type="hidden">
	<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	<button type="button" class="btn btn-primary" id="comment-submit">Submit</button>
</div>
</div>
</div>
</div>

<script>
$(document).ready(function() {
	$('#dataTables').DataTable({
		responsive : true
	});
	$('#commentModal').modal({
        keyboard: true
    });
});
</script>
</div>
<!-- <script type="text/javascript" src="jquery-1.11.1.min.js"></script> -->
<script src="https://code.jquery.com/jquery.js"></script>
<script src="<%=path %>/taoforfun/js/bootstrap.min.js"></script>
<script src="<%=path %>/taoforfun/js/comment.js"></script>
<script src="<%=path%>/taoforfun/js/jquery.dataTables.min.js"></script>
<script src="<%=path%>/taoforfun/js/dataTables.bootstrap.min.js"></script>
</body>
</html>