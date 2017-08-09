<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="model.User"%>
<%@ page import="model.Weibo"%>
<%@ page import="model.Comment"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.util.Set"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Tao For Fun - Weibos</title>

<%
	String path = request.getContextPath();
%>

<link href="<%=path%>/taoforfun/css/bootstrap.min.css" rel="stylesheet">
<link href="<%=path%>/taoforfun/css/user.css" rel="stylesheet">
</head>
<body>

<%
	User user = new User();
//  ArrayList<User> friends = new ArrayList<User>();
 ArrayList<Weibo> weibos = new ArrayList<Weibo>();
	if(request.getSession().getAttribute("user")== null){
		response.sendRedirect("homePro");
	}
	else{
		user = (User)request.getSession().getAttribute("user");
// 		if(request.getAttribute("friends")!=null)
// 			friends = (ArrayList<User>)request.getAttribute("friends");
		if(request.getAttribute("weibos")!=null)
				weibos = (ArrayList<Weibo>)request.getAttribute("weibos");
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
<%-- 	<img src="<%=path%>/taoforfun/img/user.png" alt="userPNG" style="width:100px;height:100px;"/> --%>
<!-- 	<ul> -->
<%-- 		<li><%=user.getUsername() %></li> --%>
<!-- 		<li><a href="getUserHomePro" class="active">Home</a></li> -->
<!-- 		<li><a href="getUserProfilePro" class="active">Profile</a></li> -->
<!-- 		<li><a href="getUserAccountPro" class="active">Account</a></li> -->
<!-- 		<li><a href="getUserPermissionPro" class="active">Permissions</a></li> -->
<!-- 		<li><a href="logoutPro" class="active">Log out</a></li> -->
<!-- 	</ul> -->
<div>
<a href="writeWeiboPro">Write Weibo</a>
</div>
	<ul>
		<li>Hot Weibos of this Topic</li>
		<li>...</li>
		<li>...</li>
		<li>Hot Interests</li>
		<li>...</li>
		<li>...</li>
	</ul>
</div>

<div class="section">

<div class="section-content">
<%
	java.sql.Timestamp ts = new java.sql.Timestamp(new java.util.Date().getTime());
	for(int i = 0; i < weibos.size(); i++){
		Weibo weibo = weibos.get(i);
		Set<Comment> comments = weibo.getComments();
%>
	<div  class="message weiboForm">
		<div class="section-data-header">
			<p><%= weibo.getAdder()%>   <%= weibo.getTime()%></p>
		</div>
		<div class="section-data-body">
			<p><%= weibo.getContent()%></p>
		</div>
		<div class="section-data-body" id="c<%=weibo.getWeiboid()%>" style="display:none">
			<h4>Comment</h4>
			<div id="comment-append<%=weibo.getWeiboid()%>">
<%
		Iterator iterator = comments.iterator();     
		while(iterator.hasNext()){
			Comment comment = (Comment)iterator.next();
%>
			<p><%=comment.getAdder() %>: <%=comment.getContent() %>
			<%if(comment.getAdder().equals(user.getUsername())){ %>
			<button class="deleteComment" data-commentid="<%=comment.getCommentid()%>">delete</button>
			<%} %></p>
			
<%} %>
			</div>
			<button class="btn btn-primary btn-lg writecommentWeiboid" onclick="return openModal(this)"
				id="<%=weibo.getWeiboid()%>">add comment</button>
			<button class="closeCommentlist" data-weiboid="<%=weibo.getWeiboid()%>">close</button>
		</div>

		<div class="section-data-footer">
		<%if(weibo.getAdder().equals(user.getUsername())){ %>
			<a href="deleteMyWeiboPro?weiboid=<%=weibo.getWeiboid()%>&&username=<%=weibo.getAdder()%>">
				<button>delete</button>
			</a>
		<%} %>
			<button>like</button>
			<button class="showCommentlist" data-weiboid="<%=weibo.getWeiboid()%>">show comment</button>
		</div>			
	</div>
	<br>
<% 
	}
	ts = weibos.get(weibos.size()-1).getTime();
%>

<button id="more-weibos" data-ts="<%=ts%>">More</button>

</div>
</div>

<script>
function openModal(obj) {
	var weiboid = $(obj).attr("id");
	var element = document.getElementById("comment-submit");
	element.dataset.weiboid = weiboid;
	$('#commentModal').modal('show');
}
</script>

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
	<button type="button" class="btn btn-primary" data-adder="<%=user.getUsername() %>" id="comment-submit">Submit</button>
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

<script src="https://code.jquery.com/jquery.js"></script>
<script src="<%=path %>/taoforfun/js/bootstrap.min.js"></script>
<script src="<%=path %>/taoforfun/js/comment.js"></script>
<script src="<%=path %>/taoforfun/js/search.js"></script>
<script src="<%=path%>/taoforfun/js/jquery.dataTables.min.js"></script>
<script src="<%=path%>/taoforfun/js/dataTables.bootstrap.min.js"></script>
<%
}
%>
</body>
</html>