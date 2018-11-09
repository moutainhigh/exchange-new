SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS  `account`;
CREATE TABLE `account` (
  `id` bigint(18) NOT NULL AUTO_INCREMENT COMMENT '����',
  `user_id` bigint(18) NOT NULL COMMENT '�û�id',
  `coin_id` bigint(18) NOT NULL COMMENT '����id',
  `status` tinyint(1) NOT NULL COMMENT '�˺�״̬��1��������2�����᣻',
  `balance_amount` decimal(40,20) NOT NULL COMMENT '���ֿ��ý��',
  `freeze_amount` decimal(40,20) NOT NULL COMMENT '���ֶ�����',
  `recharge_amount` decimal(40,20) NOT NULL COMMENT '�ۼƳ�ֵ���',
  `withdrawals_amount` decimal(40,20) NOT NULL COMMENT '�ۼ����ֽ��',
  `net_value` decimal(40,20) DEFAULT '0.00000000000000000000' COMMENT '��ֵ',
  `lock_margin` decimal(40,20) DEFAULT '0.00000000000000000000' COMMENT 'ռ�ñ�֤��',
  `float_profit` decimal(40,20) DEFAULT '0.00000000000000000000' COMMENT '�ֲ�ӯ��/����ӯ��',
  `total_profit` decimal(40,20) DEFAULT '0.00000000000000000000' COMMENT '��ӯ��',
  `rec_addr` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '��ֵ��ַ',
  `version` bigint(18) NOT NULL COMMENT '�汾��',
  `last_update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '����ʱ��',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '����ʱ��',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `userid_coinid_unique` (`user_id`,`coin_id`) USING BTREE,
  KEY `account_coin_id_ref` (`coin_id`) USING BTREE,
  KEY `inx_platform_account` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1060511024224378887 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='�ʽ��˻�';

DROP TABLE IF EXISTS  `account_detail`;
CREATE TABLE `account_detail` (
  `id` bigint(18) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(18) NOT NULL COMMENT '�û�id',
  `coin_id` bigint(18) NOT NULL COMMENT '����id',
  `account_id` bigint(18) NOT NULL COMMENT '�˻�id',
  `ref_account_id` bigint(18) NOT NULL COMMENT '���������˻�ID',
  `order_id` bigint(18) NOT NULL DEFAULT '0' COMMENT '����ID',
  `direction` tinyint(4) NOT NULL COMMENT '�ʽ�������Ϊ-1������Ϊ-2',
  `business_type` varchar(100) NOT NULL COMMENT 'ҵ������',
  `amount` decimal(40,20) NOT NULL COMMENT '����/���',
  `fee` decimal(40,20) DEFAULT '0.00000000000000000000' COMMENT '������',
  `remark` varchar(255) NOT NULL COMMENT '��ע',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'ʱ��',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `payment_detail_accountid_fk` (`account_id`) USING BTREE,
  KEY `payment_detail_userid_fk` (`user_id`) USING BTREE,
  KEY `payment_detail_refaccountid_fk` (`ref_account_id`) USING BTREE,
  KEY `fk_accountdetail_coinid` (`coin_id`) USING BTREE,
  KEY `payment_detail_created_fk` (`created`),
  KEY `idx_business_type` (`business_type`) USING BTREE,
  KEY `account_detail_remark` (`remark`(191))
) ENGINE=InnoDB AUTO_INCREMENT=1060730588447035394 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='�ʽ��˻���ˮ';

DROP TABLE IF EXISTS  `admin_bank`;
CREATE TABLE `admin_bank` (
  `id` bigint(18) NOT NULL AUTO_INCREMENT COMMENT '����',
  `name` varchar(64) DEFAULT NULL COMMENT '����������',
  `bank_name` varchar(256) DEFAULT NULL COMMENT '����������',
  `bank_card` varchar(32) DEFAULT NULL COMMENT '����',
  `coin_id` bigint(18) DEFAULT NULL COMMENT '��ֵת��������ID',
  `coin_name` varchar(16) DEFAULT NULL COMMENT '��������',
  `status` tinyint(4) DEFAULT NULL COMMENT '״̬��0-��Ч��1-��Ч��',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1058273451270029315 DEFAULT CHARSET=utf8mb4 COMMENT='����ҳ�ֵ���Ź���';

DROP TABLE IF EXISTS  `asset_snapshot`;
CREATE TABLE `asset_snapshot` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '����',
  `user_id` bigint(20) NOT NULL COMMENT '�û�ID',
  `balance` decimal(40,20) NOT NULL COMMENT '�˻����ʲ�',
  `snap_time` varchar(50) NOT NULL DEFAULT '' COMMENT '����ʱ��',
  `date` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '��������',
  `created` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '��������',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1060562640749506569 DEFAULT CHARSET=utf8mb4 COMMENT='�ʲ�����';

DROP TABLE IF EXISTS  `asset_snapshot_detail`;
CREATE TABLE `asset_snapshot_detail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '����',
  `user_id` bigint(20) NOT NULL COMMENT '�û�ID',
  `coin_id` bigint(20) NOT NULL COMMENT '����id',
  `balance_amount` decimal(40,20) NOT NULL COMMENT '�������',
  `freeze_amount` decimal(40,20) NOT NULL COMMENT '�������',
  `balance` decimal(40,20) NOT NULL COMMENT '��Ӧusdt�ļ۸�',
  `price` decimal(40,20) DEFAULT NULL COMMENT '�ּ�',
  `snap_time` varchar(50) NOT NULL DEFAULT '' COMMENT '����ʱ��',
  `date` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '��������',
  `created` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '��������',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1060562626480484380 DEFAULT CHARSET=utf8mb4 COMMENT='�ʲ���������';

DROP TABLE IF EXISTS  `cash_recharge`;
CREATE TABLE `cash_recharge` (
  `id` bigint(18) unsigned NOT NULL AUTO_INCREMENT COMMENT '����',
  `user_id` bigint(18) unsigned NOT NULL COMMENT '�û�ID',
  `coin_id` bigint(18) NOT NULL COMMENT '����ID',
  `coin_name` varchar(255) NOT NULL COMMENT '��������',
  `num` decimal(20,2) unsigned NOT NULL COMMENT '��������ֵ��',
  `fee` decimal(20,2) unsigned NOT NULL COMMENT '������',
  `feecoin` varchar(255) DEFAULT NULL COMMENT '�����ѱ���',
  `mum` decimal(20,2) unsigned NOT NULL COMMENT '�ɽ��������˽�',
  `type` varchar(255) NOT NULL COMMENT '���ͣ�alipay��֧������cai1pay�����׸���bank��������',
  `tradeno` varchar(255) NOT NULL COMMENT '��ֵ������',
  `outtradeno` varchar(255) DEFAULT NULL COMMENT '������������',
  `remark` varchar(8) DEFAULT NULL COMMENT '��ֵ��ע��ע',
  `audit_remark` varchar(128) DEFAULT NULL COMMENT '��˱�ע',
  `step` tinyint(4) DEFAULT NULL COMMENT '��ǰ��˼���',
  `status` tinyint(4) NOT NULL COMMENT '״̬��0-����ˣ�1-���ͨ����2-�ܾ���3-��ֵ�ɹ���',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '����ʱ��',
  `last_update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '����ʱ��',
  `name` varchar(100) DEFAULT NULL COMMENT '���п��˻���',
  `bank_name` varchar(100) DEFAULT NULL COMMENT '������',
  `bank_card` varchar(100) DEFAULT NULL COMMENT '���п���',
  `last_time` datetime DEFAULT NULL COMMENT '���ȷ�ϵ���ʱ�䡣',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `userid` (`user_id`) USING BTREE,
  KEY `status` (`status`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1060032624783237123 DEFAULT CHARSET=utf8mb4 COMMENT='���ҳ�ֵ��¼';

DROP TABLE IF EXISTS  `cash_recharge_audit_record`;
CREATE TABLE `cash_recharge_audit_record` (
  `id` bigint(18) NOT NULL AUTO_INCREMENT COMMENT '����',
  `order_id` bigint(18) DEFAULT NULL COMMENT '��ֵ������',
  `status` tinyint(4) DEFAULT NULL COMMENT '״̬',
  `remark` text COMMENT '��˱�ע',
  `step` tinyint(4) DEFAULT NULL COMMENT '��ǰ��˼���',
  `audit_user_id` bigint(18) DEFAULT NULL COMMENT '�����ID',
  `audit_user_name` varchar(128) DEFAULT NULL COMMENT '�����',
  `created` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '����ʱ��',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1060040806912294915 DEFAULT CHARSET=utf8mb4 COMMENT='���ҳ�ֵ��˼�¼';

DROP TABLE IF EXISTS  `cash_withdraw_audit_record`;
CREATE TABLE `cash_withdraw_audit_record` (
  `id` bigint(18) NOT NULL AUTO_INCREMENT COMMENT '����',
  `order_id` bigint(18) DEFAULT NULL COMMENT '��Ҷ�����',
  `status` tinyint(4) DEFAULT NULL COMMENT '״̬',
  `remark` text COMMENT '��˱�ע',
  `step` tinyint(4) DEFAULT NULL COMMENT '��ǰ��˼���',
  `audit_user_id` bigint(18) DEFAULT NULL COMMENT '�����ID',
  `audit_user_name` varchar(128) DEFAULT NULL COMMENT '�����',
  `created` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '����ʱ��',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1058272453285724162 DEFAULT CHARSET=utf8mb4 COMMENT='����������˼�¼';

DROP TABLE IF EXISTS  `cash_withdrawals`;
CREATE TABLE `cash_withdrawals` (
  `id` bigint(18) NOT NULL AUTO_INCREMENT COMMENT '����',
  `user_id` bigint(18) NOT NULL COMMENT '�û�ID',
  `coin_id` bigint(18) NOT NULL COMMENT '����ID',
  `account_id` bigint(18) NOT NULL COMMENT '�ʽ��˻�ID',
  `num` decimal(20,2) NOT NULL COMMENT '���������ֽ�',
  `fee` decimal(20,2) NOT NULL COMMENT '������',
  `mum` decimal(20,2) NOT NULL COMMENT '���˽��',
  `truename` varchar(255) NOT NULL COMMENT '������',
  `bank` varchar(255) NOT NULL COMMENT '��������',
  `bank_prov` varchar(255) DEFAULT NULL COMMENT '��������ʡ',
  `bank_city` varchar(255) DEFAULT NULL COMMENT '����������',
  `bank_addr` varchar(255) DEFAULT NULL COMMENT '������',
  `bank_card` varchar(255) NOT NULL COMMENT '�����˺�',
  `remark` varchar(255) DEFAULT NULL COMMENT '��ע',
  `step` tinyint(4) DEFAULT NULL COMMENT '��ǰ��˼���',
  `status` tinyint(4) NOT NULL COMMENT '״̬��0-����ˣ�1-���ͨ����2-�ܾ���3-���ֳɹ���',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '����ʱ��',
  `last_update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '����ʱ��',
  `last_time` datetime DEFAULT NULL COMMENT '���ȷ�����ֵ���ʱ��',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `userid` (`user_id`) USING BTREE,
  KEY `status` (`status`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1058247628238036995 DEFAULT CHARSET=utf8mb4 COMMENT='�������ּ�¼';

DROP TABLE IF EXISTS  `coin`;
CREATE TABLE `coin` (
  `id` bigint(18) NOT NULL AUTO_INCREMENT COMMENT '����ID',
  `name` varchar(100) NOT NULL COMMENT '��������',
  `title` varchar(100) NOT NULL COMMENT '���ֱ���',
  `img` varchar(255) NOT NULL COMMENT '����logo',
  `type` varchar(50) NOT NULL COMMENT '��������',
  `wallet` varchar(50) NOT NULL COMMENT '���rgb���Ϲ��ң�qbb��Ǯ����',
  `round` tinyint(4) NOT NULL COMMENT 'С��λ��',
  `base_amount` decimal(20,8) DEFAULT NULL COMMENT '��С���ֵ�λ',
  `min_amount` decimal(20,8) DEFAULT NULL COMMENT '������С��������',
  `max_amount` decimal(20,8) DEFAULT NULL COMMENT '���������������',
  `day_max_amount` decimal(20,8) DEFAULT NULL COMMENT '���������������',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT 'status=1������\r\n0������',
  `auto_out` double DEFAULT '10' COMMENT '�Զ�ת������',
  `rate` double DEFAULT '0' COMMENT '��������',
  `min_fee_num` decimal(20,8) DEFAULT NULL COMMENT '�����ȡ�����Ѹ���',
  `withdraw_flag` tinyint(4) DEFAULT '1' COMMENT '���ֿ���',
  `recharge_flag` tinyint(4) DEFAULT '1' COMMENT '��ֵ����',
  `last_update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '����ʱ��',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '����ʱ��',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_status_wallet_type` (`wallet`,`status`,`type`) USING BTREE,
  KEY `idx_create_time` (`created`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1045970844459524099 DEFAULT CHARSET=utf8mb4 COMMENT='����������Ϣ';

DROP TABLE IF EXISTS  `coin_buckle`;
CREATE TABLE `coin_buckle` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '����id',
  `type` int(10) NOT NULL COMMENT '�������� 1��;2��',
  `status` int(4) NOT NULL DEFAULT '0' COMMENT '״̬��0-����ˣ�1-���ͨ����2�ܾ���3��˳ɹ���',
  `amount` decimal(20,8) NOT NULL COMMENT '��������',
  `last_update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '�޸�ʱ��',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '����ʱ��',
  `account_id` bigint(20) NOT NULL COMMENT '�����˻�',
  `description` varchar(255) NOT NULL COMMENT 'ժҪ',
  `remark` varchar(255) DEFAULT NULL COMMENT '��ע',
  `step` int(10) NOT NULL COMMENT '��ǰ��˵ȼ�',
  `audit_time` datetime DEFAULT NULL COMMENT '���ʱ��',
  `reason` varchar(255) DEFAULT NULL COMMENT 'ԭ��',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1059427238667993090 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='���ֻ��ҳ�ֵ��¼';

DROP TABLE IF EXISTS  `coin_buckle_audit_record`;
CREATE TABLE `coin_buckle_audit_record` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '����',
  `order_id` bigint(20) DEFAULT NULL COMMENT '��Ҷ�����',
  `status` tinyint(4) DEFAULT NULL COMMENT '״̬',
  `remark` text COMMENT '��˱�ע',
  `step` tinyint(4) DEFAULT NULL COMMENT '��ǰ��˼���',
  `audit_user_id` bigint(20) DEFAULT NULL COMMENT '�����ID',
  `audit_user_name` varchar(128) DEFAULT NULL COMMENT '�����',
  `created` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '����ʱ��',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1059427347078168579 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='���ֻ���������˼�¼';

DROP TABLE IF EXISTS  `coin_recharge`;
CREATE TABLE `coin_recharge` (
  `id` bigint(18) unsigned NOT NULL AUTO_INCREMENT COMMENT '����id',
  `user_id` bigint(18) unsigned NOT NULL COMMENT '�û�id',
  `coin_id` bigint(18) NOT NULL COMMENT '����id',
  `coin_name` varchar(255) NOT NULL DEFAULT '' COMMENT '��������',
  `coin_type` varchar(50) NOT NULL DEFAULT '' COMMENT '��������',
  `address` varchar(255) DEFAULT NULL COMMENT 'Ǯ����ַ',
  `confirm` int(1) NOT NULL COMMENT '��ֵȷ����',
  `status` int(4) DEFAULT '0' COMMENT '״̬��0-�����ʣ�1-��ֵʧ�ܣ�2����ʧ�ܣ�3���˳ɹ���',
  `txid` varchar(80) DEFAULT NULL COMMENT '����id',
  `amount` decimal(20,8) DEFAULT NULL COMMENT 'ʵ�ʵ���',
  `last_update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '�޸�ʱ��',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '����ʱ��',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=620 DEFAULT CHARSET=utf8mb4 COMMENT='���ֻ��ҳ�ֵ��¼';

DROP TABLE IF EXISTS  `coin_type`;
CREATE TABLE `coin_type` (
  `id` bigint(18) NOT NULL AUTO_INCREMENT COMMENT '����',
  `code` varchar(16) NOT NULL COMMENT '����',
  `description` varchar(32) NOT NULL COMMENT '����',
  `status` tinyint(4) NOT NULL COMMENT '״̬��0-��Ч��1-��Ч��',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '����ʱ��',
  `last_update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '����ʱ��',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `code_unique` (`code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1015666990675070979 DEFAULT CHARSET=utf8mb4 COMMENT='��������';

DROP TABLE IF EXISTS  `coin_withdraw`;
CREATE TABLE `coin_withdraw` (
  `id` bigint(18) unsigned NOT NULL AUTO_INCREMENT COMMENT '����id',
  `user_id` bigint(18) unsigned NOT NULL COMMENT '�û�id',
  `coin_id` bigint(18) NOT NULL COMMENT '����id',
  `coin_name` varchar(255) NOT NULL DEFAULT '' COMMENT '��������',
  `coin_type` varchar(50) NOT NULL DEFAULT '' COMMENT '��������',
  `address` varchar(255) NOT NULL DEFAULT '' COMMENT 'Ǯ����ַ',
  `txid` varchar(80) DEFAULT NULL COMMENT '����id',
  `num` decimal(20,8) NOT NULL COMMENT '������',
  `fee` decimal(20,8) NOT NULL COMMENT '������()',
  `mum` decimal(20,8) NOT NULL COMMENT 'ʵ������',
  `type` tinyint(1) DEFAULT '0' COMMENT '0վ��1����',
  `chain_fee` decimal(20,8) DEFAULT NULL COMMENT '���������ѻ���',
  `block_num` int(11) unsigned DEFAULT '0' COMMENT '����߶�',
  `wallet_mark` varchar(255) DEFAULT NULL COMMENT 'Ǯ����ұ�ע��ע',
  `remark` varchar(255) DEFAULT NULL COMMENT '��̨�����Ա��ұ�ע��ע',
  `step` tinyint(4) DEFAULT NULL COMMENT '��ǰ��˼���',
  `status` tinyint(1) NOT NULL COMMENT '״̬��0-����У�1-�ɹ���2-�ܾ���3-������4-���ͨ����5-����У�',
  `audit_time` datetime DEFAULT NULL COMMENT '���ʱ��',
  `last_update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '�޸�ʱ��',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '����ʱ��',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `userid` (`user_id`) USING BTREE,
  KEY `coinname` (`coin_id`) USING BTREE,
  KEY `idx_created` (`created`) USING BTREE,
  KEY `idx_status` (`status`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=246 DEFAULT CHARSET=utf8mb4 COMMENT='���ֻ������ּ�¼';

DROP TABLE IF EXISTS  `coin_withdraw_audit_record`;
CREATE TABLE `coin_withdraw_audit_record` (
  `id` bigint(18) NOT NULL AUTO_INCREMENT COMMENT '����',
  `order_id` bigint(18) DEFAULT NULL COMMENT '��Ҷ�����',
  `status` tinyint(4) DEFAULT NULL COMMENT '״̬',
  `remark` text COMMENT '��˱�ע',
  `step` tinyint(4) DEFAULT NULL COMMENT '��ǰ��˼���',
  `audit_user_id` bigint(18) DEFAULT NULL COMMENT '�����ID',
  `audit_user_name` varchar(128) DEFAULT NULL COMMENT '�����',
  `created` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '����ʱ��',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1060434541655445507 DEFAULT CHARSET=utf8mb4 COMMENT='���ֻ���������˼�¼';

DROP TABLE IF EXISTS  `coin_withdraw_retry_record`;
CREATE TABLE `coin_withdraw_retry_record` (
  `id` bigint(18) unsigned NOT NULL AUTO_INCREMENT COMMENT '����id',
  `order_id` bigint(18) DEFAULT NULL,
  `user_id` bigint(18) unsigned NOT NULL COMMENT '�û�id',
  `coin_id` bigint(18) NOT NULL COMMENT '����id',
  `coin_name` varchar(255) NOT NULL DEFAULT '' COMMENT '��������',
  `address` varchar(255) NOT NULL DEFAULT '' COMMENT 'Ǯ����ַ',
  `txid` varchar(80) DEFAULT NULL COMMENT '����id',
  `num` decimal(20,8) NOT NULL COMMENT '������',
  `fee` decimal(20,8) NOT NULL COMMENT '������()',
  `mum` decimal(20,8) NOT NULL COMMENT 'ʵ������',
  `type` tinyint(1) DEFAULT '0' COMMENT '�������,0վ��1����',
  `remark` text COMMENT '��˱�ע',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '����ʱ��',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `userid` (`user_id`) USING BTREE,
  KEY `coinname` (`coin_id`) USING BTREE,
  KEY `idx_created` (`created`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='���ֻ��������ش��¼';

DROP TABLE IF EXISTS  `config`;
CREATE TABLE `config` (
  `id` bigint(18) NOT NULL AUTO_INCREMENT COMMENT '����',
  `type` varchar(64) DEFAULT NULL COMMENT '���ù�������',
  `code` varchar(50) NOT NULL COMMENT '���ù������',
  `name` varchar(100) NOT NULL COMMENT '���ù�������',
  `description` varchar(255) DEFAULT NULL COMMENT '���ù�������',
  `desc` varchar(255) DEFAULT NULL COMMENT '���ù�������',
  `value` varchar(255) NOT NULL COMMENT '����ֵ',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '����ʱ��',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `type_code` (`type`,`code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1021670751313121292 DEFAULT CHARSET=utf8mb4 COMMENT='ƽ̨������Ϣ';

DROP TABLE IF EXISTS  `dividend_account`;
CREATE TABLE `dividend_account` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '����',
  `user_id` bigint(20) NOT NULL COMMENT '�û�ID',
  `reward_amount` decimal(40,20) NOT NULL COMMENT '�����ۼ��ֺܷ�',
  `unlock_amount` decimal(40,20) NOT NULL DEFAULT '0.00000000000000000000' COMMENT '�����ѽⶳ�ֺ�',
  `lock_amount` decimal(40,20) NOT NULL COMMENT 'δ�ⶳ�ֺ�',
  `unlock_date` varchar(16) NOT NULL DEFAULT '' COMMENT '�ⶳ����',
  `created` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '��������',
  `last_update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '��������',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COMMENT='���뽱���ֺ��˻�';

DROP TABLE IF EXISTS  `dividend_record`;
CREATE TABLE `dividend_record` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '����',
  `user_id` bigint(20) NOT NULL COMMENT '�û�ID',
  `refe_user_id` bigint(20) NOT NULL COMMENT '�����û�id',
  `scale_amount` varchar(20) NOT NULL DEFAULT '' COMMENT '����',
  `invite_amount` decimal(20,8) NOT NULL COMMENT '���뽱��������',
  `reward_date` varchar(16) DEFAULT NULL COMMENT '�ֺ�����',
  `enable` int(4) DEFAULT NULL COMMENT '1����,0������(��Ч������)',
  `mark` varchar(50) DEFAULT NULL COMMENT '��ע,Ĭ��Ϊ��',
  `created` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '''��������',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1060200265018028035 DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS  `dividend_record_detail`;
CREATE TABLE `dividend_record_detail` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '����',
  `user_id` bigint(20) NOT NULL COMMENT '�û�ID',
  `refe_user_id` bigint(20) NOT NULL COMMENT '�����û�id',
  `invite_amount` decimal(20,8) NOT NULL COMMENT '���뽱��������',
  `reward_date` varchar(16) DEFAULT NULL COMMENT '�ֺ�����',
  `enable` int(4) DEFAULT NULL COMMENT '1����,0������(��Ч������)',
  `mark` varchar(50) DEFAULT NULL COMMENT '��ע,Ĭ��Ϊ��',
  `created` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '''��������',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1060200265013833730 DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS  `dividend_release_record`;
CREATE TABLE `dividend_release_record` (
  `pri_week_total_mine` decimal(40,8) DEFAULT NULL,
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '����',
  `user_id` bigint(20) NOT NULL COMMENT '�û�ID',
  `unlock_amount` decimal(40,8) NOT NULL DEFAULT '0.00000000' COMMENT '�ⶳ�ֺ�',
  `unlock_date` varchar(16) NOT NULL DEFAULT '' COMMENT '�ⶳ����',
  `week_lock` decimal(40,8) NOT NULL COMMENT '���ۼƷֺ�',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `user_id_index` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COMMENT='���뽱���ͷ���ϸ';

DROP TABLE IF EXISTS  `entrust_order`;
CREATE TABLE `entrust_order` (
  `id` bigint(18) NOT NULL AUTO_INCREMENT COMMENT '����ID',
  `user_id` bigint(18) NOT NULL COMMENT '�û�ID',
  `market_id` bigint(18) NOT NULL COMMENT '�г�ID',
  `market_type` tinyint(4) DEFAULT NULL COMMENT '�г����ͣ�1���ұҽ��ף�2�����½��ף�',
  `symbol` varchar(16) DEFAULT NULL COMMENT '���׶Ա�ʶ��',
  `market_name` varchar(50) NOT NULL COMMENT '�����г�',
  `price` decimal(40,20) NOT NULL COMMENT 'ί�м۸�',
  `merge_low_price` decimal(40,20) DEFAULT NULL COMMENT '�ϲ���ȼ۸�1',
  `merge_high_price` decimal(40,20) DEFAULT NULL COMMENT '�ϲ���ȼ۸�2',
  `volume` decimal(40,20) NOT NULL COMMENT 'ί������',
  `amount` decimal(40,20) NOT NULL COMMENT 'ί���ܶ�',
  `fee_rate` decimal(40,20) NOT NULL COMMENT '�����ѱ���',
  `fee` decimal(40,20) NOT NULL COMMENT '����������',
  `contract_unit` int(11) DEFAULT NULL COMMENT '��Լ��λ',
  `deal` decimal(40,20) NOT NULL COMMENT '�ɽ�����',
  `freeze` decimal(40,20) NOT NULL COMMENT '������',
  `margin_rate` decimal(40,20) DEFAULT NULL COMMENT '��֤�����',
  `base_coin_rate` decimal(40,20) DEFAULT NULL COMMENT '�������Ҷԣ�USDT/BTC���һ���',
  `price_coin_rate` decimal(40,20) DEFAULT NULL COMMENT '���ۻ��Ҷԣ�USDT/BTC)�һ���',
  `lock_margin` decimal(40,20) DEFAULT NULL COMMENT 'ռ�ñ�֤��',
  `price_type` tinyint(4) NOT NULL DEFAULT '2' COMMENT '�۸����ͣ�1-�мۣ�2-�޼�',
  `trade_type` tinyint(4) DEFAULT NULL COMMENT '�������ͣ�1-���֣�2-ƽ��',
  `type` tinyint(4) NOT NULL COMMENT '�������ͣ�1-���룻2-����',
  `open_order_id` bigint(18) DEFAULT NULL COMMENT 'ƽ��ί�й�������',
  `status` tinyint(4) NOT NULL COMMENT 'status��0-δ�ɽ���1-�ѳɽ���2-��ȡ����3-�쳣��',
  `last_update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '����ʱ��',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '����ʱ��',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idnex_price` (`price`,`market_id`,`volume`,`deal`,`type`,`status`,`user_id`) USING BTREE,
  KEY `idx_create_time` (`created`) USING BTREE,
  KEY `idx_market_id` (`market_id`) USING BTREE,
  KEY `idx_user_id` (`user_id`) USING BTREE,
  KEY `idx_status` (`status`) USING BTREE,
  KEY `idx_symbol` (`symbol`) USING BTREE,
  KEY `idx_all` (`symbol`,`user_id`,`status`,`created`) USING BTREE,
  KEY `idx_id` (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1060730594440757250 DEFAULT CHARSET=utf8mb4 COMMENT='ί�ж�����Ϣ';

DROP TABLE IF EXISTS  `forex_account`;
CREATE TABLE `forex_account` (
  `id` bigint(18) NOT NULL AUTO_INCREMENT COMMENT '����',
  `user_id` bigint(18) DEFAULT NULL COMMENT '�û�ID',
  `market_id` bigint(18) DEFAULT NULL COMMENT '���׶�ID',
  `market_name` varchar(255) DEFAULT NULL COMMENT '���׶�',
  `type` tinyint(4) DEFAULT NULL COMMENT '�ֲַ���1-��2-��',
  `amount` decimal(20,8) DEFAULT '0.00000000' COMMENT '�ֲ���',
  `lock_amount` decimal(20,8) DEFAULT '0.00000000' COMMENT '����ֲ���',
  `status` tinyint(4) DEFAULT NULL COMMENT '״̬��1-��Ч��2-������',
  `last_update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '�޸�ʱ��',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '����ʱ��',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `unique_index` (`user_id`,`market_id`,`type`) USING BTREE,
  KEY `idx_created` (`created`) USING BTREE,
  KEY `idx_updated` (`last_update_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='���½��׳ֲ���Ϣ';

DROP TABLE IF EXISTS  `forex_account_detail`;
CREATE TABLE `forex_account_detail` (
  `id` bigint(18) NOT NULL AUTO_INCREMENT COMMENT '����',
  `account_id` bigint(18) DEFAULT NULL COMMENT '�ֲ��˻�ID',
  `type` tinyint(4) DEFAULT NULL COMMENT '��֧���ͣ����֣�2-ƽ�֣�',
  `amount` decimal(20,8) DEFAULT NULL COMMENT '�ֲ���',
  `remark` text COMMENT '��ע',
  `created` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '����ʱ��',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_account_id` (`account_id`) USING BTREE,
  KEY `idx_type` (`type`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='�ֲ��˻���ˮ';

DROP TABLE IF EXISTS  `forex_close_position_order`;
CREATE TABLE `forex_close_position_order` (
  `id` bigint(18) NOT NULL AUTO_INCREMENT COMMENT '����',
  `user_id` bigint(18) DEFAULT NULL COMMENT '�û�ID',
  `market_id` bigint(18) DEFAULT NULL COMMENT '���׶�ID',
  `market_name` varchar(255) DEFAULT NULL COMMENT '���׶�����',
  `type` tinyint(4) DEFAULT NULL COMMENT '�ֲַ���1-��2-��',
  `account_id` bigint(18) DEFAULT NULL COMMENT '�ʽ��˻�ID',
  `entrust_order_id` bigint(18) DEFAULT NULL COMMENT 'ί�ж�����',
  `order_id` bigint(18) DEFAULT NULL COMMENT '�ɽ�������',
  `price` decimal(20,8) DEFAULT NULL COMMENT '�ɽ���',
  `num` decimal(20,8) DEFAULT NULL COMMENT '�ɽ�����',
  `open_id` bigint(18) DEFAULT NULL COMMENT '�������ֶ�����',
  `profit` decimal(20,8) DEFAULT NULL COMMENT 'ƽ��ӯ��',
  `unlock_margin` decimal(20,8) DEFAULT NULL COMMENT '���ػ���֤��',
  `last_update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '�޸�ʱ��',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '����ʱ��',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_create_time` (`created`) USING BTREE,
  KEY `idx_update_time` (`last_update_time`) USING BTREE,
  KEY `idx_market_id` (`market_id`) USING BTREE,
  KEY `idx_user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='ƽ������';

DROP TABLE IF EXISTS  `forex_coin`;
CREATE TABLE `forex_coin` (
  `id` bigint(18) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL COMMENT '��������',
  `title` varchar(100) NOT NULL COMMENT '���ֱ���',
  `sort` tinyint(4) NOT NULL DEFAULT '0' COMMENT '����',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '״̬: 0���� 1����',
  `last_update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '�޸�ʱ��',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '����ʱ��',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='���½��ױ��ֱ�';

DROP TABLE IF EXISTS  `forex_open_position_order`;
CREATE TABLE `forex_open_position_order` (
  `id` bigint(18) NOT NULL AUTO_INCREMENT COMMENT '����',
  `user_id` bigint(18) DEFAULT NULL COMMENT '�û�ID',
  `market_id` bigint(18) DEFAULT NULL COMMENT '���׶�ID',
  `market_name` varchar(255) DEFAULT NULL COMMENT '���׶�����',
  `coin_id` bigint(18) DEFAULT NULL COMMENT '�������',
  `type` tinyint(4) DEFAULT NULL COMMENT '�ֲַ���1-��2-��',
  `account_id` bigint(18) DEFAULT NULL COMMENT '�ʽ��˻�ID',
  `entrust_order_id` bigint(18) DEFAULT NULL COMMENT 'ί�ж���',
  `order_id` bigint(18) DEFAULT NULL COMMENT '�ɽ�������',
  `price` decimal(20,8) DEFAULT NULL COMMENT '�ɽ��۸�',
  `num` decimal(20,8) DEFAULT '0.00000000' COMMENT '�ɽ�����',
  `lock_margin` decimal(20,8) DEFAULT '0.00000000' COMMENT '�۳���֤��',
  `close_num` decimal(20,8) DEFAULT '0.00000000' COMMENT 'ƽ����',
  `status` tinyint(4) DEFAULT NULL COMMENT '״̬��1��δƽ�֣�2-��ƽ��',
  `last_update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '�޸�ʱ��',
  `created` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '����ʱ��',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_create_time` (`created`) USING BTREE,
  KEY `idx_update_time` (`last_update_time`) USING BTREE,
  KEY `idx_user_id` (`user_id`) USING BTREE,
  KEY `idx_market_id` (`market_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='���ֶ�����Ϣ';

DROP TABLE IF EXISTS  `market`;
CREATE TABLE `market` (
  `id` bigint(18) NOT NULL AUTO_INCREMENT COMMENT '�г�ID',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '���ͣ�1-���ֻ��ң�2�����½���',
  `trade_area_id` bigint(18) NOT NULL COMMENT '��������ID',
  `sell_coin_id` bigint(18) DEFAULT NULL COMMENT '�����г�ID',
  `buy_coin_id` bigint(18) NOT NULL COMMENT '�򷽱���ID',
  `symbol` varchar(16) DEFAULT NULL COMMENT '���׶Ա�ʶ',
  `name` varchar(100) NOT NULL COMMENT '����',
  `title` varchar(100) NOT NULL COMMENT '����',
  `img` varchar(255) DEFAULT NULL COMMENT '�г�logo',
  `open_price` decimal(20,8) NOT NULL COMMENT '���̼۸�',
  `fee_buy` decimal(20,8) NOT NULL COMMENT '������������',
  `fee_sell` decimal(20,8) NOT NULL COMMENT '������������',
  `margin_rate` decimal(20,8) DEFAULT NULL COMMENT '��֤��ռ�ñ���',
  `num_min` decimal(20,8) NOT NULL COMMENT '������Сί����',
  `num_max` decimal(20,8) NOT NULL COMMENT '�������ί����',
  `trade_min` decimal(20,8) NOT NULL COMMENT '������С�ɽ���',
  `trade_max` decimal(20,8) NOT NULL COMMENT '�������ɽ���',
  `price_scale` tinyint(4) DEFAULT '0' COMMENT '�۸�С��λ',
  `num_scale` tinyint(4) NOT NULL DEFAULT '0' COMMENT '����С��λ',
  `contract_unit` int(11) DEFAULT NULL COMMENT '��Լ��λ',
  `point_value` decimal(20,8) DEFAULT NULL COMMENT '��',
  `merge_depth` varchar(128) DEFAULT NULL COMMENT '�ϲ���ȣ���ʽ��4,3,2��4:��ʾΪ0.0001��3����ʾΪ0.001',
  `trade_time` varchar(100) DEFAULT '' COMMENT '����ʱ��',
  `trade_week` varchar(100) DEFAULT '' COMMENT '��������',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '������',
  `status` tinyint(1) NOT NULL COMMENT '״̬\r\n0����\r\n1����',
  `fxcm_symbol` varchar(255) DEFAULT NULL COMMENT '����API���׶�',
  `yahoo_symbol` varchar(255) DEFAULT NULL COMMENT '��Ӧ�Ż�����API���׶�',
  `aliyun_symbol` varchar(255) DEFAULT NULL COMMENT '��Ӧ������API���׶�',
  `last_update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '����ʱ��',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '����ʱ��',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_type` (`type`) USING BTREE,
  KEY `idx_trade_area_id` (`trade_area_id`) USING BTREE,
  KEY `idx_status` (`status`) USING BTREE,
  KEY `idx_buy_coinid_sell_coinid` (`sell_coin_id`,`buy_coin_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1045973271921352706 DEFAULT CHARSET=utf8mb4 COMMENT='���׶�������Ϣ';

DROP TABLE IF EXISTS  `mine`;
CREATE TABLE `mine` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '����',
  `user_id` bigint(20) NOT NULL COMMENT '�û�ID',
  `total_mining` decimal(40,20) NOT NULL COMMENT '�û��ڿ��ܵĶ��(��ʵ�ܵ��ڿ�����)',
  `time_mining` varchar(50) NOT NULL DEFAULT '' COMMENT '�ڿ�ʱ��',
  `real_mining` decimal(40,20) NOT NULL COMMENT 'ʵ�ʽ������',
  `created` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '��������',
  `last_update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '����ʱ��',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1060562642938933259 DEFAULT CHARSET=utf8mb4 COMMENT='�ʲ�����';

DROP TABLE IF EXISTS  `mine_data`;
CREATE TABLE `mine_data` (
  `id` bigint(18) NOT NULL AUTO_INCREMENT COMMENT '����',
  `pre_distributed` decimal(30,8) DEFAULT NULL COMMENT '���մ������ۻ��ۺ�',
  `pre_mining` decimal(30,8) DEFAULT NULL COMMENT 'ǰһ���ڿ����',
  `total_circulation` decimal(30,8) DEFAULT NULL COMMENT '����ͨ��',
  `sec_irculation` decimal(30,8) DEFAULT NULL COMMENT '�����г���ͨ��',
  `distributed` decimal(30,8) DEFAULT NULL COMMENT '���մ������ۻ��ۺ�',
  `per_million_revenue` decimal(30,8) DEFAULT NULL COMMENT '������������ÿ���������',
  `statistics_date` varchar(50) DEFAULT NULL COMMENT 'ͳ������',
  `created` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '����ʱ��',
  `last_update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '����ʱ��',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1060564761997783042 DEFAULT CHARSET=utf8mb4 COMMENT='�ڿ����ݻ���';

DROP TABLE IF EXISTS  `mine_pool`;
CREATE TABLE `mine_pool` (
  `id` bigint(18) NOT NULL AUTO_INCREMENT COMMENT '����',
  `name` varchar(256) DEFAULT NULL COMMENT '����',
  `description` varchar(256) DEFAULT NULL COMMENT '����',
  `create_user` bigint(18) DEFAULT NULL COMMENT '������',
  `status` tinyint(4) DEFAULT '0' COMMENT '״̬',
  `remark` varchar(256) DEFAULT NULL COMMENT '��ע',
  `created` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '����ʱ��',
  `last_update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '�޸�ʱ��',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1059633166793093122 DEFAULT CHARSET=utf8mb4 COMMENT='���';

DROP TABLE IF EXISTS  `mine_pool_member`;
CREATE TABLE `mine_pool_member` (
  `id` bigint(18) NOT NULL AUTO_INCREMENT COMMENT '����',
  `mine_pool_id` bigint(18) DEFAULT NULL COMMENT '���ID',
  `user_id` bigint(18) DEFAULT NULL COMMENT '�û�ID',
  `created` datetime DEFAULT NULL COMMENT '����ʱ��',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4575 DEFAULT CHARSET=utf8mb4 COMMENT='��س�Ա';

DROP TABLE IF EXISTS  `mining_detail`;
CREATE TABLE `mining_detail` (
  `id` bigint(19) NOT NULL AUTO_INCREMENT COMMENT '����ID',
  `user_id` bigint(19) NOT NULL COMMENT '�û�ID',
  `area_name` varchar(19) NOT NULL DEFAULT '' COMMENT '�г�����',
  `total_fee` decimal(40,20) NOT NULL COMMENT '�ڿ��������ܶ��',
  `time_mining` varchar(100) NOT NULL DEFAULT '' COMMENT '�ڿ�ʱ��',
  `last_update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '����ʱ��',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '����ʱ��',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `user_id` (`user_id`,`area_name`,`time_mining`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=20431246 DEFAULT CHARSET=utf8mb4 COMMENT='�ڿ�ÿ�ջ�����Ϣ';

DROP TABLE IF EXISTS  `notice`;
CREATE TABLE `notice` (
  `id` bigint(18) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL COMMENT '����',
  `description` varchar(200) DEFAULT NULL COMMENT '���',
  `author` varchar(50) DEFAULT NULL COMMENT '����',
  `status` int(1) DEFAULT NULL COMMENT '����״̬',
  `sort` int(4) NOT NULL COMMENT '��������Խ��Խ��ǰ',
  `content` text COMMENT '����',
  `last_update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '����޸�ʱ��',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '��������',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1057187699043966978 DEFAULT CHARSET=utf8mb4 COMMENT='ϵͳ��Ѷ������Ϣ';

DROP TABLE IF EXISTS  `plant_coin_dividend_record`;
CREATE TABLE `plant_coin_dividend_record` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '����',
  `user_id` bigint(20) NOT NULL COMMENT '�û�ID',
  `coin_name` varchar(10) NOT NULL DEFAULT '' COMMENT '��������',
  `amount` decimal(20,8) NOT NULL COMMENT 'ƽ̨�ҷֺ���',
  `reward_date` varchar(16) NOT NULL DEFAULT '' COMMENT '�ֺ�����',
  `created` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '''��������',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1060562648978731017 DEFAULT CHARSET=utf8mb4 COMMENT='����ƽ̨�ҷֺ��¼';

DROP TABLE IF EXISTS  `pool_dividend_account`;
CREATE TABLE `pool_dividend_account` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '����',
  `user_id` bigint(20) NOT NULL COMMENT '�û�ID',
  `reward_amount` decimal(20,8) NOT NULL COMMENT '�ۼƷֺ�',
  `unlock_amount` decimal(20,8) NOT NULL COMMENT '�ѽⶳ',
  `unlock_date` varchar(16) NOT NULL DEFAULT '' COMMENT '�ⶳ����',
  `created` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '��������',
  `last_update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '��������',
  `lock_amount` decimal(20,8) DEFAULT NULL COMMENT 'δ�ⶳ',
  `pri_month_total_mine` decimal(20,0) DEFAULT NULL COMMENT '�����ڿ�����',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='��ؽⶳ���';

DROP TABLE IF EXISTS  `pool_dividend_record`;
CREATE TABLE `pool_dividend_record` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '����',
  `user_id` bigint(20) NOT NULL COMMENT '����userid',
  `amount` decimal(20,8) NOT NULL COMMENT '����ǰһ�콱�����',
  `reward_date` varchar(16) DEFAULT NULL COMMENT '������������',
  `created` datetime DEFAULT NULL COMMENT '''��������',
  `mark` varchar(100) DEFAULT NULL COMMENT '���������ʽ��ʱ��,дһ����ע',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1060562737252052995 DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS  `private_placement`;
CREATE TABLE `private_placement` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '����',
  `user_id` bigint(20) NOT NULL COMMENT '�û�ID',
  `amount` decimal(20,8) NOT NULL DEFAULT '0.00000000' COMMENT '˽ļ���',
  `freeze_amount` decimal(20,8) DEFAULT '0.00000000' COMMENT '������',
  `release_amount` decimal(20,8) DEFAULT '0.00000000' COMMENT '�ͷŽ��',
  `created` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '��������',
  `last_update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '��������',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `index_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=259 DEFAULT CHARSET=utf8mb4 COMMENT='˽ļ��';

DROP TABLE IF EXISTS  `private_placement_release_record`;
CREATE TABLE `private_placement_release_record` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '����',
  `user_id` bigint(20) NOT NULL COMMENT '�û�ID',
  `release_amount` decimal(20,8) NOT NULL DEFAULT '0.00000000' COMMENT '�ͷŽ��',
  `release_amount_rate` decimal(20,8) NOT NULL DEFAULT '0.00000000' COMMENT '�ͷű���',
  `created` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '�ͷ�ʱ��',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1060562651549839363 DEFAULT CHARSET=utf8mb4 COMMENT='˽ļ�ͷż�¼��';

DROP TABLE IF EXISTS  `properties`;
CREATE TABLE `properties` (
  `id` int(11) NOT NULL,
  `key` varchar(50) NOT NULL,
  `value` varchar(500) NOT NULL,
  `application` varchar(50) NOT NULL,
  `profile` varchar(50) NOT NULL,
  `label` varchar(50) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS  `reward_config`;
CREATE TABLE `reward_config` (
  `id` bigint(18) NOT NULL AUTO_INCREMENT COMMENT '����',
  `coin_id` bigint(18) NOT NULL COMMENT '����id',
  `coin_name` varchar(255) NOT NULL DEFAULT '' COMMENT '��������',
  `type` varchar(50) NOT NULL COMMENT '��������',
  `status` tinyint(4) NOT NULL COMMENT '�������أ�0 �ر�,1 ����',
  `amount` decimal(40,20) NOT NULL COMMENT '�������',
  `start_time` datetime NOT NULL COMMENT '������ʼʱ��',
  `end_time` datetime NOT NULL COMMENT '��������ʱ��',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `coin_id_idx` (`coin_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1021670751313121358 DEFAULT CHARSET=utf8mb4 COMMENT='��������';

DROP TABLE IF EXISTS  `reward_record`;
CREATE TABLE `reward_record` (
  `id` bigint(18) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(18) NOT NULL COMMENT '�û�id',
  `coin_id` bigint(18) NOT NULL COMMENT '����id',
  `account_id` bigint(18) NOT NULL COMMENT '�˻�id',
  `business_type` varchar(100) NOT NULL COMMENT 'ҵ������',
  `amount` decimal(40,20) NOT NULL COMMENT '����/���',
  `remark` varchar(255) NOT NULL COMMENT '��ע',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'ʱ��',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_created` (`created`) USING BTREE,
  KEY `idx_business_type` (`business_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS  `sms`;
CREATE TABLE `sms` (
  `id` bigint(18) NOT NULL AUTO_INCREMENT COMMENT '����id',
  `template_code` varchar(25) DEFAULT NULL COMMENT '����ģ��ID',
  `country_code` varchar(255) DEFAULT NULL COMMENT '��������',
  `mobile` varchar(100) DEFAULT NULL COMMENT '���Ž����ֻ���',
  `content` varchar(255) DEFAULT NULL COMMENT '��������',
  `status` int(4) DEFAULT NULL COMMENT '����״̬��0��Ĭ��ֵ������0���ɹ����Ͷ���������С��0���쳣��',
  `remark` varchar(255) DEFAULT NULL COMMENT '��ע',
  `last_update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '����ʱ��',
  `created` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '����ʱ��',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1019617990242516994 DEFAULT CHARSET=utf8mb4 COMMENT='������Ϣ';

DROP TABLE IF EXISTS  `table_aa`;
CREATE TABLE `table_aa` (
  `id` bigint(18) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(18) NOT NULL COMMENT '�û�id',
  `coin_id` bigint(18) NOT NULL COMMENT '����id',
  `account_id` bigint(18) NOT NULL COMMENT '�˻�id',
  `ref_account_id` bigint(18) NOT NULL COMMENT '���������˻�ID',
  `order_id` bigint(18) NOT NULL DEFAULT '0' COMMENT '����ID',
  `direction` tinyint(1) NOT NULL COMMENT '�ʽ�������Ϊ-1������Ϊ-2',
  `business_type` varchar(100) CHARACTER SET utf8mb4 NOT NULL COMMENT 'ҵ������',
  `amount` decimal(40,20) NOT NULL COMMENT '����/���',
  `fee` decimal(40,20) DEFAULT '0.00000000000000000000' COMMENT '������',
  `remark` varchar(255) CHARACTER SET utf8mb4 NOT NULL COMMENT '��ע',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'ʱ��',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1019578841737759438 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS  `trade_area`;
CREATE TABLE `trade_area` (
  `id` bigint(18) NOT NULL AUTO_INCREMENT COMMENT '����',
  `name` varchar(32) DEFAULT NULL COMMENT '����������',
  `code` varchar(32) DEFAULT NULL COMMENT '����������',
  `type` tinyint(4) DEFAULT NULL COMMENT '���ͣ�1-���ֻ��ҽ��ף�2-���½���ʹ�ã�',
  `coin_id` bigint(18) DEFAULT NULL COMMENT '������֣������½�����Ҫʹ�ã�',
  `coin_name` varchar(16) DEFAULT NULL COMMENT '����������ƣ������½�����Ҫʹ�ã�',
  `sort` tinyint(4) DEFAULT NULL COMMENT '����',
  `status` tinyint(4) DEFAULT NULL COMMENT '״̬',
  `base_coin` bigint(18) DEFAULT NULL COMMENT '�Ƿ���Ϊ�����������,0��1�� ��ͳ�Ƹ����˻�ʹ��',
  `last_update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '�޸�ʱ��',
  `created` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '����ʱ��',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_coin_id` (`coin_id`) USING BTREE,
  KEY `idx_type` (`type`) USING BTREE,
  KEY `idx_update_time` (`last_update_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1042610672674267138 DEFAULT CHARSET=utf8mb4 COMMENT='������';

DROP TABLE IF EXISTS  `turnover_order`;
CREATE TABLE `turnover_order` (
  `id` bigint(18) NOT NULL AUTO_INCREMENT,
  `market_id` bigint(18) NOT NULL COMMENT '�г�ID',
  `market_type` int(11) DEFAULT NULL COMMENT '���׶����ͣ�1-�ұҽ��ף�2-���½��ף�',
  `trade_type` tinyint(4) NOT NULL COMMENT '��������:1 �� 2��',
  `symbol` varchar(16) DEFAULT NULL COMMENT '���׶Ա�ʶ��',
  `market_name` varchar(16) DEFAULT NULL COMMENT '���׶�����',
  `sell_user_id` bigint(18) NOT NULL COMMENT '�����û�ID',
  `sell_coin_id` bigint(18) NOT NULL COMMENT '��������ID',
  `sell_order_id` bigint(18) NOT NULL COMMENT '����ί�ж���ID',
  `sell_price` decimal(40,20) NOT NULL COMMENT '����ί�м۸�',
  `sell_fee_rate` decimal(40,20) NOT NULL COMMENT '������������',
  `sell_volume` decimal(40,20) NOT NULL COMMENT '����ί������',
  `buy_user_id` bigint(18) NOT NULL COMMENT '���û�ID',
  `buy_coin_id` bigint(18) NOT NULL COMMENT '�򷽱���ID',
  `buy_order_id` bigint(18) NOT NULL COMMENT '��ί�ж���ID',
  `buy_volume` decimal(40,20) NOT NULL COMMENT '��ί������',
  `buy_price` decimal(40,20) NOT NULL COMMENT '��ί�м۸�',
  `buy_fee_rate` decimal(40,20) NOT NULL COMMENT '����������',
  `order_id` bigint(18) NOT NULL COMMENT 'ί�ж���ID',
  `amount` decimal(40,20) NOT NULL COMMENT '�ɽ��ܶ�',
  `price` decimal(40,20) NOT NULL DEFAULT '0.00000000000000000000' COMMENT '�ɽ��۸�',
  `volume` decimal(40,20) NOT NULL COMMENT '�ɽ�����',
  `deal_sell_fee` decimal(40,20) NOT NULL COMMENT '�ɽ�����������',
  `deal_sell_fee_rate` decimal(40,20) NOT NULL COMMENT '�ɽ�������������',
  `deal_buy_fee` decimal(40,20) NOT NULL COMMENT '�ɽ�����������',
  `deal_buy_fee_rate` decimal(40,20) NOT NULL COMMENT '�ɽ�����ɽ��ʷ�',
  `status` tinyint(4) NOT NULL COMMENT '״̬0���ɽ���1�ѳɽ���2������3.�쳣',
  `last_update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '����ʱ��',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '����ʱ��',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `un_sell_buy_order_id` (`sell_order_id`,`buy_order_id`) USING BTREE,
  KEY `idx_create_time` (`created`) USING BTREE,
  KEY `idx_market_id` (`market_id`) USING BTREE,
  KEY `turnover_sellorder_buyorder_market_index` (`market_id`,`sell_order_id`,`buy_order_id`) USING BTREE,
  KEY `idx_selluserid` (`sell_user_id`) USING BTREE,
  KEY `idx_buyuserid` (`buy_user_id`) USING BTREE,
  KEY `idx_bid_sid` (`sell_order_id`,`buy_order_id`),
  KEY `idx_symbol` (`symbol`) USING BTREE,
  KEY `idx_status` (`status`) USING BTREE,
  KEY `idx_buy_order_id` (`buy_order_id`) USING BTREE,
  KEY `idx_sell_order_id` (`sell_order_id`) USING BTREE,
  KEY `turnover_symbol_status_buyorderid_index` (`symbol`,`status`,`buy_order_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1060730601285861378 DEFAULT CHARSET=utf8mb4 COMMENT='�ɽ�����';

DROP TABLE IF EXISTS  `turnover_record`;
CREATE TABLE `turnover_record` (
  `id` bigint(18) NOT NULL AUTO_INCREMENT,
  `market_id` bigint(18) NOT NULL COMMENT '�г�ID',
  `price` decimal(20,8) NOT NULL COMMENT '�ɽ���',
  `volume` decimal(20,8) NOT NULL COMMENT '�ɽ�����',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '����ʱ��',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='�ɽ�����';

DROP TABLE IF EXISTS  `user`;
CREATE TABLE `user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '����id',
  `type` tinyint(4) DEFAULT '1' COMMENT '�û����ͣ�1-��ͨ�û���2-������',
  `username` varchar(255) DEFAULT NULL COMMENT '�û���',
  `country_code` varchar(255) DEFAULT NULL COMMENT '���ʵ绰����',
  `mobile` varchar(255) DEFAULT NULL COMMENT '�ֻ���',
  `password` varchar(255) NOT NULL COMMENT '����',
  `paypassword` varchar(255) DEFAULT NULL COMMENT '��������',
  `paypass_setting` tinyint(4) DEFAULT '0' COMMENT '������������״̬',
  `email` varchar(255) DEFAULT NULL COMMENT '����',
  `real_name` varchar(255) DEFAULT NULL COMMENT '��ʵ����',
  `id_card_type` tinyint(1) DEFAULT NULL COMMENT '֤������:1�����֤��2������֤��3�����գ�4��̨�����ͨ��֤��5���۰ľ���ͨ��֤��9��������',
  `auth_status` tinyint(4) DEFAULT '0' COMMENT '��֤״̬��0-δ��֤��1-����ʵ����֤��2-�߼�ʵ����֤',
  `ga_secret` varchar(32) DEFAULT NULL COMMENT 'Google������Կ',
  `ga_status` tinyint(1) DEFAULT '0' COMMENT 'Google��֤����״̬,0,δ���ã�1����',
  `id_card` varchar(255) DEFAULT NULL COMMENT '���֤��',
  `level` int(11) DEFAULT NULL COMMENT '�����̼���',
  `authtime` datetime DEFAULT NULL COMMENT '��֤ʱ��',
  `logins` int(11) DEFAULT '0' COMMENT '��¼��',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '״̬��0�����ã�1�����ã�',
  `invite_code` varchar(200) DEFAULT NULL COMMENT '������',
  `invite_relation` varchar(500) DEFAULT NULL COMMENT '�����ϵ',
  `direct_inviteid` varchar(20) DEFAULT NULL COMMENT 'ֱ��������ID',
  `is_deductible` int(11) DEFAULT '0' COMMENT '0 �� 1��  �Ƿ���ƽ̨�ҵֿ�������',
  `reviews_status` int(11) DEFAULT '0' COMMENT '���״̬,1ͨ��,2�ܾ�,0,�����',
  `refe_auth_id` bigint(30) DEFAULT NULL,
  `agent_note` text COMMENT '�����ܾ̾�ԭ��',
  `access_key_id` varchar(16) DEFAULT NULL COMMENT 'API��KEY',
  `access_key_secret` varchar(30) DEFAULT NULL COMMENT 'API����Կ',
  `last_update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '�޸�ʱ��',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '����ʱ��',
  `flag` tinyint(4) NOT NULL DEFAULT '0' COMMENT '�����˱��',
  `platid` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `status` (`status`) USING BTREE,
  KEY `idx_addtime` (`created`) USING BTREE,
  KEY `username` (`username`(191)) USING BTREE,
  KEY `email` (`email`(191)) USING BTREE,
  KEY `mobile` (`mobile`(191)) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1060511024161439746 DEFAULT CHARSET=utf8mb4 COMMENT='�û���';

DROP TABLE IF EXISTS  `user_auth_audit_record`;
CREATE TABLE `user_auth_audit_record` (
  `id` bigint(18) NOT NULL AUTO_INCREMENT COMMENT '����',
  `auth_code` bigint(18) DEFAULT NULL COMMENT '��Ӧuser_auth_info��code',
  `user_id` bigint(18) DEFAULT NULL COMMENT '�û�ID',
  `status` tinyint(4) DEFAULT NULL COMMENT '״̬1ͬ��2�ܽ^',
  `remark` varchar(1000) DEFAULT NULL COMMENT '��ע',
  `step` tinyint(4) DEFAULT NULL COMMENT '��ǰ��˼���',
  `audit_user_id` bigint(18) DEFAULT NULL COMMENT '�����ID',
  `audit_user_name` varchar(128) DEFAULT NULL COMMENT '�����',
  `created` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '����ʱ��',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1060385664433950723 DEFAULT CHARSET=utf8mb4 COMMENT='ʵ����֤�����Ϣ';

DROP TABLE IF EXISTS  `user_auth_info`;
CREATE TABLE `user_auth_info` (
  `id` bigint(18) NOT NULL AUTO_INCREMENT COMMENT '����',
  `user_id` bigint(18) DEFAULT NULL COMMENT '�û�ID',
  `image_url` varchar(256) DEFAULT NULL COMMENT 'ͼƬ��ַ',
  `serialno` int(11) DEFAULT NULL COMMENT '��ţ�1-���֤�����գ�2-���֤�����գ�3-�ֳ����֤��Ƭ��',
  `last_update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '����ʱ��',
  `created` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '����ʱ��',
  `auth_code` bigint(18) DEFAULT NULL COMMENT '�û�ÿ����˼�¼Ψһ��ʶ',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1060385664530419716 DEFAULT CHARSET=utf8mb4 COMMENT='ʵ����֤��Ϣ';

DROP TABLE IF EXISTS  `user_bank`;
CREATE TABLE `user_bank` (
  `id` bigint(18) NOT NULL AUTO_INCREMENT COMMENT '����id',
  `user_id` bigint(18) NOT NULL COMMENT '�û�id',
  `remark` varchar(255) NOT NULL COMMENT '���п�����',
  `real_name` varchar(255) NOT NULL COMMENT '������',
  `bank` varchar(255) NOT NULL COMMENT '������',
  `bank_prov` varchar(255) DEFAULT NULL COMMENT '����ʡ',
  `bank_city` varchar(255) DEFAULT NULL COMMENT '������',
  `bank_addr` varchar(255) DEFAULT NULL COMMENT '������ַ',
  `bank_card` varchar(255) NOT NULL COMMENT '�����˺�',
  `status` tinyint(4) NOT NULL COMMENT '״̬��0�����ã�1�����ã�',
  `last_update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '����ʱ��',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '����ʱ��',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `status` (`status`) USING BTREE,
  KEY `userid` (`user_id`) USING BTREE,
  KEY `create_time` (`created`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1010101010101010714 DEFAULT CHARSET=utf8mb4 COMMENT='�û�����Ϣ';

DROP TABLE IF EXISTS  `user_favorite_market`;
CREATE TABLE `user_favorite_market` (
  `id` bigint(18) NOT NULL COMMENT '����',
  `type` int(11) DEFAULT NULL COMMENT '���׶����ͣ�1-�ұҽ��ף�2-���½��ף�',
  `user_id` bigint(18) DEFAULT NULL COMMENT '�û�ID',
  `market_id` bigint(18) DEFAULT NULL COMMENT '���׶�ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='�û��ղؽ����г�';

DROP TABLE IF EXISTS  `user_login_log`;
CREATE TABLE `user_login_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '����',
  `user_id` bigint(20) DEFAULT NULL COMMENT '�û�ID',
  `client_type` tinyint(4) DEFAULT NULL COMMENT '�ͻ�������1-PC��2-IOS��3-Android',
  `login_ip` varchar(16) DEFAULT NULL COMMENT '��¼IP',
  `login_address` varchar(32) DEFAULT NULL COMMENT '��¼��ַ',
  `login_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '��¼ʱ��',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FK_fk_login_user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1060724171811622914 DEFAULT CHARSET=utf8mb4 COMMENT='�û���¼��־';

DROP TABLE IF EXISTS  `user_wallet`;
CREATE TABLE `user_wallet` (
  `id` bigint(18) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(18) NOT NULL COMMENT '�û�ID',
  `coin_id` bigint(18) NOT NULL COMMENT '����ID',
  `coin_name` varchar(200) NOT NULL DEFAULT '' COMMENT '��������',
  `name` varchar(200) NOT NULL DEFAULT '' COMMENT '��ҵ�ַ����',
  `addr` varchar(200) NOT NULL DEFAULT '' COMMENT '��ַ',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '����',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '״̬',
  `last_update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '����ʱ��',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '����ʱ��',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `status` (`status`) USING BTREE,
  KEY `userid` (`user_id`) USING BTREE,
  KEY `idx_coinid` (`coin_id`) USING BTREE,
  KEY `idx_create_time` (`created`) USING BTREE,
  KEY `idx_status` (`status`) USING BTREE,
  KEY `coinname` (`coin_name`(191)) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1060404839936212994 DEFAULT CHARSET=utf8mb4 COMMENT='�û���ҵ�ַ';

DROP TABLE IF EXISTS  `web_config`;
CREATE TABLE `web_config` (
  `id` bigint(18) NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `type` varchar(50) NOT NULL DEFAULT '' COMMENT '����, LINK_BANNER ,WEB_BANNER',
  `name` varchar(100) DEFAULT NULL COMMENT '����',
  `value` text NOT NULL COMMENT 'ֵ',
  `sort` smallint(4) DEFAULT '1' COMMENT 'Ȩ��',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '����ʱ��',
  `url` text COMMENT '�����ӵ�ַ',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '�Ƿ�ʹ�� 0 �� 1��',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1049947647725379586 DEFAULT CHARSET=utf8mb4 COMMENT='��վ������Ϣ';

DROP TABLE IF EXISTS  `work_issue`;
CREATE TABLE `work_issue` (
  `id` bigint(18) NOT NULL AUTO_INCREMENT COMMENT '����',
  `user_id` bigint(18) DEFAULT NULL COMMENT '�û�id(�����û�id)',
  `answer_user_id` bigint(18) DEFAULT NULL COMMENT '�ظ���id',
  `answer_name` varchar(50) DEFAULT NULL COMMENT '�ظ�������',
  `question` text COMMENT '��������',
  `answer` text COMMENT '�ش�����',
  `status` tinyint(1) DEFAULT NULL COMMENT '״̬��1-���ش�2-�ѻش�',
  `last_update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '�޸�ʱ��',
  `created` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '����ʱ��',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1010101010101010170 DEFAULT CHARSET=utf8mb4 COMMENT='������¼';

SET FOREIGN_KEY_CHECKS = 1;

