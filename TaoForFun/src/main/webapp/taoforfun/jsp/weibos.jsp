<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="model.Tag"%>
<%@ page import="model.User"%>
<%@ page import="model.Weibo"%>
<%@ page import="model.Weibotag"%>
<%@ page import="model.Comment"%>
<%@ page import="model.Thumbup"%>
<%@ page import="java.util.Map"%>
<%@ page import="java.util.Set"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.Iterator"%> 
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
<link href="<%=path%>/taoforfun/css/default.css" rel="stylesheet">
<link href="<%=path%>/taoforfun/css/style.css" rel="stylesheet">
</head>
<body>

<%
	User user = new User();
 	ArrayList<Weibo> weibos = new ArrayList<Weibo>();
 	HashMap<Integer, Tag> tags = new HashMap<Integer, Tag>();
 	HashMap<Integer, Boolean> check = new HashMap<Integer, Boolean>();
	if(request.getSession().getAttribute("user")== null){
		response.sendRedirect("homePro");
	}
	else{
		user = (User)request.getSession().getAttribute("user");
		if(request.getAttribute("weibos")!=null)
				weibos = (ArrayList<Weibo>)request.getAttribute("weibos");
		if(request.getAttribute("thumbupCheck")!= null)
			check = (HashMap<Integer, Boolean>)request.getAttribute("thumbupCheck");
		if(request.getSession().getAttribute("tags")!= null)
			tags = (HashMap<Integer, Tag>)request.getSession().getAttribute("tags");
%>

<nav>
<h2 class="title" id="logo">Tao For Fun!</h2>
<div id="nav-blocks">
	<form id="searchForm" action="searchPro" method="post">	
	</form>
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

<div id="section" style="padding:0;border:0 none;">
<div class="section-left">

<div class="write-weibo">
	<a href="<%=path%>/taoforfun/jsp/userhomewriteweibo.jsp">
	<img src="<%=path%>/taoforfun/img/write.PNG" alt="writeWeibo" style="width:100px;height:100px;"/>
	</a><br/>
</div>

<!-- <div id="hot-promote"> -->
<!-- 	<p class="heading-side">Hot Weibos of this Topic</p> -->
<!-- </div> -->
<div id="hot-tags">
	<p class="heading-side">Hot Interests</p>
<% for(int t = 0; t < ((tags.size()<10)?tags.size():10); t++){
	Integer It = new Integer(t+1);
	if(tags.containsKey(It)){
%>
	<div class="btn-small tagbtn" style="margin:5px;cursor:pointer;" data-searchthis="<%=tags.get(It).getTagname() %>"><%=tags.get(It).getTagname() %></div>
<%}} %>
</div>

</div>

<div class="section-right">

<div class="section-content">
<%
	java.sql.Timestamp ts = new java.sql.Timestamp(new java.util.Date().getTime());
	if(weibos.size()>0){
	for(int i = 0; i < weibos.size(); i++){
		Weibo weibo = weibos.get(i);
		List<Comment> comments = weibo.getComments();
		Set<Weibotag> weibotags =  weibo.getWeibotags();
%>
	<div  class="message weiboForm">
		<div class="section-data-header">
			<p><%= weibo.getAdder()%>   <%= weibo.getTime()%></p>
			<p>
			<%
			for(Weibotag wt : weibotags){
				Tag tag = new Tag();
				if(tags.containsKey(wt.getTagid())){tag = tags.get(wt.getTagid());}
			%>
				<span class="btn-small tagbtn" data-tagid="<%=tag.getTagid() %>" data-searchthis="<%=tag.getTagname() %>"><%=tag.getTagname() %></span>
			<%
			}
			%>
			</p>
		</div>
		<div class="section-data-body">
			<p><%= weibo.getContent()%></p>
		</div>
		<div class="section-data-body">
			<h4 class="heading">Comments</h4>
			<div id="comment-append<%=weibo.getWeiboid()%>">
<%
		if(!comments.isEmpty()){     
		for(int u = 0; u < comments.size(); u++){
			Comment comment = comments.get(u);
%>
			<p>
			<%if(comment.getAdder().equals(user.getUsername())){ %>
				<a type="button" class="deleteComment" data-commentid="<%=comment.getCommentid()%>"
				style="cursor:pointer;padding:2px;background:#aaaaaa;border-radius:100%;">&times;</a>
			<%} %>
			<%=comment.getAdder() %> :  <%=comment.getContent() %></p>
			
<%}} %>
			</div>
		</div>

		<div class="section-data-footer">
			<div style="float:right;margin:0 10px;">
				<img src="<%=path%>/taoforfun/img/messages.PNG" alt="comment" style="width:25px;height:auto;cursor:pointer;margin:0 5px;"
				class="bubble writecommentWeiboid" id="<%=weibo.getWeiboid()%>" data-adder="<%=weibo.getAdder()%>"/>
				
				<span class="likecount" data-count="<%=weibo.getThumbups()%>">(<%=weibo.getThumbups()%>)</span>
<%
String heart = "whiteheart";
String icon = "heart.PNG";
Integer wid=new Integer(weibo.getWeiboid());
if(check.get(wid)){heart = "redheart"; icon = "like.png";} 
%>
				<img class="<%=heart %>" src="<%=path%>/taoforfun/img/<%=icon %>" alt="like" data-dir="<%=path%>/taoforfun/img/"
				style="width:25px;height:auto;cursor:pointer;margin:0 5px;" data-weiboid="<%=weibo.getWeiboid()%>"/>
				
				<%if(weibo.getAdder().equals(user.getUsername())){ %>
				<a href="deleteMyWeiboPro?weiboid=<%=weibo.getWeiboid()%>&&username=<%=weibo.getAdder()%>">
				<img class="trash" src="<%=path%>/taoforfun/img/delete.PNG" alt="delete" style="width:25px;height:auto;margin:0 5px;"
				onclick="return deleteconfirm()"/></a>
				<%} %>
			</div>	
		</div>			
	</div>
	<br>
<% 
	}
	ts = weibos.get(weibos.size()-1).getTime();
	}
%>

<div class="loading-weibo"></div>

<div style="text-align:center">

<img src="<%=path%>/taoforfun/img/down.PNG" alt="writeWeibo" id="more-weibos" data-ts="<%=ts%>"
 style="width:50px;height:50px;cursor:pointer;"/>

</div>


</div>
</div>
</div>

<div style="clear:both"></div>
</div>

<script>
function deleteconfirm(){
	if(confirm("are you sure to delete this?")){
		return true;
	}else{
		return false;
	}
}
</script>

<script src="https://code.jquery.com/jquery.js"></script>
<%-- <script src="<%=path %>/taoforfun/js/bootstrap.min.js"></script> --%>
<script src="<%=path %>/taoforfun/js/user.js"></script>
<script src="<%=path %>/taoforfun/js/search.js"></script>
<script src="<%=path %>/taoforfun/js/comment.js"></script>
<script type="text/javascript" src="scripts/jquery.min.js"></script>
<script type="text/javascript" src="scripts/jquery.imgareaselect.pack.js"></script>
<script src='<%=path %>/taoforfun/js/velocity.min.js'></script>
<script src='<%=path %>/taoforfun/js/jquery.jebox.js'></script>
<script src='<%=path %>/taoforfun/js/jquery.jebox.min.js'></script>
<script src='<%=path %>/taoforfun/js/jquery-1.7.2.js'></script>
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