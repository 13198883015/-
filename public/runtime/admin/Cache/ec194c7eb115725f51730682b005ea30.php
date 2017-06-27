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

<script type="text/javascript" src="__TMPL__Common/js/jquery.bgiframe.js"></script>
<script type="text/javascript" src="__TMPL__Common/js/jquery.weebox.js"></script>
<script type="text/javascript" src="__TMPL__Common/js/carry.js"></script>
<link rel="stylesheet" type="text/css" href="__TMPL__Common/style/weebox.css" />

<div class="main">
<div class="main_title">手续费设置 </div>
<div class="blank5"></div>
<form action="<?php echo U("UserCarry/saveconfig");?>"  method="post">
	<table id="dataTable" class="dataTable" cellpadding="0" cellspacing="0">
		<tbody>
			<tr><td colspan="5" class="topTd">&nbsp; </td></tr>
			<tr >
				<td colspan="5">勾去掉提交即删除</td>
			</tr>
			<tr class="row">
				<th width="50px">保留</th>
				<th>简称</th>
				<th>最低金额</th>
				<th>最高金额</th>
				<th>手续费</th>
			</tr>
			<?php $idx = 1; ?>
			<?php if(is_array($list)): foreach($list as $key=>$item): ?><tr>
				<td align="center"><input type="checkbox" name="config[id][<?php echo ($idx); ?>]" checked="checked" value="<?php echo ($item["id"]); ?>" /></td>
				<td><input type="text" class="textbox"  name="config[name][<?php echo ($idx); ?>]" value="<?php echo ($item["name"]); ?>" /></td>
				<td><input type="text" class="textbox"  name="config[min_price][<?php echo ($idx); ?>]" value="<?php echo ($item["min_price"]); ?>" /></td>
				<td><input type="text" class="textbox"  name="config[max_price][<?php echo ($idx); ?>]" value="<?php echo ($item["max_price"]); ?>" /></td>
				<td>
					<input type="text" class="textbox"  name="config[fee][<?php echo ($idx); ?>]" value="<?php echo ($item["fee"]); ?>" />
					<select name="config[fee_type][<?php echo ($idx); ?>]">
						<option value="0" <?php if($item['fee_type'] == 0): ?>selected="selected"<?php endif; ?>>&yen;</option>
						<option value="1" <?php if($item['fee_type'] == 1): ?>selected="selected"<?php endif; ?>>%</option>
					</select>
				</td>
			</tr>
			<?php ++$idx; ?><?php endforeach; endif; ?>
			<tr>
				<td align="center">新增</td>
				<td><input type="text" class="textbox"  name="aconfig[name][<?php echo ($idx); ?>]" value="" /></td>
				<td><input type="text" class="textbox"  name="aconfig[min_price][<?php echo ($idx); ?>]" value="" /></td>
				<td><input type="text" class="textbox"  name="aconfig[max_price][<?php echo ($idx); ?>]" value="" /></td>
				<td>
					<input type="text" class="textbox"  name="aconfig[fee][<?php echo ($idx); ?>]" value="" />
					<select name="aconfig[fee_type][<?php echo ($idx); ?>]">
						<option value="0">&yen;</option>
						<option value="1">%</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td colspan="4">
					<input type="submit" class="button" value="提交" />
					<input type="reset" class="button" value="重置" />
				</td>
			</tr>
			<tr><td colspan="5" class="bottomTd"> &nbsp;</td></tr>
		</tbody>
	</table>
</form>
<div class="blank5"></div>

</body>
</html>