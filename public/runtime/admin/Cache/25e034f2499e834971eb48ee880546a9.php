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

<script type="text/javascript" src="__TMPL__Common/js/conf.js"></script>
<script type="text/javascript" src="__TMPL__Common/js/calendar/calendar.php?lang=zh-cn" ></script>
<link rel="stylesheet" type="text/css" href="__TMPL__Common/js/calendar/calendar.css" />
<script type="text/javascript" src="__TMPL__Common/js/calendar/calendar.js"></script>
<script type="text/javascript" src="__TMPL__Common/js/deal.js"></script>
<script type="text/javascript" src="__TMPL__Common/js/colorpicker.js"></script>
<link rel="stylesheet" type="text/css" href="__TMPL__Common/style/colorpicker.css" />
<script type="text/javascript">
	window.onload = function()
	{
		init_dealform();
	}
</script>
<link rel="stylesheet" type="text/css" href="__TMPL__Common/style/jquery.lightbox-0.5.css" media="screen" />


<div class="main">
<div class="main_title"><?php echo L("EDIT");?> <a href="<?php echo u("City/index");?>" class="back_list"><?php echo L("BACK_LIST");?></a></div>
<div class="blank5"></div>

<form name="edit" action="__APP__" method="post" enctype="multipart/form-data">
<div class="button_row">
	<input type="button" class="button conf_btn" rel="1" value="<?php echo L("DEAL_BASE_INFO");?>" />&nbsp;
	<input type="button" class="button conf_btn" rel="2" value="<?php echo L("SEO_CONFIG");?>" />&nbsp;	
</div>


<div class="blank5"></div>

<table class="form conf_tab" cellpadding=0 cellspacing=0 rel="1">
	<tr>
		<td colspan=2 class="topTd"></td>
	</tr>
	<tr>
		<td class="item_title">名称:</td>
		<td class="item_input">
			<input type="text" class="textbox require" name="name"  value="<?php echo ($vo["name"]); ?>" />
		</td>
	</tr>
	<tr>
		<td class="item_title">别名:</td>
		<td class="item_input">
			<input type="text" class="textbox require" name="uname"  value="<?php echo ($vo["uname"]); ?>" />
		</td>
	</tr>
	
	
	
	<tr>
		<td class="item_title">上级城市:</td>
		<td class="item_input">
			
			<select name="pid" >
			<option value="0" >==上级城市==</option>
			<?php if(is_array($list)): foreach($list as $key=>$city): ?><option value="<?php echo ($city["id"]); ?>" <?php if($city["id"] == $vo['pid']): ?>selected="selected"<?php endif; ?> ><?php echo ($city["name"]); ?></option><?php endforeach; endif; ?>
			</select>

		</td>
	</tr>
	<!-- 
	<tr>
		<td class="item_title">is_default:</td>
		<td class="item_input">
			<input type="text" class="textbox require" name="uname"  value="<?php echo ($vo["is_default"]); ?>" />
		</td>
	</tr>
	 -->
	<tr>
		<td class="item_title"><?php echo L("SORT");?>:</td>
		<td class="item_input">
			<input type="text" class="textbox require" name="sort"  value="<?php echo ($vo["sort"]); ?>" />
		</td>
	</tr>
	<tr>
		<td colspan=2 class="bottomTd"></td>
	</tr>
</table>


<table class="form conf_tab" cellpadding=0 cellspacing=0 rel="2">
	<tr>
		<td colspan=2 class="topTd"></td>
	</tr>
	<tr>
		<td class="item_title"><?php echo L("CITY_SEO_TITLE");?>:</td>
		<td class="item_input"><textarea class="textarea" name="seo_title" ><?php echo ($vo["seo_title"]); ?></textarea></td>
	</tr>
	<tr>
		<td class="item_title"><?php echo L("CITY_SEO_KEYWORD");?>:</td>
		<td class="item_input"><textarea class="textarea" name="seo_keyword" ><?php echo ($vo["seo_keyword"]); ?></textarea></td>
	</tr>
	<tr>
		<td class="item_title"><?php echo L("CITY_SEO_DESCRIPTION");?>:</td>
		<td class="item_input"><textarea class="textarea" name="seo_description" ><?php echo ($vo["seo_description"]); ?></textarea></td>
	</tr>
	<tr>
		<td colspan=2 class="bottomTd"></td>
	</tr>
</table>
<div class="blank5"></div>

	<table class="form" cellpadding=0 cellspacing=0>
		<tr>
			<td colspan=2 class="topTd"></td>
		</tr>
		<tr>
			<td class="item_title"></td>
			<td class="item_input">
			<!--隐藏元素-->
			<input type="hidden" name="id" value="<?php echo ($vo["id"]); ?>" />
			<input type="hidden" name="<?php echo conf("VAR_MODULE");?>" value="City" />
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