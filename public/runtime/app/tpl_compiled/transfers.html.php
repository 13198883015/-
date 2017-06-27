<?php echo $this->fetch('inc/header.html'); ?>
<adv adv_id="债权转让列表页顶部广告" />
	<p class="pos"><a href="<?php
echo parse_url_tag("u:index|index|"."".""); 
?>">首页</a> > <a href="<?php
echo parse_url_tag("u:index|transfer|"."".""); 
?>">转让列表</a></p>
	
	<div id="content" class="clearfix">
		<div class="short filterbox">
			<div class="bddf clearfix" id="deallist" name="deallist">
				<div class="filter clearfix">
		            <div class="f_l f_dgray b">按条件搜索</div>
		        </div>
		        <div class="propAttrs clearfix pr <?php if ($this->_var['months_type'] != 0 || $this->_var['lefttime'] != 0): ?>v<?php endif; ?>" id="search_condition" <?php if ($this->_var['months_type'] == 0 && $this->_var['lefttime'] == 0): ?>style="height:130px"<?php endif; ?>>
					<a href="javascript:void(0);" class="j_more  ps" style="bottom:10px;right:10px;z-index:10;color:#01bcef">更多筛选</a>
		            <form action="<?php
echo parse_url_tag("u:index|deals|"."cid=".$this->_var['cid']."".""); 
?>" method="post" id="searchByConditionForm">
		                
		                <?php if ($this->_var['cate_list_url']): ?>
						<div class="attr">
		                    <div class="attrKey">认证标识：</div>
		                    <div class="attrValues">
								<ul class="av-collapse" id="dashboard">
									<?php $_from = $this->_var['cate_list_url']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }; $this->push_vars('key', 'cates');if (count($_from)):
    foreach ($_from AS $this->_var['key'] => $this->_var['cates']):
?>
									<li >
										<a href="<?php echo $this->_var['cates']['url']; ?>#deallist" <?php if ($this->_var['cates']['id'] == $this->_var['cate_id']): ?>class="cur"<?php endif; ?>><?php echo $this->_var['cates']['name']; ?></a>
									</li>
									<?php endforeach; endif; unset($_from); ?><?php $this->pop_vars();; ?>								
								</ul>
		                    </div>
		                </div>
						<?php endif; ?>
						
						   
		                <div class="attr">
							<div class="attrKey">区域列表：</div>
							<div class="attrValues">
								<ul class="av-collapse" name="city" id="city">
									<?php $_from = $this->_var['city_urls']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }; $this->push_vars('key', 'city');if (count($_from)):
    foreach ($_from AS $this->_var['key'] => $this->_var['city']):
?>
		                            <li><a href="<?php echo $this->_var['city']['url']; ?>#deallist"  <?php if ($this->_var['city']['id'] == $this->_var['city_id']): ?> class="cur" <?php endif; ?>><?php echo $this->_var['city']['name']; ?></a></li>
									<?php endforeach; endif; unset($_from); ?><?php $this->pop_vars();; ?>
		                        </ul>
		                    </div>
		                </div>
						<?php if ($this->_var['sub_citys']): ?>
						<div class="attr">
							<div class="attrKey">城市列表：</div>
							<div class="attrValues">
								<ul class="av-collapse" name="city" id="city">
									<?php $_from = $this->_var['sub_citys']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }; $this->push_vars('key', 'scity');if (count($_from)):
    foreach ($_from AS $this->_var['key'] => $this->_var['scity']):
?>
		                            <li><a href="<?php echo $this->_var['scity']['url']; ?>#deallist"  <?php if ($this->_var['scity']['id'] == $this->_var['scity_id']): ?> class="cur" <?php endif; ?>><?php echo $this->_var['scity']['name']; ?></a></li>
									<?php endforeach; endif; unset($_from); ?><?php $this->pop_vars();; ?>
		                        </ul>
		                    </div>
		                </div>
						<?php endif; ?>
						
						
						<div class="attr">
		                    <div class="attrKey">信誉等级：</div>
		                    <div class="attrValues">
								<ul class="av-collapse" name="level" id="level">
									<?php $_from = $this->_var['level_list_url']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }; $this->push_vars('key', 'ilevel');if (count($_from)):
    foreach ($_from AS $this->_var['key'] => $this->_var['ilevel']):
?>
								   <li>
									   <a href="<?php echo $this->_var['ilevel']['url']; ?>#deallist" <?php if ($this->_var['level'] == $this->_var['ilevel']['id']): ?>class="cur"<?php endif; ?>><?php echo $this->_var['ilevel']['name']; ?><?php if ($this->_var['key'] != 0): ?>以上<?php endif; ?></a>
								   </li>
								   <?php endforeach; endif; unset($_from); ?><?php $this->pop_vars();; ?>
								</ul>
							</div>
		                </div>
						<div class="attr">
		                    <div class="attrKey">回馈利率：</div>
		                    <div class="attrValues">
								<ul class="av-collapse" name="interest" id="interest">
		                           <?php $_from = $this->_var['interest_url']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }; $this->push_vars('key', 'iinterest');if (count($_from)):
    foreach ($_from AS $this->_var['key'] => $this->_var['iinterest']):
?>
								   <li>
									   <a href="<?php echo $this->_var['iinterest']['url']; ?>#deallist" <?php if ($this->_var['interest'] == $this->_var['iinterest']['interest']): ?>class="cur"<?php endif; ?>><?php echo $this->_var['iinterest']['name']; ?><?php if ($this->_var['key'] != 0): ?>以上<?php endif; ?></a>
								   </li>
								   <?php endforeach; endif; unset($_from); ?><?php $this->pop_vars();; ?>
		                        </ul>
		                    </div>
		                </div>
		                
		             
		                
		                
						<div class="attr">
							<div class="attrKey">借款期限：</div>
							<div class="attrValues">
								<ul class="av-collapse" name="interest" id="months">
									<?php $_from = $this->_var['months_type_url']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }; $this->push_vars('key', 'months_0_60369200_1498464718');if (count($_from)):
    foreach ($_from AS $this->_var['key'] => $this->_var['months_0_60369200_1498464718']):
?>
		                            <li><a href="<?php echo $this->_var['months_0_60369200_1498464718']['url']; ?>#deallist" <?php if ($this->_var['key'] == $this->_var['months_type']): ?>class="cur"<?php endif; ?>><?php echo $this->_var['months_0_60369200_1498464718']['name']; ?></a></li>
									<?php endforeach; endif; unset($_from); ?><?php $this->pop_vars();; ?>
		                        </ul>
		                    </div>
		                </div>
						<div class="attr">
		                    <div class="attrKey">剩余时间：</div>
		                    <div class="attrValues">
								<ul class="av-collapse" name="lefttime" id="lefttime">
		                            <?php $_from = $this->_var['lefttime_url']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }; $this->push_vars('key', 'ilefttime');if (count($_from)):
    foreach ($_from AS $this->_var['key'] => $this->_var['ilefttime']):
?>
								   <li>
									   <a href="<?php echo $this->_var['ilefttime']['url']; ?>#deallist" <?php if ($this->_var['lefttime'] == $this->_var['ilefttime']['lefttime']): ?>class="cur"<?php endif; ?>><?php echo $this->_var['ilefttime']['name']; ?><?php if ($this->_var['key'] != 0): ?>以内<?php endif; ?></a>
								   </li>
								   <?php endforeach; endif; unset($_from); ?><?php $this->pop_vars();; ?>
		                        </ul>
		                    </div>
		                </div>
		            </form>
		        </div>
			</div>
			<div class="blank"></div>
			<div class="blank"></div>
		</div>
		<div class="list">
			<div class="list_title clearfix">
				<div onclick="window.location.href='<?php
echo parse_url_tag("u:index|deals|"."".""); 
?>'">投资列表</div>
				<div class="cur">债权转让</div>
				<a href="<?php
echo parse_url_tag("u:index|tool|"."".""); 
?>" class="calt">理财计算器</a>
			</div>
			<div class="list_cont">
				<div class="i_deal_list clearfix">
				<?php if ($this->_var['transfer_list']): ?>
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr  border="0" style="background-color:#00bef0; color:#fff; height:34px;">
				        <th>标题</th>
						<th style="width:15%">转让人  / 承接人</th>
						<th style="width:18%">本/息/<a href="#" onclick="set_sort('borrow_amount');" style="color:#fff;">转让金</a></th>
						<th style="width:10%"><a href="#" onclick="set_sort('rate');" style="color:#fff;">利率</a></th>
						<th style="width:10%"><a href="#" onclick="set_sort('repay_time');" style="color:#fff;">待还</a>/总期数</th>
						<th style="width:10%"><a href="#" onclick="set_sort('ulevel');" style="color:#fff;">信用等级</a></th>
						<th style="width:15%"><a href="#" onclick="set_sort('remain_time');" style="color:#fff;">剩余时间</a></th>
				    </tr>
					<?php if ($this->_var['transfer_list']): ?>
					<?php $_from = $this->_var['transfer_list']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }; $this->push_vars('key', 'deal');if (count($_from)):
    foreach ($_from AS $this->_var['key'] => $this->_var['deal']):
?>
					<tr class="item <?php if ($this->_var['key'] % 2 == 1): ?>item_1<?php endif; ?> tc">
		                <td style="text-align:left">
		                	&nbsp;&nbsp;<img src="<?php echo $this->_var['deal']['cate_info']['icon']; ?>" width="24" height="24" class="ico" />
		                    <a href="<?php echo $this->_var['deal']['url']; ?>" target="_blank">
		                      <?php echo $this->_var['deal']['name']; ?>
		                    </a>
		                </td>
		                <td>
							<div class="f_gray">
	                          <a href="<?php echo $this->_var['deal']['user']['url']; ?>" target="_blank"><?php echo $this->_var['deal']['user']['user_name']; ?></a>
	                      	</div>
							<?php if ($this->_var['deal']['tuser']): ?>
							<div class="f_gray">
	                          <a href="<?php echo $this->_var['deal']['tuser']['url']; ?>" target="_blank"><?php echo $this->_var['deal']['tuser']['user_name']; ?></a>
	                      	</div>
							<?php endif; ?>
		                </td>
		                <td>
		                  	<div><?php echo $this->_var['deal']['left_benjin_format']; ?></div>
							<div><?php echo $this->_var['deal']['left_lixi_format']; ?></div>
		                    <div>
		                        <?php 
$k = array (
  'name' => 'format_price',
  'v' => $this->_var['deal']['transfer_amount'],
);
echo $k['name']($k['v']);
?>
		                    </div>
		                </td>    
		                <td>
		                    <div>
		                        <?php 
$k = array (
  'name' => 'number_format',
  'v' => $this->_var['deal']['rate'],
  'f' => '2',
);
echo $k['name']($k['v'],$k['f']);
?>%
		                    </div>
		                      
		                </td>
		                <td>
		                    <span class="f_red"><?php echo $this->_var['deal']['how_much_month']; ?>/<?php echo $this->_var['deal']['repay_time']; ?>
		                </td>
		                <td>
		                    <a href="<?php echo $this->_var['deal']['duser']['url']; ?>" target="_blank"><img src="<?php echo $this->_var['TMPL']; ?>/images/<?php echo $this->_var['deal']['duser']['point_level']; ?>.png" width="40" align="absmiddle" alt="<?php echo $this->_var['deal']['duser']['point_level']; ?>" title="<?php echo $this->_var['deal']['duser']['point_level']; ?>"></a>
		                </td>
		                <td>
                          	<?php if ($this->_var['deal']['t_user_id'] > 0): ?>
								已转让
							<?php else: ?>
								<?php if ($this->_var['deal']['status'] == 0): ?>
									已撤销
								<?php else: ?>
								<?php echo $this->_var['deal']['remain_time_format']; ?>
								<?php if ($this->_var['deal']['remain_time'] < 0): ?>
								  	逾期还款
								<?php endif; ?>
								<?php endif; ?>
							<?php endif; ?>
		                </td>
			        </tr>
					<?php endforeach; endif; unset($_from); ?><?php $this->pop_vars();; ?>
					<?php else: ?>
					<tr><td colspan="7">没有数据</td></tr>
					<?php endif; ?>
				</table>
				<?php endif; ?>
			</div>
			<div class="pages"><?php echo $this->_var['pages']; ?></div>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
	jQuery(function(){
		$("#searchByKeyForm .searchinput").bind("focus",function(){
			if($.trim($(this).val())=="请输入您的搜索条件"){
				$(this).val("");
				$(this).removeClass("f_dgray");
			}
		});
		
		$("#searchByKeyForm .searchinput").bind("blur",function(){
			if($.trim($(this).val())=="请输入您的搜索条件" || $.trim($(this).val())==""){
				$(this).val("请输入您的搜索条件");
				$(this).addClass("f_dgray");
			}
		});
		
		$("#search_condition .j_more").click(function(){
			if(!$("#search_condition").hasClass("v")){
				$("#search_condition").css({"height":"220px"});
				$("#search_condition").addClass("v");
			}
			else{
				$("#search_condition").css({"height":"130px"});
				$("#search_condition").removeClass("v");
			}
		});
	});
	function searchByCondition(){
		$("#searchByConditionForm").submit();
	}
	function searchLoans(){
		if($.trim($("#searchByKeyForm .searchinput").val())=="请输入您的搜索条件" || $.trim($("#searchByKeyForm .searchinput").val())==""){
			$.showErr("请输入您的搜索条件");
			return false;
		}
		$("#searchByKeyForm").submit();
	};
	
	function calculate(){
		var amount=$("#calculateAmount").val();
        var interest=$("#calculateInterest").val();
        var month=$("#calculateMonth").val();
		var repayType = $("#repayType").val();

        if((amount.replace(/[ ]/g, "")) == "" || (amount.replace(/[ ]/g, "")) == null||amount==""||amount==null){
            $.showErr("请输入初始投资");
            return;
        }else{
            amount=$.trim(amount);
            if(/^(([1-9]{1}\d*)|([0]{1}))(\.(\d){1,2})?$/.test(amount)==false){
                $.showErr("初始投资只能为整数或者小数且最多只能有两位小数");
                return;
            }else{
                if(amount>1000000){
                    $.showErr("初始投资为100万以下");
                    return;
                }
            }
        }
        if((interest.replace(/[ ]/g, "")) == "" || (interest.replace(/[ ]/g, "")) == null||interest==""||interest==null){
            $.showErr("请输入年利率");
            return;
        }else{
            interest=$.trim(interest);
            if(/^(([1-9]{1}\d*)|([0]{1}))(\.(\d){1,2})?$/.test(interest)==false){
                $.showErr("年利率只能为整数或者小数且最多只能有两位小数");
                return;
            }else{
                if(interest>=100){
                    $.showErr("年利率必须在100%以下");
                    return false;
                }
            }
        }
        if((month.replace(/[ ]/g, "")) == "" || (month.replace(/[ ]/g, "")) == null||month==""||month==null){
            $.showErr("请输入投资期限");
            return;
        }else{
            month=$.trim(month);
            if(/^(([1-9]{1}\d*)|([0]{1}))(\.(\d){1,2})?$/.test(month)==false){
                $.showErr("投资期限只能为整数或者小数且最多只能有两位小数");
                return;
            }else{
                if(month>100){
                    $.showErr("投资期限为100月以内");
                    return;
                }
            }
        }
        var value = 0;
	    var inters= interest /(100*12);
		if(repayType==0){
			value= month*amount*(inters*Math.pow((1+inters), month) / (Math.pow((1+inters),month)-1));
		}
		else if(repayType==1){
			value = parseFloat(amount) + parseFloat(inters*amount*month);
		}
		else if(repayType==2){
			value = parseFloat(amount) + parseFloat(inters*amount*month);
		}
		
        $("#lastValue").html(formatNum(value));
    }
</script>
<?php echo $this->fetch('inc/footer.html'); ?>