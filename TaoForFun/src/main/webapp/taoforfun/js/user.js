$(document).ready(function() {
	
	var tagidlist = new Array();
	
	var formData = new FormData();
	var picno = 0;
	
	//check messages
	if($(".tip-message").text() == "0"){
		$(".tip-message").hide();
	}else{
		
	}

	
	$(document).on("change", "#picpath", function(){
		$("sizeErr").text("");
		var srcs = getObjectURL(this.files[0]);//input
		if($('input[name=pic]')[0].files[0].size > 2*1024*1024){
    		$("#sizeErr").text("your file is too large!");
    		return;
    	}
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
    	//alert(formData);
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
    
    $(document).on("change", "#picspath", function(){
		var srcs = getObjectURL(this.files[0]);//input
    	formData.append('pic'+picno, $('input[name=pics]')[0].files[0]);
        if(srcs){
        	$(".emptyimg").parent().show();
            $(".emptyimg").attr("src", srcs);
            $(".emptyimg").attr("class", "img1");
            
        }
        
        $(".close-img").on("click",function() {
//        	$("#pic-save").attr("data-src", '');
        	$("#picspath").val('');
//        	$(this).children(".img1").attr("src", "");
//        	$(this).children(".img1").attr("class", "img1 emptyimg");
        	$(this).parent().remove();
            $(this).hide();
        })
        
        $("#pics-preview").append('<div class="img-view" style="float:left"><span class="close close-img" style="display:none">&times;'+
									'<img src="" class="img1 emptyimg"/></span></div>');
    });
    
    $(document).on("click", "#addpic", function(){
    	
    });
    
    $(document).on("click", "#addemoji", function(){
    	jeBox.open({
            boxSize:["500px","240px"],
            content:'<div style="padding:20px;">emojis</div>',
            maskLock : true
        })
    });
    
    $(document).on("click", "#addtag", function(){
    	jeBox.open({
            boxSize:["500px","240px"],
            content:'<div style="padding:20px;">'+
            			'<div style="padding:0 0 10px 0"><button class="btn-small" id="gettag">search tag</button></div>'+
            			'<input type="text" name="tagname" id="searchtagname"/>'+
            			'<br>'+
            			'<div id="tagdesc" style="width:auto;height:20px;"></div>'+
            			'<div id="showtags"></div>'+
            		'</div>',
            maskLock : true
        })
    });
    
    $(document).on("click", "#gettag", function(){
    	var tagname = $("#searchtagname").val();
    	$.ajax({
			url :"searchTagPro.action",
			type : "POST",
			async : false,
			data : {tagname : tagname},
			dataType :"json",
			error : function(){
				jeBox.open({
		            boxSize:["200px","50px"],
		            content:'<div style="text-align:center;">error!</div>',
		            maskLock : true
		        })
			},
			success:function(data){
    			var info=JSON.parse(data);
    			$("#showtags").html('');
    			var i = 0;
    			while(info.tagResult[i] != null){
    				var tag = info.tagResult[i];
    				var tagtype = "tag";
    				for(var u = 0; u < tagidlist.length; u++){
    					if(tagidlist[u] == tag.tagid){
    						tagtype = "tagget";
    						break;
    					}
    				}
    				$("#showtags").html('<div class="'+tagtype+'" style="margin:10px;" data-tagid="'+
    									tag.tagid +
    									'" data-desc="'+
    									tag.description +
    									'">'+tag.tagname+'</div>');
    				i++;
    			}
    			
    			
			}
		})
    });
    
    $(document).on("mouseover", ".tag", function(){
    	var desc = $(this).attr("data-desc");
    	$("#tagdesc").text(desc);
    });
    
    $(document).on("mouseout", ".tag", function(){
    	$("#tagdesc").text("");
    });
    
    $(document).on("click", ".tag", function(){
    	$(this).attr("class","tagget");
    	var addid = $(this).attr("data-tagid");
    	tagidlist.push(addid);
    	var tagids = tagidlist.join(",");
    	$("#submitTag").val(tagids);
    	//$("#tags-preview").append('<div class="tagget" style="margin:5px 0; data-tagid="'+
    								//addid+
    								//'" id="tagid'+addid+'">'+$(this).text()+'</div>');
    });
    
    $(document).on("click", ".tagget", function(){
    	$(this).attr("class","tag");
    	var delid = $(this).attr("data-tagid");
    	//alert(delid);
    	for(var i = 0; i < tagidlist.length; i++){
    		if (tagidlist[i] == delid){
    			tagidlist = tagidlist.slice(0,i).concat(tagidlist.slice(i+1,tagidlist.length));
    			
    			var tagids = tagidlist.join(",");
    	    	$("#submitTag").val(tagids);
    	    	//var del = document.getElementById("tagid"+delid);
    	    	
    	    	//alert(del);
    	    	//$("#tags-preview").removeChild();
    			break;
    		}
    	}
    });
    
    $(document).on("click", ".whiteheart", function(){
    	var path = $(this).attr("data-dir");
    	$(this).attr("src", path+"like.png");
    	$(this).attr("class", "redheart");
    	var newcount = parseInt($(this).prev().attr("data-count")) + 1;
    	$(this).prev().text("("+newcount+")");
    	$(this).prev().attr("data-count", newcount);
    	var weiboid = $(this).attr("data-weiboid");
    	
    	$.ajax({
			url :"thumbupPro.action",
			type : "POST",
			async : false,
			data : {weiboid : weiboid},
			dataType :"json",
			error : function(){
				alert("error!");
			},
			success:function(data){}
		})
    });
    
    $(document).on("click", ".redheart", function(){
    	var path = $(this).attr("data-dir");
    	$(this).attr("src", path+"heart.PNG");
    	$(this).attr("class", "whiteheart");
    	var newcount = parseInt($(this).prev().attr("data-count")) - 1;
    	$(this).prev().text("("+newcount+")");
    	$(this).prev().attr("data-count", newcount);
    	var weiboid = $(this).attr("data-weiboid");
    	
    	$.ajax({
			url :"thumbupPro.action",
			type : "POST",
			async : false,
			data : {weiboid : weiboid},
			dataType :"json",
			error : function(){
				alert("error!");
			},
			success:function(data){}
		})
    });
    
    function ZoomAllPicture(pictureid,setformatwidth,setformatheight)
    {
        //var allItem = document.getElementsByTagName("Img");
        var formatwidth = parseInt(setformatwidth);
        var formatheight = parseInt(setformatheight);
        var outwidth;
        var outheight;
        var width;
        var height;
        
        $("img[id="+pictureid+"]").each(function(i,n){
            width = parseInt($(this).width());
            height = parseInt($(this).height());
            
            var rateWidth = formatwidth / width;
            var rateHeight = formatheight / height;
            
            if(rateWidth > rateHeight){
                outheight = setformatheight;
                outwidth = width * rateHeight;
            }
            else{
                outheight = height * rateWidth;
                outwidth = formatwidth
            }
            $(this).attr("width",outwidth);
            $(this).attr("height",outheight);
        });
    }
    
    $(document).on("click", "#weiboSubmit", function(){
    	var c = document.getElementById("weiboContent").value;
    	
    	if(c == ""){
    		document.getElementById("weibowarn").innerHTML = "Empty content cannot be submitted!";
    		return false;
    	}
    	else{
    		if(c.length > 140){
    			document.getElementById("weibowarn").innerHTML = "Too many words!";
    			return false;
    		}
    		else{
    			document.getElementById("submitContent").value = c;
    			$.ajax({
    	            type: "POST",
    	            url: "updatePicsPro.action",
    	            data: formData,
    	            dataType: "text",
    	            contentType: false,
    	            processData: false,
    	            success: function(data) {
    	            	return true;
    	            },
    	            error: function(XMLHttpRequest, textStatus, errorThrown) {
    	            	jeBox.open({
    			            boxSize:["300px","50px"],
    			            content:'<div style="text-align:center;">pics upload failed. pls retry.</div>',
    			            maskLock : true
    			        });
    	            	return false;
    	            }
    	        });
    			return false;
    		}
    	}
    	return false;
    });
    
});		