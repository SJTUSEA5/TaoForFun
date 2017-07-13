$(document).ready(function() {
	$("#comment-submit").click(function(e){
		var dataset = e.currentTarget.dataset;
		var weiboid = dataset.weiboid;
		alert(weiboid);
		var content = document.getElementById("commentContent").value;
		if(content == ""){
			document.getElementById("commentwarn").innerHTML = "Empty content cannot be submitted!";
			return false;
		}
		else{
			
//			$.ajax({
//				url :"commentMyWeiboPro.action",
//				type : "POST",
//				async : false,
//				data : {
//					weiboid : weiboid,
//					content : content
//					},
//				dataType :"json",
//				error : function(){
//					alert("error!");
//				},
//				success:function(data){
//					$("#cm-modal-title").text(data.title);
//					$("#cm-modal-author").text(data.author);
//					$("#cm-modal-publisher").text(data.publisher);
//					$("#cm-modal-price").text(data.price);
//					$("#cm-modal-date").text(data.date);
//					$("#cm-modal-id").text(bookid);
//					$("#detail").fadeIn();
//				}
//			})
		}
	});
});		