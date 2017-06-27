<?php if (!defined('THINK_PATH')) exit();?>

<div class="main">
<div class="main_title"><?php echo ($user_info["user_name"]); ?></div>
<div class="blank5"></div>
<script type="text/javascript">
	function check_submit_info(){
     var is_error = 0;
         $(".item_input .img_int").each(function(i){
             //this.src = "test" + i + ".jpg";
             var val = $(this).val();
             val = val.toLowerCase();//小写

             if(val.indexOf(".jpg")!=-1 || val.indexOf(".png")!=-1 || val.indexOf(".jpeg")!=-1 || val.indexOf(".gif")!=-1){
                 return true;
             }else{
                 if(val.length>0){
                     alert(val);
                     is_error =1;
                     alert("非法的文件");
                     return false;
                 }
             }
           });
           if(is_error == 1){
               return false;
           }else
                return true;
	}
	
    $(function(){
        var img_count =3;
        $.Add_Img = function(){
            $("#img_"+img_count).after('<p>文件名:<input name="file_name[]" /><input class="img_int" type="file" name="img_data[]" id="img_'+(img_count+1)+'"/></p>');
            img_count++;
        };
        
        $.Del_Img = function(obj){
            var src = $(obj).attr("title");
            var id = $("input[name='id']").val();
            $.ajax({
                url:ROOT+"?"+VAR_MODULE+"="+MODULE_NAME+"&"+VAR_ACTION+"=view_info_del_img&id="+id,
                data:"ajax=1&src="+src,
                dataType:"post",
                dataType:"json",
                success:function(result){
                    if(result.status){
                        $(obj).parent().hide();
                    }else{
                        alert(result.info);
                    }
                    
                }
            });
        }
    });
</script>
<form name="edit" action="__APP__" method="post" enctype="multipart/form-data" onsubmit="return check_submit_info();">
<table class="form" cellpadding=0 cellspacing=0>
	<tr>
		<td colspan=3 class="topTd"></td>
	</tr>
	<tr>
		<td class="item_title">上传资料:</td>
		<td class="item_input">
                <?php if($old_imgdata_str): ?><?php if(is_array($old_imgdata_str)): foreach($old_imgdata_str as $key=>$img_item): ?><p>文件名:<span>[<?php echo ($img_item["name"]); ?>]</span>&nbsp;&nbsp;<a href="<?php echo ($img_item["img"]); ?>" target="_blank">查看</a>&nbsp;<a href="javascript:void(0)" onclick="$.Del_Img(this)" title='<?php echo ($img_item["img"]); ?>'>删除</a></p><?php endforeach; endif; ?><?php endif; ?>
                    <p>文件名:<input name="file_name[]" value=''/> <input class="img_int" type="file" name="img_data[]" id="img_1"/></p>
                    <p>文件名:<input name="file_name[]" value=''/> <input class="img_int" type="file" name="img_data[]" id="img_2"/></p>
                    <p>文件名:<input name="file_name[]" value=''/> <input class="img_int" type="file" name="img_data[]" id="img_3"/></p>
		</td>
                <td><input type="button" name="add_img" onclick="$.Add_Img()" value="添加"/></td>
	</tr>

	<tr>
		<td class="item_title">&nbsp;</td>
		<td class="item_input" colspan=2>
			<!--隐藏元素-->
			<input type="hidden" name="id" value="<?php echo ($user_info["id"]); ?>" />
			<input type="hidden" name="<?php echo conf("VAR_MODULE");?>" value="User" />
			<input type="hidden" name="<?php echo conf("VAR_ACTION");?>" value="modify_view_info" />
			<!--隐藏元素-->
			<input type="submit" class="button" value="<?php echo L("OK");?>" />
			<input type="reset" class="button" value="<?php echo L("RESET");?>" />
		</td>
	</tr>
	<tr>
		<td colspan=3 class="bottomTd"></td>
	</tr>
</table>	 
</form>
</div>