<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<%
	String path = request.getContextPath();
%>
<link rel="stylesheet" type="text/css" href="<%=path %>/taoforfun/css/normalize.css" />
<link rel="stylesheet" type="text/css" href="<%=path %>/taoforfun/css/demo.css">
<link href="<%=path %>/taoforfun/css/font-awesome.min.css" rel="stylesheet">
<link rel="stylesheet" href="<%=path %>/taoforfun/css/style.css">

</head>
<body>
<nav>
  <a href="#" id="logo">
	<span class="fa fa-logo"></span>
	TaoForFun 
  </a>
  <div id="sideMenu">
	<span class="fa fa-navicon" id="sideMenuClosed">me</span>
  </div>
</nav>


<div id="sideMenuContainer">
  <img src="<%=path %>/taoforfun/img/user.png" alt="userPNG" style="width:100px;height:100px;border-radius:50%;"/>
  <p>Username</p>
  <br></br>
  <a href="#" title="new user guide"><span class="fa fa-bolt"></span></a>
  <a href="#" title="rules"><span class="fa fa-exclamation-circle"></span></a>
  <a href="#" title="setting"><span class="fa fa-map"></span></a>
  <a href="#" title="usergroups"><span class="fa fa-info-circle"></span></a>
  <a href="#" title="directory"><span class="fa fa-users"></span></a>
  <a href="#" title="claims"><span class="fa fa-camera"></span></a>
  <a href="#" title="summaries"><span class="fa fa-commenting"></span></a>
  <a href="#" title="requests"><span class="fa fa-heart"></span></a>
  <a href="#" title="unanswered"><span class="fa fa-flag"></span></a>
  <a href="#" title="faq / suggestions"><span class="fa fa-question-circle"></span></a>
  <a href="#" title="chat"><span class="fa fa-glass"></span></a>
</div>
	
<script src="<%=path %>/taoforfun/js/jquery-1.11.0.min.js" type="text/javascript"></script>
<script src='<%=path %>/taoforfun/js/velocity.min.js'></script>
<script src='<%=path %>/taoforfun/js/sideToggleExtended.js'></script>
<script type="text/javascript">
	$(document).ready(function(){
	  $('#sideMenu').sideToggle({
		moving: '#sideMenuContainer',
		direction: 'right'
	  });

	});
</script>

<div style="text-align:center;margin:150px 0; font:normal 14px/24px 'MicroSoft YaHei';">
<p>12345</p>
<p><a href="http://sc.chinaz.com/" target="_blank">link</a></p>
</div>
</body>
</html>