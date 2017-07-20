<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="model.User"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Tao For Fun - User Profile</title>

<%
	String path = request.getContextPath();
%>
<link href="<%=path%>/taoforfun/css/user.css" rel="stylesheet">
</head>
<body>

<%
	User user = new User();
	if(session.getAttribute("user")== null){
		response.sendRedirect("homePro");
	}
	else{
		user = (User)session.getAttribute("user");
	}
%>

<form method="post" enctype="multipart/form-data" action="updateHeadimgPro">
<input type="file" name="headimg"/>
<input type="submit" value="Submit"/>
</form>



</body>
</html>