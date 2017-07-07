<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<title>TaoForFun</title>

<%
	String path = request.getContextPath();
%>
<link href="<%=path%>/taoforfun/css/home.css" rel="stylesheet">
</head>

<body>
<div id="logo">
	<p>Tao For Fun!</p>
</div>
<div id="centraltitle">
	<h2>TaoForFun Project</h2>
</div>

<h1>${sessionScope.re}</h1>

<div id="loginform">
	<form action="loginPro" method="post">  
       				<h2>Username:<input type="text" name="loginname"></h2> <br/><br/> 
      				<h2>Password:<input type="password" name="password" value=""></h2> <br/><br/>  
    				<h2><input type="submit" value="Login"></h2>
    			</form> 
</div>
<br><br><br><br><br>
<br><br><br><br><br>
<div id="ps">
<a href="<%=path%>/taoforfun/jsp/findPassword.jsp">forget password?</a>
<a href="<%=path%>/taoforfun/jsp/register.jsp">register now!</a>
</div>
</body>
</html>
