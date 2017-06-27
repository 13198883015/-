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
<div class="main_title"><?php echo L("CONF_MOBILE");?></div>
<div class="blank5"></div>
	<form method='post' id="form" name="form" action="__APP__">
	<table cellpadding="4" cellspacing="0" border="0" class="form">
		<tr>
			<td colspan="2" class="topTd"></td>
		</tr>
		<?php if(is_array($config)): foreach($config as $key=>$cfg): ?><tr <?php if($cfg['code'] == 'only_one_delivery' or $cfg['code'] == 'has_ecv' or $cfg['code'] == 'has_message' or $cfg['code'] == 'has_region'): ?>style="display:none;"<?php endif; ?>>		
			<td class="item_title"><?php echo ($cfg["title"]); ?></th>
			<td class="item_input">
				<?php if($cfg['type'] == 1): ?><div  style='margin-bottom:5px; '><textarea id='<?php echo ($cfg["code"]); ?>' name='<?php echo ($cfg["code"]); ?>' class='ketext' style=' height:150px;width:750px;' ><?php echo ($cfg["val"]); ?></textarea> </div><?php endif; ?>
				<?php if($cfg['type'] == 2): ?><span>
        <div style='float:left; height:35px; padding-top:1px;'>
			<input type='hidden' value='<?php echo ($cfg["val"]); ?>' name='<?php echo ($cfg["code"]); ?>' id='keimg_h_<?php echo ($cfg["code"]); ?>' />
			<div class='buttonActive' style='margin-right:5px;'>
				<div class='buttonContent'>
					<button type='button' class='keimg ke-icon-upload_image' rel='<?php echo ($cfg["code"]); ?>'>选择图片</button>
				</div>
			</div>
		</div>
		 <a href='<?php if($cfg["val"] == ''): ?>./admin/Tpl/default/Common/images/no_pic.gif<?php else: ?><?php echo ($cfg["val"]); ?><?php endif; ?>' target='_blank' id='keimg_a_<?php echo ($cfg["code"]); ?>' ><img src='<?php if($cfg["val"] == ''): ?>./admin/Tpl/default/Common/images/no_pic.gif<?php else: ?><?php echo ($cfg["val"]); ?><?php endif; ?>' id='keimg_m_<?php echo ($cfg["code"]); ?>' width=35 height=35 style='float:left; border:#ccc solid 1px; margin-left:5px;' /></a>
		 <div style='float:left; height:35px; padding-top:1px;'>
			 <div class='buttonActive'>
				<div class='buttonContent'>
					<img src='/admin/Tpl/default/Common/images/del.gif' style='<?php if($cfg["val"] == ''): ?>display:none<?php endif; ?>; margin-left:10px; float:left; border:#ccc solid 1px; width:35px; height:35px; cursor:pointer;' class='keimg_d' rel='<?php echo ($cfg["code"]); ?>' title='删除'>
				</div>
			</div>
		</div>
		</span><?php endif; ?>
				<?php if($cfg['type'] == 0): ?><input type="text" class="textbox" name="<?php echo ($cfg["code"]); ?>" value="<?php echo ($cfg["val"]); ?>" /><?php endif; ?>
				<?php if($cfg['type'] == 3): ?><textarea class="textbox " name="<?php echo ($cfg["code"]); ?>"  style="height:100px;width:250px;"><?php echo ($cfg["val"]); ?></textarea><?php endif; ?>
			</td>
		</tr><?php endforeach; endif; ?>
		<tr>
			<td class="item_title"></td>
			<td class="item_input">
				<input type="hidden" name="<?php echo conf("VAR_MODULE");?>" value="Conf" />
			
				<input type="hidden" name="<?php echo conf("VAR_ACTION");?>" value="savemobile" />
				<input type="submit" class="button" value="<?php echo L("EDIT");?>" />
				<input type="reset" class="button" value="<?php echo L("RESET");?>" />
			</td>
		</tr>
		<tr>
			<td colspan="2" class="bottomTd"></td>
		</tr>
	</table>
	</form>
</div>
</body>
</html>