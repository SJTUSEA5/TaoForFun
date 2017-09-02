<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<title>TaoForFun</title>

<%
	String path = request.getContextPath();
%>

<link rel="stylesheet" href="css/font-awesome.min.css">
<link href="<%=path %>/taoforfun/css/bootstrap.min.css" rel="stylesheet">
<link href="<%=path %>/taoforfun/css/home.css" rel="stylesheet">
</head>

<body>
<div id="logo">
	<p>Tao For Fun!</p>
</div>
<div id="centraltitle">
	<h2>TaoForFun Project</h2>
</div>

<div class="container">
	<div class="row">
		<div class="col-md-offset-3 col-md-6">
			<form class="form-horizontal" action="loginPro" method="post" name="loginform">
				<span class="heading">User Login</span>
				<div class="form-group">
					<p id="re">${sessionScope.re}</p>
					<input type="text" class="form-control" id="inputName" name="loginname" 
					oninput="document.getElementById('re').innerHTML=''" placeholder="Username or Email">
				</div>
				<div class="form-group help">
					<input type="password" class="form-control" id="inputPassword" name="password" placeholder="Password">
				</div>
				<div class="form-group">
					<button type="submit" class="btn" onclick="JavaScript:document.loginform.submit();">Login</button>
				</div>
			</form>
		</div>
	</div>
</div>
<div id="ps">
<a href="<%=path%>/taoforfun/jsp/findPassword.jsp">forget password?</a>
<a href="<%=path%>/taoforfun/jsp/register.jsp">register now!</a>
</div>

<script>
$(document).on("change", "input", function(){
	$("#re").text("");
})
</script>

</body>
</html>
