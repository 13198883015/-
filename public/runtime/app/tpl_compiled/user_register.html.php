<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta name="Generator" />
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><?php if ($this->_var['page_title']): ?><?php echo $this->_var['page_title']; ?> - <?php endif; ?><?php if ($this->_var['show_site_titile'] == 1): ?><?php 
$k = array (
  'name' => 'app_conf',
  'value' => 'SHOP_SEO_TITLE',
);
echo $k['name']($k['value']);
?> - <?php endif; ?><?php echo $this->_var['site_info']['SHOP_TITLE']; ?></title>
<link rel="icon" href="favicon.ico" type="/image/x-icon" />
<link rel="shortcut icon" href="favicon.ico" type="/image/x-icon" />
<meta name="keywords" content="<?php if ($this->_var['page_keyword']): ?><?php echo $this->_var['page_keyword']; ?><?php endif; ?><?php echo $this->_var['site_info']['SHOP_KEYWORD']; ?>" />
<meta name="description" content="<?php if ($this->_var['page_description']): ?><?php echo $this->_var['page_description']; ?><?php endif; ?><?php echo $this->_var['site_info']['SHOP_DESCRIPTION']; ?>" />
<?php
$this->_var['pagecss'][] = $this->_var['TMPL_REAL']."/css/style.css";
$this->_var['pagecss'][] = $this->_var['TMPL_REAL']."/css/weebox.css";
$this->_var['pagejs'][] = $this->_var['TMPL_REAL']."/js/jquery.js";
$this->_var['pagejs'][] = $this->_var['TMPL_REAL']."/js/jquery.bgiframe.js";
$this->_var['pagejs'][] = $this->_var['TMPL_REAL']."/js/jquery.weebox.js";
$this->_var['pagejs'][] = $this->_var['TMPL_REAL']."/js/jquery.pngfix.js";
$this->_var['pagejs'][] = $this->_var['TMPL_REAL']."/js/lazyload.js";
$this->_var['pagejs'][] = $this->_var['TMPL_REAL']."/js/script.js";
$this->_var['pagejs'][] = $this->_var['TMPL_REAL']."/js/op.js";
$this->_var['cpagejs'][] = $this->_var['TMPL_REAL']."/js/script.js";
$this->_var['cpagejs'][] = $this->_var['TMPL_REAL']."/js/op.js";
if(app_conf("APP_MSG_SENDER_OPEN")==1)
{
$this->_var['pagejs'][] = $this->_var['TMPL_REAL']."/js/msg_sender.js";
$this->_var['cpagejs'][] = $this->_var['TMPL_REAL']."/js/msg_sender.js";
}
$this->_var['pagecss'][] = $this->_var['TMPL_REAL']."/css/main.css";
$this->_var['pagecss'][] = $this->_var['TMPL_REAL']."/css/user_login_reg.css";
?>
<link rel="stylesheet" type="text/css" href="<?php 
$k = array (
  'name' => 'parse_css',
  'v' => $this->_var['pagecss'],
);
echo $k['name']($k['v']);
?>" />

<script type="text/javascript">
var APP_ROOT = '<?php echo $this->_var['APP_ROOT']; ?>';;
var LOADER_IMG = '<?php echo $this->_var['TMPL']; ?>/images/lazy_loading.gif';
var ERROR_IMG = '<?php echo $this->_var['TMPL']; ?>/images/image_err.gif';
var send_span = <?php 
$k = array (
  'name' => 'app_conf',
  'v' => 'SEND_SPAN',
);
echo $k['name']($k['v']);
?>000;
<?php if (app_conf ( "APP_MSG_SENDER_OPEN" ) == 1 && $this->_var['DEAL_MSG_COUNT'] > 0): ?>
var to_send_msg = true;
<?php else: ?>
var to_send_msg = false;
<?php endif; ?>
</script>
<script type="text/javascript" src="<?php echo $this->_var['APP_ROOT']; ?>/public/runtime/app/lang.js"></script>
<script type="text/javascript" src="<?php 
$k = array (
  'name' => 'parse_script',
  'v' => $this->_var['pagejs'],
  'c' => $this->_var['cpagejs'],
);
echo $k['name']($k['v'],$k['c']);
?>"></script>
<style type="text/css">
	.user-lr-box-left .field .holder_tip{left: 180px;_left:-240px;top:0}
	.register_box .user-lr-box-left .field .f-input-tip{_position:absolute;_left:-287px;}
	.logo a{display:block;}

#and .form_err {
    min-width: 176px;
	_width: 176px;
}

</style>
</head>
<body class="register_body">
	<div class="head z100" id="j_head">
		<div class="head_cont" style="background:#fff">
			<div class="wrap constr clearfix">
				<div class="logo f_l">
					<a class="link" href="<?php echo $this->_var['APP_ROOT']; ?>/">
						<?php
							$this->_var['logo_image'] = app_conf("SHOP_LOGO");
						?>
						<?php 
$k = array (
  'name' => 'load_page_png',
  'v' => $this->_var['logo_image'],
);
echo $k['name']($k['v']);
?>
					</a>
				</div>
				<!--<?php if ($this->_var['MODULE_NAME'] == 'user'): ?>-->
				<div class="f_yahei no-nav-text"><?php if ($this->_var['ACTION_NAME'] == 'login'): ?>登录<?php elseif ($this->_var['ACTION_NAME'] == 'register'): ?>注册<?php endif; ?></div>
				<!--<?php endif; ?>-->
			</div>
		</div>
		<p class="head_bg"></p>
	</div>
	
	
		<div class="blank20"></div>
	
	    <div class="regstep">
            <ol class="ui-step ui-step-3">
                <li class="ui-step-start ui-step-active">
                    <div class="ui-step-line">-</div>
                    <div class="ui-step-icon">
                        <i class="iconfont"></i>
                        <i class="ui-step-number">1</i>
                        <span class="ui-step-text">填写账户信息</span>
                    </div>
                </li>
                <li>
                    <div class="ui-step-line">-</div>
                    <div class="ui-step-icon">
                        <i class="iconfont"></i>
                        <i class="ui-step-number">2</i>
                        <span class="ui-step-text">实名信息</span>
                    </div>
                </li>
                <li class="ui-step-end">
                    <div class="ui-step-line">-</div>
                    <div class="ui-step-icon">
                        <i class="iconfont"></i>
                        <i class="ui-step-number">3</i>
                        <span class="ui-step-text">注册成功</span>
                    </div>
                </li>
            </ol>
        </div>
        
	<div class="blank20"></div>
	<div class="inc  wrap register_box">
		<div>
			
			<div class="inc_main clearfix bdd wb">
				<div class="user-lr-box-left f_l" style="width:590px">
					<!--手机和邮箱注册表单-->
				
					<form action="<?php
echo parse_url_tag("u:shop|user#doregister|"."".""); 
?>" method="post" id="signup-user-form">
						
						<div class="field username pr">
							<div class="u_icon"></div>
							<label for="signup-username"><span class="f_red">*</span> <?php echo $this->_var['LANG']['USER_TITLE_USER_NAME']; ?></label>
							<span class="holder_tip ps" >输入注册帐号</span>
							<input type="text" value="<?php echo $this->_var['reg_name']; ?>" class="f-input ipttxt" id="signup-username" name="user_name" size="30">
							<span class="f-input-tip"></span> 
							<span class="hint"><?php echo $this->_var['LANG']['USER_TITLE_USER_NAME_TIP']; ?></span> 
						</div>
						<div class="blank1"></div>
						
						<?php if (( app_conf ( "REGISTER_TYPE" ) == 0 || app_conf ( "REGISTER_TYPE" ) == 1 )): ?>		
							<div class="field mobile pr">
								<div class="u_icon"></div>
								<label for="signup-mobile"><span class="f_red">*</span> <?php echo $this->_var['LANG']['USER_TITLE_MOBILE']; ?></label>
								<span class="holder_tip ps" >输入手机号码</span>
								<input type="text" value="" class="f-input ipttxt" id="settings-mobile" name="mobile" size="30">
								<span class="f-input-tip"></span> 
								<span class="hint"> <?php echo $this->_var['LANG']['USER_TITLE_MOBILE_TIP']; ?></span>
							</div>
							<div class="blank1"></div>
							<?php if (( app_conf ( "USER_VERIFY" ) == 0 || app_conf ( "USER_VERIFY" ) == 2 )): ?>
							<div class="field verify pr">
								<label >手机验证码</label>
								<input type="text" value="" class="f-input ipttxt"  name="sms_code" >
								<input type="button" value="获取验证码" class="sendsms_button f_l btn_disable " id="get_regsms_code" class="ml5 f_l"  />
								<span class="f-input-tip"></span> 
								<span class="hint"> 输入收到的手机验证码</span>
							</div>
							<div class="blank1"></div>
							<?php endif; ?>
						<?php endif; ?>
						
						<?php if (( app_conf ( "REGISTER_TYPE" ) == 0 || app_conf ( "REGISTER_TYPE" ) == 2 )): ?>	
							<div class="field email pr">
								<div class="u_icon"></div>
								<label for="signup-email-address"><span class="f_red">*</span> <?php echo $this->_var['LANG']['USER_TITLE_EMAIL']; ?></label>
								<span class="holder_tip ps" >输入常用的邮箱</span>
								<input type="text" value="" class="f-input ipttxt" id="signup-email-address" name="email" size="30">
								<span class="f-input-tip"></span> 
								<span class="hint"><?php echo $this->_var['LANG']['USER_TITLE_EMAIL_TIP']; ?></span> 
							</div>
							<div class="blank1"></div>
						
							<?php if (( app_conf ( "USER_VERIFY" ) == 1 || app_conf ( "USER_VERIFY" ) == 2 )): ?>
							<div class="field verify pr">
								<label >邮箱验证码</label>
								<input type="text" value="" class="f-input ipttxt"  name="emsms_code" >
								<input type="button" value="获取验证码" class="sendsms_button f_l btn_disable " id="get_emregsms_code" class="ml5 f_l"  />
								<span class="f-input-tip"></span> 
								<span class="hint"> 输入收到的邮箱验证码</span>
							</div>
							<div class="blank1"></div>
							<?php endif; ?>
						<?php endif; ?>
					
						
						
						<div class="field password pr" id="and">
							<div class="u_icon"></div>
							<label for="signup-password"><span class="f_red">*</span> <?php echo $this->_var['LANG']['USER_TITLE_USER_PWD']; ?></label>
							<span class="holder_tip ps" >输入密码</span>
							<input type="password" class="f-input ipttxt" id="signup-password" size="30">
							<span class="f-input-tip"></span> 
							<input type="hidden" id="signup-password-ipt" name="user_pwd">
							<span class="hint"><?php echo $this->_var['LANG']['USER_TITLE_USER_PWD_TIP']; ?></span> 
						</div>
						<div class="blank1"></div>
						<div class="field password pr">
							<div class="u_icon"></div>
							<label for="signup-password-confirm"><span class="f_red">*</span> <?php echo $this->_var['LANG']['USER_TITLE_USER_CONFIRM_PWD']; ?></label>
							<span class="holder_tip ps" >再次输入密码</span>
							<input type="password" class="f-input ipttxt" id="signup-password-confirm"size="30">
							<input type="hidden" id="signup-password-confirm-ipt" name="user_pwd_confirm">
							<span class="f-input-tip"></span>
							<span class="hint">请再次填写密码</span>
						</div>
						<div class="blank1"></div>
						
						
						<?php $_from = $this->_var['field_list']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }; $this->push_vars('', 'field_item');if (count($_from)):
    foreach ($_from AS $this->_var['field_item']):
?>
						<div class="field weibo pr">
							<label id="<?php echo $this->_var['field_item']['field_name']; ?>_label"><?php echo $this->_var['field_item']['field_show_name']; ?></label>
							<span class="holder_tip ps" >输入<?php echo $this->_var['field_item']['field_show_name']; ?></span>
							<?php if ($this->_var['field_item']['input_type'] == 0): ?>
							<input type="text" value="" class="f-input ipttxt" id="settings-<?php echo $this->_var['field_item']['field_name']; ?>" name="<?php echo $this->_var['field_item']['field_name']; ?>" size="30">
							<?php endif; ?>
							
							<?php if ($this->_var['field_item']['input_type'] == 1): ?>
							<select id="settings-<?php echo $this->_var['field_item']['field_name']; ?>" name="<?php echo $this->_var['field_item']['field_name']; ?>">
								<?php $_from = $this->_var['field_item']['value_scope']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }; $this->push_vars('', 'value_item');if (count($_from)):
    foreach ($_from AS $this->_var['value_item']):
?>
								<option value="<?php echo $this->_var['value_item']; ?>"><?php echo $this->_var['value_item']; ?></option>
								<?php endforeach; endif; unset($_from); ?><?php $this->pop_vars();; ?>
							</select>
							<?php endif; ?>
							<span class="f-input-tip">&nbsp;</span>
							<span class="hint"><?php if ($this->_var['field_item']['is_must'] == 1): ?>请输入<?php echo $this->_var['field_item']['field_show_name']; ?><?php else: ?>&nbsp;<?php endif; ?></span>
						</div>
						<div class="blank1"></div>
						<?php endforeach; endif; unset($_from); ?><?php $this->pop_vars();; ?>
						
						<?php if (app_conf ( "VERIFY_IMAGE" ) == 1 && app_conf ( "USER_VERIFY" ) >= 3): ?>
						<div class="field verify pr">
							<div class="verify_row">
							<label>&nbsp;</label>								
							<input type="text" value="" class="f-input ipttxt f_l" name="verify" onfocus="$('#signup-user-email-form #JverifyImg').attr('src','<?php echo $this->_var['APP_ROOT']; ?>/verify.php?w=89&h=44&rand='+ Math.random());"  />	
							<img class="ml10 f_l" src="<?php echo $this->_var['APP_ROOT']; ?>/verify.php?w=89&h=44&rand=<?php 
$k = array (
  'name' => 'rand',
);
echo $k['name']();
?>" id="JverifyImg" onclick="this.src='<?php echo $this->_var['APP_ROOT']; ?>/verify.php?w=89&h=44&rand='+ Math.random();" title="看不清楚？换一张" />			
							</div>
							<span class="hint">请输入验证码</span>
						</div>
						<div class="blank1"></div>
						<?php endif; ?>
						<?php if (app_conf ( "INVITE_REFERRALS" ) == 1): ?>
						<div class="field weibo <?php if ($this->_var['referer'] != ''): ?>hide<?php endif; ?> pr">
							<label from="settings-referer">推荐人</label>
							<span class="holder_tip ps" <?php if ($this->_var['referer'] != ""): ?>style="display:none"<?php endif; ?>>输入推荐人手机号/会员名</span>
							<input type="text" value="<?php echo $this->_var['referer']; ?>" class="f-input ipttxt" id="settings-referer" name="referer" >
							
							<span class="f-input-tip">&nbsp;</span>
							<span class="hint">可输入推荐人手机号码或会员名。</span>
						</div>
						<div class="blank1"></div>
						<?php endif; ?>
						
						<div class="field agreement pr f14">
							<label>&nbsp;</label>
							<span class="ui-select ui-selected" >
								<input type="checkbox" id="J_agreement" value="1" checked="checked" />
							</span>
							同意 <a href="<?php
echo parse_url_tag("u:index|help|"."id=".$this->_var['agreement']."".""); 
?>" class="f_blue">注册协议</a> 和 <a href="<?php
echo parse_url_tag("u:index|help|"."id=".$this->_var['privacy']."".""); 
?>" class="f_blue">隐私条款</a>
						</div>
						<div class="blank"></div>
						<div class="act">
							<input type="submit" class="reg-submit-btn" id="signup-mobile-submit" name="commit" value="<?php echo $this->_var['LANG']['REGISTER']; ?>">				
						</div>
					
					</form>
				</div>
				<div class="user-lr-box-right f_r">
					<div class="has_account tc pb15 f14">已有帐号？<a href="<?php
echo parse_url_tag("u:index|user#login|"."".""); 
?>" class="f_blue">直接登录</a></div>
				</div>
			</div>		
			<div class="inc_foot"></div>
		</div>
	</div>

<script type="text/javascript">
<?php if (app_conf ( "USER_VERIFY" ) < 3): ?>

var regsiter_vy_time = null;  	//定义时间
var is_lock_send_vy = false;	//解除锁定
var left_rg_time = 0;			//开始时间

function left_time_to_send_regvy(){
	clearTimeout(regsiter_vy_time);
	if(left_rg_time > 0){
		regsiter_vy_time = setTimeout(left_time_to_send_regvy,1000);
		$("#get_regsms_code").val(left_rg_time+"秒后重新获取验证码");
		$("#get_regsms_code").addClass("btn_disable");
		left_rg_time -- ;
	}
	else{
		is_lock_send_vy = false;
		$("#get_regsms_code").removeClass("btn_disable");
		$("#get_regsms_code").val("重新获取验证码");
		
		left_rg_time = 0;
	}
}

var regsiter_vy_times = null;  	//定义时间
var is_lock_send_vys = false;	//解除锁定
var left_rg_times = 0;			//开始时间
function left_time_to_send_regvys(){
	clearTimeout(regsiter_vy_times);
	if(left_rg_times > 0){
		regsiter_vy_times = setTimeout(left_time_to_send_regvys,1000);
		$("#get_emregsms_code").val(left_rg_times+"秒后重新获取验证码");
		$("#get_emregsms_code").addClass("btn_disable");
		left_rg_times -- ;
	}
	else{
		is_lock_send_vys = false;
		$("#get_emregsms_code").removeClass("btn_disable");
		$("#get_emregsms_code").val("重新获取验证码");
		left_rg_times = 0;
	}
}
<?php endif; ?>

$(document).ready(function(){
	$("#get_regsms_code").click(function(){
			if(is_lock_send_vy || $(this).hasClass(".btn_disable")){
				return false;
			}
			is_lock_send_vy = true;
			if(!$.maxLength($("#settings-mobile").val(),11,true))
			{
				is_lock_send_vy = false;
				formError($("#settings-mobile"),"长度不能超过11位");
				return false;
			}
			
			if($.trim($("#settings-mobile").val()).length == 0)
			{			
				is_lock_send_vy = false;
				formError($("#settings-mobile"),"<?php 
$k = array (
  'name' => 'sprintf',
  'format' => $this->_var['LANG']['EMPTY_ERROR_TIP'],
  'value' => $this->_var['LANG']['USER_TITLE_MOBILE'],
);
echo $k['name']($k['format'],$k['value']);
?>");
				return false;
			}	
			
			if(!$.checkMobilePhone($("#settings-mobile").val()))
			{
				is_lock_send_vy = false;
				formError($("#settings-mobile"),"<?php 
$k = array (
  'name' => 'sprintf',
  'format' => $this->_var['LANG']['FORMAT_ERROR_TIP'],
  'value' => $this->_var['LANG']['USER_TITLE_MOBILE'],
);
echo $k['name']($k['format'],$k['value']);
?>");	
				return false;
			}	
			var ajaxurl = APP_ROOT+"/index.php?ctl=ajax&act=get_register_verify_code";
			
			
			var query = new Object();
			query.user_mobile =  $.trim($("#settings-mobile").val());
			$.ajax({ 
				url: ajaxurl,
				data:query,
				type: "POST",
				dataType: "json",
				success: function(result){
					if(result.status==1)
					{
						left_rg_time = 60;
						left_time_to_send_regvy();
						$.showSuccess(result.info,function(){
							to_send_msg = true;
						});
					}
					else
					{	
						is_lock_send_vy = false;
						formError($("#settings-mobile"),result.info);
						return false;
					}
				},error:function(){
					is_lock_send_vy = false;
				}
			});	
		}); //发送手机验证码
		
		
		$("#get_emregsms_code").click(function(){
			if(is_lock_send_vys || $(this).hasClass(".btn_disable")){
				return false;
			}
			is_lock_send_vys = true;
			if($.trim($("#signup-email-address").val()).length == 0)
			{	
				is_lock_send_vys = false;
				formError($("#signup-email-address"),"<?php 
$k = array (
  'name' => 'sprintf',
  'format' => $this->_var['LANG']['EMPTY_ERROR_TIP'],
  'value' => $this->_var['LANG']['USER_TITLE_EMAIL'],
);
echo $k['name']($k['format'],$k['value']);
?>");			
				return false;
			}
			if(!$.checkEmail($("#signup-email-address").val()))
			{
				is_lock_send_vys = false;
				formError($("#signup-email-address"),"<?php 
$k = array (
  'name' => 'sprintf',
  'format' => $this->_var['LANG']['FORMAT_ERROR_TIP'],
  'value' => $this->_var['LANG']['USER_TITLE_EMAIL'],
);
echo $k['name']($k['format'],$k['value']);
?>");
				return false;
			}	
			var ajaxurl = APP_ROOT+"/index.php?ctl=ajax&act=get_email_verify";
			var query = new Object();
			query.user_email =  $("#signup-email-address").val();
			$.ajax({ 
				url: ajaxurl,
				data:query,
				type: "POST",
				dataType: "json",
				success: function(result){
					if(result.status==1)
					{
						left_rg_times = 60;
						left_time_to_send_regvys();
						$.showSuccess(result.info,function(){
							to_send_msg = true;
						});
					}
					else
					{	
						is_lock_send_vys = false;
						formError($("#signup-email-address"),result.info);
						return false;
					}
				}
			});	
		}); //发送邮箱验证码
		
		
		
		
		
	
	<?php if (( app_conf ( "REGISTER_TYPE" ) == 0 || app_conf ( "REGISTER_TYPE" ) == 2 )): ?>	
	$("#signup-email-address").bind("blur",function(){
		var obj = $(this);
		if($.trim(obj.val()).length == 0)
		{
			formError(obj,"<?php 
$k = array (
  'name' => 'sprintf',
  'format' => $this->_var['LANG']['EMPTY_ERROR_TIP'],
  'value' => $this->_var['LANG']['USER_TITLE_EMAIL'],
);
echo $k['name']($k['format'],$k['value']);
?>");			
			return false;
		}
		if(!$.checkEmail(obj.val()))
		{
			formError(obj,"<?php 
$k = array (
  'name' => 'sprintf',
  'format' => $this->_var['LANG']['FORMAT_ERROR_TIP'],
  'value' => $this->_var['LANG']['USER_TITLE_EMAIL'],
);
echo $k['name']($k['format'],$k['value']);
?>");
			return false;
		}	
		var ajaxurl = APP_ROOT+"/index.php?ctl=ajax&act=check_field";
		var query = new Object();
		query.field_name = "email";
		query.field_data = $.trim(obj.val());
		$.ajax({ 
			url: ajaxurl,
			data:query,
			type: "POST",
			dataType: "json",
			success: function(data){
				if(data.status==1)
				{
					formSuccess($("#signup-email-address"),"<?php echo $this->_var['LANG']['CAN_USED']; ?>");
					$("#get_emregsms_code").removeClass("btn_disable");
					return false;
				}
				else
				{
					formError($("#signup-email-address"),data.info);
					return false;
				}
			}
		});	
	});
	<?php endif; ?>
	//邮箱验证
	
	<?php if (( app_conf ( "REGISTER_TYPE" ) == 0 || app_conf ( "REGISTER_TYPE" ) == 1 )): ?>	
	$("#settings-mobile").bind("blur",function(){
		var obj = $(this);
		$("#get_regsms_code").addClass("btn_disable");
		if(!$.checkMobilePhone(obj.val()))
		{
			formError(obj,"<?php 
$k = array (
  'name' => 'sprintf',
  'format' => $this->_var['LANG']['FORMAT_ERROR_TIP'],
  'value' => $this->_var['LANG']['USER_TITLE_MOBILE'],
);
echo $k['name']($k['format'],$k['value']);
?>");	
			return false;
		}	
		if($.trim(obj.val()).length == 0)
		{				
			formError(obj,"<?php 
$k = array (
  'name' => 'sprintf',
  'format' => $this->_var['LANG']['EMPTY_ERROR_TIP'],
  'value' => $this->_var['LANG']['USER_TITLE_MOBILE'],
);
echo $k['name']($k['format'],$k['value']);
?>");
			return false;
		}
		var ajaxurl = APP_ROOT+"/index.php?ctl=ajax&act=check_field";
		var query = new Object();
		query.field_name = "mobile";
		query.field_data = $.trim(obj.val());
		$.ajax({ 
			url: ajaxurl,
			data:query,
			type: "POST",
			dataType: "json",
			success: function(data){
				if(data.status==1)
				{
					if(query.field_data!='')
					formSuccess(obj,"<?php echo $this->_var['LANG']['CAN_USED']; ?>");
					else
					formSuccess(obj,"");
					
					$("#get_regsms_code").removeClass("btn_disable");
					return false;
				}
				else
				{					
					formError(obj,data.info);
					return false;
				}
			}
		});	
	}); 
	<?php endif; ?>
	//手机验证
	
	
	$(".ui-select").click(function(){
		if($(this).hasClass("ui-selected")){
			$(this).removeClass("ui-selected");
			$(this).find("input").attr("checked","");
		}
		else{
			$(this).addClass("ui-selected");
			$(this).find("input").attr("checked","checked");
		}
	});
	

	$(".user-lr-box-left .holder_tip").click(function(){
		$(this).hide();
		$(this).parent().find(".f-input").focus();
	});
	$(".register_box .f-input").focus(function(){
		$(this).parent().find(".holder_tip").hide();
	});
	$(".register_box .f-input").blur(function(){
		if($(this).val()==""){
			$(this).parent().find(".holder_tip").show();
		}
	});
	
	$("#signup-mobile-submit").click(function(){
		var name;
		name=$.trim($("#signup-user-form #signup-password").val())
		var reg=/^[a-zA-z0-9]{6,}$/;  
		var regs=/^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,16}$/;
		if(reg.test(name)){	
			if(regs.test(name)){	
				formSuccess($("#signup-user-form #signup-password"),"<?php echo $this->_var['LANG']['CAN_USED']; ?>");
			}
			else{
				formError($("#signup-user-form #signup-password"),"安全等级低，请用数字+字母");
				return false;
			}
		}
		else{
			formError($("#signup-user-form #signup-password"),"长度在6~16之间，只能包含字符、数字和下划线。");
			return false;
		}
		if(!$.minLength($("#signup-user-form #signup-password").val(),6,false))
		{
			formError($("#signup-user-form #signup-password"),"<?php 
$k = array (
  'name' => 'sprintf',
  'format' => $this->_var['LANG']['FORMAT_ERROR_TIP'],
  'value' => $this->_var['LANG']['USER_TITLE_USER_PWD'],
);
echo $k['name']($k['format'],$k['value']);
?>");	
			return false;
		}
		var objform = $(this).parent().parent();
		checkRegsiter(objform);
	});//单击提交
	
	
	$("#signup-user-form input,#signup-user-form select").keydown(function(e){ 
		var objform = $(this).parent().parent();
		var curKey = e.which; 
		if(curKey == 13){
			checkRegsiter(objform);
		}; 
	});
	
	

	
	
	$("#signup-user-form #signup-username").bind("blur",function(){
		var obj = $(this);
		if(!$.minLength(obj.val(),3,true))
		{
			formError(obj,"<?php 
$k = array (
  'name' => 'sprintf',
  'format' => $this->_var['LANG']['FORMAT_ERROR_TIP'],
  'value' => $this->_var['LANG']['USER_TITLE_USER_NAME'],
);
echo $k['name']($k['format'],$k['value']);
?>");		
			return false;
		}
		
		if(!$.maxLength(obj.val(),16,true))
		{
			formError(obj,"<?php 
$k = array (
  'name' => 'sprintf',
  'format' => $this->_var['LANG']['FORMAT_ERROR_TIP'],
  'value' => $this->_var['LANG']['USER_TITLE_USER_NAME'],
);
echo $k['name']($k['format'],$k['value']);
?>");			
			return false;
		}	
		
		var ajaxurl = APP_ROOT+"/index.php?ctl=ajax&act=check_field";
		var query = new Object();
		query.field_name = "user_name";
		query.field_data = $.trim(obj.val());
		$.ajax({ 
			url: ajaxurl,
			data:query,
			type: "POST",
			dataType: "json",
			success: function(data){
				if(data.status==1)
				{
					formSuccess(obj,"<?php echo $this->_var['LANG']['CAN_USED']; ?>");
					return false;
				}
				else
				{
					formError(obj,data.info);
					return false;
				}
			}
		});	
	}); //用户名验证
	
	
	$("#signup-user-form #signup-password").bind("blur",function(){
		var obj = $(this);
		var name;
		name=$.trim(obj.val())
		var reg=/^[a-zA-z0-9]{6,}$/;  
		var regs=/^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,16}$/;
		if(reg.test(name)){	
			if(regs.test(name)){	
				formSuccess(obj,"<?php echo $this->_var['LANG']['CAN_USED']; ?>");
			}
			else{
				formError(obj,"安全等级低，请用数字+字母");
				return false;
			}
		}
		else{
			formError(obj,"长度在6~16之间，只能包含字符、数字和下划线。");
			return false;
		}
		if(!$.minLength(obj.val(),6,false))
		{
			formError(obj,"<?php 
$k = array (
  'name' => 'sprintf',
  'format' => $this->_var['LANG']['FORMAT_ERROR_TIP'],
  'value' => $this->_var['LANG']['USER_TITLE_USER_PWD'],
);
echo $k['name']($k['format'],$k['value']);
?>");	
			return false;
		}
		obj.parent().find("#signup-password-ipt").val(obj.val());
		formSuccess(obj,"<?php echo $this->_var['LANG']['CAN_USED']; ?>");
	}); //密码验证

	$("#signup-user-form #signup-password-confirm").bind("blur",function(){
		var obj = $(this);
		if(obj.val()!==""){
			if(obj.val() != obj.parent().parent().find("#signup-password").val())
			{
				formError(obj,"<?php echo $this->_var['LANG']['USER_PWD_CONFIRM_ERROR']; ?>");			
				return false;
			}
		}
		else{
			formError(obj,"请输入确认密码");
			return false;
		}
		obj.parent().find("#signup-password-confirm-ipt").val(obj.val());
		formSuccess(obj,"<?php echo $this->_var['LANG']['VERIFY_SUCCESS']; ?>");
	}); //确认密码验证
		
	<?php $_from = $this->_var['field_list']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }; $this->push_vars('', 'field_item');if (count($_from)):
    foreach ($_from AS $this->_var['field_item']):
?>
			<?php if ($this->_var['field_item']['is_must'] == 1): ?>			
			$("#settings-<?php echo $this->_var['field_item']['field_name']; ?>").bind("blur",function(){
				var obj = $(this);
				if(obj.val()=='')
				{
					formError(obj,"<?php 
$k = array (
  'name' => 'sprintf',
  'format' => $this->_var['LANG']['EMPTY_ERROR_TIP'],
  'value' => $this->_var['field_item']['field_show_name'],
);
echo $k['name']($k['format'],$k['value']);
?>");	
					return false;
				}
				formSuccess(obj,"");
			}); //扩展字段		
			<?php endif; ?>
	<?php endforeach; endif; unset($_from); ?><?php $this->pop_vars();; ?>
	
	checkReferer();
	$("#settings-referer").bind("blur",function(){
		checkReferer();
	});
});

function  checkReferer(){
	var val = $.trim($("#settings-referer").val());
	if(val==""){
		formSuccess($("#settings-referer"),"");
		return;
	}
	
	var ajaxurl = APP_ROOT+"/index.php?ctl=ajax&act=check_user";
		var query = new Object();
		query.val = val;
		$.ajax({ 
			url: ajaxurl,
			data:query,
			type: "POST",
			dataType: "json",
			success: function(data){
				if(data.status==1)
				{
					formSuccess($("#settings-referer"),"此推荐人信息正确");
					return false;
				}
				else
				{
					formError($("#settings-referer"),"您填写的推荐人信息在本平台不存在，请核对信息是否真实有效后重新输入");
					return false;
				}
			}
		});	
}

function checkRegsiter(obj){
	
	if(!$.minLength(obj.find("#signup-username").val(),3,true))
	{
		obj.find("#signup-username").focus();
		$.showErr("<?php 
$k = array (
  'name' => 'sprintf',
  'format' => $this->_var['LANG']['FORMAT_ERROR_TIP'],
  'value' => $this->_var['LANG']['USER_TITLE_USER_NAME'],
);
echo $k['name']($k['format'],$k['value']);
?>");		
		return false;
	}
	if(!$.maxLength(obj.find("#signup-username").val(),16,true))
	{
		obj.find("#signup-username").focus();
		$.showErr("<?php 
$k = array (
  'name' => 'sprintf',
  'format' => $this->_var['LANG']['FORMAT_ERROR_TIP'],
  'value' => $this->_var['LANG']['USER_TITLE_USER_NAME'],
);
echo $k['name']($k['format'],$k['value']);
?>");			
		return false;
	}
	
	<?php if (( app_conf ( "REGISTER_TYPE" ) == 0 || app_conf ( "REGISTER_TYPE" ) == 1 )): ?>	/*xsz*/
		if(!$.checkMobilePhone($("#settings-mobile").val()))
		{
			$("#settings-mobile").focus();			
			$.showErr("<?php 
$k = array (
  'name' => 'sprintf',
  'format' => $this->_var['LANG']['FORMAT_ERROR_TIP'],
  'value' => $this->_var['LANG']['USER_TITLE_MOBILE'],
);
echo $k['name']($k['format'],$k['value']);
?>");	
			return false;
		}	
		if($.trim($("#settings-mobile").val()).length == 0)
		{
			$("#settings-mobile").focus();
			$.showErr("<?php 
$k = array (
  'name' => 'sprintf',
  'format' => $this->_var['LANG']['EMPTY_ERROR_TIP'],
  'value' => $this->_var['LANG']['USER_TITLE_MOBILE'],
);
echo $k['name']($k['format'],$k['value']);
?>");
			return false;
		}
	<?php endif; ?>
	
	<?php if (( app_conf ( "REGISTER_TYPE" ) == 0 || app_conf ( "REGISTER_TYPE" ) == 2 )): ?>	
		if($.trim($("#signup-email-address").val()).length == 0 )
		{
			$("#signup-email-address").focus();
			$.showErr("<?php 
$k = array (
  'name' => 'sprintf',
  'format' => $this->_var['LANG']['EMPTY_ERROR_TIP'],
  'value' => $this->_var['LANG']['USER_TITLE_EMAIL'],
);
echo $k['name']($k['format'],$k['value']);
?>");
			return false;
		}
		if(!$.checkEmail($("#signup-email-address").val()))
		{
			$("#signup-email-address").focus();			
			$.showErr("<?php 
$k = array (
  'name' => 'sprintf',
  'format' => $this->_var['LANG']['FORMAT_ERROR_TIP'],
  'value' => $this->_var['LANG']['USER_TITLE_EMAIL'],
);
echo $k['name']($k['format'],$k['value']);
?>");
			return false;
		}
	<?php endif; ?>
	
	

	if(!$.minLength(obj.find("#signup-password").val(),4,false))
	{
		obj.find("#signup-password").focus();
		$.showErr("<?php 
$k = array (
  'name' => 'sprintf',
  'format' => $this->_var['LANG']['FORMAT_ERROR_TIP'],
  'value' => $this->_var['LANG']['USER_TITLE_USER_PWD'],
);
echo $k['name']($k['format'],$k['value']);
?>");	
		return false;
	}
	if(obj.find("#signup-password-confirm").val()!==""){
		if(obj.find("#signup-password-confirm").val() != obj.find("#signup-password").val())
		{
			obj.find("#signup-password-confirm").focus();
			$.showErr("<?php echo $this->_var['LANG']['USER_PWD_CONFIRM_ERROR']; ?>");			
			return false;
		}
	}
	else{
		obj.find("#signup-password-confirm").focus();
		$.showErr("请输入确认密码");			
		return false;
	}//密码



	<?php $_from = $this->_var['field_list']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }; $this->push_vars('', 'field_item');if (count($_from)):
    foreach ($_from AS $this->_var['field_item']):
?>
		<?php if ($this->_var['field_item']['is_must'] == 1): ?>
		if(obj.find("#settings-<?php echo $this->_var['field_item']['field_name']; ?>").val()=='')
		{
			$.showErr("<?php 
$k = array (
  'name' => 'sprintf',
  'format' => $this->_var['LANG']['EMPTY_ERROR_TIP'],
  'value' => $this->_var['field_item']['field_show_name'],
);
echo $k['name']($k['format'],$k['value']);
?>");	
			obj.find("#settings-<?php echo $this->_var['field_item']['field_name']; ?>").focus();
			return false;
		}
		<?php endif; ?>
	<?php endforeach; endif; unset($_from); ?><?php $this->pop_vars();; ?>

	
	if(obj.find("#J_agreement:checked").length == 0){
		$.showErr("请先同意  注册协议 和 隐私条款");
		return false;
	}
	
	return true;
}
</script>
</div>
<div class="blank"></div>
	<div class="wrap clearfix">
	 	<div class="copyright clearfix tc" style="padding:8px ;background:#f7f7f7; color:#757575">
			<?php 
$k = array (
  'name' => 'app_conf',
  'value' => 'SHOP_FOOTER',
);
echo $k['name']($k['value']);
?> 
        </div>
	</div>
</body>
</html>