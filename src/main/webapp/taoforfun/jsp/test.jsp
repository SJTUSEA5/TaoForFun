<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="https://code.jquery.com/jquery.js"></script>
<script>
$(document).ready(function(){
  $("#button").click(function(){
    $(this).parent().remove();
  });
});
</script>
</head>
<body>
<p id="p">a<button id="button">delete</button></p>
<p>b</p>

</body>
</html>