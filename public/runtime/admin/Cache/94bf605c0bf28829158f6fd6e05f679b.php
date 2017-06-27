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
<?php function getReferralsUserName($user_id)
{
	$user_name =  M("User")->where("id=".$user_id." and is_delete = 0")->getField("user_name");
	if(!$user_name)
	$user_name = l("NO_USER");
	
	return "<a href='".u("User/index",array("user_name"=>$user_name))."'>".$user_name."</a>";
}


function pay_time_stauts($pay_time,$id){
	if(intval($pay_time) == 0)
	{
		return "<a href='javascript:pay(".$id.")'>".l("PAY_BY_ADMIN")."</a>";
	}
	else
		return to_date($pay_time);
}

function get_deal_name($deal_id){
	return '<a href="__ROOT__/index.php?ctl=deal&id='.$deal_id.'" target="_blank">'.D("Deal")->where("id=".$deal_id)->getfield("name").'</a>';
} ?>
</PHP>
<script type="text/javascript">
	function pay(id)
	{
		if(confirm("<?php echo L("CONFIRM_PAY");?>"))
		location.href = ROOT+"?"+VAR_MODULE+"=Referrals&"+VAR_ACTION+"=pay&id="+id;
	}
	function foreach_pay(){
		location.href = ROOT+"?"+VAR_MODULE+"=Referrals&"+VAR_ACTION+"=foreach_pay&log_begin_time="+$("#log_begin_time").val()+"&log_end_time="+$("#log_end_time").val();
	}
</script>
<div class="main">
<div class="main_title"><?php echo ($main_title); ?></div>
<div class="blank5"></div>
<div class="search_row">
	<form name="search" action="__APP__" method="get">	
		<input type="text" class="textbox" name="log_begin_time" id="log_begin_time" value="<?php echo trim($_REQUEST['log_begin_time']);?>" onfocus="return showCalendar('log_begin_time', '%Y-%m-%d %H:%M:%S', false, false, 'btn_log_begin_time');" />
		<input type="button" class="button" id="btn_log_begin_time" value="<?php echo L("SELECT_TIME");?>" onclick="return showCalendar('log_begin_time', '%Y-%m-%d %H:%M:%S', false, false, 'btn_log_begin_time');" />	
		-
		<input type="text" class="textbox" name="log_end_time" id="log_end_time" value="<?php echo trim($_REQUEST['log_end_time']);?>" onfocus="return showCalendar('log_end_time', '%Y-%m-%d %H:%M:%S', false, false, 'btn_log_end_time');" />
		<input type="button" class="button" id="btn_log_end_time" value="<?php echo L("SELECT_TIME");?>" onclick="return showCalendar('log_end_time', '%Y-%m-%d %H:%M:%S', false, false, 'btn_log_end_time');" />	
		可返列表
		<input type="hidden" value="Referrals" name="m" />
		<input type="hidden" value="index" name="a" />
		<input type="submit" class="button" value="<?php echo L("SEARCH");?>" />
		
		
		<input type="button" class="button" onclick="foreach_pay();" value="结果批量返还" />
	</form>
</div>
<div class="blank5"></div>
<!-- Think 系统列表组件开始 -->
<table id="dataTable" class="dataTable" cellpadding=0 cellspacing=0 ><tr><td colspan="12" class="topTd" >&nbsp; </td></tr><tr class="row" ><th width="8"><input type="checkbox" id="check" onclick="CheckAll('dataTable')"></th><th width="50px"><a href="javascript:sortBy('id','<?php echo ($sort); ?>','Referrals','index')" title="按照<?php echo L("ID");?><?php echo ($sortType); ?> "><?php echo L("ID");?><?php if(($order)  ==  "id"): ?><img src="__TMPL__Common/images/<?php echo ($sortImg); ?>.gif" width="12" height="17" border="0" align="absmiddle"><?php endif; ?></a></th><th><a href="javascript:sortBy('user_id','<?php echo ($sort); ?>','Referrals','index')" title="按照<?php echo L("REFERRALS_USER");?><?php echo ($sortType); ?> "><?php echo L("REFERRALS_USER");?><?php if(($order)  ==  "user_id"): ?><img src="__TMPL__Common/images/<?php echo ($sortImg); ?>.gif" width="12" height="17" border="0" align="absmiddle"><?php endif; ?></a></th><th><a href="javascript:sortBy('rel_user_id','<?php echo ($sort); ?>','Referrals','index')" title="按照投资人<?php echo ($sortType); ?> ">投资人<?php if(($order)  ==  "rel_user_id"): ?><img src="__TMPL__Common/images/<?php echo ($sortImg); ?>.gif" width="12" height="17" border="0" align="absmiddle"><?php endif; ?></a></th><th><a href="javascript:sortBy('lixi','<?php echo ($sort); ?>','Referrals','index')" title="按照利息总额<?php echo ($sortType); ?> ">利息总额<?php if(($order)  ==  "lixi"): ?><img src="__TMPL__Common/images/<?php echo ($sortImg); ?>.gif" width="12" height="17" border="0" align="absmiddle"><?php endif; ?></a></th><th><a href="javascript:sortBy('referral_rate','<?php echo ($sort); ?>','Referrals','index')" title="按照抽成比例%<?php echo ($sortType); ?> ">抽成比例%<?php if(($order)  ==  "referral_rate"): ?><img src="__TMPL__Common/images/<?php echo ($sortImg); ?>.gif" width="12" height="17" border="0" align="absmiddle"><?php endif; ?></a></th><th><a href="javascript:sortBy('smoney','<?php echo ($sort); ?>','Referrals','index')" title="按照<?php echo L("REFERRALS_MONEY");?><?php echo ($sortType); ?> "><?php echo L("REFERRALS_MONEY");?><?php if(($order)  ==  "smoney"): ?><img src="__TMPL__Common/images/<?php echo ($sortImg); ?>.gif" width="12" height="17" border="0" align="absmiddle"><?php endif; ?></a></th><th><a href="javascript:sortBy('deal_id','<?php echo ($sort); ?>','Referrals','index')" title="按照借款<?php echo ($sortType); ?> ">借款<?php if(($order)  ==  "deal_id"): ?><img src="__TMPL__Common/images/<?php echo ($sortImg); ?>.gif" width="12" height="17" border="0" align="absmiddle"><?php endif; ?></a></th><th><a href="javascript:sortBy('load_id','<?php echo ($sort); ?>','Referrals','index')" title="按照投标编号<?php echo ($sortType); ?> ">投标编号<?php if(($order)  ==  "load_id"): ?><img src="__TMPL__Common/images/<?php echo ($sortImg); ?>.gif" width="12" height="17" border="0" align="absmiddle"><?php endif; ?></a></th><th><a href="javascript:sortBy('l_key','<?php echo ($sort); ?>','Referrals','index')" title="按照第几期<?php echo ($sortType); ?> ">第几期<?php if(($order)  ==  "l_key"): ?><img src="__TMPL__Common/images/<?php echo ($sortImg); ?>.gif" width="12" height="17" border="0" align="absmiddle"><?php endif; ?></a></th><th><a href="javascript:sortBy('repay_time','<?php echo ($sort); ?>','Referrals','index')" title="按照返利时间<?php echo ($sortType); ?> ">返利时间<?php if(($order)  ==  "repay_time"): ?><img src="__TMPL__Common/images/<?php echo ($sortImg); ?>.gif" width="12" height="17" border="0" align="absmiddle"><?php endif; ?></a></th><th><a href="javascript:sortBy('pay_time','<?php echo ($sort); ?>','Referrals','index')" title="按照<?php echo L("REFERRALS_PAY_TIME");?><?php echo ($sortType); ?> "><?php echo L("REFERRALS_PAY_TIME");?><?php if(($order)  ==  "pay_time"): ?><img src="__TMPL__Common/images/<?php echo ($sortImg); ?>.gif" width="12" height="17" border="0" align="absmiddle"><?php endif; ?></a></th></tr><?php if(is_array($list)): $i = 0; $__LIST__ = $list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$referrals): ++$i;$mod = ($i % 2 )?><tr class="row" ><td><input type="checkbox" name="key" class="key" value="<?php echo ($referrals["id"]); ?>"></td><td>&nbsp;<?php echo ($referrals["id"]); ?></td><td>&nbsp;<?php echo (getReferralsUserName($referrals["user_id"])); ?></td><td>&nbsp;<?php echo (getReferralsUserName($referrals["rel_user_id"])); ?></td><td>&nbsp;<?php echo (format_price($referrals["lixi"])); ?></td><td>&nbsp;<?php echo ($referrals["referral_rate"]); ?></td><td>&nbsp;<?php echo (format_price($referrals["smoney"])); ?></td><td>&nbsp;<?php echo (get_deal_name($referrals["deal_id"])); ?></td><td>&nbsp;<?php echo ($referrals["load_id"]); ?></td><td>&nbsp;<?php echo ($referrals["l_key"]); ?></td><td>&nbsp;<?php echo (to_date($referrals["repay_time"])); ?></td><td>&nbsp;<?php echo (pay_time_stauts($referrals["pay_time"],$referrals['id'])); ?></td></tr><?php endforeach; endif; else: echo "" ;endif; ?><tr><td colspan="12" class="bottomTd"> &nbsp;</td></tr></table>
<!-- Think 系统列表组件结束 -->
 

<div class="blank5"></div>
<div class="page"><?php echo ($page); ?></div>
</div>
</body>
</html>