<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.Iterator"%> 
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.Set"%>
<%@ page import="java.util.Map"%>
<%@ page import="model.Tag"%>
<%@ page import="model.User"%>
<%@ page import="model.Usertag"%>
<%@ page import="model.Weibo"%>
<%@ page import="model.Weibotag"%>
<%@ page import="model.Comment"%>
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
<link href="<%=path%>/taoforfun/css/default.css" rel="stylesheet">
<link href="<%=path%>/taoforfun/css/style.css" rel="stylesheet">
</head>
<body>

<%
	User user = new User();
	User friend = new User();
	ArrayList<Weibo> fweibos = new ArrayList<Weibo>();
	ArrayList<Usertag> futs = new ArrayList<Usertag>();
	HashMap<Integer, Tag> tags = new HashMap<Integer, Tag>();
	HashMap<Integer, Boolean> check = new HashMap<Integer, Boolean>();
	if(request.getSession().getAttribute("user") == null){
		response.sendRedirect("homePro");
	}
	else{
		user = (User)request.getSession().getAttribute("user");
		if(request.getAttribute("friend") != null)
			friend = (User)request.getAttribute("friend");
		if(request.getAttribute("fweibos") != null)
			fweibos = (ArrayList<Weibo>)request.getAttribute("fweibos");
		if(request.getAttribute("thumbupCheck")!= null)
			check = (HashMap<Integer, Boolean>)request.getAttribute("thumbupCheck");
		if(request.getSession().getAttribute("tags")!= null)
			tags = (HashMap<Integer, Tag>)request.getSession().getAttribute("tags");
		if(request.getAttribute("futs") != null)
			futs = (ArrayList<Usertag>)request.getAttribute("futs");
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
	
	<h2 class="heading">User Profile</h2>
<%
	String headimg2 = path+"/taoforfun/img/UserHeadImg/";
	String userheadimgname2 = friend.getHeadimg();
	if(userheadimgname2 == null)userheadimgname2 = "default.png";
	headimg2 = headimg2 + userheadimgname2;
	
	
	String intro = "";
	if(friend.getIntroduction() != null)intro = friend.getIntroduction();
	java.sql.Date birthday = new java.sql.Date(new java.util.Date().getTime());
	if(friend.getBirthday() != null)birthday = friend.getBirthday();
	String city = "";
	if(friend.getCity() != null)city = friend.getCity();
	String phone = "";
	if(friend.getPhone() != null)phone = friend.getPhone();
	String gender = "unknown";
	if(friend.getGender() != null)gender = friend.getGender();

%>
	<div style="text-align:center">
		<img src="<%=headimg2 %>" alt="userPNG" style="width:100px;height:100px;border-radius:50%"/>
		<p style="margin:10px;"><%=friend.getUsername() %></p>	
	</div>
	<br>
	<div style="text-align:center">
		<form action="getMessageBoxPro" method="post" name="messageform">
			<input type="hidden" name="receiveid" value="<%=friend.getUserid() %>"/>
		</form>
		<p><a href="#" class="btn-small">Home</a>
		<a href="JavaScript:document.messageform.submit();" class="btn-small">Send Message</a>
		<a href="deleteFriendPro" class="btn-small">Delete Friend</a></p>
	</div>
	<br>
	<br>
		<div id="friend-profile">
			<p>Name: <%=friend.getUsername()%></p>
			<p>Gender: <%=gender %> </p>
			<p>Age: <%=friend.getAge() %> </p>
			<p>City: <%=city %></p>
			<p>Email: <%=friend.getEmail()%></p>
			<p>Birthday: <%=birthday %></p>
			<p>Phone: <%=phone %></p>
			<p>Introduction: <%=intro %></p>
		</div>
<br>

<h2 class="heading">Tags Interested</h2>
<%for(int i = 0; i < futs.size(); i++){
		Tag tag = tags.get(futs.get(i).getTagid());	
%>
	<div class="btn-small tagbtn"  style="margin:5px;text-align:center;cursor:pointer;width:<%=tag.getTagname().length()%>9px;" data-searchthis="<%=tag.getTagname() %>"><%=tag.getTagname() %></div>
<%} %>
<br>
<div id="latest-weibo">
	<h2 class="heading">Latest Weibos</h2>
<%
	int i = 0;
	for(; i < fweibos.size(); i++){
		Weibo fweibo = fweibos.get(i);
		List<Comment> comments = fweibo.getComments();
		Set<Weibotag> weibotags =  fweibo.getWeibotags();
%>
	<div  class="message weiboForm">
		<div class="section-data-header">
			<p><%= fweibo.getAdder()%>   <%= fweibo.getTime()%></p>
			<p>
			<%
			for(Weibotag wt : weibotags){
				Tag tag = new Tag();
				if(tags.containsKey(wt.getTagid())){tag = tags.get(wt.getTagid());}
			%>
				<span class="btn-small" data-tagid="<%=tag.getTagid() %>"><%=tag.getTagname() %></span>
			<%
			}
			%>
			</p>
		</div>
		<div class="section-data-body">
			<p><%= fweibo.getContent()%></p>
		</div>
		<div class="section-data-body" id="c<%=fweibo.getWeiboid()%>" style="display:none">
			<h4>Comment</h4>
			<div id="comment-append<%=fweibo.getWeiboid()%>">
<%
		if(!comments.isEmpty()){  
		for(int u = 0; u < comments.size(); u++){
			Comment comment = comments.get(u);
%>
			<p><%=comment.getAdder() %> :  <%=comment.getContent() %>
			</p>
			
<%}} %>
			</div>
			<button class="btn btn-primary btn-lg writecommentWeiboid" onclick="return openModal(this)" id="<%=fweibo.getWeiboid()%>">
			add comment</button>
			<button class="closeCommentlist" data-weiboid="<%=fweibo.getWeiboid()%>">close</button>
		</div>

		<div class="section-data-footer">		
			<img src="<%=path%>/taoforfun/img/messages.PNG" alt="comment" style="width:25px;height:auto;cursor:pointer;margin:0 5px;"
			class="bubble writecommentWeiboid" id="<%=fweibo.getWeiboid()%>" data-adder="<%=friend.getUsername()%>"/>
			
			<span class="likecount" data-count="<%=fweibo.getThumbups()%>">(<%=fweibo.getThumbups()%>)</span>
<%
String heart = "whiteheart";
String icon = "heart.PNG";
Integer wid=new Integer(fweibo.getWeiboid());
if(check.get(wid)){heart = "redheart"; icon = "like.png";} 
%>
			<img class="<%=heart %>" src="<%=path%>/taoforfun/img/<%=icon %>" alt="like" data-dir="<%=path%>/taoforfun/img/"
			style="width:25px;height:auto;cursor:pointer;margin:0 5px;" data-weiboid="<%=fweibo.getWeiboid()%>"/>
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
$(document).ready(function() {
	$('#dataTables').DataTable({
		responsive : true
	});
});
</script>
</div>

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
</body>
</html>