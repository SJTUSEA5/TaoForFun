$(document).ready(function() {
	$(".showCommentlist").click(function(){
 		var weiboid = $(this).attr("data-weiboid");
 		$("#c"+weiboid).fadeIn();
 	});
	
	$(".closeCommentlist").click(function(){
 		var weiboid = $(this).attr("data-weiboid");
 		$("#c"+weiboid).fadeOut();
 	});
	
	$(document).on("click", ".deleteComment", function(){
 		var commentid = $(this).attr("data-commentid");
		$(this).parent().remove();
		$.ajax({
			url :"deleteMyCommentPro.action",
			type : "POST",
			async : false,
			data : {
				commentid : commentid,
				},
			dataType :"text",
			error : function(){
				alert("error!");
			},
			success:function(data){}
		})
 	});
	
	$("#comment-submit").click(function(){
		var weiboid = $(this).attr("data-weiboid");
		var content = document.getElementById("commentContent").value;
		var adder = $(this).attr("data-adder");
		if(content == ""){
			document.getElementById("commentwarn").innerHTML = "Empty content cannot be submitted!";
			return false;
		}
		else{
			$("#comment-append"+weiboid).append("<p>"+adder+": "+content+"</p>");
			$.ajax({
				url :"commentMyWeiboPro.action",
				type : "POST",
				async : false,
				data : {
					weiboid : weiboid,
					content : content
					},
				dataType :"text",//json
				error : function(){
					alert("error!");
				},
				success:function(data){
//					var weiboid = data.weiboid;
//					var adder = data.adder;
//					var content = data.content;
//					var commentid = data.commentid;
					$('#commentModal').modal('hide');
//					$("#comment-append"+weiboid).append("<p>"+adder+": "+content+
//							"<button class='deleteComment' data-commentid="+commentid+">delete</button></p>");
				}
			})
		}
	});
});		