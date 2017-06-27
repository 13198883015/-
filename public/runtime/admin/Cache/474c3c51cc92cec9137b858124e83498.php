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

<script type="text/javascript" src="__TMPL__Common/js/calendar/calendar.php?lang=zh-cn" ></script>

<link rel="stylesheet" type="text/css" href="__TMPL__Common/js/calendar/calendar.css" />
<script type="text/javascript" src="__TMPL__Common/js/calendar/calendar.js"></script>
<div class="main">
<div class="main_title"><?php echo ($main_title); ?></div>
<div class="blank5"></div>

<form name="search" action="__APP__" method="get">	

<div class="search_row">
	开始时间：
	<input type="text" class="textbox" name="start_time" value="<?php echo ($start_time); ?>" id="start_time"  onfocus="this.blur(); return showCalendar('start_time', '%Y-%m-%d', false, false, 'btn_start_time');" />
	<input type="button" class="button" id="btn_start_time" value="<?php echo L("SELECT_TIME");?>" onclick="return showCalendar('start_time', '%Y-%m-%d', false, false, 'btn_start_time');" />
	
	结束时间：
	<input type="text" class="textbox" name="end_time" value="<?php echo ($end_time); ?>" id="end_time"  onfocus="this.blur(); return showCalendar('end_time', '%Y-%m-%d', false, false, 'btn_end_time');" />
	<input type="button" class="button" id="btn_end_time" value="<?php echo L("SELECT_TIME");?>" onclick="return showCalendar('end_time', '%Y-%m-%d', false, false, 'btn_end_time');" />
	
		<input type="hidden" value="Statistics" name="m" />
		<input type="hidden" value="index" name="a" />
		<input type="hidden" value="do" name="search" />
		<input type="submit" class="button" value="<?php echo L("SEARCH");?>" />
		
		<span class="span_tip">&nbsp;结果仅供参考</span>

</div>
</form>
<div class="blank5"></div>

<table cellspacing="0" cellpadding="0" class="dataTable" id="dataTable">
	<tbody>
		<tr>
			<td class="topTd" colspan="<?php echo 17+count($deal_cate); ?>">&nbsp; </td>
			</tr>
			<tr class="row">
				<th>时间</th>
				<th>线上充值</th>		
				<th>线下充值</th>
				
				<?php if(is_array($deal_cate)): foreach($deal_cate as $key=>$cate): ?><th><?php echo ($cate["name"]); ?></th><?php endforeach; endif; ?>
				
				<th>投资总额</th>
				<th>已获利息</th>
				
				<th>应付本金</th>
				<th>应付利息</th>
				<th>应付罚息</th>
				
				<th>已付本金</th>
				<th>已付利息</th>
				<th>已付罚息</th>
				
				<th>待收本金</th>
				<th>待收利息</th>
				<th>待收罚息</th>
				
				<th>待投资金</th>
				<th>申请提现</th>
				<th>成功提现</th>
				</tr>
				<?php if(is_array($list)): foreach($list as $key=>$item): ?><tr class="row">
					<td><?php echo (to_date($item["day"],"Y-m-d")); ?></td>
					<td><?php echo conf("CURRENCY_UNIT");?><?php echo (number_format($item["online_pay"],2)); ?></td>			
					<td><?php echo conf("CURRENCY_UNIT");?><?php echo (number_format($item["below_pay"],2)); ?></td>
					
					<?php if(is_array($deal_cate)): foreach($deal_cate as $key=>$cate): ?><td><?php echo conf("CURRENCY_UNIT");?><?php echo number_format($item[$cate['id']]['borrow_amount'],2); ?></td><?php endforeach; endif; ?>
					
					<td><?php echo conf("CURRENCY_UNIT");?><?php echo (number_format($item["load_amount"],2)); ?></td>
					<td><?php echo conf("CURRENCY_UNIT");?><?php echo (number_format($item["load_lixi_amount"],2)); ?></td>
					
					<td><?php echo conf("CURRENCY_UNIT");?><?php echo (number_format($item["benjin_amount"],2)); ?></td>
					<td><?php echo conf("CURRENCY_UNIT");?><?php echo (number_format($item["pay_lxi_amount"],2)); ?></td>
					<td><?php echo conf("CURRENCY_UNIT");?><?php echo (number_format($item["impose_amount"],2)); ?></td>
					
					<td><?php echo conf("CURRENCY_UNIT");?><?php echo (number_format($item["has_repay_benjin_amount"],2)); ?></td>
					<td><?php echo conf("CURRENCY_UNIT");?><?php echo (number_format($item["has_repay_lxi_amount"],2)); ?></td>
					<td><?php echo conf("CURRENCY_UNIT");?><?php echo (number_format($item["has_repay_impose_amount"],2)); ?></td>
					
					<td><?php echo conf("CURRENCY_UNIT");?><?php echo (number_format($item["wait_repay_benjin_amount"],2)); ?></td>
					<td><?php echo conf("CURRENCY_UNIT");?><?php echo (number_format($item["wait_repay_lxi_amount"],2)); ?></td>
					<td><?php echo conf("CURRENCY_UNIT");?><?php echo (number_format($item["wait_repay_impose_amount"],2)); ?></td>
					
					<td><?php echo conf("CURRENCY_UNIT");?><?php echo (number_format($user_amount,2)); ?></td>
					<td><?php echo conf("CURRENCY_UNIT");?><?php echo (number_format($item["carry"],2)); ?></td>
					<td><?php echo conf("CURRENCY_UNIT");?><?php echo (number_format($item["suc_carry"],2)); ?></td>
				</tr><?php endforeach; endif; ?>
				<tr><td class="bottomTd" colspan="<?php echo 17+count($deal_cate); ?>"> &nbsp;</td></tr>
			</tbody>
		</table>


</div>
</body>
</html>