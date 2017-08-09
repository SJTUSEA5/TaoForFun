<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<%
	String path = request.getContextPath();
%>
<script src="https://code.jquery.com/jquery.js"></script>
<style type="text/css">
        .imgbox,.imgbox1
        {
            float: left;
            margin-right: 20px;
            margin-top: 20px;
            position: relative;
            width: 182px;
            height: 142px;
            border: 1px solid red;
            overflow: hidden;
        }
        .imgbox1{border: 1px solid blue;
        }


        .imgnum{
            left: 0px;
            top: 0px;
            margin: 0px;
            padding: 0px;
        }
        .imgnum input,.imgnum1 input {
            position: absolute;
            width: 182px;
            height: 142px;
            opacity: 0;
        }
        .imgnum img,.imgnum1 img {
            width: 100%;
            height: 100%;
        }
        .close,
        .close1 {
            color: red;
            position: absolute;
            left: 170px;
            top: 0px;
            display: none;
        }





    </style>
</head>
<body>
<div id="img">
<div class="imgbox">
    <div class="imgnum">
        <input type="file" class="filepath" />
        <span class="close">X</span>
        <img src="<%=path%>/taoforfun/img/user.png" class="img1" />
        <img src="" class="img2" />
    </div>
</div>

<div class="imgbox1">
    <div class="imgnum">
        <input type="file" class="filepath1" />
        <span class="close1">X</span>
        <img src="<%=path%>/taoforfun/img/user.png" class="img11" />
        <img src="" class="img22" />
    </div>
</div>

</div>

</body>
<script type="text/javascript">
    $(function() {
        $(".filepath").on("change",function() {
            alert($('.imgbox').length);
            var srcs = getObjectURL(this.files[0]);   //获取路径
            $(this).nextAll(".img1").hide();   //this指的是input
            $(this).nextAll(".img2").show();  //fireBUg查看第二次换图片不起做用
            $(this).nextAll('.close').show();   //this指的是input
            $(this).nextAll(".img2").attr("src",srcs);    //this指的是input
            $(this).val('');    //必须制空
            $(".close").on("click",function() {
                $(this).hide();     //this指的是span
                $(this).nextAll(".img2").hide();
                $(this).nextAll(".img1").show();
            })
        })
    })




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





    $(function() {
        $("#img").on("change",".filepath1",function() {
            //alert($('.imgbox1').length);
            var srcs = getObjectURL(this.files[0]);   //获取路径
            alert(srcs);
            //this指的是input
            /* $(this).nextAll(".img22").attr("src",srcs);    //this指的是input
             $(this).nextAll(".img22").show();  //fireBUg查看第二次换图片不起做用*/
            var htmlImg='<div class="imgbox1">'+
                    '<div class="imgnum1">'+
                    '<input type="file" class="filepath1" />'+
                    '<span class="close1">X</span>'+
                    '<img src="'+<%=path%>+'/taoforfun/img/user.png'"+ 'class='img11' />'+
                    '<img src="'+srcs+'" class="img22" />'+
                    '</div>'+
                    '</div>';

            $(this).parent().parent().before(htmlImg);
            $(this).val('');    //必须制空
            $(this).parent().parent().prev().find(".img11").hide();   //this指的是input
            $(this).parent().parent().prev().find('.close1').show();

            $(".close1").on("click",function() {
                $(this).hide();     //this指的是span
                $(this).nextAll(".img22").hide();
                $(this).nextAll(".img11").show();
                if($('.imgbox1').length>1){
                    $(this).parent().parent().remove();
                }

            })
        })
    })
    
    $(function() {
  $('#upload_image').change(function(event) {
    // 根据这个 <input> 获取文件的 HTML5 js 对象
    var files = event.target.files, file;        
    if (files && files.length > 0) {
      // 获取目前上传的文件
      file = files[0];
      // 来在控制台看看到底这个对象是什么
      console.log(file);
      // 那么我们可以做一下诸如文件大小校验的动作
      if(file.size > 1024 * 1024 * 2) {
        alert('图片大小不能超过 2MB!');
        return false;
      }
      // !!!!!!
      // 下面是关键的关键，通过这个 file 对象生成一个可用的图像 URL
      // 获取 window 的 URL 工具
      var URL = window.URL || window.webkitURL;
      // 通过 file 生成目标 url
      var imgURL = URL.createObjectURL(file);
      // 用这个 URL 产生一个 <img> 将其显示出来
      $('body').append($('<img/>').attr('src', imgURL));
      // 使用下面这句可以在内存中释放对此 url 的伺服，跑了之后那个 URL 就无效了
      // URL.revokeObjectURL(imgURL);
    }
  });
});

</script>

</html>