<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<%
	String path = request.getContextPath();
%>

<link rel="stylesheet" type="text/css" href="${basePath}css/imgcss/imgareaselect-default.css" />
<script src="${basePath}js/jQuery-1.7.1.min.js" ></script>
<script src="${basePath}js/jquery.form.js" ></script>
<script src="${basePath}js/jquery.imgareaselect.pack.js" type="text/JavaScript"></script>
<script type="text/javascript"> 
var realImgWidth = 0;
 var realImgHeight = 0;
 var scissorX = 50;
 var scissorY = 50; 
 
 function scissor(){
        var imagePath = document.getElementById("imagePath").value;
        var tt = document.getElementById("imagePath");
        var aa = $("#imagePath");
    if(imagePath=="" || imagePath==null){
          alert("<bean:message key='label.uploadPhoto' />！");
          return false;
    }else{
        //先把图片上传到服务器
        $("#headForm").ajaxSubmit({
               type: "POST",
               url: "${basePath}myzonePar.do?method=uploadPic&param="+Math.random(),
              //data: "classId="+classId,
               dataType: "json",
                success: function(result){
                $("#imgtarget").attr("src","${basePath}upload/"+ result.picName);
                $("#ximg").attr("src", "${basePath}upload/"+ result.picName);
                $("#qietu").show();
      
                document.getElementById("uploadImg").value = result.picName; 
                setTimeout(function(){
                           realImgWidth = $("#imgtarget").width();
                          realImgHeight = $("#imgtarget").height();
                         var ias = $('#imgtarget').imgAreaSelect({ instance: true });
          
                          if(parseInt(realImgWidth)<50){
                                   scissorX = parseInt(realImgWidth);
                         }
                         if(parseInt(realImgHeight)<50){
                                  scissorY = parseInt(realImgHeight);
                         }
                           ias.setSelection(0, 0, scissorX, scissorY, true);     
                           ias.setOptions({ show: true });    
                           ias.update();
                            $('.imgareaselect-selection').show();
      },1000); 
      
     }
       });
  }
   }
  
function preview(img, selection) {
    if (!selection.width || !selection.height)
        return;
    
    var scaleX = scissorX / selection.width;
 var scaleY = scissorY / selection.height;
    $('#preview img').css({
        width: Math.round(scaleX* parseInt(realImgWidth) ),
        height: Math.round(scaleY * parseInt(realImgHeight) ),
        marginLeft: -Math.round(scaleX * selection.x1),
        marginTop: -Math.round(scaleY * selection.y1)
    });
    $('#x1').val(selection.x1);
    $('#y1').val(selection.y1);
    $('#x2').val(selection.x2);
    $('#y2').val(selection.y2);
    $('#scaleWidth').val(selection.width);
    $('#scaleHeight').val(selection.height);    
}
$(function () {
    $('#imgtarget').imgAreaSelect({ aspectRatio: '1:1', handles: true,show:true,
        fadeSpeed: 200, maxHeight:50, maxWidth:50, minHeight:50, minWidth:50, onSelectChange: preview, onInit:preview });
});
</script>
</head>
<body>
<form id="headForm" name="headForm" method="post" enctype="multipart/form-data" action="${basePath}myzonePar.do?method=toUpdateHeadImage">
         <div class="shangchuan">
          <div class="shangchuan_left">
              <div >
                   <c:choose>
          <c:when test="${!empty headImage}">
              <img src="${basePath}showImage.do?uuid=${uuid}" width="50" height="50" /><br/>
          </c:when>
          <c:otherwise>
              <img src="${basePath}jsp/parents/image/qshead.jpg" width="50" height="50" /><br/>
          </c:otherwise>
         </c:choose>
              </div>
             </div>
             <div class="shangchuan_right">
                    <input id="imagePath" name="file" size="30" style=" margin-top:20px; height:25px;" type="file" onChange="scissor()"/>
                    <div style="width:150px; float:left; padding-top:5px;"></div>
                    <div style="float:left; margin-left:99px; width:190px;"><img src="${basePath}/jsp/parents/<bean:message key='label.image' />/tianjia01.png" id="updateHeadImg" name="updateHeadImg" onClick="updateImgFun()"style="margin-top:5px; float:right; cursor:pointer;"/></div>               
              </div> 
        </div>
        <div id="qietu" style="height: 150px; margin:2px 0 0 100px; display:none;">
             <div style="width:150px; height: 150px; float:left; ">
                  <div id="imgg" style=" border:1px solid green; float:left; overflow: hidden;">
                       <img id="imgtarget" src="" />
                  </div>
             </div>     
             <div style="width:20px; height:150px; border:0px; float:left;"></div>
             <div class="frame" style="margin:10px 10px 0 30px;  width: 50px; height: 150px; float:left;">
            <div id="preview" style="width: 50px; height: 50px; overflow: hidden;">
                 <img id="ximg" name="ximg" src="" >
            </div>
          </div>
          <input type="text" id="uploadImg" name="uploadImg" value="" style="display:none;"/>
          <table style="margin-top: 1em; height:150px; display:none;">
          <thead>
           <tr>
             <th colspan="2" style="font-size: 110%; font-weight: bold; text-align: left; padding-left: 0.1em;">
               Coordinates
             </th>
             <th colspan="2" style="font-size: 110%; font-weight: bold; text-align: left; padding-left: 0.1em;">
               Dimensions
             </th>
           </tr>
         </thead>
         <tbody>
           <tr>
                <td style="width:20px;"><b>X<sub>1</sub>:</b></td>
           <td><input id="x1" name="x1" value="0" type="text" size="5" readonly="true"></td>
           <td style="width:20px;"><b>Width:</b></td>
             <td><input value="-" id="scaleWidth" name="scaleWidth" type="text" size="5" readonly="true"></td>
           </tr>
           <tr>
             <td><b>Y<sub>1</sub>:</b></td>
             <td><input id="y1" name="y1" value="0" type="text" size="5" readonly="true"></td>
             <td><b>Height:</b></td>
             <td><input id="scaleHeight" name="scaleHeight" value="-" type="text" size="5" readonly="true"></td>
           </tr>
           <tr>
             <td><b>X<sub>2</sub>:</b></td>
             <td><input id="x2" name="x2" value="50" type="text" size="5" readonly="true"></td>
             <td></td>
             <td></td>
           </tr>
           <tr>
             <td><b>Y<sub>2</sub>:</b></td>
             <td><input id="y2" name="y2" value="50" type="text" size="5" readonly="true"></td>
             <td></td>
             <td></td>
           </tr>
         </tbody>
       </table>
    </div>   
       </form>
</body>
</html>