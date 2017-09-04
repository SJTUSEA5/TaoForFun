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

<link rel="stylesheet" type="text/css" href="<%=path%>/taoforfun/css/imgareaselect-default.css" />
<link href="<%=path %>/taoforfun/css/font-awesome.min.css" rel="stylesheet">
<link href="<%=path%>/taoforfun/css/bootstrap.min.css" rel="stylesheet">
<link href="<%=path%>/taoforfun/css/style.css" rel="stylesheet">
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
	<img src="<%=headimg %>" alt="userPNG" style="width:100px;height:100px;border-radius:50%"/>
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

<div id="side-nav">

<div class="write-weibo">
	<a href="<%=path%>/taoforfun/jsp/userhomewriteweibo.jsp">
	<img src="<%=path%>/taoforfun/img/write.PNG" alt="writeWeibo" style="width:100px;height:100px;"/>
	</a><br/>
</div>

<div>
	<p>Hot Weibos of this Topic</p>
	<p>Hot Interests</p>
</div>

</div>

<div id="section">

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
			<img src="<%=path%>/taoforfun/img/delete.PNG" alt="delete" style="width:25px;height:auto;margin:0 5px;"
			onclick="return deleteconfirm()"/></a>
		<%} %>
			
			<img src="<%=path%>/taoforfun/img/heart.PNG" alt="like" data-dir="<%=path%>/taoforfun/img/"
			style="width:25px;height:auto;cursor:pointer;margin:0 5px;"/>
			
			<img src="<%=path%>/taoforfun/img/messages.PNG" alt="comment" style="width:25px;height:auto;cursor:pointer;margin:0 5px;"
			class="writecommentWeiboid" onclick="return openModal(this)" id="<%=weibo.getWeiboid()%>"/>
		</div>			
	</div>
	<br>
<% 
	}
	ts = weibos.get(weibos.size()-1).getTime();
%>

<div class="loading-weibo" style="text-align:center">
<button id="more-weibos" data-ts="<%=ts%>">
<img src="<%=path%>/taoforfun/img/down.PNG" alt="writeWeibo" style="width:50px;height:50px;"/>
</button>
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

<script src="https://code.jquery.com/jquery.js"></script>
<script src="<%=path %>/taoforfun/js/bootstrap.min.js"></script>
<script src="<%=path %>/taoforfun/js/user.js"></script>
<script src="<%=path %>/taoforfun/js/search.js"></script>
<script src="<%=path %>/taoforfun/js/comment.js"></script>
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
<%
}
%>
</body>
</html>