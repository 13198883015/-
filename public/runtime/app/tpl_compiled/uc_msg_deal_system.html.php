<?php
$this->_var['pmjs'][] = $this->_var['TMPL_REAL']."/js/pm.js";
$this->_var['cpmjs'][] = $this->_var['TMPL_REAL']."/js/pm.js";
?>
<script type="text/javascript" src="<?php 
$k = array (
  'name' => 'parse_script',
  'v' => $this->_var['pmjs'],
  'c' => $this->_var['cpmjs'],
);
echo $k['name']($k['v'],$k['c']);
?>"></script>

<div class="list">
	<div class="list_title clearfix">
		<div><a href="<?php
echo parse_url_tag("u:index|uc_msg#index|"."".""); 
?>"><?php echo $this->_var['LANG']['UC_NOTICE']; ?></a></div>
		<div><a href="<?php
echo parse_url_tag("u:index|uc_msg#index|"."mtype=private".""); 
?>"><?php echo $this->_var['LANG']['UC_PRIVATE_MSG']; ?></a></div>
		<div class="cur"><a href="###">详情</a></div>
	</div>
	<div class="uc_r_bl_box clearfix">
		<div class="uc-table">
		<form name="pm_list">
			<table style="width:100%" cellspacing="0" cellpadding="0" border="0" class="uc-msg-table" >
				
				<?php $_from = $this->_var['list']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }; $this->push_vars('key', 'pm');if (count($_from)):
    foreach ($_from AS $this->_var['key'] => $this->_var['pm']):
?>
				<tr class="pm_row <?php if ($this->_var['key'] % 2 == 0): ?>pm_row_1<?php endif; ?>">
					<td width=50 style="vertical-align:top;padding-top:15px">
						<span class="pm_pic pm_pic_<?php echo $this->_var['pm']['is_notice']; ?>"></span>
					</td>
					<td style="text-align:left;width:135px; vertical-align:top;">
						<div class="pt5">
						<?php if ($this->_var['pm']['is_notice'] == 1): ?>
						系统通知
						<?php elseif ($this->_var['pm']['is_notice'] == 2): ?>
						材料通过
						<?php elseif ($this->_var['pm']['is_notice'] == 3): ?>
						材料驳回
						<?php elseif ($this->_var['pm']['is_notice'] == 4): ?>
						信用额度更新
						<?php elseif ($this->_var['pm']['is_notice'] == 5): ?>
						提现申请
						<?php elseif ($this->_var['pm']['is_notice'] == 6): ?>
						提现成功
						<?php elseif ($this->_var['pm']['is_notice'] == 7): ?>
						提现失败
						<?php elseif ($this->_var['pm']['is_notice'] == 8): ?>
						还款成功
						<?php elseif ($this->_var['pm']['is_notice'] == 9): ?>
						回款成功
						<?php elseif ($this->_var['pm']['is_notice'] == 10): ?>
						借款流标
						<?php elseif ($this->_var['pm']['is_notice'] == 11): ?>
						投标流标
						<?php elseif ($this->_var['pm']['is_notice'] == 12): ?>
						三日内还款
						<?php elseif ($this->_var['pm']['is_notice'] == 13): ?>
						标被留言
						<?php elseif ($this->_var['pm']['is_notice'] == 14): ?>
						标留言被回复
						<?php elseif ($this->_var['pm']['is_notice'] == 15): ?>
						借款投标过半
						<?php elseif ($this->_var['pm']['is_notice'] == 16): ?>
						投标满标
						<?php elseif ($this->_var['pm']['is_notice'] == 17): ?>
						债权转让
						<?php elseif ($this->_var['pm']['is_notice'] == 19): ?>
						续约成功
						<?php elseif ($this->_var['pm']['is_notice'] == 20): ?>
						续约失败
						<?php else: ?>
						<?php echo $this->_var['LANG']['SYSTEM_PM']; ?>
						<?php endif; ?>
						</div>
						<div class="time">
						<?php 
$k = array (
  'name' => 'to_date',
  'v' => $this->_var['pm']['create_time'],
);
echo $k['name']($k['v']);
?>
						</div>				
					</td>
					<td style="text-align:left;line-height:24px">
						<div class="clearfix" style="text-align:right">	<input type="checkbox" value="<?php echo $this->_var['pm']['group_key']; ?>" name="pm_key[]" />删除</div>
						<?php if ($this->_var['pm']['title']): ?><div style="font-weight:bolder;"><?php echo $this->_var['pm']['title']; ?></div><?php endif; ?>
						<div class="clearfix">
						尊敬的用户<?php 
$k = array (
  'name' => 'get_user_name',
  'v' => $this->_var['pm']['to_user_id'],
  's' => '0',
);
echo $k['name']($k['v'],$k['s']);
?>：<br>
						<?php echo $this->_var['pm']['content']; ?>
						</div>
						<?php if ($this->_var['pm']['is_notice'] == 2): ?>
							<div class="clearfix">请登录<?php 
$k = array (
  'name' => 'app_conf',
  'v' => 'SHOP_TITLE',
);
echo $k['name']($k['v']);
?>“个人账户”—“认证信息”查看相关信息。</div>
						<?php elseif ($this->_var['pm']['is_notice'] == 3): ?>
							<div class="clearfix">请您认真阅读该项审核的注释，提交符合认证要求的资料，重新进行该项认证。</div>
							<div class="clearfix">您可以登录<?php 
$k = array (
  'name' => 'app_conf',
  'v' => 'SHOP_TITLE',
);
echo $k['name']($k['v']);
?>“个人账户”—“认证信息”查看相关信息。</div>
							<div class="clearfix">点击 <a href="<?php
echo parse_url_tag("u:index|uc_credit|"."".""); 
?>">这里</a> 查看您的信用状况。</div>
						<?php elseif ($this->_var['pm']['is_notice'] == 4): ?>
							<div class="clearfix">请登录<?php 
$k = array (
  'name' => 'app_conf',
  'v' => 'SHOP_TITLE',
);
echo $k['name']($k['v']);
?>“个人账户”—“认证信息”查看相关信息。</div>
							<div class="clearfix">点击 <a href="<?php
echo parse_url_tag("u:index|uc_credit|"."".""); 
?>">这里</a> 查看您的信用状况。</div>
						<?php elseif ($this->_var['pm']['is_notice'] == 8): ?>
							<div class="clearfix">请您登录<?php 
$k = array (
  'name' => 'app_conf',
  'v' => 'SHOP_TITLE',
);
echo $k['name']($k['v']);
?>，访问“我的账户”—“偿还借款”查看您的还款详情。</div>
							<div class="clearfix">点击 <a href="<?php
echo parse_url_tag("u:index|uc_deal#refund|"."".""); 
?>">这里</a>查看您的还款详情。</div>
							<div class="clearfix">点击 <a href="<?php
echo parse_url_tag("u:index|uc_money|"."".""); 
?>">这里</a>查看账户余额。</div>
						<?php elseif ($this->_var['pm']['is_notice'] == 9): ?>
							<div class="clearfix">请您登录<?php 
$k = array (
  'name' => 'app_conf',
  'v' => 'SHOP_TITLE',
);
echo $k['name']($k['v']);
?>，访问“我的账户”—“我的投资”查看您的投标详情。</div>
							<div class="clearfix">点击 <a href="<?php
echo parse_url_tag("u:index|uc_invest|"."".""); 
?>">这里</a>查看您的投标详情。</div>
							<div class="clearfix">点击 <a href="<?php
echo parse_url_tag("u:index|uc_money|"."".""); 
?>">这里</a>查看账户余额。</div>
						<?php elseif ($this->_var['pm']['is_notice'] == 10): ?>
							<div class="clearfix">如果您属于认证未通过流标，为了您能够成功贷款，请凑齐申请贷款所需要的材料。您可以点击<a href="<?php
echo parse_url_tag("u:index|helpcenter|"."".""); 
?>" target="_self">需要提供哪些材料？</a>来了解更多所需材料的详情。进行更多的信用认证将有助您获得更高的贷款额度。</div>
							<div class="blank20"></div>
							<div class="clearfix">如果您属于招标到期流标，为了您能够成功贷款，请适度提高贷款利率，将有助您更快的获得贷款。&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
							<div class="blank20"></div>
							<div class="clearfix">点击&nbsp;<a href="<?php
echo parse_url_tag("u:index|borrow|"."".""); 
?>">这里</a>重新发布借款。</div>
							<div>如果您觉得收到过多站内信，可以点击&nbsp;<a href="<?php
echo parse_url_tag("u:index|uc_msg#setting|"."".""); 
?>">这里</a>进行设置</div>
						<?php elseif ($this->_var['pm']['is_notice'] == 12): ?>
							<div class="clearfix">请您访问<?php 
$k = array (
  'name' => 'app_conf',
  'v' => 'SHOP_TITLE',
);
echo $k['name']($k['v']);
?>“我的账户”—“偿还借款”，按时偿还借款。</div>
							<div class="clearfix">如果您未能按时还款，您将要支付逾期罚息，并且将对您的信用信息产生负面影响，具体详情请见电子借款协议。</div>
							<div class="clearfix">点击 <a href="<?php
echo parse_url_tag("u:index|uc_deal#refund|"."".""); 
?>">这里</a>偿还借款。</div>
							<div class="clearfix">点击 <a href="<?php
echo parse_url_tag("u:index|uc_deal#contract|"."id=".$this->_var['pm']['fav_id']."".""); 
?>">这里</a>查看电子借款协议。</div>
						<?php elseif ($this->_var['pm']['is_notice'] == 13): ?>
							<div class="clearfix">请您登录<?php 
$k = array (
  'name' => 'app_conf',
  'v' => 'SHOP_TITLE',
);
echo $k['name']($k['v']);
?>借款详情页面查看答复。</div>
							<div class="clearfix">点击 <a href="<?php
echo parse_url_tag("u:index|deal|"."id=".$this->_var['pm']['fav_id']."".""); 
?>">这里</a>进行答复。</div>
						<?php elseif ($this->_var['pm']['is_notice'] == 14): ?>
							<div class="clearfix">点击 <a href="<?php
echo parse_url_tag("u:index|deal|"."id=".$this->_var['pm']['fav_id']."".""); 
?>">这里</a>查看借款列表详情或进行投标。
						<?php endif; ?>
						<div class="clearfix">感谢您对我们的支持和关注！</div>
						
						<div class="clearfix" style="text-align:right"><?php 
$k = array (
  'name' => 'app_conf',
  'v' => 'SHOP_TITLE',
);
echo $k['name']($k['v']);
?></div>
						
						</div>
					</td>
				</tr>
				<?php endforeach; endif; unset($_from); ?><?php $this->pop_vars();; ?>
				
				<tr>
				<td></td>
				<td></td>
				<td>
					<div class="pt10" style="float:right">
					<?php echo $this->_var['LANG']['SELECT_ALL']; ?><input type="checkbox" name="checkall" /> 
					</div>
					<div style="float: right; text-align: right; width: 100%;">
					<input type="button" value="<?php echo $this->_var['LANG']['DELETE']; ?>" name="del_pmxiaoxi" class="remove_msg_btn" />
					</div>
				</td>
				</tr>
			</table>	
			</form>	
		</div>
		<div class="blank"></div>
		
		<div class="pages" style="padding:0px; margin:0px;"><?php echo $this->_var['pages']; ?></div>
		<div class="blank"></div>
	</div>
</div>

