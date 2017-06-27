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
<div class="main">
<div class="main_title"><?php echo L("ADD");?> <a href="<?php echo u("Deal/index");?>" class="back_list"><?php echo L("BACK_LIST");?></a></div>
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
		<td class="item_title">颜色:</td>
		<td class="item_input">
			<input type="text" name="titlecolor" class="textbox" maxlength="6" size="6" id="colorpickerField" value="" />
			<span class="tip_span">不填即为默认颜色</span>
		</td>
	</tr>
	<tr>
		<td class="item_title">借款编号:</td>
		<td class="item_input">
			<input type="text" name="deal_sn" class="textbox" value="<?php echo ($deal_sn); ?>" />
			<span class="tip_span">此处编号用于合同处，不得重复</span>
		</td>
	</tr>
	<tr>
		<td class="item_title"><?php echo L("DEAL_NAME");?>:</td>
		<td class="item_input">
			<input type="text" class="textbox require" name="name" style="width:500px;" />
		</td>
	</tr>
	<tr>
		<td class="item_title"><?php echo L("DEAL_SUB_NAME");?>:</td>
		<td class="item_input"><input type="text" class="textbox require" name="sub_name" /> <span class='tip_span'>[<?php echo L("DEAL_SUB_NAME_TIP");?>]</span></td>
	</tr>
	<tr>
		<td class="item_title">会员ID:</td>
		<td class="item_input"><input type="text" class="textbox require" name="user_id" /> 
	</tr>
	
	<!-- xsz -->
	<tr>
		<td class="item_title">认证资料显示:</td>
		<td id="view_user_img_box">
		</td>
	</tr>

	
	<tr>
		<td class="item_title">所在城市:</td>
		<td class="item_input" id="citys_box">
			
			<?php if(is_array($citys)): foreach($citys as $key=>$city): ?><?php if($city['pid'] == 0): ?><div class="item">
						<div class="bcity f_l">
							<input name="city_id[]"  type="checkbox" value="<?php echo ($city["id"]); ?>" >
							<?php echo ($city["name"]); ?>
						 	：
					 	</div>
					 	<div class="scity f_l">
					 	<?php if(is_array($citys)): foreach($citys as $key=>$citya): ?><?php if($city['id'] == $citya['pid']): ?><input  type="checkbox" name="city_id[]" value="<?php echo ($citya["id"]); ?>" >
								 <?php echo ($citya["name"]); ?><?php endif; ?><?php endforeach; endif; ?>
						</div>
					</div>
					<div class="blank5"></div><?php endif; ?><?php endforeach; endif; ?>
			
		</td>
	</tr>
	
	<tr>
		<td class="item_title"><?php echo L("CATE_TREE");?>:</td>
		<td class="item_input">	
		<select name="cate_id" class="require">
			<option value="0">==<?php echo L("NO_SELECT_CATE");?>==</option>
			<?php if(is_array($deal_cate_tree)): foreach($deal_cate_tree as $key=>$cate_item): ?><option value="<?php echo ($cate_item["id"]); ?>"><?php echo ($cate_item["title_show"]); ?></option><?php endforeach; endif; ?>
		</select>
		</td>
	</tr>
	
	
	<tr>
		<td class="item_title">担保机构:</td>
		<td class="item_input">
		<select name="agency_id">
			<option value="0">==<?php echo L("NO_SELECT_AGENCY");?>==</option>
			<?php if(is_array($deal_agency)): foreach($deal_agency as $key=>$agency_item): ?><option value="<?php echo ($agency_item["id"]); ?>"><?php if($agency_item['short_name'] != ''): ?><?php echo ($agency_item["short_name"]); ?><?php else: ?><?php echo ($agency_item["name"]); ?><?php endif; ?></option><?php endforeach; endif; ?>
		</select>
		</td>
	</tr>
	
	<tr>
		<td class="item_title">担保范围:</td>
		<td class="item_input">
		<select name="warrant">
			<option value="0">无</option>
			<option value="1">本金</option>
			<option value="2">本金及利息</option>
		</select>
		</td>
	</tr>
	
	<tr id="guarantor_margin_amt_box" style="display:none">
		<td class="item_title">担保保证金:</td>
		<td class="item_input">
			<input type="text" class="textbox" name="guarantor_margin_amt" value="0.00" />
			<span class="tip_span">冻结担保人的金额，需要提前存钱</span>
		</td>
	</tr>
	
	<tr id="guarantor_amt_box" style="display:none">
		<td class="item_title">担保金额:</td>
		<td class="item_input">
			<input type="text" class="textbox" name="guarantor_amt" value="0.00" />
			<a href="__ROOT__/index.php?ctl=tool" target="_blank">理财计算器</a>
		</td>
	</tr>
	
	<tr id="guarantor_pro_fit_amt_box" style="display:none">
		<td class="item_title">担保收益:</td>
		<td class="item_input">
			<input type="text" class="textbox" name="guarantor_pro_fit_amt" value="0.00" />
		</td>
	</tr>
	
	<tr>
		<td class="item_title"><?php echo L("DEAL_ICON");?>:</td>
		<td class="item_input">
			<span>
        <div style='float:left; height:35px; padding-top:1px;'>
			<input type='hidden' value='' name='icon' id='keimg_h_icon' />
			<div class='buttonActive' style='margin-right:5px;'>
				<div class='buttonContent'>
					<button type='button' class='keimg ke-icon-upload_image' rel='icon'>选择图片</button>
				</div>
			</div>
		</div>
		 <a href='./admin/Tpl/default/Common/images/no_pic.gif' target='_blank' id='keimg_a_icon' ><img src='./admin/Tpl/default/Common/images/no_pic.gif' id='keimg_m_icon' width=35 height=35 style='float:left; border:#ccc solid 1px; margin-left:5px;' /></a>
		 <div style='float:left; height:35px; padding-top:1px;'>
			 <div class='buttonActive'>
				<div class='buttonContent'>
					<img src='/admin/Tpl/default/Common/images/del.gif' style='display:none; margin-left:10px; float:left; border:#ccc solid 1px; width:35px; height:35px; cursor:pointer;' class='keimg_d' rel='icon' title='删除'>
				</div>
			</div>
		</div>
		</span>
		</td>
	</tr>
	
	<tr>
		<td class="item_title"><?php echo L("TYPE_TREE");?>:</td>
		<td class="item_input">
		<select name="type_id">
			<option value="0">==<?php echo L("NO_SELECT_TYPE");?>==</option>
			<?php if(is_array($deal_type_tree)): foreach($deal_type_tree as $key=>$type_item): ?><option value="<?php echo ($type_item["id"]); ?>"><?php echo ($type_item["name"]); ?></option><?php endforeach; endif; ?>
		</select>
		</td>
	</tr>
	
	<tr>
		<td class="item_title">还款方式:</td>
		<td class="item_input">
			<select name="loantype">
				<option value="0">等额本息</option>
				<option value="1">付息还本</option>
				<option value="2">到期本息</option>
			</select>
		</td>
	</tr>
	
	<tr>
		<td class="item_title"><?php echo L("BORROW_AMOUNT");?>:</td>
		<td class="item_input">
			<input type="text" class="textbox require" name="borrow_amount" value="0.00" />
		</td>
	</tr>
	
	<tr>
		<td class="item_title">借款保证金:</td>
		<td class="item_input">
			<input type="text" class="textbox require " name="guarantees_amt"  value="0.00"  />
			<span class="tip_span">冻结借款人的金额，需要提前存钱</span>
		</td>
	</tr>
	
	<tr>
		<td class="item_title"><?php echo L("MIN_LOAN_MONEY");?>:</td>
		<td class="item_input">
			<input type="text" class="textbox require" name="min_loan_money" value="0"/>
		</td>
	</tr>
	
	<tr>
		<td class="item_title"><?php echo L("MAX_LOAN_MONEY");?>:</td>
		<td class="item_input">
			<input type="text" class="textbox" name="max_loan_money"  value="0" />
			<span class="tip_span">0为不限制</span>
		</td>
	</tr>
	
	<tr>
		<td class="item_title"><?php echo L("REPAY_TIME");?>:</td>
		<td class="item_input">
			<input type="text" id="repay_time" class="textbox require" SIZE="5"  name="repay_time" value="3" />
			<select id="repay_time_type" name="repay_time_type">
				<option value="0">天</option>
				<option value="1" selected="selected">月</option>
			</select>
		</td>
	</tr>
	<tr>
		<td class="item_title"><?php echo L("RATE");?>:</td>
		<td class="item_input">
			<input type="text" class="textbox require" SIZE="5" name="rate"  value=""  />%
		</td>
	</tr>
	<tr>
		<td class="item_title">筹标期限:</td>
		<td class="item_input">
			<input type="text" class="textbox require" SIZE="5" name="enddate" value="<?php echo ($vo["enddate"]); ?>"  />
		</td>
	</tr>
	<tr>
		<td class="item_title">成交服务费:</td>
		<td class="item_input">
			<input type="text" class="textbox" SIZE="5" name="services_fee" value=""  />%
			<span class="tip_span">按发布时的会员等级</span>
		</td>
	</tr>
	<tr>
		<td class="item_title">借款者管理费:</td>
		<td class="item_input">
			<input type="text" class="textbox" SIZE="5" name="manage_fee" value="<?php echo app_conf("MANAGE_FEE");?>"  />%
			<span class="tip_span">管理费 = 本金总额×管理费率 0即不收取</span>
		</td>
	</tr>
	<tr>
		<td class="item_title">投资者管理费:</td>
		<td class="item_input">
			<input type="text" class="textbox" SIZE="5" name="user_loan_manage_fee" value="<?php echo app_conf("USER_LOAN_MANAGE_FEE");?>"  />%
			<span class="tip_span">管理费 = 投资总额×管理费率 0即不收取</span>
		</td>
	</tr>
	<tr>
		<td class="item_title">普通逾期管理费:</td>
		<td class="item_input">
			<input type="text" class="textbox" SIZE="5" name="manage_impose_fee_day1" value="<?php echo app_conf("MANAGE_IMPOSE_FEE_DAY1");?>"  />%
			<span class="tip_span">逾期管理费总额 = 逾期本息总额×对应逾期管理费率×逾期天数 0即不收取</span>
		</td>
	</tr>
	<tr>
		<td class="item_title">严重逾期管理费:</td>
		<td class="item_input">
			<input type="text" class="textbox" SIZE="5" name="manage_impose_fee_day2" value="<?php echo app_conf("MANAGE_IMPOSE_FEE_DAY2");?>"  />%
			<span class="tip_span">逾期管理费总额 = 逾期本息总额×对应逾期管理费率×逾期天数 0即不收取</span>
		</td>
	</tr>
	<tr>
		<td class="item_title">普通逾期罚息:</td>
		<td class="item_input">
			<input type="text" class="textbox" SIZE="5" name="impose_fee_day1" value="<?php echo app_conf("IMPOSE_FEE_DAY1");?>"  />%
			<span class="tip_span">罚息总额 = 逾期本息总额×对应罚息利率×逾期天数 0即不收取</span>
		</td>
	</tr>
	<tr>
		<td class="item_title">严重逾期罚息:</td>
		<td class="item_input">
			<input type="text" class="textbox" SIZE="5" name="impose_fee_day2" value="<?php echo app_conf("IMPOSE_FEE_DAY2");?>"  />%
			<span class="tip_span">罚息总额 = 逾期本息总额×对应罚息利率×逾期天数 0即不收取</span>
		</td>
	</tr>
	<tr>
		<td class="item_title">债权转让管理费:</td>
		<td class="item_input">
			<input type="text" class="textbox" SIZE="5" name="user_load_transfer_fee" value="<?php echo app_conf("USER_LOAD_TRANSFER_FEE");?>"  />%
			<span class="tip_span">管理费 = 转让金额×管理费率 0即不收取</span>
		</td>
	</tr>
	<tr>
		<td class="item_title">提前还款补偿:</td>
		<td class="item_input">
			<input type="text" class="textbox" SIZE="5" name="compensate_fee" value="<?php echo app_conf("COMPENSATE_FEE");?>"  />%
			<span class="tip_span">补偿金额 = 剩余本金×补偿利率 0即不收取</span>
		</td>
	</tr>
	<tr>
		<td class="item_title">投资人返利:</td>
		<td class="item_input">
			<input type="text" class="textbox" SIZE="5" name="user_bid_rebate" value="<?php echo app_conf("USER_BID_REBATE");?>"  />%
			<span class="tip_span">返利金额=投标金额×返利百分比【需满标】</span>
		</td>
	</tr>
	
	<tr>
		<td class="item_title">申请延期:</td>
		<td class="item_input">
			<input type="text" class="textbox" SIZE="5" name="generation_position" value="100"  />%
			<span class="tip_span">当还款金额大于或等于设置的额度，借款人如果资金不够，可申请延期还款，延期还款就是平台代其还此借款。借款人未还部分由平台跟借款人协商。</span>
		</td>
	</tr>
	
	<tr>
		<td class="item_title"><?php echo L("DEAL_DESCRIPTION");?>:</td>
		<td class="item_input">
			 <div  style='margin-bottom:5px; '><textarea id='description' name='description' class='ketext' style='width:500px;height:200px' ></textarea> </div>
		</td>
	</tr>
	<tr>
		<td class="item_title">风险等级:</td>
		<td class="item_input">
			<select name="risk_rank">
				<option value="0">低</option>
				<option value="1">中</option>
				<option value="2">高</option>
			</select>
		</td>
	</tr>
	<tr>
		<td class="item_title">借款状态:</td>
		<td class="item_input">
			<label><?php echo L("DEAL_STATUS_0");?><input type="radio" name="deal_status" value="0" checked="checked" /></label>
			<label><?php echo L("DEAL_STATUS_1");?><input type="radio" name="deal_status" value="1" /></label>
			<label><?php echo L("DEAL_STATUS_3");?><input type="radio" name="deal_status" value="3" /></label>
		</td>
	</tr>
	<tr id="start_time_box" style="display:none">
		<td class="item_title">开始时间:</td>
		<td class="item_input">
			<input type="text" class="textbox" name="start_time" value="" id="start_time"  onfocus="this.blur(); return showCalendar('start_time', '%Y-%m-%d %H:%M:%S', false, false, 'btn_start_time');" />
			<input type="button" class="button" id="btn_start_time" value="<?php echo L("SELECT_TIME");?>" onclick="return showCalendar('start_time', '%Y-%m-%d %H:%M:%S', false, false, 'btn_start_time');" />
			<input type="button" class="button" value="<?php echo L("CLEAR_TIME");?>" onclick="$('#start_time').val('');" />		
		</td>
	</tr>
	<tr id="bad_time_box" style="display:none">
		<td class="item_title"><?php echo L("DEAL_STATUS_3");?>时间:</td>
		<td class="item_input">
			<input type="text" class="textbox" name="bad_time" id="bad_time" value="" onfocus="this.blur(); return showCalendar('bad_time', '%Y-%m-%d %H:%M:%S', false, false, 'btn_bad_time');" />
			<input type="button" class="button" id="btn_bad_time" value="<?php echo L("SELECT_TIME");?>" onclick="return showCalendar('bad_time', '%Y-%m-%d %H:%M:%S', false, false, 'btn_bad_time');" />
			<input type="button" class="button" value="<?php echo L("CLEAR_TIME");?>" onclick="$('#bad_time').val('');" />	
		</td>
	</tr>
	<tr id="bad_info_box" style="display:none">
		<td class="item_title"><?php echo L("DEAL_STATUS_3");?>原因:</td>
		<td class="item_input">
			<textarea type="text" class="textbox" name="bad_msg" id="bad_msg" value="" rows="3" cols="50"></textarea>
		</td>
	</tr>
	<!--<tr>
		<td class="item_title"><?php echo L("IS_EFFECT");?>:</td>
		<td class="item_input">
			<lable><?php echo L("IS_EFFECT_1");?><input type="radio" name="is_effect" value="1" checked="checked" /></lable>
			<lable><?php echo L("IS_EFFECT_0");?><input type="radio" name="is_effect" value="0" /></lable>
		</td>
	</tr>-->
	<tr>
		<td class="item_title"><?php echo L("SORT");?>:</td>
		<td class="item_input"><input type="text" class="textbox" name="sort" value="<?php echo ($new_sort); ?>" /></td>
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
		<td class="item_title"><?php echo L("DEAL_SEO_TITLE");?>:</td>
		<td class="item_input"><textarea class="textarea" name="seo_title" ></textarea></td>
	</tr>
	<tr>
		<td class="item_title"><?php echo L("DEAL_SEO_KEYWORD");?>:</td>
		<td class="item_input"><textarea class="textarea" name="seo_keyword" ></textarea></td>
	</tr>
	<tr>
		<td class="item_title"><?php echo L("DEAL_SEO_DESCRIPTION");?>:</td>
		<td class="item_input"><textarea class="textarea" name="seo_description" ></textarea></td>
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
			<input type="hidden" name="<?php echo conf("VAR_MODULE");?>" value="Deal" />
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
</>
</body>
</html>