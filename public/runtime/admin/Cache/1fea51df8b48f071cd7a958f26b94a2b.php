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

<script type="text/javascript" src="__TMPL__Common/js/user_edit.js"></script>
<script type="text/javascript" src="__TMPL__Common/js/conf.js"></script>
<script type="text/javascript" src="__ROOT__/system/region.js"></script>
<div class="main">
<div class="main_title"><?php echo L("ADD");?> <a href="<?php echo u("User/index");?>" class="back_list"><?php echo L("BACK_LIST");?></a></div>
<div class="blank5"></div>
<form name="edit" action="__APP__" method="post" enctype="multipart/form-data">

<div class="blank5"></div>
<table class="form conf_tab" cellpadding=0 cellspacing=0 rel="1">
	<tr>
		<td colspan=2 class="topTd"></td>
	</tr>
	<tr>
		<td class="item_title"><?php echo L("USER_NAME");?>:</td>
		<td class="item_input"><input type="text" class="textbox require" name="user_name" /></td>
	</tr>
	<tr>
		<td class="item_title"><?php echo L("USER_EMAIL");?>:</td>
		<td class="item_input"><input type="text" class="textbox require" name="email" /></td>
	</tr>
	<tr>
		<td class="item_title"><?php echo L("USER_MOBILE");?>:</td>
		<td class="item_input"><input type="text" class="textbox <?php if(intval(app_conf("MOBILE_MUST"))==1) echo 'require'; ?>" name="mobile" /></td>
	</tr>
	<tr>
		<td class="item_title"><?php echo L("USER_PASSWORD");?>:</td>
		<td class="item_input"><input type="password" class="textbox require" name="user_pwd" /></td>
	</tr>
	<tr>
		<td class="item_title"><?php echo L("USER_CONFIRM_PASSWORD");?>:</td>
		<td class="item_input"><input type="password" class="textbox require" name="user_confirm_pwd" /></td>
	</tr>
	<tr>
		<td class="item_title"><?php echo L("USER_GROUP");?>:</td>
		<td class="item_input">
			<select name="group_id">
				<?php if(is_array($group_list)): foreach($group_list as $key=>$group_item): ?><option value="<?php echo ($group_item["id"]); ?>"><?php echo ($group_item["name"]); ?></option><?php endforeach; endif; ?>
			</select>
		</td>
	</tr>
	<tr>
		<td colspan="2" class="item_title" style="text-align:center;"><b>身份信息</b></td>
	</tr>
	<tr>
		<td class="item_title">姓名:</td>
		<td class="item_input"><input type="text"  class="textbox" name="real_name" /></td>
	</tr>
	<tr>
		<td class="item_title">身份证号码:</td>
		<td class="item_input"><input type="text" class="textbox" name="idno" /></td>
	</tr>
		
	<tr>
		<td class="item_title"><?php echo L("USER_BIRTHDAY");?>:</td>
		<td class="item_input">
			<input type="text" name="byear" class="textbox" value=""  style="width:40px" maxlength="4" /><?php echo L("USER_BYEAR");?>
			<input type="text" name="bmonth" class="textbox" value="" style="width:20px" maxlength="2"/><?php echo L("USER_BMONTH");?>
			<input type="text" name="bday" class="textbox" value=""  style="width:20px" maxlength="2" /><?php echo L("USER_BDAY");?>
		</td>
	</tr>
	<tr>
		<td class="item_title">性别:</td>
		<td class="item_input">
			<select name="sex">
				<option value="0">女</option>
				<option value="1">男</option>
			</select>
		</td>
	</tr>
	<tr>
		<td colspan="2" class="item_title" style="text-align:center;"><b>学历信息</b></td>
	</tr>
	<tr>
		<td class="item_title">最高学历:</td>
		<td class="item_input">
			<select name="graduation">
				<option value="">请选择</option>
				<option value="高中或以下">高中或以下</option>
				<option value="大专">大专</option>
				<option value="本科">本科</option>
				<option value="研究生或以上">研究生或以上</option>
			</select>
		</td>
	</tr>
	<tr>
		<td class="item_title">入学年份:</td>
		<td class="item_input">
			<select name="graduatedyear">
				<?php $y = date("Y"); for($i=$y;$i>=$y-100;$i--): ?>
					<option value="<?php echo $i;?>"><?php echo $i;?></option>
				<?php endfor; ?>
			</select>
		</td>
	</tr>
	<tr>
		<td class="item_title">毕业院校:</td>
		<td class="item_input">
			<input type="text" name="university" class="textbox" value="" />
		</td>
	</tr>
	<tr>
		<td class="item_title">12位在线验证码:</td>
		<td class="item_input">
			<input type="text" name="edu_validcode" class="textbox" value="" />
		</td>
	</tr>
	<tr>
		<td colspan="2" class="item_title" style="text-align:center;"><b>婚姻状况</b></td>
	</tr>
	<tr>
		<td class="item_title">婚姻状况:</td>
		<td class="item_input">
			<label><input type="radio" class="f-radio" value="已婚" name="marriage">已婚</label>
			<label><input type="radio" class="f-radio" value="未婚" name="marriage">未婚</label>
			<label><input type="radio" class="f-radio" value="离异" name="marriage">离异</label>
			<label><input type="radio" class="f-radio" value="丧偶" name="marriage">丧偶</label>
		</td>
	</tr>
	<tr>
		<td colspan="2" class="item_title" style="text-align:center;"><b>房产信息</b></td>
	</tr>
	<tr>
		<td class="item_title">是否有房:</td>
		<td class="item_input">
			<label><input type="radio" class="f-radio" value="1" name="hashouse">有</label>
			<label><input type="radio" class="f-radio" value="0" name="hashouse" checked="checked">无</label>
		</td>
	</tr>
	<tr>
		<td class="item_title">有无房贷:</td>
		<td class="item_input">
			<label><input type="radio" class="f-radio" value="1" name="houseloan">有</label>
			<label><input type="radio" class="f-radio" value="0" name="houseloan" checked="checked">无</label>
		</td>
	</tr>
	<tr>
		<td colspan="2" class="item_title" style="text-align:center;"><b>购车信息</b></td>
	</tr>
	<tr>
		<td class="item_title">是否有车:</td>
		<td class="item_input">
			<label><input type="radio" class="f-radio" value="1" name="hascar"  <?php if($vo['hascar'] == 1): ?>checked="checked"<?php endif; ?>>有</label>
			<label><input type="radio" class="f-radio" value="0" name="hascar"  <?php if($vo['hascar'] == 0): ?>checked="checked"<?php endif; ?>>无</label>
		</td>
	</tr>
	<tr>
		<td class="item_title">有无车贷:</td>
		<td class="item_input">
			<label><input type="radio" class="f-radio" value="1" name="carloan"  <?php if($vo['carloan'] == 1): ?>checked="checked"<?php endif; ?>>有</label>
			<label><input type="radio" class="f-radio" value="0" name="carloan"  <?php if($vo['carloan'] == 0): ?>checked="checked"<?php endif; ?>>无</label>
		</td>
	</tr>
	<tr>
		<td class="item_title">汽车品牌:</td>
		<td class="item_input">
			<input type="text" name="car_brand" class="textbox" value="" />
		</td>
	</tr>
	<tr>
		<td class="item_title">购车年份:</td>
		<td class="item_input">
			<input type="text" name="car_year" class="textbox" value="" />
		</td>
	</tr>
	<tr>
		<td class="item_title">车牌号码:</td>
		<td class="item_input">
			<input type="text" name="car_number" class="textbox" value="" />
		</td>
	</tr>
	<tr>
		<td colspan="2" class="item_title" style="text-align:center;"><b>其他</b></td>
	</tr>
	<tr>
		<td class="item_title">有无子女:</td>
		<td class="item_input">
			<label><input type="radio" class="f-radio" value="1" name="haschild" />有</label>
			<label><input type="radio" class="f-radio" value="0" name="haschild" />无</label>
		</td>
	</tr>
	<tr>
		<td class="item_title">籍贯:</td>
		<td class="item_input">
			<select name="n_province_id">
				<option value="0">=<?php echo L("PLEASE_SELECT");?>=</option>
				<?php if(is_array($region_lv2)): foreach($region_lv2 as $key=>$lv2): ?><option value="<?php echo ($lv2["id"]); ?>"><?php echo ($lv2["name"]); ?></option><?php endforeach; endif; ?>
			</select>
									
			<select name="n_city_id">
				<option value="0">=<?php echo L("PLEASE_SELECT");?>=</option>	
				<?php if(is_array($region_lv3)): foreach($region_lv3 as $key=>$lv3): ?><option value="<?php echo ($lv3["id"]); ?>"><?php echo ($lv3["name"]); ?></option><?php endforeach; endif; ?>
			</select>
		</td>
	</tr>
	<tr>
		<td class="item_title">户口所在地:</td>
		<td class="item_input">
			<select name="province_id">
				<option value="0">=<?php echo L("PLEASE_SELECT");?>=</option>
				<?php if(is_array($region_lv2)): foreach($region_lv2 as $key=>$lv2): ?><option value="<?php echo ($lv2["id"]); ?>"><?php echo ($lv2["name"]); ?></option><?php endforeach; endif; ?>
			</select>
									
			<select name="city_id">
				<option value="0">=<?php echo L("PLEASE_SELECT");?>=</option>	
				<?php if(is_array($region_lv3)): foreach($region_lv3 as $key=>$lv3): ?><option value="<?php echo ($lv3["id"]); ?>"><?php echo ($lv3["name"]); ?></option><?php endforeach; endif; ?>
			</select>
		</td>
	</tr>
	<tr>
		<td class="item_title">居住地址:</td>
		<td class="item_input">
			<input type="text" value="" class="textbox" name="address" size="50">
		</td>
	</tr>
	<tr>
		<td class="item_title">电话:</td>
		<td class="item_input">
			<input type="text" class="textbox"  value="" name="phone">
		</td>
	</tr>
	<tr>
		<td colspan="2" class="item_title" style="text-align:center;"></td>
	</tr>
	<tr>
		<td class="item_title"><?php echo L("IS_EFFECT");?>:</td>
		<td class="item_input">
			<lable><?php echo L("IS_EFFECT_1");?><input type="radio" name="is_effect" value="1" checked="checked" /></lable>
			<lable><?php echo L("IS_EFFECT_0");?><input type="radio" name="is_effect" value="0" /></lable>
		</td>
	</tr>
	<?php if(is_array($field_list)): foreach($field_list as $key=>$field_item): ?><tr>
		<td class="item_title"><?php echo ($field_item["field_show_name"]); ?>:</td>
		<td class="item_input">
			 <?php if($field_item['input_type'] == 0): ?><input type="text" class="textbox <?php if($field_item['is_must'] == 1): ?>require<?php endif; ?>" name="<?php echo ($field_item["field_name"]); ?>" /><?php endif; ?>
			 
			 <?php if($field_item['input_type'] == 1): ?><select name="<?php echo ($field_item["field_name"]); ?>">
			 		<?php if(is_array($field_item["value_scope"])): foreach($field_item["value_scope"] as $key=>$value_item): ?><option value="<?php echo ($value_item); ?>"><?php echo ($value_item); ?></option><?php endforeach; endif; ?>
			 	</select><?php endif; ?>
		</td>
	</tr><?php endforeach; endif; ?>
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
			<input type="hidden" name="<?php echo conf("VAR_MODULE");?>" value="User" />
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