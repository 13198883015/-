<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><?php echo conf("APP_NAME");?><?php echo l("ADMIN_PLATFORM");?></title>
<script type="text/javascript" src="__ROOT__/public/runtime/admin/lang.js"></script>
<script type="text/javascript">
	var version = '<?php echo app_conf("DB_VERSION");?>';
</script>
<link rel="stylesheet" type="text/css" href="__TMPL__Common/style/style.css" />
<link rel="stylesheet" type="text/css" href="__TMPL__Common/style/main.css" />
<script type="text/javascript" src="__TMPL__Common/js/jquery.js"></script>
</head>

<body>
	<div class="main">
	<div class="main_title">网站统计信息</div>
	<div class="blank5"></div>
	<table class="form" cellpadding=0 cellspacing=0>
		<tr>
			<td colspan=2 class="topTd"></td>
		</tr>
		<tr>
			<td class="item_title ">
				会员统计
			</td>
			<td class="item_input">
				<a href="<?php echo u("User/index");?>">会员总数：<?php echo ($user_count); ?></a>，
						其中 
						<a href="<?php echo u("User/index",array("is_effect"=>1));?>">有效账户：<?php if($effect_user[0]['is_effect'] == 1): ?><?php echo ($effect_user["0"]["total_user"]); ?><?php else: ?>0<?php endif; ?></a>
						&nbsp;，&nbsp;
						<a href="<?php echo u("User/index",array("is_effect"=>0));?>">无效账户：<?php if($effect_user[0]['is_effect'] == 0): ?><?php echo ($effect_user["0"]["total_user"]); ?><?php elseif($effect_user[1]['is_effect'] == 0): ?><?php if($effect_user[1]['total_user'] > 0){ echo $effect_user[1]['total_user'];}else{ echo  0;} ?><?php else: ?>0<?php endif; ?></a>
						&nbsp;，&nbsp;
						 <a href="<?php echo u("User/trash");?>">回收站用户：<?php echo ($trash_user_count); ?></a>
				<br>
				<?php if(is_array($credit_types)): foreach($credit_types as $key=>$credit): ?>通过<?php echo ($credit["type_name"]); ?>：<?php echo ($credit["user_count"]); ?><br><?php endforeach; endif; ?>
			</td>
		</tr>
		<tr>
			<td colspan=2 class="topTd"></td>
		</tr>
		<tr>
			<td class="item_title ">
				资金进出统计
			</td>
			<td class="item_input">
				&nbsp;&nbsp;线上充值：<?php echo number_format($online_pay,2);?>【<a href="<?php echo u("PaymentNotice/index",array('no_payment_id'=>$below_pay_id,'is_paid'=>1));?>">查看详情</a>】<br>
				&nbsp;&nbsp;线下充值：<?php echo number_format($below_pay,2);?>【<a href="<?php echo u("PaymentNotice/index",array('payment_id'=>$below_pay_id,'is_paid'=>1));?>">查看详情</a>】<br>
				管理员充值：<?php echo number_format($manage_recharge,2);?><br>
				管理员提现：<?php echo number_format($manage_carry,2);?>【<a href="<?php echo u("Index/manage_carry");?>">操作</a>】<br>
				&nbsp;&nbsp;成功提现：<?php echo number_format($carry_amount,2);?><br>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;总计：<?php echo number_format($total_usre_money,2);?>
			</td>
		</tr>
		<tr>
			<td colspan=2 class="topTd"></td>
		</tr>
		<tr>
			<td class="item_title ">
				借款统计
			</td>
			<td class="item_input">
				&nbsp;&nbsp;成功借出总额：<?php echo number_format($borrow_amount,2);?><br>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;已还总额：<?php echo number_format($has_repay_amount,2);?><br>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;待还总额：<?php echo number_format($need_repay_amount,2);?><br>
				冻结中的保证金：<?php echo number_format($freezen_amt,2);?>【借款人】 + <?php echo number_format($grt_freezen_amt,2);?>【担保方】<br>
			</td>
		</tr>
		<tr>
			<td colspan=2 class="topTd"></td>
		</tr>
		<tr>
			<td class="item_title ">
				投资者收益统计
			</td>
			<td class="item_input">
				&nbsp;&nbsp;&nbsp;&nbsp;成功借款利息总额：<?php echo number_format($load_rate_amount,2);?><br>
				成功借款投标奖励总额：<?php echo number_format($rebate_amount,2);?><br>
				&nbsp;&nbsp;&nbsp;&nbsp;注册奖励冻结资金：<?php echo number_format($register_lock_money,2);?><br>
			</td>
		</tr>
		
		<tr>
			<td colspan=2 class="topTd"></td>
		</tr>
		<tr>
			<td class="item_title ">
				逾期统计
			</td>
			<td class="item_input">
				&nbsp;&nbsp;逾期还款总额：<?php echo number_format($yq_repay_amount,2);?>【含逾期管理费】<br>
				逾期未还款总额：<?php echo number_format($yq_norepay_amount,2);?>【含逾期管理费】<br>
				&nbsp;&nbsp;逾期罚息总额：<?php echo number_format($yq_all_amount,2);?>【含逾期管理费】<br>
			</td>
		</tr>
		<tr>
			<td colspan=2 class="topTd"></td>
		</tr>
		<tr>
			<td class="item_title ">
				网站收益统计
			</td>
			<td class="item_input">
				借入者成交服务费总额：<?php echo number_format($success_service_fee,2);?><br>
				借入者成交管理费总额：<?php echo number_format($success_manage_fee,2);?><br>
				投资者成交管理费总额：<?php echo number_format($load_success_manage_fee,2);?><br>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;提现手续费总额：<?php echo number_format($carry_manage_fee,2);?><br>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;网站收益总计：<?php echo number_format(($success_service_fee + $success_manage_fee + $load_success_manage_fee + $carry_manage_fee),2);?><br>
			</td>
		</tr>
		
		
		<tr>
			<td colspan=2 class="bottomTd"></td>
		</tr>
	</table>	
	</div>
</body>
</html>