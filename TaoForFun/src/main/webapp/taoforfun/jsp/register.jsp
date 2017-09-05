<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Tao For Fun - Register</title>

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

<nav>
<h2 class="title" id="logo">Tao For Fun!</h2>
<div id="nav-blocks">
	<form id="searchForm" action="searchPro" method="post">	
	</form>
	<input type="text" name="search" placeholder="search something" id="searchthing"/>
	<button class="btn btn-default" id="search-submit" style="margin:0 15px">Search  </button>
	<a href="getFriendsWeibosPro" class="active" style="margin:15px">  Weibos  </a>
	<a href="/TaoForFun/index.jsp">  Log in</a>
</div>
</nav>
<div id="page">
<div id="section">
<div class="section-content">
<h2 class="heading">Input your information to join us!</h2>
<h2>${sessionScope.msg}</h2>
<% session.setAttribute("msg", ""); %>
<div class="signinform" style="text-align:center;">
	<form action="registerPro" method="post">
		<p>UserName<input type="text" name="username"/></p>
<!-- 		<p>Email<input type="text" name="email"/></p> -->
		<p>Password<input type="password" name="password"/></p>
		<p>Confirm Password<input type="password" name="confirmpassword"/></p>
		<br>
		<br>
		<input class="btn" type="submit" value="Sign in"/>
	</form>
	<br>
	<a href="/TaoForFun/index.jsp" class="btn-small" style="background:#aaaaaa">back</a>
	<br><br><br>
</div>
</div>
</div>
</div>
<script src="https://code.jquery.com/jquery.js"></script>
<script src="<%=path %>/taoforfun/js/bootstrap.min.js"></script>
<script src="<%=path %>/taoforfun/js/user.js"></script>
<script src="<%=path %>/taoforfun/js/search.js"></script>
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