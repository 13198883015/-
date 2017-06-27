-- fanwe SQL Dump Program
-- Apache/2.4.23 (Win32) OpenSSL/1.0.2j PHP/5.4.45
-- 
-- DATE : 2017-06-26 16:05:52
-- MYSQL SERVER VERSION : 5.5.53
-- PHP VERSION : apache2handler
-- Vol : 3


DROP TABLE IF EXISTS `%DB_PREFIX%remind_count`;
CREATE TABLE `%DB_PREFIX%remind_count` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `topic_count` int(11) NOT NULL COMMENT '分享数',
  `topic_count_time` int(11) NOT NULL,
  `dp_count` int(11) NOT NULL COMMENT '点评统计',
  `dp_count_time` int(11) NOT NULL,
  `msg_count` int(11) NOT NULL COMMENT '会员留言',
  `msg_count_time` int(11) NOT NULL,
  `buy_msg_count` int(11) NOT NULL COMMENT '弃用',
  `buy_msg_count_time` int(11) NOT NULL,
  `order_count` int(11) NOT NULL COMMENT '订单统计',
  `order_count_time` int(11) NOT NULL,
  `refund_count` int(11) NOT NULL COMMENT '退款统计',
  `refund_count_time` int(11) NOT NULL,
  `retake_count` int(11) NOT NULL COMMENT '弃用',
  `retake_count_time` int(11) NOT NULL,
  `incharge_count` int(11) NOT NULL COMMENT '充值统计',
  `incharge_count_time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
DROP TABLE IF EXISTS `%DB_PREFIX%reportguy`;
CREATE TABLE `%DB_PREFIX%reportguy` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '举报人',
  `r_user_id` int(11) NOT NULL COMMENT '被举报人',
  `reason` varchar(50) NOT NULL COMMENT '举报原因',
  `content` text NOT NULL COMMENT '举报内容',
  `status` tinyint(1) NOT NULL COMMENT '是否处理 0未处理 1已处理',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
DROP TABLE IF EXISTS `%DB_PREFIX%role`;
CREATE TABLE `%DB_PREFIX%role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `is_effect` tinyint(1) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
INSERT INTO `%DB_PREFIX%role` VALUES ('4','测试管理员','1','0');
DROP TABLE IF EXISTS `%DB_PREFIX%role_access`;
CREATE TABLE `%DB_PREFIX%role_access` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL COMMENT '角色ID',
  `node` varchar(255) NOT NULL COMMENT '节点action名',
  `module` varchar(255) NOT NULL COMMENT '模块名',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=87 DEFAULT CHARSET=utf8;
DROP TABLE IF EXISTS `%DB_PREFIX%sms`;
CREATE TABLE `%DB_PREFIX%sms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '短信接口显示名称',
  `description` text NOT NULL COMMENT '描述',
  `class_name` varchar(255) NOT NULL COMMENT '类名',
  `server_url` text NOT NULL COMMENT '接口的服务器通讯地址',
  `user_name` varchar(255) NOT NULL COMMENT '接口商验证用用户名',
  `password` varchar(255) NOT NULL COMMENT '接口商验证用密码',
  `config` text NOT NULL COMMENT '额外的配置信息',
  `is_effect` tinyint(1) NOT NULL COMMENT '有效性',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
DROP TABLE IF EXISTS `%DB_PREFIX%topic`;
CREATE TABLE `%DB_PREFIX%topic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fav_id` varchar(255) NOT NULL COMMENT '收藏的id',
  `type` varchar(255) NOT NULL COMMENT 'focus关注，1',
  `user_id` int(11) NOT NULL COMMENT '会员ID',
  `user_name` varchar(255) NOT NULL COMMENT '会员名',
  `l_user_id` int(11) NOT NULL COMMENT '借款人的ID',
  `is_effect` tinyint(1) NOT NULL COMMENT '有效性',
  `create_time` int(11) NOT NULL COMMENT '触发时间',
  PRIMARY KEY (`id`),
  KEY `create_time` (`create_time`),
  KEY `user_id` (`user_id`),
  KEY `type` (`type`),
  KEY `is_effect` (`is_effect`),
  KEY `ordery_sort` (`create_time`),
  KEY `multi_key` (`is_effect`,`create_time`),
  KEY `index_01` (`fav_id`,`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
DROP TABLE IF EXISTS `%DB_PREFIX%urls`;
CREATE TABLE `%DB_PREFIX%urls` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` text NOT NULL,
  `count` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
DROP TABLE IF EXISTS `%DB_PREFIX%user`;
CREATE TABLE `%DB_PREFIX%user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) NOT NULL COMMENT '会员名',
  `user_pwd` varchar(255) NOT NULL COMMENT '会员密码',
  `create_time` int(11) NOT NULL COMMENT '注册时间',
  `update_time` int(11) NOT NULL COMMENT '修改时间',
  `login_ip` varchar(255) NOT NULL COMMENT '最后登录IP',
  `group_id` int(11) NOT NULL COMMENT '会员组ID',
  `is_effect` tinyint(1) NOT NULL COMMENT '是否被禁用（未验证）',
  `is_delete` tinyint(1) NOT NULL COMMENT '删除',
  `email` varchar(255) NOT NULL COMMENT '会员邮件',
  `idno` varchar(20) NOT NULL COMMENT '身份证号',
  `idcardpassed` tinyint(1) NOT NULL COMMENT '身份证是否审核通过',
  `idcardpassed_time` int(11) NOT NULL COMMENT '通过时间',
  `real_name` varchar(50) NOT NULL COMMENT '真实姓名',
  `mobile` varchar(255) NOT NULL COMMENT '会员手机号',
  `mobilepassed` tinyint(1) NOT NULL COMMENT '手机是否验证通过',
  `score` int(11) NOT NULL COMMENT '积分',
  `money` decimal(20,2) NOT NULL COMMENT '资金',
  `quota` decimal(20,0) NOT NULL DEFAULT '0' COMMENT '额度',
  `lock_money` decimal(20,2) NOT NULL COMMENT '冻结资金',
  `verify` varchar(255) NOT NULL COMMENT '验证码',
  `code` varchar(255) NOT NULL COMMENT '登录用的标识码',
  `pid` int(11) NOT NULL COMMENT '推荐人ID',
  `login_time` int(11) NOT NULL COMMENT '最后登录时间',
  `referral_count` int(11) NOT NULL COMMENT ' 返利数量',
  `password_verify` varchar(255) NOT NULL COMMENT '取回密码的验证码',
  `integrate_id` int(11) NOT NULL COMMENT '会员整合的用户ID（如uc中的会员ID）',
  `sina_id` int(11) NOT NULL COMMENT '新浪同步的会员ID',
  `renren_id` int(11) NOT NULL COMMENT '预留',
  `kaixin_id` int(11) NOT NULL COMMENT '预留',
  `sohu_id` int(11) NOT NULL COMMENT '预留',
  `bind_verify` varchar(255) NOT NULL COMMENT '绑定验证码',
  `verify_create_time` int(11) NOT NULL COMMENT '绑定验证码发送时间',
  `tencent_id` varchar(255) NOT NULL COMMENT '腾讯微博ID',
  `referer` varchar(255) NOT NULL COMMENT '会员来路',
  `login_pay_time` int(11) NOT NULL COMMENT '弃用',
  `focus_count` int(11) NOT NULL COMMENT '关注别人的数量',
  `focused_count` int(11) NOT NULL COMMENT '粉丝数',
  `n_province_id` int(11) NOT NULL COMMENT '户籍-省',
  `n_city_id` int(11) NOT NULL COMMENT '户籍-市',
  `province_id` int(11) NOT NULL COMMENT '户口-省',
  `city_id` int(11) NOT NULL COMMENT '户口-市',
  `sex` tinyint(1) NOT NULL DEFAULT '-1' COMMENT '性别 0女 1 男',
  `step` tinyint(1) NOT NULL COMMENT ' 新手已完成步骤',
  `byear` int(4) NOT NULL COMMENT '出生年',
  `bmonth` int(2) NOT NULL COMMENT '出生月',
  `bday` int(2) NOT NULL COMMENT '出生日',
  `graduation` varchar(15) NOT NULL COMMENT '学历',
  `graduatedyear` int(5) NOT NULL COMMENT '入学年份',
  `university` varchar(100) NOT NULL COMMENT '毕业院校',
  `edu_validcode` varchar(20) NOT NULL COMMENT '学历认证码',
  `has_send_video` tinyint(1) NOT NULL COMMENT '是否已经上传视频',
  `marriage` varchar(15) NOT NULL COMMENT '婚姻状况',
  `haschild` tinyint(1) NOT NULL COMMENT '有子女 0无 1有',
  `hashouse` tinyint(1) NOT NULL COMMENT '是否有房 0无 1有',
  `houseloan` tinyint(1) NOT NULL COMMENT '是否又房贷',
  `hascar` tinyint(1) NOT NULL COMMENT '是否有车',
  `carloan` tinyint(4) NOT NULL COMMENT '是否又车贷',
  `car_brand` varchar(50) NOT NULL COMMENT '汽车品牌',
  `car_year` int(4) NOT NULL COMMENT '购车时间',
  `car_number` varchar(50) NOT NULL COMMENT '汽车数量',
  `address` varchar(150) NOT NULL COMMENT '住址',
  `phone` varchar(50) NOT NULL COMMENT '电话',
  `postcode` varchar(20) NOT NULL COMMENT '邮编',
  `locate_time` int(11) NOT NULL DEFAULT '0' COMMENT '用户最后登陆时间',
  `xpoint` float(10,6) NOT NULL DEFAULT '0.000000' COMMENT '用户最后登陆x座标',
  `ypoint` float(10,6) NOT NULL DEFAULT '0.000000' COMMENT '用户最后登陆y座标',
  `topic_count` int(11) NOT NULL COMMENT '主题数',
  `fav_count` int(11) NOT NULL COMMENT '喜欢数',
  `faved_count` int(11) NOT NULL COMMENT '被喜欢数',
  `insite_count` int(11) NOT NULL COMMENT '弃用',
  `outsite_count` int(11) NOT NULL COMMENT '弃用',
  `level_id` int(11) NOT NULL COMMENT '等级ID',
  `point` int(11) NOT NULL COMMENT '经验值',
  `sina_app_key` varchar(255) NOT NULL COMMENT '新浪的同步验证key',
  `sina_app_secret` varchar(255) NOT NULL COMMENT '新浪的同步验证密码',
  `is_syn_sina` tinyint(1) NOT NULL COMMENT '是否同步发微博到新浪',
  `tencent_app_key` varchar(255) NOT NULL COMMENT '腾讯的同步验证key',
  `tencent_app_secret` varchar(255) NOT NULL COMMENT '腾讯的同步验证密码',
  `is_syn_tencent` tinyint(1) NOT NULL COMMENT '是否同步发微博到腾讯',
  `t_access_token` varchar(250) NOT NULL COMMENT '腾讯微博授权码',
  `t_openkey` varchar(250) NOT NULL COMMENT '腾讯微博的openkey',
  `t_openid` varchar(250) NOT NULL COMMENT '腾讯微博OPENID',
  `sina_token` varchar(250) NOT NULL COMMENT '新浪的授权码',
  `is_borrow_out` tinyint(1) NOT NULL COMMENT '是否是投标者',
  `is_borrow_int` tinyint(1) NOT NULL COMMENT '是否融资人',
  `creditpassed` tinyint(1) NOT NULL COMMENT '信用认证是否通过',
  `creditpassed_time` int(11) NOT NULL COMMENT '信用认证通过时间',
  `workpassed` tinyint(1) NOT NULL COMMENT '工作认证是否通过',
  `workpassed_time` int(11) NOT NULL COMMENT '工作认证通过时间',
  `incomepassed` tinyint(1) NOT NULL COMMENT '收入认证是否通过',
  `incomepassed_time` int(11) NOT NULL COMMENT '收入认证通过时间',
  `housepassed` tinyint(1) NOT NULL COMMENT '房产认证是否通过',
  `housepassed_time` int(11) NOT NULL COMMENT '房产认证通过时间',
  `carpassed` tinyint(1) NOT NULL COMMENT '汽车认证是否通过',
  `carpassed_time` int(11) NOT NULL COMMENT '汽车认证通过时间',
  `marrypassed` tinyint(1) NOT NULL COMMENT '结婚认证是否通过',
  `marrypassed_time` int(11) NOT NULL COMMENT '结婚认证通过时间',
  `edupassed` tinyint(1) NOT NULL COMMENT '教育认证是否通过',
  `edupassed_time` int(11) NOT NULL COMMENT '教育认证通过时间',
  `skillpassed` tinyint(1) NOT NULL COMMENT '技术职称是否通过',
  `skillpassed_time` int(11) NOT NULL COMMENT '技术职称认证通过时间',
  `videopassed` tinyint(1) NOT NULL COMMENT '视频认证是否通',
  `videopassed_time` int(11) NOT NULL COMMENT '视频认证通过时间',
  `mobiletruepassed` tinyint(1) NOT NULL COMMENT '手机实名认证是否通过',
  `mobiletruepassed_time` int(11) NOT NULL COMMENT '手机实名认证认证通过时间',
  `residencepassed` tinyint(1) NOT NULL,
  `residencepassed_time` int(11) NOT NULL,
  `alipay_id` varchar(255) NOT NULL,
  `qq_id` varchar(255) NOT NULL,
  `info_down` varchar(255) NOT NULL COMMENT '资料下载地址',
  `sealpassed` tinyint(1) NOT NULL COMMENT '电子印章是否通过',
  `paypassword` varchar(50) NOT NULL COMMENT '支付密码',
  `apns_code` varchar(255) DEFAULT NULL COMMENT '推送设备号',
  `emailpassed` tinyint(1) NOT NULL,
  `tmp_email` varchar(255) NOT NULL,
  `view_info` text NOT NULL,
  `ips_acct_no` varchar(30) DEFAULT NULL COMMENT 'pIpsAcctNo 30 IPS托管平台账 户号',
  `referral_rate` decimal(10,2) NOT NULL COMMENT '返利抽成比',
  `taobao_id` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unk_user_name` (`user_name`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
INSERT INTO `%DB_PREFIX%user` VALUES ('1','fanwe','6714ccb93be0fda4e51f206b91b46358','1362094066','1362094066','127.0.0.1','1','1','0','fanwe@fanwe.com','1','1','1358551878','1','13696857677','1','3','68900.00','288893','0.00','','','0','1407173232','0','','0','0','0','0','0','7648','1356635011','','','0','3','3','4','53','4','55','1','1','1914','5','7','大专','2013','','2147483647','1','未婚','0','0','0','0','0','别克','2010','闽A.123123','2222','','35001','1330712776','119.306938','26.069746','30','1','3','3','0','7','757','','','0','','','0','','','','','1','0','1','1358551878','1','1358551878','1','1359089534','0','0','0','0','0','0','1','127','0','0','0','0','0','0','0','0','','','','0','','','0','','','','0.00','');
DROP TABLE IF EXISTS `%DB_PREFIX%user_active_log`;
CREATE TABLE `%DB_PREFIX%user_active_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '会员ID',
  `create_time` int(11) NOT NULL COMMENT '发生时间',
  `point` int(11) NOT NULL COMMENT '经验',
  `score` int(11) NOT NULL COMMENT '积分',
  `money` decimal(11,4) NOT NULL COMMENT '钱',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
DROP TABLE IF EXISTS `%DB_PREFIX%user_auth`;
CREATE TABLE `%DB_PREFIX%user_auth` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `m_name` varchar(255) NOT NULL,
  `a_name` varchar(255) NOT NULL,
  `rel_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
DROP TABLE IF EXISTS `%DB_PREFIX%user_autobid`;
CREATE TABLE `%DB_PREFIX%user_autobid` (
  `user_id` int(11) NOT NULL,
  `fixed_amount` decimal(20,0) NOT NULL COMMENT '每次投标金额',
  `min_rate` decimal(20,0) NOT NULL COMMENT '最小利息',
  `max_rate` decimal(20,0) NOT NULL COMMENT '最大利息',
  `min_period` int(11) NOT NULL COMMENT '最低借款期限',
  `max_period` int(11) NOT NULL COMMENT '最高借款期限',
  `min_level` int(11) NOT NULL COMMENT '最低信用等级',
  `max_level` int(11) NOT NULL COMMENT '最高信用等级',
  `retain_amount` decimal(20,0) NOT NULL COMMENT '账户保留金额',
  `is_effect` tinyint(4) NOT NULL COMMENT '是否开启  0关闭 1开启',
  `last_bid_time` int(11) NOT NULL COMMENT '最后一次投标时间',
  `deal_cates` text NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
INSERT INTO `%DB_PREFIX%user_autobid` VALUES ('1','1100','15','25','3','36','5','7','0','1','1362944420','');
DROP TABLE IF EXISTS `%DB_PREFIX%user_bank`;
CREATE TABLE `%DB_PREFIX%user_bank` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '体现人（标识ID）',
  `bank_id` int(11) NOT NULL COMMENT '银行(标识ID)',
  `bankcard` varchar(30) NOT NULL COMMENT '卡号',
  `real_name` varchar(20) NOT NULL COMMENT '姓名',
  `region_lv1` int(11) NOT NULL,
  `region_lv2` int(11) NOT NULL,
  `region_lv3` int(11) NOT NULL,
  `region_lv4` int(11) NOT NULL,
  `bankzone` varchar(255) NOT NULL COMMENT '开户网点',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `bank_id` (`bank_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
DROP TABLE IF EXISTS `%DB_PREFIX%user_carry`;
CREATE TABLE `%DB_PREFIX%user_carry` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '提现人（标识ID）',
  `money` decimal(20,2) NOT NULL COMMENT '提现金额',
  `fee` decimal(20,2) NOT NULL COMMENT '手续费',
  `bank_id` int(11) NOT NULL COMMENT '银行ID',
  `bankcard` varchar(30) NOT NULL COMMENT '开好',
  `create_time` int(11) NOT NULL COMMENT '提交日期',
  `status` tinyint(1) NOT NULL COMMENT '0未处理，1处理，2关闭',
  `update_time` int(11) NOT NULL COMMENT '处理时间',
  `msg` text NOT NULL COMMENT '操作通知内容',
  `desc` text NOT NULL COMMENT '备注',
  `real_name` varchar(30) NOT NULL COMMENT '姓名',
  `region_lv1` int(11) NOT NULL COMMENT '国ID',
  `region_lv2` int(11) NOT NULL COMMENT '省ID',
  `region_lv3` int(11) NOT NULL COMMENT '市ID',
  `region_lv4` int(11) NOT NULL COMMENT '区ID',
  `bankzone` varchar(255) NOT NULL COMMENT '开户网点',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
DROP TABLE IF EXISTS `%DB_PREFIX%user_carry_config`;
CREATE TABLE `%DB_PREFIX%user_carry_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL COMMENT '简称',
  `min_price` decimal(20,0) NOT NULL COMMENT '最低额度',
  `max_price` decimal(20,0) NOT NULL COMMENT '最高额度',
  `fee` decimal(20,2) NOT NULL COMMENT '费率',
  `fee_type` tinyint(1) NOT NULL COMMENT '费率类型 0 是固定值 1是百分比',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
INSERT INTO `%DB_PREFIX%user_carry_config` VALUES ('1','2万以下','0','19999','1.00','0');
INSERT INTO `%DB_PREFIX%user_carry_config` VALUES ('2','2万元(含)-5万元','20000','49999','3.00','0');
INSERT INTO `%DB_PREFIX%user_carry_config` VALUES ('3','5万元(含)-100万元','50000','999999','5.00','0');
DROP TABLE IF EXISTS `%DB_PREFIX%user_contacter`;
CREATE TABLE `%DB_PREFIX%user_contacter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `user_name` varchar(50) NOT NULL,
  `tel` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
DROP TABLE IF EXISTS `%DB_PREFIX%user_credit_file`;
CREATE TABLE `%DB_PREFIX%user_credit_file` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '会员ID',
  `type` varchar(50) NOT NULL COMMENT '审核类型',
  `file` text NOT NULL COMMENT '序列化后的审核资料地址',
  `create_time` int(11) NOT NULL COMMENT '上传时间',
  `status` tinyint(1) NOT NULL COMMENT '0未处理，1已处理',
  `passed` tinyint(1) NOT NULL COMMENT '是否认证通过',
  `passed_time` int(1) NOT NULL COMMENT '认证日期',
  `msg` text NOT NULL COMMENT '失败原因',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
INSERT INTO `%DB_PREFIX%user_credit_file` VALUES ('1','1','credit_identificationscanning','a:1:{i:0;s:50:\"./public/attachment/201301/14/17/50f3ce845a18a.jpg\";}','0','1','0','0','');
INSERT INTO `%DB_PREFIX%user_credit_file` VALUES ('2','1','credit_house','a:1:{i:0;s:50:\"./public/attachment/201301/14/17/50f3ce845a18a.jpg\";}','0','1','0','0','');
INSERT INTO `%DB_PREFIX%user_credit_file` VALUES ('3','1','credit_contact','a:2:{i:0;s:50:\"./public/attachment/201301/15/09/50f4b1a92ccd5.jpg\";i:1;s:50:\"./public/attachment/201301/15/09/50f4b18e93f79.jpg\";}','0','1','0','0','');
INSERT INTO `%DB_PREFIX%user_credit_file` VALUES ('4','1','credit_incomeduty','a:1:{i:0;s:50:\"./public/attachment/201301/15/11/50f4cfbbb09f3.jpg\";}','0','1','0','0','');
INSERT INTO `%DB_PREFIX%user_credit_file` VALUES ('5','1','credit_credit','a:1:{i:0;s:50:\"./public/attachment/201301/15/11/50f4cfd10b869.jpg\";}','0','1','0','0','');
INSERT INTO `%DB_PREFIX%user_credit_file` VALUES ('6','1','credit_car','a:3:{i:0;s:50:\"./public/attachment/201301/15/14/50f4f3769c76c.jpg\";i:1;s:50:\"./public/attachment/201301/15/14/50f4f3769c76c.jpg\";i:2;s:50:\"./public/attachment/201301/15/14/50f4f3769c76c.jpg\";}','0','1','0','0','');
INSERT INTO `%DB_PREFIX%user_credit_file` VALUES ('7','1','credit_residence','a:2:{i:0;s:50:\"./public/attachment/201301/19/10/50fa070599761.jpg\";i:1;s:50:\"./public/attachment/201301/19/10/50fa0638d3575.jpg\";}','1358534280','1','0','0','');
INSERT INTO `%DB_PREFIX%user_credit_file` VALUES ('8','1','credit_mobilereceipt','a:1:{i:0;s:50:\"./public/attachment/201301/19/11/50fa192493730.jpg\";}','1358538917','1','0','0','');
DROP TABLE IF EXISTS `%DB_PREFIX%user_credit_type`;
CREATE TABLE `%DB_PREFIX%user_credit_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(255) NOT NULL COMMENT '类型名称',
  `type` varchar(100) NOT NULL COMMENT '审核类型',
  `icon` varchar(255) NOT NULL COMMENT '图标',
  `brief` text NOT NULL COMMENT '简介',
  `description` text NOT NULL COMMENT '认证说明',
  `role` varchar(255) NOT NULL COMMENT '认证条件',
  `file_tip` varchar(255) NOT NULL COMMENT '上传框说明',
  `file_count` int(11) NOT NULL,
  `expire` int(11) NOT NULL COMMENT '过期时间',
  `status` tinyint(1) NOT NULL COMMENT '0系统，1管理员新加',
  `is_effect` tinyint(1) NOT NULL COMMENT '0无效，1有效',
  `sort` int(11) NOT NULL COMMENT '排序',
  `point` int(11) NOT NULL COMMENT '信用积分',
  `must` tinyint(1) NOT NULL COMMENT '是否必须',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='会员认证审核资料';
INSERT INTO `%DB_PREFIX%user_credit_type` VALUES ('1','实名认证','credit_identificationscanning','./public/credit/1.jpg','您上传的身份证扫描件需和您绑定的身份证一致，否则将无法通过认证。','<div class=\"lh22\">\r\n	1、请您上传您<span class=\"f_red\">本人身份证原件</span>的照片。如果您持有第二代身份证，请上传正、反两面照片。\r\n</div>\r\n<div class=\"lh22\">\r\n	如果您持有第一代身份证，仅需上传正面照片。\r\n</div>\r\n<div class=\"lh22\">\r\n	2、请确认您上传的资料是清晰的、未经修改的数码照片（不可以是扫描图片）。\r\n</div>\r\n<div class=\"lh22\">\r\n	每张图片的尺寸<span class=\"f_red\">不大于1.5M</span>。\r\n</div>','','','2','0','1','1','1','10','1');
INSERT INTO `%DB_PREFIX%user_credit_type` VALUES ('2','工作认证','credit_contact','./public/credit/2.jpg','您的工作状况是评估您信用状况的主要依据。请您填写真实可靠的工作信息。','上传资料说明：<br />\r\n如果您满足以下 1种以上的身份，例如：您有稳定工作，且兼职开淘宝店。<br />\r\n我们建议您同时上传两份资料，这将有助于提高您的借款额度和信用等级 <br />\r\n<br />\r\n<table class=\"f12\" cellspacing=\"1\" style=\"background:#ccc;\">\r\n	<tbody>\r\n		<tr>\r\n			<td class=\"pl10 pr10 wb\">\r\n				<h4>\r\n					工薪阶层：\r\n				</h4>\r\n请上传以下<span class=\"f_red\">至少两项</span>资料的照片或扫描件：\r\n			</td>\r\n			<td class=\"pl10 pr10 wb\">\r\n				<div class=\"lh22\">\r\n					a) 劳动合同。\r\n				</div>\r\n				<div class=\"lh22\">\r\n					b) 加盖单位公章的在职证明。\r\n				</div>\r\n				<div class=\"lh22\">\r\n					c) 带有姓名及照片的工作证。\r\n				</div>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td class=\"pl10 pr10 wb\">\r\n				<h4>\r\n					私营企业主:\r\n				</h4>\r\n请上传以下<span class=\"f_red\">全部三项</span>资料的照片或扫描件：\r\n			</td>\r\n			<td class=\"pl10 pr10 wb\">\r\n				<div class=\"lh22\">\r\n					a) 企业的营业执照。\r\n				</div>\r\n				<div class=\"lh22\">\r\n					b) 企业的税务登记证。\r\n				</div>\r\n				<div class=\"lh22\">\r\n					c) 店面照片（照片内需能看见营业执照）。\r\n				</div>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td class=\"pl10 pr10 wb\">\r\n				<h4>\r\n					网商：\r\n				</h4>\r\n请上传以下资料的照片或扫描件：\r\n			</td>\r\n			<td class=\"pl10 pr10 wb\">\r\n				<div class=\"lh22\">\r\n					a) 请上传网店主页和后台的截屏(需要看清网址）。\r\n				</div>\r\n				<div class=\"lh22\">\r\n					b) 支付宝（或其他第三方支付工具）的至少3张最近3个月的商户版成功交易记录的截屏图片。\r\n				</div>\r\n				<div class=\"lh22\">\r\n					c) 营业执照（如果有的话提供，不是必须的）。\r\n				</div>\r\n				<div class=\"lh22\">\r\n					d) 备注：如果是淘宝专职卖家，店铺等级必须为3钻以上（含3钻）。\r\n				</div>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>','工薪阶层需入职满6个月，私营企业主和淘宝商家需经营满一年','','4','6','1','1','2','10','1');
INSERT INTO `%DB_PREFIX%user_credit_type` VALUES ('3','信用报告','credit_credit','./public/credit/3.jpg','个人信用报告是由中国人民银行出具，全面记录个人信用活动，反映个人信用基本状况的文件。本报告是p2p信贷了解您信用状况的一个重要参考资料。 您信用报告内体现的信用记录，和信用卡额度等数据，将在您发布借款时经网站工作人员整理，在充分保护您隐私的前提下披露给借出者，作为借出者投标的依据。','<div>\r\n	<div class=\"lh22\">\r\n		1、个人信用报告需<span class=\"f_red\">15日内</span>开具。\r\n	</div>\r\n	<div class=\"lh22\">\r\n		2、上传您的<span class=\"f_red\">个人信用报告原件</span>的照片，每页信用报告需独立照相，并将整份信用报告按页码先后顺序完整上传。 <br />\r\n<a href=\"#creditDiv\" id=\"creditGuy\" class=\"f_blue\">如何办理个人信用报告？</a> <br />\r\n<a href=\"http://www.pbccrc.org.cn/zxzx/lxfs/lxfs.shtml\" target=\"_blank\" class=\"f_blue\">全国各地征信中心联系方式查询</a> \r\n	</div>\r\n	<div class=\"lh22\">\r\n		3、请确认您上传的资料是清晰的、未经修改的数码照片或扫描图片。\r\n	</div>\r\n</div>','','上传央行信用报告','2','6','1','1','3','10','1');
INSERT INTO `%DB_PREFIX%user_credit_type` VALUES ('4','收入认证','credit_incomeduty','./public/credit/4.jpg','您的银行流水单以及完税证明，是证明您收入情况的主要文件，也是评估您还款能力的主要依据之一。','上传资料说明：<br />\r\n如果您满意以下 1种以上的身份，例如：您有稳定工作，且兼职开淘宝店。 <br />\r\n我们建议您同时上传两份资料，这将有助于提高您的借款额度和信用等级。 <br />\r\n<table class=\"f12\" cellspacing=\"1\" style=\"background:#ccc;\">\r\n	<tbody>\r\n		<tr>\r\n			<td class=\"pl10 pr10 wb\">\r\n				<h4>\r\n					工薪阶层：\r\n				</h4>\r\n请上传右侧<span class=\"f_red\">一项或多项</span>资料：\r\n			</td>\r\n			<td class=\"wb\">\r\n				<div class=\"lh22\" style=\"padding:0 10px;\">\r\n					a) 最近连续六个月工资卡银行流水单的照片或扫描件，须有银行盖章，或工资卡网银的电脑截屏。<br />\r\n<a href=\"#bankDiv\" id=\"bankGuy\" class=\"f_blue\">如何办理银行流水单？</a> \r\n				</div>\r\n				<div class=\"lh22\" style=\"padding:0 10px;\">\r\n					b) 最近连续六个月的个人所得税完税凭证。<br />\r\n<a href=\"#dutyDiv\" id=\"dutyGuy\" class=\"f_blue\">如何办理个人所得税完税证明？</a> \r\n				</div>\r\n				<div class=\"lh22\" style=\"padding:0 10px;\">\r\n					c) 社保卡正反面原件的照片以及最近连续六个月缴费记录。\r\n				</div>\r\n				<div class=\"lh22\" style=\"padding:0 10px;\">\r\n					d) 如果工资用现金形式发放，请提供近半年的常用银行储蓄账户流水单，须有银行盖章，或工资卡网银的电脑截屏。。\r\n				</div>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td class=\"pl10 pr10 wb\">\r\n				<h4>\r\n					私营企业主:\r\n				</h4>\r\n请上传右侧<span class=\"f_red\">一项或多项</span>资料的照片或扫描件：\r\n			</td>\r\n			<td class=\"wb\">\r\n				<div class=\"lh22\" style=\"padding:0 10px;\">\r\n					a) 最近连续六个月个人银行卡流水单，须有银行盖章，或网银的电脑截屏。<br />\r\n<a href=\"#bankDiv\" id=\"bankGuy2\" class=\"f_blue\">如何办理银行流水单？</a> \r\n				</div>\r\n				<div class=\"lh22\" style=\"padding:0 10px;\">\r\n					b) 最近连续六个月企业银行流水单，须有银行盖章；或近半年企业的纳税证明。\r\n				</div>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td class=\"pl10 pr10 wb\">\r\n				<h4>\r\n					网商：\r\n				</h4>\r\n请上传右侧<span class=\"f_red\">全部两项</span>资料的照片或扫描件：\r\n			</td>\r\n			<td class=\"wb\">\r\n				<div class=\"lh22\" style=\"padding:0 10px;\">\r\n					a) 最近连续六个月个人银行卡流水单，须有银行盖章，或网银的电脑截屏。<br />\r\n<a href=\"#bankDiv\" id=\"bankGuy2\" class=\"f_blue\">如何办理银行流水单？</a> \r\n				</div>\r\n				<div class=\"lh22\" style=\"padding:0 10px;\">\r\n					b) 如果是淘宝商家请上传近半年淘宝店支付宝账户明细的网银截图。\r\n				</div>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>','收入需较稳定，私营企业主及淘宝商家月均流水需在20000以上','上传完税证明','6','6','1','1','4','10','1');
INSERT INTO `%DB_PREFIX%user_credit_type` VALUES ('5','电子印章','credit_seal','./public/credit/6.jpg','电子印章将会在借款协议那边使用。','<div class=\"lh22\">\r\n                        	电子印章认证必须为<span class=\"f_red\">GIF</span>或者<span class=\"f_red\">PNG</span>的<span class=\"f_red\">背景透明</span>图片。\r\n                        </div>','','电子印章','1','0','1','1','5','2','0');
INSERT INTO `%DB_PREFIX%user_credit_type` VALUES ('6','房产认证','credit_house','./public/credit/15.jpg','房产证明是证明借入者资产及还款能力的重要凭证,根据借款者提供的房产证明给与借入者一定的信用加分。','1、 请上传以下任意一项或多项资料。\r\n<div class=\"pl15\">\r\n	<div class=\"lh22\">\r\n		a) <span class=\"f_red\">购房合同以及发票。</span> \r\n	</div>\r\n	<div class=\"lh22\">\r\n		b) <span class=\"f_red\">银行按揭贷款合同。</span> \r\n	</div>\r\n	<div class=\"lh22\">\r\n		c) <span class=\"f_red\">房产局产调单及收据。</span> \r\n	</div>\r\n</div>\r\n2、 请确认您上传的资料是清晰的、未经修改的数码照片或<span class=\"f_red\">彩色扫描</span>图片。 每张图片的尺寸<span class=\"f_red\">不大于3M</span>。','必须是商品房','上传房产证明','4','0','1','1','6','3','0');
INSERT INTO `%DB_PREFIX%user_credit_type` VALUES ('7','购车认证','credit_car','./public/credit/12.jpg','购车证明是证明借入者资产及还款能力的重要凭证之一，根据借入者提供的购车证明给与借入者一定的信用加分。','<div class=\"lh22\">\r\n	1、请上传您所购买<span class=\"f_red\">车辆行驶证</span>原件的照片。\r\n</div>\r\n<div class=\"lh22\">\r\n	2、请上传您和您购买车辆的<span class=\"f_red\">合影（照片须露出车牌号码）</span>。\r\n</div>\r\n<div class=\"lh22\">\r\n	3、请确认您上传的资料是清晰的、未经修改的数码照片或扫描图片。\r\n</div>','','上传汽车证明','4','0','1','1','7','3','0');
INSERT INTO `%DB_PREFIX%user_credit_type` VALUES ('8','学历认证','credit_graducation','./public/credit/10.jpg','出者在选择借款列表投标时，借入者的学历也是一个重要的参考因素。为了让借出者更好、更快地相信您的学历是真实的，强烈建议您对学历进行在线验证。','<div class=\"f14 f_red\">一、2001年至今获得学历，需学历证书编号</div>\r\n<div class=\"pl15\">\r\n<div class=\"lh22\">\r\n	1、点击 <a href=\"http://www.chsi.com.cn/xlcx/\" target=\"_blank\" class=\"f_blue\">网上学历查询</a>。\r\n</div>\r\n<div class=\"lh22\">\r\n	2、选择“零散查询”。\r\n</div>\r\n<div class=\"lh22\">\r\n	3、输入证书编号、查询码（通过手机短信获得，为12位学历查询码）、姓名、以及验证码进行查询。\r\n</div>\r\n<div class=\"lh22\">\r\n	4、查询成功后，您将查获得《教育部学历证书电子注册备案表》。\r\n</div>\r\n<div class=\"lh22\">\r\n	5、将该表<span class=\"f_red\">右下角的12位在线验证码</span><a href=\"./public/images/xueli_1.jpg\" target=\"_blank\" class=\"f_blue\">（见样本图01）</a>，输入下面的文本框。\r\n</div>\r\n<div class=\"lh22\">\r\n	6、点击提交审核。\r\n</div>\r\n</div>\r\n<div class=\"f14 f_red\">\r\n	二、1991年至今获得学历，无需学历证书编号\r\n</div>\r\n<div class=\"pl15\">\r\n<div class=\"lh22\">\r\n	1、点击 <a href=\"http://www.chsi.com.cn/xlcx/\" target=\"_blank\" class=\"f_blue\">网上学历查询</a>。\r\n</div>\r\n<div class=\"lh22\">\r\n	2、选择“本人查询”。\r\n</div>\r\n<div class=\"lh22\">\r\n	3、注册学信网账号。\r\n</div>\r\n<div class=\"lh22\">\r\n	4、登录学信网，点击“学历信息”。\r\n</div>\r\n<div class=\"lh22\">\r\n	5、选择您的最高学历，并点击“申请验证报告”（申请过程中，您需通过手机短信获得12位学历查询码，此查询码与{function name=\"app_conf\" v=\"SHOP_TITLE\"}所需验证码不同）。\r\n</div>\r\n<div class=\"lh22\">\r\n	6、申请成功后，您将获得<span class=\"f_red\">12位在线验证码</span><a href=\"./public/images/xueli_2.jpg\" target=\"_blank\" class=\"f_blue\">（见样本图02）</a> \r\n</div>\r\n<div class=\"lh22\">\r\n	7、将12位在线验证码输入下面的文本框\r\n</div>\r\n<div class=\"lh22\">\r\n	8、点击提交审核\r\n</div>\r\n</div>','大专或以上学历（普通全日制）','','0','0','1','1','8','10','0');
INSERT INTO `%DB_PREFIX%user_credit_type` VALUES ('9','技术职称认证','credit_titles','./public/credit/9.jpg','技术职称是经专家评审、反映一个人专业技术水平并作为聘任专业技术职务依据的一种资格，不与工资挂钩，是考核借款人信用的评估因素之一，通过技术职称认证证明，您将获得一定的信用加分。','<div class=\"lh22\">\r\n	1、请上传您的技术职称证书原件照片。\r\n</div>\r\n<div class=\"lh22\">\r\n	2、 请确认您上传的资料是清晰的、未经修改的数码照片或扫描图片。 每张图片的尺寸<span class=\"f_red\">不大于1.5M</span>。\r\n</div>','国家承认的二级及以上等级证书。例如律师证、会计证、工程师证等','上传技术职称认证','2','0','1','1','9','2','0');
INSERT INTO `%DB_PREFIX%user_credit_type` VALUES ('10','视频认证','credit_videoauth','./public/credit/8.jpg','什么是视频认证？只有通过视频认证您才能获得贷款，您只需要在视频认证页面上传您本人的视频，并提交，即可申请视频认证。您也可以选择与p2p信贷客服在线上进行视频认证。','<div class=\"lh22\">\r\n	1、视频录制要求：\r\n	<div>\r\n		（1）视频认证文件大小<span class=\"f_red\">不得超过50M</span><br />\r\n（2）	请上传真实有效的本人的视频<br />\r\n（3）	视频文件格式可以是RMVB、WMV、mp4 、 AVI等类型的文件<br />\r\n（4）	视频认证必须图像清晰，声音清楚<br />\r\n（5）	视频认证必须衣冠整洁，禁止出现抽烟，赤裸等形象\r\n	</div>\r\n</div>\r\n<div class=\"lh22\">\r\n	2、视频录制内容。请针对本次借款录制视频，视频中需包括以下内容：\r\n	<div>\r\n		<span class=\"b\">（1）：首先，请朗读以下文字：</span>我是 ***，我在{function name=\"app_conf\" v=\"SHOP_TITLE\"}的用户名是***，我的身份证号是 ***********************，现在我正在做{function name=\"app_conf\" v=\"SHOP_TITLE\"}的视频确认。我在此做出以下承诺：我愿意接受{function name=\"app_conf\" v=\"SHOP_TITLE\"}的使用条款和借款协议；我提供给{function name=\"app_conf\" v=\"SHOP_TITLE\"}的信息及资料均是真实有效的；我愿意对我在{function name=\"app_conf\" v=\"SHOP_TITLE\"}上的行为承担全部法律责任；在我未能按时归还借款时，我同意{function name=\"app_conf\" v=\"SHOP_TITLE\"}采取法律诉讼、资料曝光等一切必要措施。\r\n	</div>\r\n	<div>\r\n		<span class=\"b\">（2）：读完声明后，请您将身份证正面(有身份证号)对准摄像头，并保持5秒，需要保证画面中能同时看到您和您的身份证，并且身份证内容清晰可见。</span>\r\n	</div>\r\n</div>\r\n<div class=\"lh22\">\r\n	3、视频提交办法：您可以选择下列方法之一进行视频认证的提交：\r\n	<div>\r\n		（1）您可以联系右侧的在线QQ客服进行视频文件的提交。\r\n	</div>\r\n	<div>\r\n		（2）您可以将视频文件发送至<a name=\"app_conf\"></a>{function name=\"app_conf\" v=\"REPLY_ADDRESS\"}，请在邮件中注明您的{function name=\"app_conf\" v=\"SHOP_TITLE\"}用户名及真实姓名。\r\n	</div>\r\n	<div>\r\n		（3）当您通过上述两种方式之一提交过视频认证文件之后，请选择下面的选项并点击“提交审核”。\r\n	</div>\r\n</div>','','','0','0','1','1','10','2','0');
INSERT INTO `%DB_PREFIX%user_credit_type` VALUES ('11','手机实名认证','credit_mobilereceipt','./public/credit/7.jpg','手机流水单是最近一段时间内的详细通话记录，是验证借入者真实性的重要凭证之一。您的手机详单不会以任何形式被泄露。','<div class=\"div22\">\r\n	1、请您上传您绑定的手机号码<span class=\"f_red\">最近3个月的手机详单</span>原件的照片。如详单数量较多可分月打印并上传\r\n</div>\r\n<div class=\"lh22\">\r\n	<span class=\"f_red\">每月前5日部分</span>（每月详单均需清晰显示机主手机号码）。\r\n</div>\r\n<div class=\"lh22\">\r\n	2、请确认您上传的资料是清晰的、未经修改的数码照片（不可以是扫描图片）。\r\n</div>\r\n<div class=\"lh22\">\r\n	每张图片的尺寸<span class=\"f_red\">不大于1.5M</span>。\r\n</div>','','上传手机流水单','4','0','1','1','11','10','0');
INSERT INTO `%DB_PREFIX%user_credit_type` VALUES ('12','居住地认证','credit_residence','./public/credit/5.jpg','居住地的稳定性，是考核借款人的主要评估因素之一，通过居住地证明，您将获得一定的信用加分。','<div class=\"lh22\">\r\n	1、请上传以下任何一项可证明<span class=\"f_red\">现居住地址</span>的证明文件原件的照片。\r\n</div>\r\n<div class=\"lh22\">\r\n	1) 用您姓名登记的水、电、气最近三期缴费单；\r\n</div>\r\n<div class=\"lh22\">\r\n	2) 用您姓名登记固定电话最近三期缴费单；\r\n</div>\r\n<div class=\"lh22\">\r\n	3) 您的信用卡最近两期的月结单；\r\n</div>\r\n<div class=\"lh22\">\r\n	4) 您的自有房产证明；\r\n</div>\r\n<div class=\"lh22\">\r\n	5) 您父母的房产证明，及证明您和父母关系的证明材料。\r\n</div>\r\n<div class=\"lh22\">\r\n	2、请确认您上传的资料是清晰的、未经修改的数码照片（不可以是扫描图片）。\r\n</div>\r\n<div class=\"lh22\">\r\n	每张图片的尺寸<span class=\"f_red\">不大于1.5M</span>。\r\n</div>','','上传居住地证明','4','6','1','1','12','2','0');
INSERT INTO `%DB_PREFIX%user_credit_type` VALUES ('13','结婚认证','credit_marriage','./public/credit/11.jpg','借入者的婚姻状况的稳定性，是考核借款人信用的评估因素之一，通过结婚认证，您将获得一定的信用加分。','<div class=\"lh22\">\r\n	1、请您上传以下资料\r\n</div>\r\n<div class=\"lh22\">\r\n	1) 您<span class=\"f_red\">结婚证书</span>原件的照片\r\n</div>\r\n<div class=\"lh22\">\r\n	2) 您配偶的身份证原件的照片。如果持有第二代身份证，请上传正反两面\r\n</div>\r\n<div class=\"lh22\">\r\n	照片。如果持有第一代身份证，仅需上传正面照片。\r\n</div>\r\n<div class=\"lh22\">\r\n	3) 您和配偶的<span class=\"f_red\">近照合影</span>一张\r\n</div>\r\n<div class=\"lh22\">\r\n	2、请确认您上传的资料是清晰的、未经修改的数码照片或扫描图片。\r\n</div>','您的配偶同意您将其个人资料提供给本站','上传结婚证书','4','0','1','1','13','2','0');
DROP TABLE IF EXISTS `%DB_PREFIX%user_extend`;
CREATE TABLE `%DB_PREFIX%user_extend` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `field_id` int(11) NOT NULL COMMENT '扩展字段ID',
  `user_id` int(11) NOT NULL COMMENT '会员ID',
  `value` varchar(255) NOT NULL COMMENT '值',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=88 DEFAULT CHARSET=utf8;
INSERT INTO `%DB_PREFIX%user_extend` VALUES ('85','1','1','大专');
INSERT INTO `%DB_PREFIX%user_extend` VALUES ('86','2','1','2004');
INSERT INTO `%DB_PREFIX%user_extend` VALUES ('87','3','1','');
DROP TABLE IF EXISTS `%DB_PREFIX%user_field`;
CREATE TABLE `%DB_PREFIX%user_field` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `field_name` varchar(255) NOT NULL COMMENT ' 字段名（代码）',
  `field_show_name` varchar(255) NOT NULL COMMENT '字段显示用的名称',
  `input_type` tinyint(1) NOT NULL COMMENT '0:手动输入 1：预选下拉',
  `value_scope` text NOT NULL COMMENT '预选下拉的预选值,以逗号分隔',
  `is_must` tinyint(1) NOT NULL COMMENT '是否必填',
  `sort` int(11) NOT NULL COMMENT '排序大到小',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unk_field_name` (`field_name`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
INSERT INTO `%DB_PREFIX%user_field` VALUES ('1','weibo','腾讯微博','0','','0','1');
DROP TABLE IF EXISTS `%DB_PREFIX%user_focus`;
CREATE TABLE `%DB_PREFIX%user_focus` (
  `focus_user_id` int(11) NOT NULL COMMENT '关注人ID',
  `focused_user_id` int(11) NOT NULL COMMENT '被关注人ID',
  `focus_user_name` varchar(255) NOT NULL COMMENT '关注人用户名',
  `focused_user_name` varchar(255) NOT NULL COMMENT '被关注人用户名',
  PRIMARY KEY (`focus_user_id`,`focused_user_id`),
  KEY `focus_user_id` (`focus_user_id`),
  KEY `focused_user_id` (`focused_user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
DROP TABLE IF EXISTS `%DB_PREFIX%user_frequented`;
CREATE TABLE `%DB_PREFIX%user_frequented` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT '0' COMMENT '员会ID',
  `title` varchar(50) DEFAULT NULL,
  `addr` varchar(255) DEFAULT NULL,
  `xpoint` float(12,6) DEFAULT '0.000000' COMMENT 'longitude',
  `ypoint` float(12,6) DEFAULT '0.000000' COMMENT 'latitude',
  `latitude_top` float(12,6) DEFAULT NULL,
  `latitude_bottom` float(12,6) DEFAULT NULL,
  `longitude_left` float(12,6) DEFAULT NULL,
  `longitude_right` float(12,6) DEFAULT NULL,
  `zoom_level` int(5) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
DROP TABLE IF EXISTS `%DB_PREFIX%user_group`;
CREATE TABLE `%DB_PREFIX%user_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '组名',
  `score` int(11) NOT NULL COMMENT '所需积分',
  `discount` decimal(20,2) NOT NULL COMMENT '折扣',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
INSERT INTO `%DB_PREFIX%user_group` VALUES ('1','普通会员','0','1.00');
DROP TABLE IF EXISTS `%DB_PREFIX%user_level`;
CREATE TABLE `%DB_PREFIX%user_level` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '等级名称',
  `point` int(11) NOT NULL COMMENT '所需经验',
  `services_fee` varchar(20) NOT NULL COMMENT '服务费率',
  `enddate` varchar(255) NOT NULL COMMENT '贷款时间',
  `repaytime` text NOT NULL COMMENT '借款期限和借款利率【一行一配置】',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unk` (`point`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
INSERT INTO `%DB_PREFIX%user_level` VALUES ('1','HR','0','5','7','3|1|10|24\r\n6|1|11|24\r\n9|1|12|24\r\n12|1|15|24\r\n18|1|15|24\r\n24|1|15|24');
INSERT INTO `%DB_PREFIX%user_level` VALUES ('2','E','100','3','7','3|1|10|24\r\n6|1|11|24\r\n9|1|12|24\r\n12|1|15|24\r\n18|1|15|24\r\n24|1|15|24');
INSERT INTO `%DB_PREFIX%user_level` VALUES ('3','D','110','2.5','7','3|1|10|24\r\n6|1|11|24\r\n9|1|12|24\r\n12|1|15|24\r\n18|1|15|24\r\n24|1|15|24');
INSERT INTO `%DB_PREFIX%user_level` VALUES ('4','C','120','2','7','3|1|10|24\r\n6|1|11|24\r\n9|1|12|24\r\n12|1|15|24\r\n18|1|15|24\r\n24|1|15|24');
INSERT INTO `%DB_PREFIX%user_level` VALUES ('5','B','130','1.5','7','3|1|10|24\r\n6|1|11|24\r\n9|1|12|24\r\n12|1|15|24\r\n18|1|15|24\r\n24|1|15|24');
INSERT INTO `%DB_PREFIX%user_level` VALUES ('6','A','145','1','7','3|1|10|24\r\n6|1|11|24\r\n9|1|12|24\r\n12|1|15|24\r\n18|1|15|24\r\n24|1|15|24');
INSERT INTO `%DB_PREFIX%user_level` VALUES ('7','AA','160','0','7','3|1|10|24\r\n6|1|11|24\r\n9|1|12|24\r\n12|1|15|24\r\n18|1|15|24\r\n24|1|15|24');
DROP TABLE IF EXISTS `%DB_PREFIX%user_log`;
CREATE TABLE `%DB_PREFIX%user_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `log_info` text NOT NULL COMMENT '日志内容',
  `log_time` int(11) NOT NULL COMMENT '发生时间',
  `log_admin_id` int(11) NOT NULL COMMENT '操作管理员的ID',
  `log_user_id` int(11) NOT NULL COMMENT '操作的前台会员ID',
  `money` decimal(20,2) NOT NULL COMMENT '相关的钱',
  `score` int(11) NOT NULL COMMENT '相关的积分',
  `point` int(11) NOT NULL COMMENT '相关的经验',
  `quota` decimal(20,2) NOT NULL COMMENT '相关的额度',
  `lock_money` decimal(20,2) NOT NULL COMMENT '相关的冻结资金',
  `user_id` int(11) NOT NULL COMMENT '会员ID',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
DROP TABLE IF EXISTS `%DB_PREFIX%user_medal`;
CREATE TABLE `%DB_PREFIX%user_medal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `medal_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `create_time` int(11) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `icon` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
DROP TABLE IF EXISTS `%DB_PREFIX%user_sign_log`;
CREATE TABLE `%DB_PREFIX%user_sign_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `sign_date` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
DROP TABLE IF EXISTS `%DB_PREFIX%user_sta`;
CREATE TABLE `%DB_PREFIX%user_sta` (
  `user_id` int(11) NOT NULL,
  `dp_count` int(11) NOT NULL COMMENT '留言数',
  `borrow_amount` decimal(20,2) NOT NULL COMMENT '总的借款数',
  `repay_amount` decimal(20,2) NOT NULL COMMENT '已还本息',
  `need_repay_amount` decimal(20,2) NOT NULL COMMENT '待还本息',
  `need_manage_amount` decimal(20,2) NOT NULL COMMENT '待还管理费',
  `avg_rate` float(10,2) NOT NULL COMMENT '平均借款利率',
  `avg_borrow_amount` decimal(20,2) NOT NULL COMMENT '平均每笔借款金额',
  `deal_count` int(11) NOT NULL COMMENT '总借入笔数',
  `success_deal_count` int(11) NOT NULL COMMENT '成功借款',
  `repay_deal_count` int(11) NOT NULL COMMENT '还清笔数',
  `tq_repay_deal_count` int(11) NOT NULL COMMENT '提前还清',
  `zc_repay_deal_count` int(11) NOT NULL COMMENT '正常还清',
  `wh_repay_deal_count` int(11) NOT NULL COMMENT '未还清',
  `yuqi_count` int(11) NOT NULL COMMENT '逾期次数',
  `yz_yuqi_count` int(11) NOT NULL COMMENT '严重逾期次数',
  `yuqi_amount` decimal(20,2) NOT NULL COMMENT '逾期本息',
  `yuqi_impose` decimal(20,2) NOT NULL COMMENT '逾期费用',
  `load_earnings` decimal(20,2) NOT NULL COMMENT '已赚利息',
  `load_tq_impose` decimal(20,2) NOT NULL COMMENT '提前还款违约金',
  `load_yq_impose` decimal(20,2) NOT NULL COMMENT '逾期还款违约金',
  `load_avg_rate` float(10,2) NOT NULL COMMENT '借出加权平均收益率',
  `load_count` int(11) NOT NULL COMMENT '总借出笔数',
  `load_money` decimal(20,2) NOT NULL COMMENT '总的借出金额',
  `load_repay_money` decimal(20,2) NOT NULL COMMENT '已回收本息',
  `load_wait_repay_money` decimal(20,2) DEFAULT NULL COMMENT '待回收本息',
  `reback_load_count` int(11) NOT NULL COMMENT '收回的借出笔数',
  `wait_reback_load_count` int(11) NOT NULL COMMENT '未收回的借出笔数',
  `load_wait_earnings` decimal(20,2) NOT NULL COMMENT '待回收利息',
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
INSERT INTO `%DB_PREFIX%user_sta` VALUES ('1','0','0.00','0.00','0.00','0.00','0.00','0.00','0','0','0','0','0','0','0','0','0.00','0.00','0.00','0.00','0.00','0.00','0','0.00','0.00','0.00','0','0','0.00');
DROP TABLE IF EXISTS `%DB_PREFIX%user_work`;
CREATE TABLE `%DB_PREFIX%user_work` (
  `user_id` int(11) NOT NULL,
  `office` varchar(100) NOT NULL COMMENT '单位名称',
  `jobtype` varchar(50) NOT NULL COMMENT '职业状态',
  `province_id` int(11) NOT NULL COMMENT '工作城市-省',
  `city_id` int(11) NOT NULL COMMENT '工作城市-市',
  `officetype` varchar(50) NOT NULL COMMENT '公司类别',
  `officedomain` varchar(50) NOT NULL COMMENT '公司行业',
  `officecale` varchar(50) NOT NULL COMMENT '公司规模',
  `position` varchar(50) NOT NULL COMMENT '职位',
  `salary` varchar(50) NOT NULL COMMENT '月收入',
  `workyears` varchar(50) NOT NULL COMMENT '在现单位工作年限',
  `workphone` varchar(20) NOT NULL COMMENT '公司电话',
  `workemail` varchar(50) NOT NULL COMMENT '公司邮箱',
  `officeaddress` varchar(100) NOT NULL COMMENT '公司地址',
  `urgentcontact` varchar(20) NOT NULL COMMENT '直系联系人-姓名',
  `urgentrelation` varchar(20) NOT NULL COMMENT '直系联系人-关系',
  `urgentmobile` varchar(20) NOT NULL COMMENT '直系联系人-电话',
  `urgentcontact2` varchar(20) NOT NULL COMMENT '其他联系人-姓名',
  `urgentrelation2` varchar(20) NOT NULL COMMENT '其他联系人-关系',
  `urgentmobile2` varchar(20) NOT NULL COMMENT '其他联系人-电话',
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
DROP TABLE IF EXISTS `%DB_PREFIX%user_x_y_point`;
CREATE TABLE `%DB_PREFIX%user_x_y_point` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `xpoint` float(14,6) NOT NULL DEFAULT '0.000000',
  `ypoint` float(14,6) NOT NULL DEFAULT '0.000000',
  `locate_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
DROP TABLE IF EXISTS `%DB_PREFIX%vote`;
CREATE TABLE `%DB_PREFIX%vote` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '调查的项目名称',
  `begin_time` int(11) NOT NULL COMMENT '开始时间',
  `end_time` int(11) NOT NULL COMMENT '结束时间',
  `is_effect` tinyint(1) NOT NULL COMMENT '有效性',
  `sort` int(11) NOT NULL,
  `description` text NOT NULL COMMENT '描述',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
DROP TABLE IF EXISTS `%DB_PREFIX%vote_ask`;
CREATE TABLE `%DB_PREFIX%vote_ask` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '投票项名称',
  `type` tinyint(1) NOT NULL COMMENT '投票类型，单选多选/自定义可叠加 1:单选 2:多选 3:自定义',
  `sort` int(11) NOT NULL COMMENT ' 排序 大到小',
  `vote_id` int(11) NOT NULL COMMENT '调查ID',
  `val_scope` text NOT NULL COMMENT '预选范围 逗号分开',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
DROP TABLE IF EXISTS `%DB_PREFIX%vote_result`;
CREATE TABLE `%DB_PREFIX%vote_result` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '投票的名称',
  `count` int(11) NOT NULL COMMENT '计数',
  `vote_id` int(11) NOT NULL COMMENT '调查项ID',
  `vote_ask_id` int(11) NOT NULL COMMENT '投票项（问题）ID',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
