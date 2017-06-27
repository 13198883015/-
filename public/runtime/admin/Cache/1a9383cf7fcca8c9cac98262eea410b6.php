<?php if (!defined('THINK_PATH')) exit();?>

<!DOCTYPE html PUBLIC '-//W3C//DTD XHTML 1.0 Transitional//EN' 'http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd'>
<html>
<head>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=7" />
<link rel="stylesheet" type="text/css" href="__TMPL__Common/style/style.css" />
<script type="text/javascript" src="__TMPL__Common/js/check_dog.js"></script>
<script type="text/javascript" src="__TMPL__Common/js/IA300ClientJavascript.js"></script>
<script type="text/javascript">
 	var VAR_MODULE = "<?php echo conf("VAR_MODULE");?>";
	var VAR_ACTION = "<?php echo conf("VAR_ACTION");?>";
	var MODULE_NAME	=	'<?php echo MODULE_NAME; ?>';
	var ACTION_NAME	=	'<?php echo ACTION_NAME; ?>';
	var ROOT = '__APP__';
	var ROOT_PATH = '<?php echo APP_ROOT; ?>';
	var CURRENT_URL = '<?php echo trim($_SERVER['REQUEST_URI']);?>';
	var INPUT_KEY_PLEASE = "<?php echo L("INPUT_KEY_PLEASE");?>";
	var TMPL = '__TMPL__';
	var APP_ROOT = '<?php echo APP_ROOT; ?>';
	var EMOT_URL = '<?php echo APP_ROOT; ?>/public/emoticons/';
	var MAX_FILE_SIZE = "<?php echo (app_conf("MAX_IMAGE_SIZE")/1000000)."MB"; ?>";
	var LOGINOUT_URL = '<?php echo u("Public/do_loginout");?>';
	CHECK_DOG_HASH = '<?php $adm_session = es_session::get(md5(conf("AUTH_KEY"))); echo $adm_session["adm_dog_key"]; ?>';
	function check_dog_sender_fun()
	{
		window.clearInterval(check_dog_sender);
		check_dog2();
	}
	var check_dog_sender = window.setInterval("check_dog_sender_fun()",5000);
</script>
<script type="text/javascript" src="__TMPL__Common/js/jquery.js"></script>
<script type="text/javascript" src="__TMPL__Common/js/jquery.timer.js"></script>
<script type="text/javascript" src="__TMPL__Common/js/script.js"></script>
<script type="text/javascript" src="__ROOT__/public/runtime/admin/lang.js"></script>
<script type='text/javascript'  src='__ROOT__/admin/public/kindeditor/kindeditor.js'></script>
<script type='text/javascript'  src='__ROOT__/admin/public/kindeditor/lang/zh_CN.js'></script>
</head>
<body onLoad="javascript:DogPageLoad();">
<div id="info"></div>

<script type="text/javascript">
	$(document).ready(function(){
		load_u_define();
		$("select[name='u_module']").bind("change",function(){ load_u_define();});		
	});
	function load_u_define()
	{
		if($("select[name='u_module']").val()=='')
		{
			$("#u_config").hide();
			$("#u_act").hide();
			$("#u_define").show();
		}
		else
		{
			var module = $("select[name='u_module']").val();
			var id = $("input[name='id']").val();
			$.ajax({
					url: ROOT+"?"+VAR_MODULE+"="+MODULE_NAME+"&"+VAR_ACTION+"=load_module&module="+module+"&id="+id, 
					data: "ajax=1",
					dataType: "json",
					success: function(obj){
						if(obj.data)
						{
							var html="<select name='u_action'>";
							for(nameo in obj.data)
							{
								html+="<option value='"+nameo+"' ";
								if(obj.info==nameo)
								{
									html+=" selected='selected' ";
								}
								html+=" >"+obj.data[nameo]+"</option>";
							}
							html+="</select>";
							$("#u_act").html(html);
						}
						else
						{
							$("#u_act").html("");
						}
					}
			});
			$("#u_act").show();
			$("#u_define").hide();
			$("#u_config").show();
		}
	}
</script>
<div class="main">
<div class="main_title"><?php echo ($vo["name"]); ?><?php echo L("EDIT");?> <a href="<?php echo u("Nav/index");?>" class="back_list"><?php echo L("BACK_LIST");?></a></div>
<div class="blank5"></div>
<form name="edit" action="__APP__" method="post" enctype="multipart/form-data">
<table class="form" cellpadding=0 cellspacing=0>
	<tr>
		<td colspan=2 class="topTd"></td>
	</tr>
	<tr>
		<td class="item_title"><?php echo L("NAV_NAME");?>:</td>
		<td class="item_input"><input type="text" class="textbox require" name="name" value="<?php echo ($vo["name"]); ?>" /></td>
	</tr>
	<tr>
		<td class="item_title">父菜单:</td>
		<td class="item_input">
			<select name="pid">
				<option value="0">==顶级菜单==</option>
				<?php if(is_array($parent_nav_tree)): foreach($parent_nav_tree as $key=>$nav_item): ?><option value="<?php echo ($nav_item["id"]); ?>" <?php if($vo['pid'] == $nav_item['id']): ?>selected="selected"<?php endif; ?>><?php echo ($nav_item["name"]); ?></option><?php endforeach; endif; ?>
			</select>
		</td>
	</tr>
	<tr>
		<td class="item_title"><?php echo L("NAV_URL");?>:</td>
		<td class="item_input">
			<select name="u_module">
					<option value=""><?php echo L("U_DEFINE");?></option>
					<?php if(is_array($navs)): foreach($navs as $key=>$nav): ?><option value="<?php echo ($key); ?>" <?php if($key == $vo['u_module']): ?>selected="selected"<?php endif; ?> ><?php echo ($nav["name"]); ?></option><?php endforeach; endif; ?>
			</select>
			<span id="u_act">				
			</span>
			<span id="u_config">				
				<?php echo L("U_PARAM");?>：<input type="text" class="textbox" name="u_param"  value="<?php echo ($vo["u_param"]); ?> "/>
			</span>
			
			<span id="u_define">
				<input type="text" class="textbox" name="url" value="<?php echo ($vo["url"]); ?>" />
			</span>
		</td>
	</tr>	
	<tr>
		<td class="item_title"><?php echo L("SORT");?>:</td>
		<td class="item_input"><input type="text" class="textbox" name="sort" value="<?php echo ($vo["sort"]); ?>" /></td>
	</tr>	
	<tr>
		<td class="item_title"><?php echo L("NAV_BLANK");?>:</td>
		<td class="item_input">
			<lable><?php echo L("BLANK_1");?><input type="radio" name="blank" value="1" <?php if($vo['blank'] == 1): ?>checked="checked"<?php endif; ?> /></lable>
			<lable><?php echo L("BLANK_0");?><input type="radio" name="blank" value="0" <?php if($vo['blank'] == 0): ?>checked="checked"<?php endif; ?> /></lable>
		</td>
	</tr>
	<tr>
		<td class="item_title"><?php echo L("IS_EFFECT");?>:</td>
		<td class="item_input">
			<lable><?php echo L("IS_EFFECT_1");?><input type="radio" name="is_effect" value="1" <?php if($vo['is_effect'] == 1): ?>checked="checked"<?php endif; ?> /></lable>
			<lable><?php echo L("IS_EFFECT_0");?><input type="radio" name="is_effect" value="0" <?php if($vo['is_effect'] == 0): ?>checked="checked"<?php endif; ?> /></lable>
		</td>
	</tr>
	<tr>
		<td class="item_title"></td>
		<td class="item_input">
			<!--隐藏元素-->
			<input type="hidden" name="id" value="<?php echo ($vo["id"]); ?>" />
			<input type="hidden" name="<?php echo conf("VAR_MODULE");?>" value="Nav" />
			<input type="hidden" name="<?php echo conf("VAR_ACTION");?>" value="update" />
			<!--隐藏元素-->
			<input type="submit" class="button" value="<?php echo L("EDIT");?>" />
			<input type="reset" class="button" value="<?php echo L("RESET");?>" />
		</td>
	</tr>
	<tr>
		<td colspan=2 class="bottomTd"></td>
	</tr>
</table>	 
</form>
</div>
</body>
</html>