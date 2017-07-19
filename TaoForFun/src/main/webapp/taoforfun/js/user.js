$(document).ready(function() {
	$(document).on("change", "#picpath", function(){
		var srcs = getObjectURL(this.files[0]);//input
		$("#pic-save").attr("data-src", srcs);
		$("#pic-save").attr("data-file",this.files[0]);
		$(this).hide();
        //$(this).val('');
        if(srcs){
        	$(".close-img").show();
            $(".img1").attr("src", srcs);
        }
        
        $(".close-img").on("click",function() {
        	$("#pic-save").attr("data-src", '');
        	$("#picpath").show();
        	$("#picpath").val('');
        	$(".img1").attr("src", "");
        	
            $(this).hide();
        })	
			
			
	});
	
	function getObjectURL(file) {
        var url = null;
        if (window.createObjectURL != undefined) {
            url = window.createObjectURL(file)
        } else if (window.URL != undefined) {
            url = window.URL.createObjectURL(file)
        } else if (window.webkitURL != undefined) {
            url = window.webkitURL.createObjectURL(file)
        }
        return url
    };
    
    $(document).on("click", "#pic-save", function(){
//    	var file = $(this).attr("data-file");
    	var formData = new FormData();
    	formData.append('headimg', $('input[name=pic]')[0].files[0]);
    	alert(formData);
    	$.ajax({
            type: "POST",
            url: "updateHeadimgPro.action",
            data: formData,
            dataType: "text",
            contentType: false,
            processData: false,
            success: function(data) {
            	$('#picModal').modal('hide');
            	$("#pic-save").attr("data-src", '');
            	$("#picpath").show();
            	$(".img1").attr("src", "");
                $(".close-img").hide();
                location.reload();
            },
            error: function(XMLHttpRequest, textStatus, errorThrown) {
                alert("failed. pls retry.");
            }
        });
    	
    });
    
});		