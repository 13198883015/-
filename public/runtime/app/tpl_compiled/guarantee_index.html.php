<?php echo $this->fetch('inc/header.html'); ?>
<style type="text/css">
	.faq .b {
		color: #00bef0;
		font-weight: 600;
		padding: 10px 0 0;
	}
	#uc_cate .c_hd{background-image:none; padding-left:30px;color:#666; background:#ececec}
	#uc_cate .c_hd_cur{background:#00bef0;color:#fff}
</style>
<div class="blank"></div>
<div class="short_uc f_l">
	<dl id="uc_cate">
		<?php $_from = $this->_var['article_cate']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }; $this->push_vars('key', 'cate');if (count($_from)):
    foreach ($_from AS $this->_var['key'] => $this->_var['cate']):
?>
		<?php if ($this->_var['cate']['pid'] != 0): ?>
			<div class="c_hd " id="c_hd_<?php echo $this->_var['cate']['id']; ?>" rel="<?php echo $this->_var['cate']['id']; ?>">
			    <?php echo $this->_var['cate']['title']; ?>
			</div>
		<?php endif; ?>
		<?php endforeach; endif; unset($_from); ?><?php $this->pop_vars();; ?>
	</dl>
</div>
<div class="long_uc f_r faq wb" style="overflow:inherit;" id="J_box">
	<div class="p15">
		<?php $_from = $this->_var['article_cate']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }; $this->push_vars('', 'cate');if (count($_from)):
    foreach ($_from AS $this->_var['cate']):
?>
			<?php if ($this->_var['cate']['pid'] != 0): ?>
			<div id="J_box_<?php echo $this->_var['cate']['id']; ?>" class="j_box_item hide" rel="<?php echo $this->_var['cate']['id']; ?>">
				<h3 class="f24 f_blue  pb10"> <?php echo $this->_var['cate']['title']; ?></h3>
				<?php if ($this->_var['cate']['article']['list']): ?>
				<?php $_from = $this->_var['cate']['article']['list']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }; $this->push_vars('', 'aitem');if (count($_from)):
    foreach ($_from AS $this->_var['aitem']):
?>
				<div class="clearfix pl10 pr10">
					<div class="f16 pt10 pb10 " id="q<?php echo $this->_var['aitem']['id']; ?>" name="q<?php echo $this->_var['aitem']['id']; ?>">
						<a href="javascript:void(0);" class="item-tit f_dgray"><b><?php echo $this->_var['aitem']['title']; ?></b></a>
                  	</div>
					<div class="clearfix f_dgray item-content" style="padding:3px 20px">
					<?php echo $this->_var['aitem']['content']; ?>
					</div>
				</div>
				<?php endforeach; endif; unset($_from); ?><?php $this->pop_vars();; ?>
				<?php endif; ?>
			</div>
			<?php endif; ?>
		<?php endforeach; endif; unset($_from); ?><?php $this->pop_vars();; ?>
		</div>
</div>
<div class="blank"></div>
<?php echo $this->fetch('inc/footer.html'); ?>
<script type="text/javascript">
jQuery(function(){
	if($("#J_box .vvs").length == 0){
		$("#J_box .j_box_item:first").removeClass("hide");
		$("#uc_cate .c_hd:first").addClass("c_hd_cur");
	}
	
	$("#uc_cate .c_hd").click(function(){
		$("#uc_cate .c_hd").removeClass("c_hd_cur");
		$(this).addClass("c_hd_cur");
		var idx = $(this).attr("rel");
		$(".j_box_item").addClass("hide");
		$("#J_box_"+idx).removeClass("hide");
	});
	
	$(".j_box_item .item-tit").click(function(){
		if($(this).parent().parent().find(".item-content").hasClass("hide")){
			$(this).parent().parent().find(".item-content").removeClass("hide");
		}
		else{
			$(this).parent().parent().find(".item-content").addClass("hide");
		}
	});
	
});
</script>