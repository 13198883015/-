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

<div class="main">
<div class="main_title"><?php echo L("ADD");?> <a href="<?php echo u("UserLevel/index");?>" class="back_list"><?php echo L("BACK_LIST");?></a></div>
<div class="blank5"></div>
<form name="edit" action="__APP__" method="post" enctype="multipart/form-data">
<table class="form" cellpadding=0 cellspacing=0>
	<tr>
		<td colspan=2 class="topTd"></td>
	</tr>
	<tr>
		<td class="item_title">等级名称:</td>
		<td class="item_input"><input type="text" class="textbox require" name="name" /></td>
	</tr>
	<tr>
		<td class="item_title">所需信用积分:</td>
		<td class="item_input"><input type="text" class="textbox" name="point" /></td>
	</tr>
	<tr>
		<td class="item_title">服务费用:</td>
		<td class="item_input"><input type="text" class="textbox" name="services_fee" value="" />%</td>
	</tr>
	<tr>
		<td class="item_title">借款期限:</td>
		<td class="item_input">
			<textarea class="textbox" name="repaytime" style="height:200px"></textarea>
			<br>
			<span class="tip_span">
				参数说明:一行代表一个借款的期限和利率
				<br/><b style="color:black">参数一|参数二|参数三|参数四</b>
				<br/>参数一:长度;
				<br/>参数二:长度类型 0代表是天，1代表是月;
				<br/>参数三:最小利率
				<br/>参数四:最大利率
				<br/>多个用回车
				<br><br>
				如果填写的是天，那么最好不要过30
				<br>
				天计算方式比较特殊，不管你选择多少天都是按月利率来算计算，即:所填利率/12,所以请填写比较适当的利率参数
			</span>
		</td>
	</tr>
	<tr>
		<td class="item_title">筹款期限:</td>
		<td class="item_input">
			<input type="text" class="textbox" name="enddate" value="" />
			<span class="tip_span">多个用,隔开</span>
		</td>
	</tr>
	<tr>
		<td class="item_title"></td>
		<td class="item_input">
			<!--隐藏元素-->
			<input type="hidden" name="<?php echo conf("VAR_MODULE");?>" value="UserLevel" />
			<input type="hidden" name="<?php echo conf("VAR_ACTION");?>" value="insert" />
			<!--隐藏元素-->
			<input type="submit" class="button" value="<?php echo L("ADD");?>" />
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