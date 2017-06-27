-- fanwe SQL Dump Program
-- Apache/2.4.23 (Win32) OpenSSL/1.0.2j PHP/5.4.45
-- 
-- DATE : 2017-06-26 16:05:52
-- MYSQL SERVER VERSION : 5.5.53
-- PHP VERSION : apache2handler
-- Vol : 2


DROP TABLE IF EXISTS `%DB_PREFIX%generation_repay_submit`;
CREATE TABLE `%DB_PREFIX%generation_repay_submit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `deal_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL COMMENT '代还多少本息',
  `money` decimal(20,2) NOT NULL,
  `status` tinyint(1) NOT NULL COMMENT '0 未处理 1续约成功 2续约失败',
  `memo` text NOT NULL,
  `op_memo` text NOT NULL COMMENT '操作备注',
  `create_time` int(11) NOT NULL COMMENT '代还时间',
  `update_time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='代还款申请';
DROP TABLE IF EXISTS `%DB_PREFIX%ips_create_new_acct`;
CREATE TABLE `%DB_PREFIX%ips_create_new_acct` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `user_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0:普通用户fanwe_user.id;1:担保用户fanwe_deal_agency.id',
  `argMerCode` varchar(6) NOT NULL COMMENT '“平台”账号 否 由IPS颁发的商户号 ',
  `pMerBillNo` varchar(30) NOT NULL DEFAULT '0' COMMENT 'pMerBillNo商户开户流水号 否 商户系统唯一丌重复 针对用户在开户中途中断（开户未完成，但关闭了IPS开 户界面）时，必须重新以相同的商户订单号发起再次开户 ',
  `pIdentType` tinyint(2) DEFAULT '1' COMMENT '证件类型 否 1#身份证，默认：1',
  `pIdentNo` varchar(20) DEFAULT NULL COMMENT '证件号码 否 真实身份证 ',
  `pRealName` varchar(30) DEFAULT NULL COMMENT '姓名 否 真实姓名（中文） ',
  `pMobileNo` varchar(11) DEFAULT NULL COMMENT '手机号 否 用户发送短信 ',
  `pEmail` varchar(50) DEFAULT NULL COMMENT '注册邮箱 否 用于登录账号，IPS系统内唯一丌能重复',
  `pSmDate` date DEFAULT NULL COMMENT '提交日期 否 时间格式“yyyyMMdd”,商户提交日期,。如：20140323 ',
  `pMemo1` varchar(100) DEFAULT NULL COMMENT '备注 是/否',
  `pMemo2` varchar(100) DEFAULT NULL COMMENT '备注 是/否',
  `pMemo3` varchar(100) DEFAULT NULL COMMENT '备注 是/否',
  `pStatus` tinyint(2) DEFAULT NULL COMMENT '开户状态 否 状态：10#开户成功，5#注册超时，9#开户失败',
  `pBankName` varchar(64) DEFAULT NULL COMMENT '银行名称 是/否 pErrCode 返回状态为 MG00000F 时返回，用 户在IPS登记的信息 ',
  `pBkAccName` varchar(50) DEFAULT NULL COMMENT '户名 是/否 pErrCode 返回状态为 MG00000F 时返回，用 户在IPS登记的信息不姓名一致。',
  `pBkAccNo` varchar(4) DEFAULT NULL COMMENT '银行卡账号 是/否 pErrCode 返回状态为 MG00000F 时返回，用 户在IPS登记的信息。返回卡号后4位。 ',
  `pCardStatus` tinyint(1) DEFAULT NULL COMMENT '身份证状态 是/否 pErrCode 返回状态为MG00000F时返回。 是否验证成功 F 未验证，Y 验证通过 验证丌 通过 ',
  `pPhStatus` tinyint(1) DEFAULT NULL COMMENT '手机状态 是/否 pErrCode 返回状态为MG00000F时返回 是否验证成功： F未验 ，Y 验证通过，N验证 丌通过 ',
  `pIpsAcctNo` varchar(30) DEFAULT NULL COMMENT 'IPS托管平台账 户号 是/否 pErrCode 返回状态为 MG00000F 时返回，由 IPS生成颁发的资金账号。 ',
  `pIpsAcctDate` date DEFAULT NULL COMMENT 'IPS开户日期 否 pErrCode 返回状态为 MG00000F 时返回，格 式：yyyymmdd ',
  `pMerCode` varchar(6) DEFAULT NULL COMMENT '“平台”账号 否 由IPS颁发的商户号 ',
  `pErrCode` varchar(8) DEFAULT NULL COMMENT '处理返回状态 否 MG00000F 操作成功； 其他错误：参考自定义错误码 ',
  `pErrMsg` varchar(255) DEFAULT NULL COMMENT '返回信息 是/否 MG00000F 操作成功； 其他错误信息：参考自定义错误码 ',
  `is_callback` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0:未回调处理;1:已回调处理',
  PRIMARY KEY (`id`,`pMerBillNo`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
DROP TABLE IF EXISTS `%DB_PREFIX%ips_do_dp_trade`;
CREATE TABLE `%DB_PREFIX%ips_do_dp_trade` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_type` tinyint(1) NOT NULL COMMENT '0:普通用户fanwe_user.id;1:担保用户fanwe_deal_agency.id',
  `user_id` int(11) NOT NULL,
  `pMerCode` varchar(6) DEFAULT NULL COMMENT '“平台”账号 否 由IPS颁发的商户号 ',
  `pMerBillNo` varchar(30) DEFAULT NULL COMMENT '商户充值订单号 否 商户系统唯一不重复',
  `pAcctType` tinyint(1) NOT NULL DEFAULT '1' COMMENT '账户类型 否 固定值为 1，表示为类型为IPS个人账户',
  `pIdentNo` varchar(20) DEFAULT NULL COMMENT '证件号码 否 真实身份证（个人）/IPS颁发的商户号（商户） 本期考虑个人，商户充值预留，下期增加 ',
  `pRealName` varchar(30) DEFAULT NULL COMMENT '姓名 否 真实姓名（中文） pIpsAcctNo 30 IPS托管账户号 否 账户类型为1时，IPS托管账户号（个人） ',
  `pIpsAcctNo` varchar(30) DEFAULT NULL COMMENT 'IPS托管账户号 账户类型为1时，IPS托管账户号（个人）',
  `pTrdDate` date DEFAULT NULL COMMENT '充值日期 否 格式：YYYYMMDD ',
  `pTrdAmt` decimal(20,2) DEFAULT '0.00' COMMENT '充值金额 否 金额单位：元，丌能为负，丌允许为0，保留2位小数； 格式：12.00 ',
  `pChannelType` tinyint(1) DEFAULT '1' COMMENT '充值渠道种类 否 1#网银充值；2#代扣充值 ',
  `pTrdBnkCode` varchar(5) DEFAULT NULL COMMENT '充值银行 是/否 网银充值的银行列表由IPS提供，对应充值银行的CODE， 具体使用见接口 <<商户端获取银行列表查询(WS)>>， 获取pBankList内容项中“银行卡编号”字段； 代扣充值这里传空； ',
  `pMerFee` decimal(20,2) DEFAULT '0.00' COMMENT '平台手续费 否 这里是平台向用户收取的费用 金额单位：元，丌能为负，允许为0，保留2位小数； 格式：12.00 ',
  `pIpsFeeType` tinyint(1) DEFAULT NULL COMMENT '谁付IPS手续费 否 这里是IPS向平台收取的费用 1：平台支付 2：用户支付 ',
  `pMemo1` varchar(100) DEFAULT NULL,
  `pMemo2` varchar(100) DEFAULT NULL,
  `pMemo3` varchar(100) DEFAULT NULL,
  `pIpsBillNo` varchar(30) DEFAULT NULL COMMENT 'IPS充值订单号 否 由IPS系统生成的唯一流水号',
  `pErrCode` varchar(8) DEFAULT NULL COMMENT '充值状态 否 MG00000F 操作成功； MG00008F IPS受理中; 其他错误信息：参考自定义错误码',
  `pErrMsg` varchar(100) DEFAULT NULL COMMENT '返回信息 是/否 MG00000F 操作成功； MG00008F IPS受理中; 其他错误信息：参考自定义错误码',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
DROP TABLE IF EXISTS `%DB_PREFIX%ips_do_dw_trade`;
CREATE TABLE `%DB_PREFIX%ips_do_dw_trade` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0:普通用户fanwe_user.id;1:担保用户fanwe_deal_agency.id',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `pMerCode` varchar(6) NOT NULL COMMENT '“平台”账号 否 由IPS颁发的商户号',
  `pMerBillNo` varchar(30) NOT NULL COMMENT '商户提现订单号商户系统唯一不重复',
  `pAcctType` tinyint(1) DEFAULT '1' COMMENT '账户类型 否 0#机构（暂未开放） ；1#个人',
  `pOutType` tinyint(1) DEFAULT NULL COMMENT '提现模式 否 1#普通提现；2#定向提现<暂不开放> ',
  `pBidNo` varchar(30) DEFAULT NULL COMMENT '标号 是/否 提现模式为2时，此字段生效 内容是投标时的标号',
  `pContractNo` varchar(30) DEFAULT NULL COMMENT '合同号 是/否 提现模式为2时，此字段生效 内容是投标时的合同号',
  `pDwTo` varchar(30) DEFAULT NULL COMMENT '提现去向 是/否 提现模式为2时，此字段生效 上送IPS托管账户号（个人/商户号）',
  `pIdentNo` varchar(20) DEFAULT NULL COMMENT '证件号码 否 真实身份证（个人）/由IPS颁发的商户号（商户）',
  `pRealName` varchar(30) DEFAULT NULL COMMENT '姓名 否 真实姓名（中文） ',
  `pIpsAcctNo` varchar(30) DEFAULT NULL COMMENT 'IPS账户号 否 账户类型为1时，IPS个人托管账户号 账户类型为0时，由IPS颁发的商户号',
  `pDwDate` date DEFAULT NULL COMMENT '提现日期 否 格式：YYYYMMDD ',
  `pTrdAmt` decimal(20,2) NOT NULL DEFAULT '0.00' COMMENT '提现金额 否 金额单位，不能为负，不允许为0 ',
  `pMerFee` decimal(20,2) NOT NULL DEFAULT '0.00' COMMENT '平台手续费 否 金额单位，不能为负，允许为0 这里是平台向用户收取的费用 ',
  `pIpsFeeType` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'IPS手续费收取方 否 这里是IPS收取的费用 1：平台支付 2：提现方支付',
  `pIpsBillNo` varchar(30) DEFAULT NULL,
  `is_callback` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0:未回调处理;1:已回调处理',
  `pErrCode` varchar(8) DEFAULT NULL COMMENT 'MG00000F ?操作成功',
  `pErrMsg` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
DROP TABLE IF EXISTS `%DB_PREFIX%ips_guarantee_unfreeze`;
CREATE TABLE `%DB_PREFIX%ips_guarantee_unfreeze` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `deal_id` int(11) NOT NULL DEFAULT '0',
  `pMerCode` varchar(6) NOT NULL COMMENT '“平台”账号 否 由IPS颁发的商户号 ',
  `pMerBillNo` varchar(30) NOT NULL DEFAULT '0' COMMENT '商户系统唯一丌重复',
  `pBidNo` varchar(30) NOT NULL DEFAULT '0' COMMENT '标的号，商户系统唯一丌重复',
  `pUnfreezeDate` date DEFAULT NULL COMMENT '解冻日期格 式：yyyymmdd ',
  `pUnfreezeAmt` decimal(20,2) DEFAULT '0.00' COMMENT '解冻金额 金额单位，丌能为负，丌允许为0 累计解冻金额  <= 当时冻结时的保证金',
  `pUnfreezenType` tinyint(1) DEFAULT '1' COMMENT '解冻类型 否 1#解冻借款方；2#解冻担保方',
  `pAcctType` tinyint(1) DEFAULT '1' COMMENT '解冻者账户类型 否 0#机构；1#个人',
  `pIdentNo` varchar(20) DEFAULT NULL COMMENT '解冻者证件号码 是/否 解冻者账户类型1时：真实身份证（个人），必填 解冻账户类型0时：为空处理',
  `pRealName` varchar(30) DEFAULT NULL COMMENT '解冻者姓名 否 账户类型为1时，真实姓名（中文） 账户类型为0时，开户时在IPS登记的商户名称 ',
  `pIpsAcctNo` varchar(30) DEFAULT NULL COMMENT '解冻者IPS账号 否 账户类型为1时，IPS个人托管账户号 账户类型为0时，由IPS颁发的商户号 ',
  `pIpsBillNo` varchar(30) DEFAULT NULL COMMENT '由IPS系统生成的唯一流水号',
  `pIpsTime` datetime DEFAULT NULL COMMENT 'IPS处理时间 否 格式为：yyyyMMddHHmmss',
  `pErrCode` varchar(8) DEFAULT NULL COMMENT '处理返回状态 否 MG00000F 操作成功； 其他错误：参考自定义错误码 ',
  `pErrMsg` varchar(255) DEFAULT NULL COMMENT '返回信息 是/否 MG00000F 操作成功； 其他错误信息：参考自定义错误码 ',
  `is_callback` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0:未回调处理;1:已回调处理',
  PRIMARY KEY (`id`,`pMerBillNo`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
DROP TABLE IF EXISTS `%DB_PREFIX%ips_register_creditor`;
CREATE TABLE `%DB_PREFIX%ips_register_creditor` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `deal_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `pMerCode` int(6) NOT NULL,
  `pMerBillNo` varchar(30) NOT NULL COMMENT '商户订单号 否 商户系统唯一不重复 ',
  `pMerDate` date DEFAULT NULL COMMENT '商户日期 否 格式：YYYYMMDD ',
  `pBidNo` varchar(30) DEFAULT NULL COMMENT '标的号 否 字母和数字，如a~z,A~Z,0~9',
  `pContractNo` varchar(30) DEFAULT NULL COMMENT '合同号 否 字母和数字，如a~z,A~Z,0~9',
  `pRegType` tinyint(1) DEFAULT NULL COMMENT '登记方式 否 1：手劢投标  2：自劢投标',
  `pAuthNo` varchar(30) DEFAULT NULL COMMENT '授权号 是/否  字母和数字，如a~z,A~Z,0~9 登记方式为1时，为空 登记方式为2时，填写该投资人自劢投标签约时IPS向平 台接口返回的“pIpsAuthNo 授权号” （详见自劢投标签 约） ',
  `pAuthAmt` decimal(20,2) DEFAULT '0.00' COMMENT '债权面额 否 金额单位元，不能为负，不允许为0 ',
  `pTrdAmt` decimal(20,2) DEFAULT '0.00' COMMENT '交易金额 否 金额单位元，不能为负，不允许为0 债权面额等于交易金额 ',
  `pFee` decimal(20,2) DEFAULT '0.00' COMMENT '投资人手续费 否 金额单位元，不能为负，允许为0 ',
  `pAcctType` tinyint(1) DEFAULT '1' COMMENT '账户类型 否 0#机构（暂未开放） ；1#个人 ',
  `pIdentNo` varchar(20) DEFAULT NULL COMMENT '证件号码 否 真实身份证（个人）/由IPS颁发的商户号',
  `pRealName` varchar(30) DEFAULT NULL COMMENT '姓名 否 真实姓名（中文）',
  `pAccount` varchar(30) DEFAULT NULL COMMENT '投资人账户 否 账户类型为1时，IPS托管账户号（个人） 账户类型为0时，由IPS颁发的商户号',
  `pUse` varchar(100) DEFAULT NULL COMMENT '借款用途 否 借款用途 ',
  `pMemo1` varchar(100) DEFAULT NULL COMMENT '备注',
  `pMemo2` varchar(100) DEFAULT NULL COMMENT '备注',
  `pMemo3` varchar(100) DEFAULT NULL COMMENT '备注',
  `pAccountDealNo` varchar(20) DEFAULT NULL COMMENT '投资人编号 否 IPS返回的投资人编号 ',
  `pBidDealNo` varchar(30) DEFAULT NULL COMMENT '标的编号 否 IPS返回的标的编号',
  `pBusiType` tinyint(1) DEFAULT NULL COMMENT '业务类型 否 返回1，代表投标',
  `pTransferAmt` decimal(20,2) DEFAULT NULL COMMENT '实际冻结金额 否 实际冻结金额',
  `pStatus` tinyint(2) DEFAULT '0' COMMENT '债权人状态 否 0：新增 1：?行中 10：结束',
  `pP2PBillNo` varchar(30) DEFAULT NULL COMMENT 'IPS P2P订单号 否 由IPS系统生成的唯一流水号',
  `pIpsTime` datetime DEFAULT NULL COMMENT 'IPS处理时间 否 格式为：yyyyMMddHHmmss',
  `is_callback` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0:未回调处理;1:已回调处理',
  `pErrCode` varchar(8) DEFAULT NULL,
  `pErrMsg` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`,`pMerBillNo`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
DROP TABLE IF EXISTS `%DB_PREFIX%ips_register_cretansfer`;
CREATE TABLE `%DB_PREFIX%ips_register_cretansfer` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `is_callback` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0:未回调处理;1:已回调处理',
  `t_user_id` int(11) NOT NULL DEFAULT '0' COMMENT '受让用户ID',
  `transfer_id` int(11) NOT NULL DEFAULT '0',
  `pMerCode` varchar(30) NOT NULL COMMENT '“平台”账 号 由IPS颁发的商户号',
  `pMerBillNo` varchar(30) NOT NULL DEFAULT '' COMMENT '商户订单号 否 商户系统唯一不重复',
  `pMerDate` date DEFAULT NULL COMMENT '商户日期 否 格式：YYYYMMDD ',
  `pBidNo` varchar(30) DEFAULT NULL COMMENT '标的号 否 原投资交易的标的号，字母和数字，如a~z,A~Z,0~9 ',
  `pContractNo` varchar(30) DEFAULT NULL COMMENT '合同号 否 原投资交易的合同号， 字母和数字，如a~z,A~Z,0~9 ',
  `pFromAccountType` tinyint(1) DEFAULT NULL COMMENT '出让方账户类型 否 0：机构（暂不支持） 1：个人 ',
  `pFromName` varchar(30) DEFAULT NULL COMMENT '出让方账户姓名 否 出让方账户真实姓名',
  `pFromAccount` varchar(50) DEFAULT NULL COMMENT '出让方账户 否 出让方账户类型为1时，IPS托管账户号（个人） 出让方账户类型为0时，由IPS颁发的商户号 ',
  `pFromIdentType` tinyint(2) DEFAULT '1' COMMENT '出让方证件类型 否 1#身份证，默认：1 ',
  `pFromIdentNo` varchar(20) DEFAULT NULL COMMENT '出让方证件号码 否 真实身份证（个人）/由IPS颁发的商户号（机构）',
  `pToAccountType` tinyint(1) DEFAULT NULL COMMENT '受让方账户类型 否 1：个人  0：机构（暂不支持）',
  `pToAccountName` varchar(30) DEFAULT NULL COMMENT '受让方账户姓名 否 受让方账户真实姓名 ',
  `pToAccount` varchar(30) DEFAULT NULL COMMENT '受让方账户 否 受让方账户类型为1时，IPS托管账户号（个人）',
  `pToIdentType` tinyint(2) DEFAULT '1' COMMENT '受让方证件类型 否 1#身份证，默讣：1 ',
  `pToIdentNo` varchar(20) DEFAULT NULL COMMENT '受让方证件号码 否 真实身份证（个人）/由IPS颁发的商户号（机构）',
  `pCreMerBillNo` varchar(30) DEFAULT NULL COMMENT '登记债权人时提 交的订单号 否 字母和数字，如a~z,A~Z,0~9 登记债权人时提交的订单号，见<登记债权人接口>请求 参数中的“pMerBillNo” ',
  `pCretAmt` decimal(20,2) DEFAULT '0.00' COMMENT '债权面额 否 金额单位元，不能为负，不允许为0 ',
  `pPayAmt` decimal(20,2) DEFAULT '0.00' COMMENT '支付金额 否 金额单位元，不能为负，不允许为0 债权面额（1-30%）<=支付金额<= 债权面额（1+30%） ',
  `pFromFee` decimal(20,2) DEFAULT '0.00' COMMENT '出让方手续费 否 金额单位元，不能为负，允许为0 ',
  `pToFee` decimal(20,2) DEFAULT '0.00' COMMENT '受让方手续费 否 金额单位元，不能为负，允许为0 ',
  `pCretType` tinyint(1) DEFAULT '1' COMMENT '转让类型 否 1：全部转让 2：部分转让',
  `pMemo1` varchar(100) DEFAULT NULL COMMENT '备注',
  `pMemo2` varchar(100) DEFAULT NULL COMMENT '备注',
  `pMemo3` varchar(100) DEFAULT NULL COMMENT '备注',
  `pErrCode` varchar(8) DEFAULT NULL COMMENT '处理返回状态 否 MG00000F 操作成功； 其他错误信息：参考自定义错误码',
  `pErrMsg` varchar(100) DEFAULT NULL COMMENT '返回信息 是/否 MG00000F 操作成功； 其他错误信息：参考自定义错误码',
  `pP2PBillNo` varchar(30) DEFAULT NULL COMMENT '债权转让编号 否 IPS返回的债权转让编号',
  `pIpsTime` datetime DEFAULT NULL COMMENT 'IPS处理时间 否 格式为：yyyyMMddHHmmss ',
  `pBussType` tinyint(1) DEFAULT '1' COMMENT '业务类型 否 1：债权转让',
  `pStatus` tinyint(1) DEFAULT '1' COMMENT '转让状态 否 0：新建 1：?行中 10：成功  9： 失败 ',
  PRIMARY KEY (`id`,`pMerBillNo`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
DROP TABLE IF EXISTS `%DB_PREFIX%ips_register_guarantor`;
CREATE TABLE `%DB_PREFIX%ips_register_guarantor` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `deal_id` int(11) NOT NULL,
  `agency_id` int(11) NOT NULL,
  `pMerCode` varchar(6) DEFAULT NULL COMMENT '“平台”账号 否 由IPS颁发的商户号',
  `pMerBillNo` varchar(30) NOT NULL DEFAULT '' COMMENT '商户订单号 否 商户系统唯一不重复',
  `pMerDate` date DEFAULT NULL COMMENT '商户日期 否 格式：yyyyMMdd ',
  `pBidNo` varchar(30) DEFAULT NULL COMMENT '标的号 否 字母和数字，如a~z,A~Z,0~9',
  `pAmount` decimal(20,2) DEFAULT '0.00' COMMENT '担保金额 否 金额单位元，不能为负，不允许为0 担保人针对该合同标的承诺的最高赔付金额 ',
  `pMarginAmt` decimal(20,2) DEFAULT '0.00' COMMENT '担保保证金 否 金额单位元，不能为负，允许为0 担保人针对该合同标的被冻结的金额',
  `pProFitAmt` decimal(20,2) DEFAULT '0.00' COMMENT '担保收益 否 金额单位元，不能为负，允许为0 ',
  `pAcctType` tinyint(1) DEFAULT '0' COMMENT '担保方类型 否 0#机构；1#个人 ',
  `pFromIdentNo` varchar(20) DEFAULT NULL COMMENT '担保方证件号码 否 针对担保方类型为1时：真实身份证（个人） 针对担保方类型为0时：由IPS颁发的商户号 ',
  `pAccountName` varchar(30) DEFAULT NULL COMMENT '担保方账户姓名 否 针对担保方类型为1时：担保方账户真实姓名 针对担保方类型为0时：在IPS开户时登记的商户名称',
  `pAccount` varchar(30) DEFAULT NULL COMMENT '担保方账户 否 担保方类型为1时，IPS托管账户号（个人） 担保方类型为0时，由IPS颁发的商户号 ',
  `pMemo1` varchar(100) DEFAULT NULL,
  `pMemo2` varchar(100) DEFAULT NULL,
  `pMemo3` varchar(100) DEFAULT NULL,
  `pP2PBillNo` varchar(30) DEFAULT NULL COMMENT '担保方编号 否 IPS返回的担保人编号 ',
  `pRealFreezeAmt` decimal(20,2) DEFAULT '0.00' COMMENT '实际冻结金额  IPS返回的担保保证金 ',
  `pCompenAmt` decimal(20,2) DEFAULT '0.00' COMMENT '已代偿金额  IPS返回的担保金额 ',
  `pIpsTime` datetime DEFAULT NULL COMMENT 'IPS处理时间  格式为：yyyyMMddHHmmss ',
  `pStatus` tinyint(2) DEFAULT NULL COMMENT '担保状态 否 0：新增  1：?行中  10：结束  9：失败',
  `pErrCode` varchar(8) DEFAULT NULL COMMENT '处理返回状态 否 MG00000F 操作成功； 其他错误信息：参考自定义错误码 ',
  `pErrMsg` varchar(100) DEFAULT NULL COMMENT '返回信息 是/否 MG00000F 操作成功； 其他错误信',
  `is_callback` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0:未回调处理;1:已回调处理',
  PRIMARY KEY (`id`,`pMerBillNo`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
DROP TABLE IF EXISTS `%DB_PREFIX%ips_register_subject`;
CREATE TABLE `%DB_PREFIX%ips_register_subject` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `pMerCode` int(6) NOT NULL DEFAULT '0' COMMENT '“平台”账号 否 由IPS颁发的商户号 ',
  `deal_id` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0:新增; 1:标的正常结束; 2:流标结束',
  `pMerBillNo` varchar(30) NOT NULL COMMENT '商户订单号 否 商户系统唯一不重复',
  `pBidNo` varchar(30) NOT NULL COMMENT '标的号，商户系统唯一不重复 ',
  `pRegDate` date DEFAULT NULL COMMENT '商户日期 否 格式：YYYYMMDD ',
  `pLendAmt` decimal(20,2) DEFAULT '0.00' COMMENT '借款金额 否 金额单位，丌能为负，丌允许为0； 借款金额  <= 10000.00万 关于N(9,2)见4.1补充说明 ',
  `pGuaranteesAmt` decimal(20,2) DEFAULT '0.00' COMMENT '借款保证金，允许冻结的金额，金额单位，丌能为负，允 许为0； 借款保证金  <= 10000.00万 ',
  `pTrdLendRate` decimal(20,2) DEFAULT '0.00' COMMENT '借款利率 否 金额单位，丌能为负，允许为0； 借款利率  < 48%，例如：45.12%传入 45.12 ',
  `pTrdCycleType` tinyint(2) DEFAULT NULL COMMENT '借款周期类型 否 借款周期类型，1：天；3：月； 借款周期 <= 5年',
  `pTrdCycleValue` int(5) DEFAULT '0' COMMENT '借款周期值 否 借款周期值 借款周期 <= 5年。 如果借款周期类型为天，则借款周期值<= 1800(360 * 5)；如果借款周期类型为月，则借款周期值<= 60(12 * 5) ',
  `pLendPurpose` varchar(100) DEFAULT NULL COMMENT '借款用途',
  `pRepayMode` tinyint(2) DEFAULT NULL COMMENT '还款方式，1：等额本息，2：按月还息到期还本；3：等 额本金；99：其他； ',
  `pOperationType` tinyint(2) DEFAULT NULL COMMENT '标的操作类型，1：新增，2：结束 “新增”代表新增标的，“结束”代表标的正常还清、丌 需要再还款戒者标的流标等情况。标的“结束”后，投资 人投标冻结金额、担保方保证金、借款人保证金均自劢解 冻。 ',
  `pLendFee` decimal(20,2) DEFAULT '0.00' COMMENT '借款人手续费 否 金额单位，丌能为负，允许为0 这里是平台向借款人收取的费用 ',
  `pAcctType` tinyint(1) DEFAULT '1' COMMENT '账户类型 否 0#机构（暂未开放） ；1#个人 ',
  `pIdentNo` varchar(20) DEFAULT NULL COMMENT '证件号码 否 真实身份证（个人）/由IPS颁发的商户号 ',
  `pRealName` varchar(30) DEFAULT NULL COMMENT '姓名 否 真实姓名（中文）',
  `pIpsAcctNo` varchar(30) DEFAULT NULL COMMENT 'IPS账户号 否 账户类型为1时，IPS托管账户号（个人） 账户类型为0时，由IPS颁发的商户号 ',
  `pMemo1` varchar(100) DEFAULT NULL COMMENT '备注 是/否  ',
  `pMemo2` varchar(100) DEFAULT NULL,
  `pMemo3` varchar(100) DEFAULT NULL,
  `pIpsBillNo` varchar(30) DEFAULT NULL,
  `pIpsTime` datetime DEFAULT NULL COMMENT 'IPS处理时间 否 格式为：yyyyMMddHHmmss ',
  `pBidStatus` tinyint(2) DEFAULT NULL COMMENT '标的状态，1：新增；2：募集中；3：? 行中；8：结束处理中；9：失败；10：结 束；',
  `pRealFreezenAmt` decimal(20,2) DEFAULT '0.00' COMMENT '实际冻结金额，金额单位，不能为负，不允许为0； 实际冻结金额 = 保证金+手续费',
  `pErrCode` varchar(255) DEFAULT NULL COMMENT 'MG02500F标的新增；（登记标的时同步返回） ? MG02501F标的募集中；（登记标的成功后异步返回） ? MG02503F 标的结束处理中；（登记结束标的时同步返 回） ? MG02504F标的失败； ? MG02505F标的结束(登记结束标的成功后异步返回)',
  `pErrMsg` varchar(100) DEFAULT NULL COMMENT '返回信息 是/否 MG00000F 操作成功； MG02500F标的新增； MG02501F标的募集中； MG02503F标的结束处理中； MG02504F标的失败； MG02505F标的结束 其他错误信息：参考自定义错误码',
  `is_callback` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0:未回调处理;1:已回调处理',
  `status_msg` varchar(255) DEFAULT NULL COMMENT '主要是status_msg=2时记录的，流标原因',
  PRIMARY KEY (`id`,`pMerBillNo`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
DROP TABLE IF EXISTS `%DB_PREFIX%ips_repayment_new_trade`;
CREATE TABLE `%DB_PREFIX%ips_repayment_new_trade` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `deal_id` int(11) NOT NULL,
  `deal_repay_id` int(11) NOT NULL DEFAULT '0' COMMENT '还款列表ID',
  `pMerCode` varchar(30) NOT NULL,
  `pMerBillNo` varchar(30) NOT NULL,
  `pBidNo` varchar(30) NOT NULL COMMENT '标号  ? 字母和数字，如a~z,A~Z,0~9',
  `pRepaymentDate` date NOT NULL COMMENT '还款日期 ? 格式：YYYYMMDD ',
  `pRepayType` tinyint(1) NOT NULL DEFAULT '1' COMMENT '还款类型，1#手动还款，2#自动还款',
  `pIpsAuthNo` varchar(30) NOT NULL COMMENT '授权号 ? 是/否 ? 当还款类型为自动还款时不为空，为手动还款时为空',
  `pOutAcctNo` varchar(30) NOT NULL COMMENT '转出方IPS账号 ? 否 ? 借款人在IPS注册的资金托管账号',
  `pOutAmt` decimal(20,2) NOT NULL DEFAULT '0.00' COMMENT '转出金额 ? 否 ? 表示此次还款总金额。 ? 转出金额=Sum(pInAmt) ? Sum(pInAmt)代表转入金额的合计，一个或多个 投资人时的还款金额的累加。 ? 金额单位：元，不能为负，不允许为 0，保留 2 位小 数； ? 格式：12.00 ',
  `pOutFee` decimal(20,2) NOT NULL DEFAULT '0.00' COMMENT '转出方总手续费 ? 否 ? 表示此次借款人或担保人所承担的还款手续费，此手 续费由商户平台向用户收取。 ? 金额单位：元，不能为负，允许为0，保留 2位小数； ? 格式：12.00 ?pOutFee ?= ?Sum(pOutInfoFee) ? Sum(pOutInfoFee)代表转出方手续费的合计 ? ',
  `pMessage` varchar(100) DEFAULT NULL COMMENT '转入结果说明 成功与失败的说明',
  `pMemo1` varchar(100) DEFAULT NULL,
  `pMemo2` varchar(100) DEFAULT NULL,
  `pMemo3` varchar(100) DEFAULT NULL,
  `pIpsBillNo` varchar(30) DEFAULT NULL COMMENT 'IPS还款订单号  否  由 IPS 系统生成的唯一流水号， 此次还款的批次号',
  `pOutIpsFee` decimal(20,2) DEFAULT '0.00' COMMENT '收取转出方手 续费  此手续费由平台商户垫付给 IPS 的手续费',
  `pIpsDate` date DEFAULT NULL COMMENT 'IPS受理日期  否  yyyyMMdd',
  `pErrCode` varchar(8) DEFAULT NULL COMMENT '返回状态  否 MG00000F操作成功 MG00008F IPS受理中；  待处理状态。（并非此次还款成功，还款成功返回详见 4.11.4）  除此之外：参考自定义错误码',
  `pErrMsg` varchar(100) DEFAULT NULL COMMENT '接口返回信息  否  状态非 MG00000F时，反馈实际原因',
  `is_callback` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
DROP TABLE IF EXISTS `%DB_PREFIX%ips_repayment_new_trade_detail`;
CREATE TABLE `%DB_PREFIX%ips_repayment_new_trade_detail` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL,
  `pCreMerBillNo` varchar(30) NOT NULL COMMENT '登记债权人时提 交的订单号 ? 否 ? 登记债权人时提交的订单号，见<登记债权人接口>请求 参数中的“pMerBillNo” ',
  `pInAcctNo` varchar(30) DEFAULT NULL COMMENT '转入方 IPS 托管 账户号 ? 否 ? 债权人在IPS注册的资金托管账号',
  `pInFee` decimal(20,2) DEFAULT '0.00' COMMENT '转入方手续费 ? 否 ? 表示此次还款债权人所承担的还款手续费，此手续费由商 户平台向用户收取。金额单位：元，不能为负，允许为0，保留2位小数； ? 格式：12.00 ?',
  `pOutInfoFee` decimal(20,2) DEFAULT '0.00' COMMENT '转出方手续费 ? 否 ? 表示此次借款人或担保人所承担的还款明细手续费，此手 续费由商户平台收取。',
  `pInAmt` decimal(20,2) DEFAULT '0.00' COMMENT '转入金额 ? 否 ? 格式：0.00 ? ?必须大于0 ?且大于转入方手续费',
  `pStatus` varchar(2) NOT NULL DEFAULT '0' COMMENT '转入状态 ? 否 ? Y#还款成功；N#还款失败',
  `pMessage` varchar(100) DEFAULT NULL COMMENT '转入结果说明 成功与失败的说明',
  `deal_load_repay_id` int(10) NOT NULL DEFAULT '0' COMMENT '对应的还款列表ID',
  `impose_money` decimal(20,2) DEFAULT '0.00',
  `repay_manage_impose_money` decimal(20,2) DEFAULT '0.00',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
DROP TABLE IF EXISTS `%DB_PREFIX%ips_transfer`;
CREATE TABLE `%DB_PREFIX%ips_transfer` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `deal_id` int(10) NOT NULL,
  `ref_data` varchar(200) DEFAULT NULL,
  `pMerCode` varchar(8) NOT NULL,
  `pMerBillNo` varchar(30) DEFAULT NULL COMMENT '商户订单号  否  商户系统唯一不重复',
  `pBidNo` varchar(30) DEFAULT NULL COMMENT '标的号  否  标的号，商户系统唯一不重复 ',
  `pDate` date DEFAULT NULL COMMENT '商户日期  否  格式：YYYYMMDD  ',
  `pTransferType` tinyint(2) DEFAULT NULL COMMENT '转账类型  否  转账类型  1：投资（报文提交关系，转出方：转入方=N：1），  2：代偿（报文提交关系，转出方：转入方=1：N），  3：代偿还款（报文提交关系，转出方：转入方=1：1），  4：债权转让（报文提交关系，转出方：转入方=1：1），  5：结算担保收益（报文提交关系，转出方：转入方=1： 1） ',
  `pTransferMode` tinyint(2) DEFAULT NULL COMMENT '转账方式  是  转账方式，1：逐笔入账；2：批量入账  逐笔入账：不将转账款项汇总，而是按明细交易一笔一 笔计入账户  批量入帐：针对投资，将明细交易按 1 笔汇总本金和 1 笔汇总手续费记入借款人帐户  当转账类型为“1：投资”时，可选择 1 或 2。其余交 易只能选1',
  `pErrCode` varchar(8) DEFAULT NULL COMMENT '返回状态 ? 否 ? 一、转账类型为“代偿”，“投 资”时同步返回 MG00008F ?IPS 受理中；异步再返回 MG00000F ? 操作成功； ? 二、其他转账类型 MG00000F ?操作成功； ? 其他错误信息：参考自定义错误码 ? ',
  `pErrMsg` varchar(100) DEFAULT NULL COMMENT '接口返回信息 ? 否 ? MG00000F ?操作成功； ? 其他错误信息：参考自定义错误码',
  `pIpsBillNo` varchar(30) DEFAULT NULL COMMENT 'IPS订单号  否  由 IPS系统生成的唯一流水号',
  `pIpsTime` datetime DEFAULT NULL COMMENT 'IPS处理时间  否  格式为：yyyyMMddHHmmss',
  `is_callback` tinyint(1) NOT NULL DEFAULT '0',
  `pMemo1` varchar(100) DEFAULT NULL,
  `pMemo2` varchar(100) DEFAULT NULL,
  `pMemo3` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
DROP TABLE IF EXISTS `%DB_PREFIX%ips_transfer_detail`;
CREATE TABLE `%DB_PREFIX%ips_transfer_detail` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT '0',
  `pOriMerBillNo` varchar(30) DEFAULT NULL COMMENT '原商户订单号  否  商户系统唯一不重复  当转账类型为投资时，为登记债权人时提交的商户订单号  当转账类型为代偿时，为登记债权人时提交的商户订单号  当转账类型为代偿还款时，为代偿时提交的商户订单号  当转账类型为债权转让时，为登记债权转让时提交的商户 订单号  当转账类型为结算担保收益时，为登记担保人时提交的商 户订单号  ',
  `pTrdAmt` decimal(20,2) DEFAULT '0.00' COMMENT '转账金额  否  金额单位：元，不能为负，不允许为0，保留2位小数；  格式：12.00  转账类型，1：投资，转账金额=债权面额；  转账类型，2：代偿，转账金额=代偿金额；  转账类型，3：代偿还款，转账金额=代偿还款金额；  转账类型，4：债权转让，转账金额=登记债权转让时的 支付金额； 转账类型，5：结算担保收益，累计转账金额<=登记担保 方时的担保收益；  ',
  `pFAcctType` tinyint(1) DEFAULT '1' COMMENT '转出方账户类型  否  0#机构；1#个人',
  `pFIpsAcctNo` varchar(30) DEFAULT NULL COMMENT '转出方 IPS 托管 账户号  否  账户类型为1时，IPS个人托管账户号  账户类型为0时，由 IPS颁发的商户号  转账类型，1：投资，此为转出方（投资人）；  转账类型，2：代偿，此为转出方（担保方）；  转账类型，3：代偿还款，此为转出方（借款人）；  转账类型，4：债权转让，此为转出方（受让方）；  转账类型，5：结算担保收益，此为转出方（借款人）；  ',
  `pFTrdFee` decimal(20,2) DEFAULT NULL COMMENT '转出方明细手续 费  否  金额单位：元，不能为负，允许为0，保留2位小数；  格式：12.00  转账类型，1：投资，此为转出方（投资人）手续费；  转账类型，2：代偿，此为转出方（担保方）手续费；  转账类型，3：代偿还款，此为转出方（借款人）手续费；  转账类型，4：债权转让，此为转出方（受让方）手续费；  转账类型，5：结算担保收益，此为转出方（借款人）手 续费；  ',
  `pTAcctType` tinyint(1) DEFAULT '1' COMMENT '转入方账户类型  否  0#机构；1#个人',
  `pTIpsAcctNo` varchar(30) DEFAULT NULL COMMENT '转入方 IPS 托管 账户号  否  账户类型为1时，IPS个人托管账户号  账户类型为0时，由 IPS颁发的商户号  转账类型，1：投资，此为转入方（借款人）；  转账类型，2：代偿，此为转入方（投资人）；  转账类型，3：代偿还款，此为转入方（担保方）；  转账类型，4：债权转让，此为转入方（出让方）；  转账类型，5：结算担保收益，此为转入方（担保方）；  ',
  `pTTrdFee` decimal(20,2) DEFAULT NULL COMMENT '转入方明细手续 费  否  金额单位：元，不能为负，允许为0，保留2位小数；  格式：12.00  转账类型，1：投资，此为转入方（借款人）手续费；  转账类型，2：代偿，此为转入方（投资人）手续费；  转账类型，3：代偿还款，此为转入方（担保方）手续费；  转账类型，4：债权转让，此为转入方（出让方）手续费；  转账类型，5：结算担保收益，此为转入方（担保方）手 续费； ',
  `pIpsDetailBillNo` varchar(255) DEFAULT NULL COMMENT 'IPS明细订单号  否  IPS明细订单号',
  `pIpsDetailTime` datetime DEFAULT NULL COMMENT 'IPS明细处理时间  否  格式为：yyyyMMddHHmmss ',
  `pIpsFee` decimal(20,2) DEFAULT '0.00' COMMENT 'IPS手续费  否  IPS手续费',
  `pStatus` varchar(1) DEFAULT NULL,
  `pMessage` varchar(100) DEFAULT NULL COMMENT '转账备注  否  转账失败的原因 ',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
DROP TABLE IF EXISTS `%DB_PREFIX%link`;
CREATE TABLE `%DB_PREFIX%link` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '友情链接显示名称',
  `group_id` int(11) NOT NULL COMMENT '友情链接分组ID',
  `url` varchar(255) NOT NULL COMMENT '链接地址',
  `is_effect` tinyint(1) NOT NULL COMMENT '有效性标识',
  `sort` int(11) NOT NULL COMMENT '排序 大到小',
  `img` varchar(255) NOT NULL COMMENT '链接图片',
  `description` text NOT NULL COMMENT '描述说明',
  `count` int(11) NOT NULL COMMENT '点击量',
  `show_index` tinyint(1) NOT NULL COMMENT '是否显示到首页底部 0:否 1:是',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
DROP TABLE IF EXISTS `%DB_PREFIX%link_group`;
CREATE TABLE `%DB_PREFIX%link_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '友情链接分组名称',
  `sort` tinyint(1) NOT NULL,
  `is_effect` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
INSERT INTO `%DB_PREFIX%link_group` VALUES ('6','友情链接','1','1');
DROP TABLE IF EXISTS `%DB_PREFIX%log`;
CREATE TABLE `%DB_PREFIX%log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `log_info` text NOT NULL COMMENT '日志描述内容',
  `log_time` int(11) NOT NULL COMMENT '发生时间',
  `log_admin` int(11) NOT NULL COMMENT ' 操作的管理员ID',
  `log_ip` varchar(255) NOT NULL COMMENT '操作者IP',
  `log_status` tinyint(1) NOT NULL COMMENT '操作结果 1:操作成功 0:操作失败',
  `module` varchar(255) NOT NULL COMMENT '操作的模块module',
  `action` varchar(255) NOT NULL COMMENT '操作的命令action',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
INSERT INTO `%DB_PREFIX%log` VALUES ('2','支付宝银行直连支付安装成功','1498435164','1','127.0.0.1','1','Payment','insert');
INSERT INTO `%DB_PREFIX%log` VALUES ('3','asd添加成功','1498435269','1','127.0.0.1','1','MsgSystem','insert');
INSERT INTO `%DB_PREFIX%log` VALUES ('4','支付宝通用登录安装成功','1498435317','1','127.0.0.1','1','ApiLogin','insert');
INSERT INTO `%DB_PREFIX%log` VALUES ('5','QQv2登录插件安装成功','1498435329','1','127.0.0.1','1','ApiLogin','insert');
INSERT INTO `%DB_PREFIX%log` VALUES ('6','支付宝快捷登录安装成功','1498435335','1','127.0.0.1','1','ApiLogin','insert');
INSERT INTO `%DB_PREFIX%log` VALUES ('7','腾讯微博登录插件更新成功','1498435345','1','127.0.0.1','1','ApiLogin','update');
INSERT INTO `%DB_PREFIX%log` VALUES ('8','新浪api登录接口更新成功','1498435370','1','127.0.0.1','1','ApiLogin','update');
INSERT INTO `%DB_PREFIX%log` VALUES ('9','阿萨添加成功','1498435437','1','127.0.0.1','1','MsgSystem','insert');
DROP TABLE IF EXISTS `%DB_PREFIX%m_adv`;
CREATE TABLE `%DB_PREFIX%m_adv` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT '',
  `img` varchar(255) DEFAULT '',
  `page` varchar(20) DEFAULT '',
  `type` tinyint(1) DEFAULT '0' COMMENT '1.标签集,2.url地址,3.分类排行,4.最亮达人,5.搜索发现,6.一起拍,7.热门单品排行,8.直接显示某个分享',
  `data` text,
  `sort` smallint(5) DEFAULT '10',
  `status` tinyint(1) DEFAULT '1',
  `open_url_type` int(11) DEFAULT '0' COMMENT '0:使用内置浏览器打开url;1:使用外置浏览器打开',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
DROP TABLE IF EXISTS `%DB_PREFIX%m_config`;
CREATE TABLE `%DB_PREFIX%m_config` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `val` text,
  `type` tinyint(1) NOT NULL,
  `sort` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
INSERT INTO `%DB_PREFIX%m_config` VALUES ('10','kf_phone','客服电话','400-000-0000','0','1');
INSERT INTO `%DB_PREFIX%m_config` VALUES ('11','kf_email','客服邮箱','qq@fanwe.com','0','2');
INSERT INTO `%DB_PREFIX%m_config` VALUES ('29','ios_upgrade','ios版本升级内容','','3','9');
INSERT INTO `%DB_PREFIX%m_config` VALUES ('16','page_size','分页大小','10','0','10');
INSERT INTO `%DB_PREFIX%m_config` VALUES ('17','about_info','关于我们(填文章ID)','66','0','3');
INSERT INTO `%DB_PREFIX%m_config` VALUES ('18','program_title','程序标题名称','方维P2P信贷系统','0','0');
INSERT INTO `%DB_PREFIX%m_config` VALUES ('22','android_version','android版本号','2014070802','0','4');
INSERT INTO `%DB_PREFIX%m_config` VALUES ('23','android_filename','android下载包名','p2p.apk','0','5');
INSERT INTO `%DB_PREFIX%m_config` VALUES ('24','ios_version','ios版本号','0','0','7');
INSERT INTO `%DB_PREFIX%m_config` VALUES ('25','ios_down_url','ios下载地址','','0','8');
INSERT INTO `%DB_PREFIX%m_config` VALUES ('28','android_upgrade','android版本升级内容','更新版本号0，更新内容：','3','6');
INSERT INTO `%DB_PREFIX%m_config` VALUES ('30','article_cate_id','文章分类ID','15','0','11');
DROP TABLE IF EXISTS `%DB_PREFIX%mail_list`;
CREATE TABLE `%DB_PREFIX%mail_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mail_address` varchar(255) NOT NULL COMMENT '邮件的地址',
  `city_id` int(11) NOT NULL COMMENT '订阅的城市ID，用于按地区群发时匹配',
  `code` varchar(255) NOT NULL COMMENT '弃用',
  `is_effect` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mail_address_idx` (`mail_address`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
DROP TABLE IF EXISTS `%DB_PREFIX%mail_server`;
CREATE TABLE `%DB_PREFIX%mail_server` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `smtp_server` varchar(255) NOT NULL COMMENT 'smtp服务器地址IP或域名',
  `smtp_name` varchar(255) NOT NULL COMMENT 'smtp发件帐号名',
  `smtp_pwd` varchar(255) NOT NULL COMMENT 'smtp密码',
  `is_ssl` tinyint(1) NOT NULL COMMENT '是否ssl加密连接（参考具体smtp服务商的要求，如gmail要求ssl连接）',
  `smtp_port` varchar(255) NOT NULL COMMENT 'smtp端口',
  `use_limit` int(11) NOT NULL COMMENT '可用次数为0时表示无限次数使用, 次数满后轮到下一个配置的邮件服务器发件，直到没有可发的邮件服务器为止',
  `is_reset` tinyint(1) NOT NULL COMMENT '是否自动清零，1:次数达到上限后自动清零，等待下一个轮回继续使用该邮箱发送',
  `is_effect` tinyint(1) NOT NULL,
  `total_use` int(11) NOT NULL COMMENT '当前已用次数',
  `is_verify` tinyint(1) NOT NULL COMMENT '是否需要身份验证,通常为1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
DROP TABLE IF EXISTS `%DB_PREFIX%medal`;
CREATE TABLE `%DB_PREFIX%medal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `class_name` varchar(255) NOT NULL COMMENT '勋章接口名',
  `name` varchar(255) NOT NULL COMMENT '显示名称',
  `description` text NOT NULL COMMENT '勋章的描述',
  `is_effect` tinyint(1) NOT NULL COMMENT '有效性',
  `config` text NOT NULL COMMENT '不同勋章接口功能的配置信息',
  `icon` varchar(255) NOT NULL COMMENT '勋章图片',
  `image` varchar(255) NOT NULL COMMENT '备用',
  `route` text NOT NULL COMMENT '勋章获取规则的描述文字',
  `allow_check` tinyint(1) NOT NULL COMMENT '是否会被系统回收 0:不会 1:会',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
DROP TABLE IF EXISTS `%DB_PREFIX%message`;
CREATE TABLE `%DB_PREFIX%message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL COMMENT '留言标题',
  `content` text NOT NULL COMMENT '留言内容',
  `create_time` int(11) NOT NULL COMMENT '留言时间',
  `update_time` int(11) NOT NULL COMMENT '回复时间',
  `admin_reply` text NOT NULL COMMENT '管理员回复内容',
  `admin_id` int(11) NOT NULL COMMENT '回复管理员ID',
  `rel_table` varchar(255) NOT NULL COMMENT '相关的数据表/模块（如借款留言deal）',
  `rel_id` int(11) NOT NULL COMMENT '相关留言的数据ID',
  `user_id` int(11) NOT NULL COMMENT '留言会员ID',
  `pid` int(11) NOT NULL COMMENT '弃用',
  `is_effect` tinyint(1) NOT NULL COMMENT '有效性标识（自动生效的留言自动为1），审核生效的留言为0',
  PRIMARY KEY (`id`),
  KEY `idx_0` (`user_id`,`is_effect`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
DROP TABLE IF EXISTS `%DB_PREFIX%message_type`;
CREATE TABLE `%DB_PREFIX%message_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(255) NOT NULL COMMENT '预设的代码用于留言表中的rel_table',
  `is_fix` tinyint(1) NOT NULL COMMENT '系统内置类型，1:不可删除该类型 0:可删除',
  `show_name` varchar(255) NOT NULL COMMENT '类型显示名称 主要在留言板页面显示',
  `is_effect` tinyint(1) NOT NULL,
  `sort` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
INSERT INTO `%DB_PREFIX%message_type` VALUES ('1','deal','1','商品评论','1','0');
DROP TABLE IF EXISTS `%DB_PREFIX%mobile_list`;
CREATE TABLE `%DB_PREFIX%mobile_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mobile` varchar(255) NOT NULL COMMENT '订阅手机号',
  `city_id` int(11) NOT NULL COMMENT '城市ID',
  `verify_code` varchar(255) NOT NULL COMMENT '验证码',
  `is_effect` tinyint(1) NOT NULL COMMENT '有效性标识',
  PRIMARY KEY (`id`),
  KEY `mobile_idx` (`mobile`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
DROP TABLE IF EXISTS `%DB_PREFIX%mobile_verify_code`;
CREATE TABLE `%DB_PREFIX%mobile_verify_code` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `verify_code` varchar(10) NOT NULL,
  `mobile` varchar(20) NOT NULL,
  `create_time` int(11) NOT NULL,
  `client_ip` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
DROP TABLE IF EXISTS `%DB_PREFIX%msg_box`;
CREATE TABLE `%DB_PREFIX%msg_box` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL COMMENT '标题',
  `content` text NOT NULL COMMENT '内容',
  `from_user_id` int(11) NOT NULL COMMENT '发件人ID 0表示系统自动发送的信息',
  `to_user_id` int(11) NOT NULL COMMENT '收信人ID',
  `create_time` int(11) NOT NULL COMMENT '发信时间',
  `is_read` tinyint(1) NOT NULL COMMENT '是否已读 0:未读 1:已读',
  `is_delete` tinyint(1) NOT NULL COMMENT '是否被用户删除',
  `system_msg_id` int(11) NOT NULL COMMENT '系统群发的系统通知关联的群发数据ID',
  `type` tinyint(1) NOT NULL,
  `group_key` varchar(200) NOT NULL,
  `is_notice` tinyint(1) NOT NULL COMMENT '1系统通知 2材料通过 3审核失败 4额度更新 5提现申请 6提现成功 7提现失败 8还款成功 9回款成功 10借款流标 11投标流标 12三日内还款 13标被留言 14标留言被回复 15借款投标过半 16投标满标 17债权转让失败，18债权转让成功 19续约成功 20续约失败 0用户信息',
  `fav_id` int(11) NOT NULL DEFAULT '0' COMMENT '关联数据id',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
DROP TABLE IF EXISTS `%DB_PREFIX%msg_conf`;
CREATE TABLE `%DB_PREFIX%msg_conf` (
  `user_id` int(11) NOT NULL,
  `mail_asked` tinyint(1) NOT NULL COMMENT '有人对我的借款列表提问（邮件）',
  `sms_asked` tinyint(1) NOT NULL COMMENT '有人对我的借款列表提问（邮件）',
  `mail_bid` tinyint(1) NOT NULL COMMENT '有人向我的借款列表投标（邮件）',
  `sms_bid` tinyint(1) NOT NULL COMMENT '有人向我的借款列表投标（短信）',
  `mail_myfail` tinyint(1) NOT NULL COMMENT '我的借款列表流标（邮件）',
  `sms_myfail` tinyint(1) NOT NULL COMMENT '我的借款列表流标（短信）',
  `mail_half` tinyint(1) NOT NULL COMMENT '我的借款列表完成度超过50%',
  `sms_half` tinyint(1) NOT NULL COMMENT '我的借款列表完成度超过50%',
  `mail_bidsuccess` tinyint(1) NOT NULL COMMENT '我的投标成功',
  `sms_bidsuccess` tinyint(1) NOT NULL COMMENT '我的投标成功',
  `mail_fail` tinyint(1) NOT NULL COMMENT '我的投标流标',
  `sms_fail` tinyint(1) NOT NULL COMMENT '我的投标流标',
  `mail_bidrepaid` tinyint(1) NOT NULL COMMENT '我收到一笔还款',
  `sms_bidrepaid` tinyint(1) NOT NULL COMMENT '我收到一笔还款',
  `mail_answer` tinyint(1) NOT NULL COMMENT '借入者回答了我对借款列表的提问',
  `sms_answer` tinyint(1) NOT NULL COMMENT '借入者回答了我对借款列表的提问',
  `mail_transferfail` tinyint(1) NOT NULL COMMENT '债权转让失败提醒',
  `sms_transferfail` tinyint(1) NOT NULL COMMENT '债权转让失败提醒',
  `mail_transfer` tinyint(1) NOT NULL COMMENT '债权转让成功提醒',
  `sms_transfer` tinyint(1) NOT NULL COMMENT '债权转让成功提醒',
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
DROP TABLE IF EXISTS `%DB_PREFIX%msg_system`;
CREATE TABLE `%DB_PREFIX%msg_system` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL COMMENT '标题',
  `content` text NOT NULL COMMENT '内容',
  `create_time` int(11) NOT NULL COMMENT '发布时间',
  `user_names` text NOT NULL COMMENT '群发的用户名列表，逗号分隔(为空表示发给所有人)',
  `user_ids` text NOT NULL COMMENT '群发的用户ID |号分隔(为空表示发给所有人)',
  `end_time` int(11) NOT NULL COMMENT '过期时间点',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
INSERT INTO `%DB_PREFIX%msg_system` VALUES ('1','asd','dasdad','1498435269','','','1499040042');
INSERT INTO `%DB_PREFIX%msg_system` VALUES ('2','阿萨','阿萨是大多数','1498435437','','','1499040229');
DROP TABLE IF EXISTS `%DB_PREFIX%msg_template`;
CREATE TABLE `%DB_PREFIX%msg_template` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '名称标识',
  `content` text NOT NULL COMMENT '模板内容',
  `type` tinyint(1) NOT NULL COMMENT '类型 0短信 1邮件',
  `is_html` tinyint(1) NOT NULL COMMENT '针对邮件设置的是否超文本标识',
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;
INSERT INTO `%DB_PREFIX%msg_template` VALUES ('1','TPL_MAIL_USER_VERIFY','尊敬的用户您的验证码是【{$verify.code}】，此验证码只能用来注册。','1','1');
INSERT INTO `%DB_PREFIX%msg_template` VALUES ('2','TPL_MAIL_USER_PASSWORD','尊敬的用户您的验证码是【{$verify.code}】。','1','1');
INSERT INTO `%DB_PREFIX%msg_template` VALUES ('38','TPL_GEN_SUCCESS_SMS','尊敬的{$notice.site_name}用户{$notice.user_name}，您的“{$notice.deal_name}”续约已成功通过，感谢您的关注和支持。','0','0');
INSERT INTO `%DB_PREFIX%msg_template` VALUES ('3','TPL_SMS_PAYMENT','{$payment_notice.user_name}你好,你所下订单{$payment_notice.order_sn}的收款单{$payment_notice.notice_sn}金额{$payment_notice.money_format}于{$payment_notice.pay_time_format}支付成功','0','0');
INSERT INTO `%DB_PREFIX%msg_template` VALUES ('4','TPL_MAIL_PAYMENT','{$payment_notice.user_name}你好,你所下订单{$payment_notice.order_sn}的收款单{$payment_notice.notice_sn}金额{$payment_notice.money_format}于{$payment_notice.pay_time_format}支付成功','1','0');
INSERT INTO `%DB_PREFIX%msg_template` VALUES ('5','TPL_SMS_VERIFY_CODE','你的手机号为{$verify.mobile},验证码为{$verify.code}','0','0');
INSERT INTO `%DB_PREFIX%msg_template` VALUES ('6','TPL_DEAL_NOTICE_SMS','{$notice.site_name}又有新借款啦!{$notice.deal_name},欢迎来投标{$notice.site_url}','0','0');
INSERT INTO `%DB_PREFIX%msg_template` VALUES ('7','TPL_MAIL_DEAL_FAILED','<p>尊敬的用户{$notice.user_name}：&nbsp; </p>\r\n<p>遗憾的通知您，您于{$notice.deal_publish_time}发布的借款“{$notice.deal_name}”流标，您的本次借款行为失败。&nbsp;</p><p>您借款失败的可能原因为：&nbsp; </p>\r\n<br>\r\n<br>\r\n1. 您没能按时提交四项必要信用认证的材料。\r\n<br>\r\n<br>\r\n2. 您在招标期间没有筹集到足够的借款。&nbsp;&nbsp; \r\n<p>如果您属于认证未通过流标，为了您能够成功贷款，请凑齐申请贷款所需要的材料。您可以点击<a href=\"{$notice.help_url}\" target=\"_blank\">需要提供哪些材料？</a>来了解更多所需材料的详情。进行更多的信用认证将有助您获得更高的贷款额度。</p>\r\n<p>如果您属于招标到期流标，为了您能够成功贷款，请适度提高贷款利率，将有助您更快的获得贷款。&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </p>\r\n<p>点击 <a href=\"{$notice.send_deal_url}\">这里</a>重新发布借款。&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </p>\r\n<p>感谢您对我们的支持与关注。&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </p>\r\n<p>{$notice.site_name}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </p>\r\n<p>注：此邮件由系统自动发送，请勿回复！&nbsp; </p>\r\n<p>如果您有任何疑问，请您查看 <a href=\"{$notice.help_url}\" target=\"_blank\">帮助</a>，或访问 <a href=\"{$notice.site_url}\" target=\"_blank\">客服中心</a></p>\r\n<p>如果您觉得收到过多邮件，可以点击 <a href=\"{$notice.msg_cof_setting_url}\" target=\"_blank\">这里</a>进行设置\r\n&nbsp; </p>','1','1');
INSERT INTO `%DB_PREFIX%msg_template` VALUES ('8','TPL_MAIL_LOAD_FAILED','<p>尊敬的用户{$notice.user_name}：&nbsp; </p>\r\n<p>遗憾的通知您，您于{$notice.deal_load_time}所投的借款“{$notice.deal_name}”流标，您的本次投标行为失败。&nbsp;</p><p>您所投的借款失败的可能原因为：&nbsp; </p>\r\n<br>\r\n<br>\r\n1. 借款者没能按时提交四项必要信用认证的材料。\r\n<br>\r\n<br>\r\n2. 借款者在招标期间没有筹集到足够的借款。&nbsp;&nbsp; \r\n\r\n<p>感谢您对我们的支持与关注。&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </p>\r\n<p>{$notice.site_name}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </p>\r\n<p>注：此邮件由系统自动发送，请勿回复！&nbsp; </p>\r\n<p>如果您有任何疑问，请您查看 <a href=\"{$notice.help_url}\" target=\"_blank\">帮助</a>，或访问 <a href=\"{$notice.site_url}\" target=\"_blank\">客服中心</a></p>\r\n<p>如果您觉得收到过多邮件，可以点击 <a href=\"{$notice.msg_cof_setting_url}\" target=\"_blank\">这里</a>进行设置\r\n&nbsp; </p>','1','1');
INSERT INTO `%DB_PREFIX%msg_template` VALUES ('9','TPL_DEAL_THREE_SMS','尊敬的{$notice.site_name}用户 {$notice.user_name} ，您本期贷款的还款日是{$notice.repay_time_d}日，还款金额{$notice.repay_money}元，请按时还款。','0','0');
INSERT INTO `%DB_PREFIX%msg_template` VALUES ('10','TPL_MAIL_DEAL_MSG','<p>尊敬的用户{$notice.user_name}：</p>\r\n<p>您好，用户{$notice.msg_user_name}对您发布的借款列表“{$notice.deal_name}”进行了以下留言：</p>\r\n<p>“{$notice.message}”</p>\r\n<p>请您登录{$notice.site_name}借款详情页面查看答复。</p>\r\n<p>点击 <a href=\"{$notice.deal_url}\" target=\"_blank\">这里</a>进行答复。</p>\r\n<p>感谢您对我们的支持与关注！</p>\r\n<p>{$notice.site_name}</p>\r\n<p>注：此邮件由系统自动发送，请勿回复！</p>\r\n<p>如果您有任何疑问，请您查看 <a href=\"{$notice.help_url}\" target=\"_blank\">帮助</a>，或访问 <a href=\"#\" target=\"_blank\">客服中心</a></p>','1','1');
INSERT INTO `%DB_PREFIX%msg_template` VALUES ('11','TPL_MAIL_DEAL_REPLY_MSG','<p>尊敬的用户{$notice.user_name}：</p>\r\n<p>您好，用户{$notice.msg_user_name}回复了您对借款列表“{$notice.deal_name}”的留言。具体回复如下：</p>\r\n<p>“{$notice.message}”</p>\r\n<p>点击 <a href=\"{$notice.deal_url}\" target=\"_blank\">这里</a>查看借款列表详情或进行投标。</p>\r\n<p>感谢您对我们的支持与关注！</p>\r\n<p>{$notice.site_name}</p>\r\n<p>注：此邮件由系统自动发送，请勿回复！</p>\r\n<p>如果您有任何疑问，请您查看 <a href=\"{$notice.help_url}\" target=\"_blank\">帮助</a>，或访问 <a href=\"#\" target=\"_blank\">客服中心</a></p>','1','1');
INSERT INTO `%DB_PREFIX%msg_template` VALUES ('12','TPL_DEAL_THREE_EMAIL','<p>尊敬的用户{$notice.user_name}：&nbsp; </p>\r\n<p>您的借款“<a href=\"{$notice.deal_url}\">{$notice.deal_name}</a>”本期还款日是{$notice.repay_time_d}日，还款金额{$notice.repay_money}元，请按时还款。【{$notice.site_name}】 </p>\r\n<p>点击 <a href=\"{$notice.repay_url}\">这里</a>进行还款。&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </p>\r\n<p>感谢您对我们的支持与关注。&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </p>\r\n<p>{$notice.site_name}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </p>\r\n<p>注：此邮件由系统自动发送，请勿回复！&nbsp; </p>\r\n<p>如果您有任何疑问，请您查看 <a href=\"{$notice.help_url}\" target=\"_blank\">帮助</a>，或访问 <a href=\"{$notice.site_url}\" target=\"_blank\">客服中心</a></p>\r\n<p>如果您觉得收到过多邮件，可以点击 <a href=\"{$notice.msg_cof_setting_url}\" target=\"_blank\">这里</a>进行设置rn&nbsp; </p>','1','1');
INSERT INTO `%DB_PREFIX%msg_template` VALUES ('13','TPL_DEAL_HALF_EMAIL','<p>尊敬的用户{$notice.user_name}：&nbsp; </p>\r\n<p>您的借款“<a href=\"{$notice.deal_url}\">{$notice.deal_name}</a>”招标完成度超过50%【{$notice.site_name}】 </p>\r\n<p>感谢您对我们的支持与关注。&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </p>\r\n<p>{$notice.site_name}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </p>\r\n<p>注：此邮件由系统自动发送，请勿回复！&nbsp; </p>\r\n<p>如果您有任何疑问，请您查看 <a href=\"{$notice.help_url}\" target=\"_blank\">帮助</a>，或访问 <a href=\"{$notice.site_url}\" target=\"_blank\">客服中心</a></p>\r\n<p>如果您觉得收到过多邮件，可以点击 <a href=\"{$notice.msg_cof_setting_url}\" target=\"_blank\">这里</a>进行设置\r\n&nbsp; </p>','1','1');
INSERT INTO `%DB_PREFIX%msg_template` VALUES ('14','TPL_DEAL_LOAD_REPAY_EMAIL','<p>尊敬的用户{$notice.user_name}：&nbsp; </p>\r\n<p>您好，您在{$notice.site_name}所投的的投标“<a href=\"{$notice.deal_url}\">{$notice.deal_name}</a>”成功还款{$notice.repay_money}元 </p>\r\n{if $notice.need_next_repay}\r\n<p>本笔投标的下个还款日为{$notice.next_repay_time}，需还本息{$notice.next_repay_money}元。</p>\r\n{else}\r\n<p>本次投标共获得收益:{$notice.all_repay_money}元,{if $notice.impose_money}其中违约金为:{$notice.impose_money}元,{/if}本次投标已回款完毕！</p>\r\n{/if}\r\n<p>感谢您对我们的支持与关注。&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </p>\r\n<p>{$notice.site_name}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </p>\r\n<p>注：此邮件由系统自动发送，请勿回复！&nbsp; </p>\r\n<p>如果您有任何疑问，请您查看 <a href=\"{$notice.help_url}\" target=\"_blank\">帮助</a>，或访问 <a href=\"{$notice.site_url}\" target=\"_blank\">客服中心</a></p>\r\n<p>如果您觉得收到过多邮件，可以点击 <a href=\"{$notice.msg_cof_setting_url}\" target=\"_blank\">这里</a>进行设置\r\n&nbsp; </p>','1','1');
INSERT INTO `%DB_PREFIX%msg_template` VALUES ('24','TPL_DEAL_LOAD_REPAY_SMS','尊敬的{$notice.site_name}用户{$notice.user_name}，您所投的标“{$notice.deal_name}”回款{$notice.repay_money}元，感谢您的关注和支持。','0','0');
INSERT INTO `%DB_PREFIX%msg_template` VALUES ('25','TPL_CARYY_SUCCESS_SMS','尊敬的{$notice.site_name}用户{$notice.user_name}，您的{$notice.carry_money}元提现已成功转入您的银行账户，请注意查收，感谢您的关注和支持。','0','0');
INSERT INTO `%DB_PREFIX%msg_template` VALUES ('26','TPL_MAIL_LOAD_SUCCESS','<p>尊敬的用户{$notice.user_name}：&nbsp; </p>\r\n<p>很高兴的通知您，您于{$notice.deal_load_time}所投的借款“{$notice.deal_name}”满标，您的本次投标行为成功。&nbsp;</p>\r\n<br>\r\n<br>\r\n<p>点击 <a href=\"{$notice.send_deal_url}\">这里</a>查看您所发布借款。&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </p>\r\n<p>感谢您对我们的支持与关注。&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </p>\r\n<p>{$notice.site_name}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </p>\r\n<p>注：此邮件由系统自动发送，请勿回复！&nbsp; </p>\r\n<p>如果您有任何疑问，请您查看 <a href=\"{$notice.help_url}\" target=\"_blank\">帮助</a>，或访问 <a href=\"{$notice.site_url}\" target=\"_blank\">客服中心</a></p>\r\n<p>如果您觉得收到过多邮件，可以点击 <a href=\"{$notice.msg_cof_setting_url}\" target=\"_blank\">这里</a>进行设置\r\n&nbsp; </p>','1','1');
INSERT INTO `%DB_PREFIX%msg_template` VALUES ('27','TPL_MAIL_TRANSFER_FAILED','<p>尊敬的用户{$notice.user_name}：&nbsp; </p>\r\n<p>很遗憾的通知您，您于{$notice.transfer_time}转让的债权，编号：“{$notice.transfer_id}”因为“{$notice.bad_msg}”自动撤销了。&nbsp;</p>\r\n<br>\r\n<br>\r\n<p>点击 <a href=\"{$notice.send_transfer_url}\">这里</a>查看您所发布的转让信息。&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </p>\r\n<p>感谢您对我们的支持与关注。&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </p>\r\n<p>{$notice.site_name}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </p>\r\n<p>注：此邮件由系统自动发送，请勿回复！&nbsp; </p>\r\n<p>如果您有任何疑问，请您查看 <a href=\"{$notice.help_url}\" target=\"_blank\">帮助</a>，或访问 <a href=\"{$notice.site_url}\" target=\"_blank\">客服中心</a></p>\r\n<p>如果您觉得收到过多邮件，可以点击 <a href=\"{$notice.msg_cof_setting_url}\" target=\"_blank\">这里</a>进行设置\r\n&nbsp; </p>','1','1');
INSERT INTO `%DB_PREFIX%msg_template` VALUES ('28','TPL_MAIL_TRANSFER_SUCCESS','<p>尊敬的用户{$notice.user_name}：&nbsp; </p>\r\n<p>很高兴的通知您，您于{$notice.transfer_time}转让的债权，编号：“{$notice.transfer_id}”已成功转让。&nbsp;</p>\r\n<br>\r\n<br>\r\n<p>点击 <a href=\"{$notice.send_deal_url}\">这里</a>查看您所发布的转让信息。&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </p>\r\n<p>感谢您对我们的支持与关注。&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </p>\r\n<p>{$notice.site_name}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </p>\r\n<p>注：此邮件由系统自动发送，请勿回复！&nbsp; </p>\r\n<p>如果您有任何疑问，请您查看 <a href=\"{$notice.help_url}\" target=\"_blank\">帮助</a>，或访问 <a href=\"{$notice.site_url}\" target=\"_blank\">客服中心</a></p>\r\n<p>如果您觉得收到过多邮件，可以点击 <a href=\"{$notice.msg_cof_setting_url}\" target=\"_blank\">这里</a>进行设置\r\n&nbsp; </p>','1','1');
INSERT INTO `%DB_PREFIX%msg_template` VALUES ('30','TPL_SMS_DEAL_FAILED','尊敬的用户{$notice.user_name}，遗憾的通知您，您于{$notice.deal_publish_time}发布的借款“{$notice.deal_name}”流标。','0','0');
INSERT INTO `%DB_PREFIX%msg_template` VALUES ('31','TPL_SMS_LOAD_FAILED','尊敬的用户{$notice.user_name}，遗憾的通知您，您于{$notice.deal_load_time}所投的借款“{$notice.deal_name}”流标。','0','0');
INSERT INTO `%DB_PREFIX%msg_template` VALUES ('32','TPL_MAIL_DEAL_SUCCESS','<p>尊敬的用户{$notice.user_name}：&nbsp; </p>\r\n<p>很高兴的通知您，您于{$notice.deal_publish_time}发布的借款“{$notice.deal_name}”满标，您的本次借款行为成功。&nbsp;</p>\r\n<br>\r\n<br>\r\n<p>点击 <a href=\"{$notice.send_deal_url}\">这里</a>查看您所发布借款。&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </p>\r\n<p>感谢您对我们的支持与关注。&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </p>\r\n<p>{$notice.site_name}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </p>\r\n<p>注：此邮件由系统自动发送，请勿回复！&nbsp; </p>\r\n<p>如果您有任何疑问，请您查看 <a href=\"{$notice.help_url}\" target=\"_blank\">帮助</a>，或访问 <a href=\"{$notice.site_url}\" target=\"_blank\">客服中心</a></p>\r\n<p>如果您觉得收到过多邮件，可以点击 <a href=\"{$notice.msg_cof_setting_url}\" target=\"_blank\">这里</a>进行设置\r\n&nbsp; </p>','1','1');
INSERT INTO `%DB_PREFIX%msg_template` VALUES ('33','TPL_SMS_DEAL_SUCCESS','尊敬的用户{$notice.user_name}，很高兴的通知您，您于{$notice.deal_publish_time}发布的借款“{$notice.deal_name}”满标。','0','0');
INSERT INTO `%DB_PREFIX%msg_template` VALUES ('34','TPL_SMS_LOAD_SUCCESS','尊敬的用户{$notice.user_name}，很高兴的通知您，您于{$notice.deal_load_time}所投的借款“{$notice.deal_name}”满标。','0','0');
INSERT INTO `%DB_PREFIX%msg_template` VALUES ('35','TPL_SMS_TRANSFER_FAILED','尊敬的用户{$notice.user_name}，很遗憾的通知您，您于{$notice.transfer_time}转让的债权编号：“{$notice.transfer_id}”撤销了。','0','0');
INSERT INTO `%DB_PREFIX%msg_template` VALUES ('36','TPL_SMS_TRANSFER_SUCCESS','尊敬的用户{$notice.user_name}，很高兴的通知您，您于{$notice.transfer_time}转让的债权，编号：“{$notice.transfer_id}”已成功转让。','0','0');
INSERT INTO `%DB_PREFIX%msg_template` VALUES ('37','TPL_SMS_DEAL_DELETE','尊敬的用户{$notice.user_name}，遗憾的通知您，您于{$notice.deal_publish_time}发布的借款“{$notice.deal_name}”因“{$notice.delete_msg}”审核失败了。','0','0');
DROP TABLE IF EXISTS `%DB_PREFIX%nav`;
CREATE TABLE `%DB_PREFIX%nav` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '菜单名称',
  `url` varchar(255) NOT NULL COMMENT '跳转的外链URL',
  `blank` tinyint(1) NOT NULL COMMENT '是否在新窗口打开',
  `sort` int(11) NOT NULL COMMENT '排序 大到小',
  `is_effect` tinyint(1) NOT NULL COMMENT '有效性标识',
  `u_module` varchar(255) NOT NULL COMMENT '指向的前台module',
  `u_action` varchar(255) NOT NULL COMMENT '指向的前台action',
  `u_id` int(11) NOT NULL COMMENT '弃用',
  `u_param` varchar(255) NOT NULL COMMENT 'url的参数，以原始的url传参方式填入 如：id=1&cid=2&pid=3',
  `is_shop` tinyint(1) NOT NULL COMMENT '菜单显示的频道 保留',
  `app_index` varchar(255) NOT NULL COMMENT '指向的前台app应用入口',
  `pid` int(11) NOT NULL COMMENT '父级ID',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COMMENT='前台导航菜单配置表';
INSERT INTO `%DB_PREFIX%nav` VALUES ('1','首页','','0','5','1','index','','0','','0','index','0');
INSERT INTO `%DB_PREFIX%nav` VALUES ('2','我要理财','','0','0','1','deals','index','0','','0','index','0');
INSERT INTO `%DB_PREFIX%nav` VALUES ('3','我要贷款','','0','0','1','borrow','','0','','0','index','0');
INSERT INTO `%DB_PREFIX%nav` VALUES ('4','我的p2p信贷','','0','0','1','uc_center','','0','','0','index','0');
INSERT INTO `%DB_PREFIX%nav` VALUES ('5','安全保障','','0','0','1','guarantee','index','0','','0','index','0');
INSERT INTO `%DB_PREFIX%nav` VALUES ('6','论坛','#','0','0','1','','','0','','0','store','0');
INSERT INTO `%DB_PREFIX%nav` VALUES ('7','平台原理','','0','0','1','aboutp2p','','0','','0','index','1');
INSERT INTO `%DB_PREFIX%nav` VALUES ('8','政策法规','','0','0','1','aboutlaws','','0','','0','index','1');
INSERT INTO `%DB_PREFIX%nav` VALUES ('9','费用','','0','0','1','aboutfee','','0','','0','index','1');
INSERT INTO `%DB_PREFIX%nav` VALUES ('10','关于我们','','0','0','1','article','','0','id=1','0','index','1');
INSERT INTO `%DB_PREFIX%nav` VALUES ('11','个人贷款','','0','5','1','deals','index','0','','0','index','2');
INSERT INTO `%DB_PREFIX%nav` VALUES ('12','工具箱','','0','3','1','tool','','0','','0','index','2');
INSERT INTO `%DB_PREFIX%nav` VALUES ('13','关于理财','','0','2','1','deals','about','0','','0','index','2');
INSERT INTO `%DB_PREFIX%nav` VALUES ('14','成为理财人','','0','1','1','belender','','0','','0','index','2');
INSERT INTO `%DB_PREFIX%nav` VALUES ('15','贷款说明','','0','0','1','borrow','aboutborrow','0','','0','index','3');
INSERT INTO `%DB_PREFIX%nav` VALUES ('16','信用认证','','0','0','1','borrow','creditswitch','0','','0','index','3');
INSERT INTO `%DB_PREFIX%nav` VALUES ('17','申请贷款','','0','0','1','borrow','index','0','','0','index','3');
INSERT INTO `%DB_PREFIX%nav` VALUES ('18','我的主页','','0','0','1','uc_center','','0','','0','index','4');
INSERT INTO `%DB_PREFIX%nav` VALUES ('19','贷款管理','','0','0','1','uc_deal','refund','0','','0','index','4');
INSERT INTO `%DB_PREFIX%nav` VALUES ('20','投标管理','','0','0','1','uc_invest','','0','','0','index','4');
INSERT INTO `%DB_PREFIX%nav` VALUES ('21','个人设置','','0','0','1','uc_account','','0','','0','index','4');
INSERT INTO `%DB_PREFIX%nav` VALUES ('22','本金保障','','0','0','1','guarantee','detail','0','id=8','0','index','5');
INSERT INTO `%DB_PREFIX%nav` VALUES ('23','交易安全保障','','0','0','1','guarantee','detail','0','id=9','0','index','5');
INSERT INTO `%DB_PREFIX%nav` VALUES ('24','贷款审核与保障','','0','0','1','guarantee','detail','0','id=10','0','index','5');
INSERT INTO `%DB_PREFIX%nav` VALUES ('25','网上理财安全建议','','0','0','1','guarantee','detail','0','id=11','0','index','5');
INSERT INTO `%DB_PREFIX%nav` VALUES ('26','债权转让','','0','4','1','transfer','index','0','','0','index','2');
DROP TABLE IF EXISTS `%DB_PREFIX%payment`;
CREATE TABLE `%DB_PREFIX%payment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `class_name` varchar(255) NOT NULL COMMENT '支付接口类名',
  `is_effect` tinyint(1) NOT NULL COMMENT '有效性标识',
  `online_pay` tinyint(1) NOT NULL COMMENT '是否为在线支付的接口',
  `fee_amount` decimal(20,2) NOT NULL COMMENT '手续费用的计费值',
  `name` varchar(255) NOT NULL COMMENT '接口名称',
  `description` text NOT NULL COMMENT '描述',
  `total_amount` decimal(20,2) NOT NULL COMMENT '总操作金额',
  `config` text NOT NULL COMMENT '序列号后的配置信息',
  `logo` varchar(255) NOT NULL COMMENT '显示的图标',
  `sort` int(11) NOT NULL,
  `fee_type` tinyint(1) NOT NULL COMMENT '手续费的计费标准 0:定额 1:支付总额的比率',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
INSERT INTO `%DB_PREFIX%payment` VALUES ('1','Account','1','1','0.00','余额支付','','0.00','N;','','1','0');
INSERT INTO `%DB_PREFIX%payment` VALUES ('2','Voucher','1','1','0.00','代金券支付','','0.00','N;','','4','0');
INSERT INTO `%DB_PREFIX%payment` VALUES ('3','AlipayBank','1','1','0.00','支付宝银行直连支付','','0.00','a:3:{s:14:\"alipay_partner\";s:0:\"\";s:14:\"alipay_account\";s:0:\"\";s:10:\"alipay_key\";s:0:\"\";}','','5','0');
DROP TABLE IF EXISTS `%DB_PREFIX%payment_notice`;
CREATE TABLE `%DB_PREFIX%payment_notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `notice_sn` varchar(255) NOT NULL COMMENT '支付单号',
  `create_time` int(11) NOT NULL COMMENT '下单时间',
  `pay_time` int(11) NOT NULL COMMENT '付款时间',
  `order_id` int(11) NOT NULL COMMENT '关联的订单号ID',
  `is_paid` tinyint(1) NOT NULL COMMENT '是否已支付',
  `user_id` int(11) NOT NULL COMMENT '会员ID',
  `payment_id` int(11) NOT NULL COMMENT '支付接口ID',
  `memo` text NOT NULL COMMENT '付款单备注',
  `money` decimal(20,2) NOT NULL COMMENT '应付金额',
  `outer_notice_sn` varchar(255) NOT NULL COMMENT '第三方支付平台的对帐号',
  PRIMARY KEY (`id`),
  UNIQUE KEY `notice_sn_unk` (`notice_sn`)
) ENGINE=MyISAM AUTO_INCREMENT=129 DEFAULT CHARSET=utf8;
DROP TABLE IF EXISTS `%DB_PREFIX%point_group`;
CREATE TABLE `%DB_PREFIX%point_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '分组名称',
  `sort` int(11) NOT NULL COMMENT '排序 大到小',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
INSERT INTO `%DB_PREFIX%point_group` VALUES ('1','卫生','100');
INSERT INTO `%DB_PREFIX%point_group` VALUES ('2','服务','100');
DROP TABLE IF EXISTS `%DB_PREFIX%point_group_link`;
CREATE TABLE `%DB_PREFIX%point_group_link` (
  `point_group_id` int(11) NOT NULL COMMENT '商户子类点评评分分组ID fanwe_merchant_type_point_group',
  `category_id` int(11) NOT NULL,
  KEY `group_id` (`point_group_id`) USING BTREE,
  KEY `type_id` (`category_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
INSERT INTO `%DB_PREFIX%point_group_link` VALUES ('2','12');
INSERT INTO `%DB_PREFIX%point_group_link` VALUES ('2','11');
INSERT INTO `%DB_PREFIX%point_group_link` VALUES ('1','10');
INSERT INTO `%DB_PREFIX%point_group_link` VALUES ('2','10');
INSERT INTO `%DB_PREFIX%point_group_link` VALUES ('2','9');
INSERT INTO `%DB_PREFIX%point_group_link` VALUES ('1','8');
INSERT INTO `%DB_PREFIX%point_group_link` VALUES ('2','8');
INSERT INTO `%DB_PREFIX%point_group_link` VALUES ('1','14');
INSERT INTO `%DB_PREFIX%point_group_link` VALUES ('2','14');
INSERT INTO `%DB_PREFIX%point_group_link` VALUES ('1','15');
INSERT INTO `%DB_PREFIX%point_group_link` VALUES ('1','16');
INSERT INTO `%DB_PREFIX%point_group_link` VALUES ('2','16');
INSERT INTO `%DB_PREFIX%point_group_link` VALUES ('1','17');
INSERT INTO `%DB_PREFIX%point_group_link` VALUES ('2','17');
DROP TABLE IF EXISTS `%DB_PREFIX%promote_msg`;
CREATE TABLE `%DB_PREFIX%promote_msg` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) NOT NULL COMMENT '群发推广信息类型(0:短信 1:邮件)',
  `title` varchar(255) NOT NULL COMMENT '群发信息（邮件标题）',
  `content` text NOT NULL COMMENT '群发的内容',
  `send_time` int(11) NOT NULL COMMENT '设置的自动发送的时间',
  `send_status` tinyint(1) NOT NULL COMMENT '发送状态 0:未发送 1:发送中 2:已发送',
  `deal_id` int(11) NOT NULL COMMENT '针对某个借款发送的推广信息',
  `send_type` tinyint(1) NOT NULL COMMENT '发送方式（0:按会员组 1:按订阅地区发送 2:自定义发送，即指定邮箱、手机发送）',
  `send_type_id` int(11) NOT NULL COMMENT '发送类型为按会员组时：会员组ID，发送类型为按地区时：城市ID',
  `send_define_data` text NOT NULL COMMENT '自定义发送时存放指定的邮箱地址、手机号，用半角逗号分隔',
  `is_html` tinyint(1) NOT NULL COMMENT '群发为邮件时的邮件类型，是否为超文本邮件',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
DROP TABLE IF EXISTS `%DB_PREFIX%promote_msg_list`;
CREATE TABLE `%DB_PREFIX%promote_msg_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dest` varchar(255) NOT NULL COMMENT '发送的目标(邮件地址/手机号)',
  `send_type` tinyint(1) NOT NULL COMMENT '发送类型 0:短信 1:邮件',
  `content` text NOT NULL COMMENT '信息内容',
  `title` varchar(255) NOT NULL COMMENT '邮件的标题',
  `send_time` int(11) NOT NULL COMMENT '发送的时间',
  `is_send` tinyint(1) NOT NULL COMMENT '是否已发送 0:否 1:等待队列发送',
  `create_time` int(11) NOT NULL COMMENT '生成的时间',
  `user_id` int(11) NOT NULL COMMENT '会员ID',
  `result` text NOT NULL COMMENT '发送结果（如出错存放服务器或接口返回的错误信息）',
  `is_success` tinyint(1) NOT NULL COMMENT '是否发送成功',
  `is_html` tinyint(1) NOT NULL COMMENT '只针对邮件使用，是否为超文本邮件 0:否 1:是',
  `msg_id` int(11) NOT NULL COMMENT '群发信息的原消息ID promote_msg表的数据ID',
  PRIMARY KEY (`id`),
  KEY `dest_idx` (`dest`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
DROP TABLE IF EXISTS `%DB_PREFIX%referrals`;
CREATE TABLE `%DB_PREFIX%referrals` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT ' 被邀请人ID，即返利生成的用户ID',
  `rel_user_id` int(11) NOT NULL COMMENT '邀请人ID（即需要返利的会员ID）',
  `money` decimal(20,2) NOT NULL COMMENT '返利的现金',
  `create_time` int(11) NOT NULL COMMENT '返利生成的时间',
  `repay_time` int(11) NOT NULL COMMENT '返利时间',
  `pay_time` int(11) NOT NULL COMMENT '返利发放的时间',
  `deal_id` int(11) NOT NULL COMMENT '关联的借款id',
  `load_id` int(11) NOT NULL COMMENT '关联的投标id',
  `l_key` int(11) NOT NULL COMMENT '关联的投标第几期还款',
  `score` int(11) NOT NULL COMMENT '返利的积分',
  `point` int(11) NOT NULL COMMENT '返利的信用',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='邀请返利记录表';
DROP TABLE IF EXISTS `%DB_PREFIX%region_conf`;
CREATE TABLE `%DB_PREFIX%region_conf` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL COMMENT '父级地区ID',
  `name` varchar(50) NOT NULL COMMENT '地区名称',
  `region_level` tinyint(4) NOT NULL COMMENT '1:国 2:省 3:市(县) 4:区(镇)',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3402 DEFAULT CHARSET=utf8;
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3','1','安徽','2');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('4','1','福建','2');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('5','1','甘肃','2');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('6','1','广东','2');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('7','1','广西','2');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('8','1','贵州','2');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('9','1','海南','2');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('10','1','河北','2');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('11','1','河南','2');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('12','1','黑龙江','2');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('13','1','湖北','2');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('14','1','湖南','2');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('15','1','吉林','2');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('16','1','江苏','2');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('17','1','江西','2');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('18','1','辽宁','2');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('19','1','内蒙古','2');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('20','1','宁夏','2');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('21','1','青海','2');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('22','1','山东','2');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('23','1','山西','2');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('24','1','陕西','2');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('26','1','四川','2');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('28','1','西藏','2');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('29','1','新疆','2');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('30','1','云南','2');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('31','1','浙江','2');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('36','3','安庆','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('37','3','蚌埠','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('38','3','巢湖','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('39','3','池州','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('40','3','滁州','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('41','3','阜阳','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('42','3','淮北','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('43','3','淮南','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('44','3','黄山','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('45','3','六安','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('46','3','马鞍山','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('47','3','宿州','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('48','3','铜陵','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('49','3','芜湖','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('50','3','宣城','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('51','3','亳州','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('52','2','北京','2');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('53','4','福州','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('54','4','龙岩','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('55','4','南平','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('56','4','宁德','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('57','4','莆田','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('58','4','泉州','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('59','4','三明','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('60','4','厦门','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('61','4','漳州','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('62','5','兰州','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('63','5','白银','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('64','5','定西','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('65','5','甘南','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('66','5','嘉峪关','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('67','5','金昌','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('68','5','酒泉','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('69','5','临夏','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('70','5','陇南','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('71','5','平凉','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('72','5','庆阳','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('73','5','天水','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('74','5','武威','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('75','5','张掖','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('76','6','广州','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('77','6','深圳','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('78','6','潮州','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('79','6','东莞','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('80','6','佛山','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('81','6','河源','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('82','6','惠州','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('83','6','江门','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('84','6','揭阳','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('85','6','茂名','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('86','6','梅州','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('87','6','清远','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('88','6','汕头','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('89','6','汕尾','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('90','6','韶关','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('91','6','阳江','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('92','6','云浮','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('93','6','湛江','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('94','6','肇庆','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('95','6','中山','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('96','6','珠海','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('97','7','南宁','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('98','7','桂林','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('99','7','百色','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('100','7','北海','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('101','7','崇左','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('102','7','防城港','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('103','7','贵港','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('104','7','河池','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('105','7','贺州','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('106','7','来宾','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('107','7','柳州','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('108','7','钦州','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('109','7','梧州','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('110','7','玉林','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('111','8','贵阳','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('112','8','安顺','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('113','8','毕节','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('114','8','六盘水','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('115','8','黔东南','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('116','8','黔南','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('117','8','黔西南','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('118','8','铜仁','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('119','8','遵义','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('120','9','海口','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('121','9','三亚','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('122','9','白沙','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('123','9','保亭','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('124','9','昌江','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('125','9','澄迈县','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('126','9','定安县','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('127','9','东方','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('128','9','乐东','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('129','9','临高县','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('130','9','陵水','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('131','9','琼海','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('132','9','琼中','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('133','9','屯昌县','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('134','9','万宁','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('135','9','文昌','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('136','9','五指山','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('137','9','儋州','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('138','10','石家庄','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('139','10','保定','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('140','10','沧州','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('141','10','承德','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('142','10','邯郸','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('143','10','衡水','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('144','10','廊坊','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('145','10','秦皇岛','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('146','10','唐山','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('147','10','邢台','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('148','10','张家口','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('149','11','郑州','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('150','11','洛阳','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('151','11','开封','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('152','11','安阳','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('153','11','鹤壁','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('154','11','济源','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('155','11','焦作','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('156','11','南阳','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('157','11','平顶山','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('158','11','三门峡','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('159','11','商丘','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('160','11','新乡','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('161','11','信阳','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('162','11','许昌','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('163','11','周口','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('164','11','驻马店','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('165','11','漯河','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('166','11','濮阳','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('167','12','哈尔滨','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('168','12','大庆','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('169','12','大兴安岭','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('170','12','鹤岗','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('171','12','黑河','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('172','12','鸡西','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('173','12','佳木斯','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('174','12','牡丹江','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('175','12','七台河','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('176','12','齐齐哈尔','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('177','12','双鸭山','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('178','12','绥化','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('179','12','伊春','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('180','13','武汉','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('181','13','仙桃','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('182','13','鄂州','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('183','13','黄冈','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('184','13','黄石','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('185','13','荆门','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('186','13','荆州','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('187','13','潜江','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('188','13','神农架林区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('189','13','十堰','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('190','13','随州','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('191','13','天门','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('192','13','咸宁','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('193','13','襄樊','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('194','13','孝感','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('195','13','宜昌','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('196','13','恩施','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('197','14','长沙','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('198','14','张家界','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('199','14','常德','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('200','14','郴州','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('201','14','衡阳','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('202','14','怀化','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('203','14','娄底','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('204','14','邵阳','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('205','14','湘潭','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('206','14','湘西','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('207','14','益阳','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('208','14','永州','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('209','14','岳阳','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('210','14','株洲','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('211','15','长春','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('212','15','吉林','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('213','15','白城','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('214','15','白山','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('215','15','辽源','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('216','15','四平','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('217','15','松原','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('218','15','通化','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('219','15','延边','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('220','16','南京','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('221','16','苏州','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('222','16','无锡','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('223','16','常州','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('224','16','淮安','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('225','16','连云港','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('226','16','南通','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('227','16','宿迁','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('228','16','泰州','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('229','16','徐州','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('230','16','盐城','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('231','16','扬州','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('232','16','镇江','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('233','17','南昌','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('234','17','抚州','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('235','17','赣州','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('236','17','吉安','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('237','17','景德镇','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('238','17','九江','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('239','17','萍乡','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('240','17','上饶','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('241','17','新余','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('242','17','宜春','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('243','17','鹰潭','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('244','18','沈阳','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('245','18','大连','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('246','18','鞍山','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('247','18','本溪','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('248','18','朝阳','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('249','18','丹东','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('250','18','抚顺','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('251','18','阜新','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('252','18','葫芦岛','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('253','18','锦州','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('254','18','辽阳','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('255','18','盘锦','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('256','18','铁岭','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('257','18','营口','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('258','19','呼和浩特','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('259','19','阿拉善盟','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('260','19','巴彦淖尔盟','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('261','19','包头','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('262','19','赤峰','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('263','19','鄂尔多斯','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('264','19','呼伦贝尔','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('265','19','通辽','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('266','19','乌海','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('267','19','乌兰察布市','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('268','19','锡林郭勒盟','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('269','19','兴安盟','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('270','20','银川','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('271','20','固原','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('272','20','石嘴山','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('273','20','吴忠','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('274','20','中卫','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('275','21','西宁','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('276','21','果洛','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('277','21','海北','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('278','21','海东','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('279','21','海南','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('280','21','海西','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('281','21','黄南','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('282','21','玉树','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('283','22','济南','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('284','22','青岛','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('285','22','滨州','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('286','22','德州','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('287','22','东营','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('288','22','菏泽','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('289','22','济宁','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('290','22','莱芜','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('291','22','聊城','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('292','22','临沂','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('293','22','日照','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('294','22','泰安','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('295','22','威海','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('296','22','潍坊','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('297','22','烟台','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('298','22','枣庄','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('299','22','淄博','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('300','23','太原','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('301','23','长治','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('302','23','大同','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('303','23','晋城','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('304','23','晋中','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('305','23','临汾','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('306','23','吕梁','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('307','23','朔州','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('308','23','忻州','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('309','23','阳泉','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('310','23','运城','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('311','24','西安','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('312','24','安康','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('313','24','宝鸡','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('314','24','汉中','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('315','24','商洛','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('316','24','铜川','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('317','24','渭南','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('318','24','咸阳','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('319','24','延安','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('320','24','榆林','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('321','25','上海','2');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('322','26','成都','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('323','26','绵阳','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('324','26','阿坝','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('325','26','巴中','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('326','26','达州','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('327','26','德阳','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('328','26','甘孜','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('329','26','广安','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('330','26','广元','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('331','26','乐山','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('332','26','凉山','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('333','26','眉山','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('334','26','南充','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('335','26','内江','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('336','26','攀枝花','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('337','26','遂宁','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('338','26','雅安','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('339','26','宜宾','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('340','26','资阳','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('341','26','自贡','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('342','26','泸州','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('343','27','天津','2');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('344','28','拉萨','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('345','28','阿里','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('346','28','昌都','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('347','28','林芝','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('348','28','那曲','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('349','28','日喀则','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('350','28','山南','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('351','29','乌鲁木齐','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('352','29','阿克苏','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('353','29','阿拉尔','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('354','29','巴音郭楞','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('355','29','博尔塔拉','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('356','29','昌吉','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('357','29','哈密','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('358','29','和田','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('359','29','喀什','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('360','29','克拉玛依','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('361','29','克孜勒苏','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('362','29','石河子','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('363','29','图木舒克','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('364','29','吐鲁番','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('365','29','五家渠','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('366','29','伊犁','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('367','30','昆明','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('368','30','怒江','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('369','30','普洱','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('370','30','丽江','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('371','30','保山','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('372','30','楚雄','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('373','30','大理','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('374','30','德宏','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('375','30','迪庆','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('376','30','红河','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('377','30','临沧','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('378','30','曲靖','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('379','30','文山','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('380','30','西双版纳','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('381','30','玉溪','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('382','30','昭通','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('383','31','杭州','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('384','31','湖州','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('385','31','嘉兴','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('386','31','金华','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('387','31','丽水','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('388','31','宁波','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('389','31','绍兴','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('390','31','台州','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('391','31','温州','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('392','31','舟山','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('393','31','衢州','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('394','32','重庆','2');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('395','33','香港','2');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('396','34','澳门','2');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('397','35','台湾','2');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('500','52','东城区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('501','52','西城区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('502','52','海淀区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('503','52','朝阳区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('504','52','崇文区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('505','52','宣武区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('506','52','丰台区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('507','52','石景山区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('508','52','房山区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('509','52','门头沟区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('510','52','通州区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('511','52','顺义区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('512','52','昌平区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('513','52','怀柔区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('514','52','平谷区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('515','52','大兴区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('516','52','密云县','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('517','52','延庆县','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('2703','321','长宁区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('2704','321','闸北区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('2705','321','闵行区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('2706','321','徐汇区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('2707','321','浦东新区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('2708','321','杨浦区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('2709','321','普陀区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('2710','321','静安区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('2711','321','卢湾区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('2712','321','虹口区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('2713','321','黄浦区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('2714','321','南汇区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('2715','321','松江区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('2716','321','嘉定区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('2717','321','宝山区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('2718','321','青浦区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('2719','321','金山区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('2720','321','奉贤区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('2721','321','崇明县','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('2912','343','和平区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('2913','343','河西区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('2914','343','南开区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('2915','343','河北区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('2916','343','河东区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('2917','343','红桥区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('2918','343','东丽区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('2919','343','津南区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('2920','343','西青区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('2921','343','北辰区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('2922','343','塘沽区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('2923','343','汉沽区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('2924','343','大港区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('2925','343','武清区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('2926','343','宝坻区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('2927','343','经济开发区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('2928','343','宁河县','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('2929','343','静海县','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('2930','343','蓟县','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3325','394','合川区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3326','394','江津区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3327','394','南川区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3328','394','永川区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3329','394','南岸区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3330','394','渝北区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3331','394','万盛区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3332','394','大渡口区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3333','394','万州区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3334','394','北碚区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3335','394','沙坪坝区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3336','394','巴南区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3337','394','涪陵区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3338','394','江北区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3339','394','九龙坡区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3340','394','渝中区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3341','394','黔江开发区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3342','394','长寿区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3343','394','双桥区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3344','394','綦江县','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3345','394','潼南县','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3346','394','铜梁县','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3347','394','大足县','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3348','394','荣昌县','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3349','394','璧山县','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3350','394','垫江县','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3351','394','武隆县','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3352','394','丰都县','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3353','394','城口县','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3354','394','梁平县','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3355','394','开县','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3356','394','巫溪县','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3357','394','巫山县','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3358','394','奉节县','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3359','394','云阳县','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3360','394','忠县','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3361','394','石柱','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3362','394','彭水','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3363','394','酉阳','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3364','394','秀山','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3365','395','沙田区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3366','395','东区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3367','395','观塘区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3368','395','黄大仙区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3369','395','九龙城区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3370','395','屯门区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3371','395','葵青区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3372','395','元朗区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3373','395','深水埗区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3374','395','西贡区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3375','395','大埔区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3376','395','湾仔区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3377','395','油尖旺区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3378','395','北区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3379','395','南区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3380','395','荃湾区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3381','395','中西区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3382','395','离岛区','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3383','396','澳门','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3384','397','台北','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3385','397','高雄','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3386','397','基隆','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3387','397','台中','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3388','397','台南','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3389','397','新竹','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3390','397','嘉义','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3391','397','宜兰县','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3392','397','桃园县','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3393','397','苗栗县','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3394','397','彰化县','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3395','397','南投县','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3396','397','云林县','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3397','397','屏东县','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3398','397','台东县','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3399','397','花莲县','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3400','397','澎湖县','3');
INSERT INTO `%DB_PREFIX%region_conf` VALUES ('3401','3','合肥','3');
