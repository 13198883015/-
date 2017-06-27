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
	function init_port()
	{
		var is_ssl = $("select[name='is_ssl']").val();
		if(is_ssl == '1')
		{
			$("input[name='smtp_port']").val("465");
		}
		else
		{
			$("input[name='smtp_port']").val("25");
		}
	}
	$(document).ready(function(){
		$("select[name='is_ssl']").bind("change",function(){
			init_port();
		});
	});
	
</script>
<div class="main">
<div class="main_title"><?php echo L("EDIT");?> <a href="<?php echo u("MailServer/index");?>" class="back_list"><?php echo L("BACK_LIST");?></a></div>
<div class="blank5"></div>
<form name="edit" action="__APP__" method="post" enctype="multipart/form-data">
<table class="form" cellpadding=0 cellspacing=0>
	<tr>
		<td colspan=2 class="topTd"></td>
	</tr>
	<tr>
		<td class="item_title"><?php echo L("SMTP_SERVER");?>:</td>
		<td class="item_input"><input type="text" class="textbox require" name="smtp_server" value="<?php echo ($vo["smtp_server"]); ?>" /></td>
	</tr>
	<tr>
		<td class="item_title"><?php echo L("SMTP_NAME");?>:</td>
		<td class="item_input"><input type="text" class="textbox require" name="smtp_name" value="<?php echo ($vo["smtp_name"]); ?>" /></td>
	</tr>
	<tr>
		<td class="item_title"><?php echo L("SMTP_PWD");?>:</td>
		<td class="item_input"><input type="password" class="textbox require" name="smtp_pwd" value="<?php echo ($vo["smtp_pwd"]); ?>" /></td>
	</tr>
	<tr>
		<td class="item_title"><?php echo L("IS_VERIFY");?>:</td>
		<td class="item_input">
			<select name="is_verify">
				<option value="1" <?php if($vo['is_verify'] == 1): ?>selected="selected"<?php endif; ?>><?php echo L("YES");?></option>
				<option value="0" <?php if($vo['is_verify'] == 0): ?>selected="selected"<?php endif; ?>><?php echo L("NO");?></option>				
			</select>
		</td>
	</tr>
	<tr>
		<td class="item_title"><?php echo L("SMTP_PORT");?>:</td>
		<td class="item_input"><input type="text" class="textbox" name="smtp_port" value="<?php echo ($vo["smtp_port"]); ?>" /></td>
	</tr>
	<tr>
		<td class="item_title"><?php echo L("IS_SSL");?>:</td>
		<td class="item_input">
			<select name="is_ssl">
				<option value="0" <?php if($vo['is_ssl'] == 0): ?>selected="selected"<?php endif; ?>><?php echo L("NO");?></option>
				<option value="1" <?php if($vo['is_ssl'] == 1): ?>selected="selected"<?php endif; ?>><?php echo L("YES");?></option>
			</select>
		</td>
	</tr>	
	<tr>
		<td class="item_title"><?php echo L("TOTAL_USE");?>:</td>
		<td class="item_input"><input type="text" class="textbox" name="total_use" value="<?php echo ($vo["total_use"]); ?>" /></td>
	</tr>
	<tr>
		<td class="item_title"><?php echo L("USE_LIMIT");?>:</td>
		<td class="item_input">
			<input type="text" class="textbox" name="use_limit" value="<?php echo ($vo["use_limit"]); ?>" />
			<span class='tip_span'>[<?php echo L("USE_LIMIT_TIP");?>]</span>
		</td>
	</tr>
	<tr>
		<td class="item_title"><?php echo L("IS_RESET");?>:</td>
		<td class="item_input">
			<select name="is_reset">
				<option value="0" <?php if($vo['is_reset'] == 0): ?>selected="selected"<?php endif; ?>><?php echo L("NO");?></option>
				<option value="1" <?php if($vo['is_reset'] == 1): ?>selected="selected"<?php endif; ?>><?php echo L("YES");?></option>
			</select>
			<span class='tip_span'>[<?php echo L("IS_RESET_TIP");?>]</span>
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
			<input type="hidden" name="<?php echo conf("VAR_MODULE");?>" value="MailServer" />
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