$(document).ready(function() {
	
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
	
	$(document).on("click","#comment-submit", function(){
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
					jeBox.closeAll();
//					$("#comment-append"+weiboid).append("<p>"+adder+": "+content+
//							"<button class='deleteComment' data-commentid="+commentid+">delete</button></p>");
				}
			})
		}
	});
	
	$(document).on("click", ".writecommentWeiboid", function(){
		var weiboid = $(this).attr("id");
		var username = $(this).attr("data-adder");
		jeBox.open({
            boxSize:["500px","350px"],
            content:
            	"<div style='padding:10px 20px;'><h2 class='heading'>Comment</h2><span id='commentwarn'>  </span>"+
            	"<div style='text-align:center'>"+
            	"<textarea rows='8' cols='60' placeholder='Comment something!' class='promote' id='commentContent'></textarea>"+
            	"</div>"+
            	"<div style='text-align:right;margin:5px 20px;'>"+
            	"<button type='button' class='btn' data-adder="+username+" id='comment-submit' data-weiboid="+
            	weiboid+
            	">Submit</button>"+
            	"</div></div>",
            maskLock : true
        })
	});
	
	
});		