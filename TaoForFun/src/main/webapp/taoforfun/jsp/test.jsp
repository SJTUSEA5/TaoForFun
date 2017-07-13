<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Tao For Fun</title>

<style type="text/css">
body {font-family: Georgia;}
</style>
<%
	String path = request.getContextPath();
%>
<link href="<%=path%>/taoforfun/css/dataTables.bootstrap.css"
	rel="stylesheet">
<link href="<%=path%>/taoforfun/css/dataTables.responsive.css"
	rel="stylesheet">
</head>
<body>
<h2>This is a test file of Tao For Fun.</h2>
<table id="dataTables">
<thead>
</thead>
<tbody>
<tr>
<td><div id="day2-meal-expense" data-drink="coffee" data-food="sushi" data-meal="lunch">¥20.12</div></td>
</tr>
</tbody>
</table>

<button id="button">click</button>
<script>

// var expenseday2 = document.getElementById("day2-meal-expense");  
// var typeOfDrink = expenseday2.dataset && expenseday2.dataset.drink;

document.getElementById("button").onclick = function(e) {
// 	var typeOfDrink = e.currentTarget.dataset && e.currentTarget.dataset.drink;
	var typeOfDrink = e.currentTarget.dataset.drink;
    alert("drink:" + typeOfDrink);
};
</script>
<script>
	$(document).ready(function() {
		$('#dataTables').DataTable({
			responsive : true
	});
});
</script>
	<script src="<%=path%>/taoforfun/js/jquery.dataTables.min.js"></script>
	<script src="<%=path%>/taoforfun/js/dataTables.bootstrap.min.js"></script>

</body>
</html>