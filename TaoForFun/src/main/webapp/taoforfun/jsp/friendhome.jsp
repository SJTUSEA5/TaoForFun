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
</head>
<body>

<%
	User user = new User();
	User friend = new User();
	ArrayList<Weibo> fweibos = new ArrayList<Weibo>();
	if(request.getSession().getAttribute("user") == null){
		response.sendRedirect("homePro");
	}
	else{
		user = (User)request.getSession().getAttribute("user");
		if(request.getAttribute("friend") != null)
			friend = (User)request.getAttribute("friend");
		if(request.getAttribute("fweibos") != null)
			fweibos = (ArrayList<Weibo>)request.getAttribute("fweibos");
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
	String userheadimgname = friend.getHeadimg();
	if(userheadimgname == null)userheadimgname = "default.png";
	headimg = headimg + userheadimgname;
%>
	<img src="<%=headimg %>" alt="userPNG"/>
	</div>
	<div class="nav-gap"><p><%=friend.getUsername() %></p></div>
	<div class="nav-list">
		<form action="getMessageBoxPro" method="post" name="messageform">
			<input type="hidden" name="receiveid" value="<%=friend.getUserid() %>"/>
		</form>
		<p><a href="#" class="active">Home</a></p>
		<p><a href="JavaScript:document.messageform.submit();">Send Message</a></p>
		<p><a href="deleteFriendPro">Delete Friend</a></p>
	</div>
</div>

<div class="section">
	<div class="section-content">
		<div id="friend-profile">
			<p>Name: <%=friend.getUsername()%></p>
			<p>Gender: </p>
			<p>Age: </p>
			<p>City: </p>
			<p>Email: <%=friend.getEmail()%></p>
			<p>Birthday: </p>
			<p>Phone: </p>
			<p>Introduction: </p>
		</div>
<br>
		<div id="latest-weibo">
			<h2>Latest Weibos</h2>
<%
	int i = 0;
	for(; i < fweibos.size(); i++){
		Weibo fweibo = fweibos.get(i);
		Set<Comment> comments = fweibo.getComments();
%>
	<div  class="message weiboForm">
		<div class="section-data-header">
			<p><%= fweibo.getAdder()%>   <%= fweibo.getTime()%></p>
		</div>
		<div class="section-data-body">
			<p><%= fweibo.getContent()%></p>
		</div>
		<div class="section-data-body" id="c<%=fweibo.getWeiboid()%>" style="display:none">
			<h4>Comment</h4>
			<div id="comment-append<%=fweibo.getWeiboid()%>">
<%
		Iterator iterator = comments.iterator();     
		while(iterator.hasNext()){
			Comment comment = (Comment)iterator.next();
%>
			<p><%=comment.getAdder() %>: <%=comment.getContent() %>
			<%if(comment.getAdder().equals(user.getUsername())){ %>
			<button class="deleteComment" data-commentid="<%=comment.getCommentid()%>">delete</button><%} %>
			</p>
			
<%} %>
			</div>
			<button class="btn btn-primary btn-lg writecommentWeiboid" onclick="return openModal(this)" id="<%=fweibo.getWeiboid()%>">
			add comment</button>
			<button class="closeCommentlist" data-weiboid="<%=fweibo.getWeiboid()%>">close</button>
		</div>

		<div class="section-data-footer">
			<button>like</button>
			<button class="showCommentlist" data-weiboid="<%=fweibo.getWeiboid()%>">show comment</button>
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
</div>

<script src="https://code.jquery.com/jquery.js"></script>
<script src="<%=path %>/taoforfun/js/bootstrap.min.js"></script>
<script src="<%=path %>/taoforfun/js/comment.js"></script>
<script src="<%=path %>/taoforfun/js/search.js"></script>
<script src="<%=path%>/taoforfun/js/jquery.dataTables.min.js"></script>
<script src="<%=path%>/taoforfun/js/dataTables.bootstrap.min.js"></script>
</body>
</html>