$(document).ready(function() {
	$(document).on("change", "#picpath", function(){
		var srcs = getObjectURL(this.files[0]);
		$(this).nextAll(".img1").hide();//input
        $(this).nextAll(".img2").show();
        $(this).nextAll('.close').show();
        $(this).nextAll(".img2").attr("src",srcs);
        $(this).val('');
        $(".close").on("click",function() {
            $(this).hide();//span
            $(this).nextAll(".img2").hide();
            $(this).nextAll(".img1").show();
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
    
});		