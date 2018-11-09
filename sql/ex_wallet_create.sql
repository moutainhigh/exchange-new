SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS  `address_pool`;
CREATE TABLE `address_pool` (
  `id` bigint(18) NOT NULL AUTO_INCREMENT,
  `coin_id` bigint(18) NOT NULL COMMENT '����ID',
  `address` varchar(100) NOT NULL COMMENT '��ַ',
  `keystore` varchar(1024) DEFAULT '' COMMENT 'keystore',
  `pwd` varchar(200) DEFAULT '' COMMENT '����',
  `coin_type` varchar(50) NOT NULL DEFAULT '' COMMENT '��ַ����',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `unq_address` (`address`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1039033984373712658 DEFAULT CHARSET=utf8mb4 COMMENT='Ǯ����ַ��';

DROP TABLE IF EXISTS  `admin_address`;
CREATE TABLE `admin_address` (
  `id` bigint(18) NOT NULL AUTO_INCREMENT COMMENT '���',
  `coin_id` bigint(18) DEFAULT NULL COMMENT '����Id',
  `keystore` varchar(1024) DEFAULT NULL COMMENT 'eth keystore',
  `pwd` varchar(200) DEFAULT NULL COMMENT 'eth�˺�����',
  `address` varchar(50) DEFAULT NULL COMMENT '��ַ',
  `status` int(4) DEFAULT NULL COMMENT '1:����(��Ǯ����ַ),2:���,3:������',
  `coin_type` varchar(50) NOT NULL DEFAULT '' COMMENT '����',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1032958549296656387 DEFAULT CHARSET=utf8mb4 COMMENT='Ǯ���鼯��ҵ�ַ����';

DROP TABLE IF EXISTS  `coin_balance`;
CREATE TABLE `coin_balance` (
  `id` bigint(18) NOT NULL COMMENT '����',
  `coin_id` bigint(18) DEFAULT NULL COMMENT '����ID',
  `coin_name` varchar(16) DEFAULT NULL COMMENT '��������',
  `system_balance` decimal(20,8) DEFAULT NULL COMMENT 'ϵͳ�����ݳ�ֵ��Ҽ��㣩',
  `coin_type` varchar(50) DEFAULT NULL COMMENT '��������',
  `collect_account_balance` decimal(20,8) DEFAULT NULL COMMENT '�鼯�˻����',
  `loan_account_balance` decimal(20,8) DEFAULT NULL COMMENT 'Ǯ���˻����',
  `fee_account_balance` decimal(20,8) DEFAULT NULL COMMENT '�������˻����(ethת����Ҫ������)',
  `recharge_account_balance` decimal(20,8) DEFAULT NULL COMMENT '��ֵ�˻����(һ��xrp,bts��Щ��Ҫ)',
  `last_update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '����ʱ��',
  `created` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '����ʱ��',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='�������';

DROP TABLE IF EXISTS  `coin_config`;
CREATE TABLE `coin_config` (
  `id` bigint(18) NOT NULL COMMENT '����ID(��Ӧcoin��ID)',
  `name` varchar(100) NOT NULL COMMENT '��������',
  `coin_type` varchar(50) NOT NULL DEFAULT '' COMMENT '�������ͣ�btc-���ر�ϵ�У�eth-��̫����ethToken-��̫�����ң�etc-��̫���䣻',
  `credit_limit` decimal(20,8) DEFAULT NULL COMMENT 'Ǯ���������ı�',
  `credit_max_limit` decimal(20,8) DEFAULT NULL COMMENT '��������״̬��ʱ��,��ʼ�鼯',
  `auto_draw_limit` decimal(20,8) DEFAULT NULL COMMENT '�Զ���ҵ���߶��',
  `auto_recharge` int(4) NOT NULL DEFAULT '1' COMMENT '�Զ���ֵ��0�ֶ���1�Զ�',
  `auto_draw` int(4) NOT NULL DEFAULT '0' COMMENT '�Ƿ��Զ����',
  `auto_collect` int(4) NOT NULL DEFAULT '0' COMMENT '�Զ��鼯��0�ֶ���1�Զ�',
  `auto_address` int(4) NOT NULL DEFAULT '0' COMMENT '�Զ���ַ��0���ֶ���1�Զ�',
  `rpc_ip` varchar(20) DEFAULT NULL COMMENT 'rpc����ip',
  `rpc_port` varchar(10) DEFAULT NULL COMMENT 'rpc����port',
  `rpc_user` varchar(30) DEFAULT NULL COMMENT 'rpc�û�',
  `rpc_pwd` varchar(200) DEFAULT NULL COMMENT 'rpc����',
  `last_block` varchar(100) DEFAULT '' COMMENT '���һ������',
  `wallet_user` varchar(64) DEFAULT NULL COMMENT 'Ǯ���û���',
  `wallet_pass` varchar(50) DEFAULT NULL COMMENT 'Ǯ������',
  `contract_address` varchar(100) DEFAULT '' COMMENT '���Һ�Լ��ַ',
  `context` varchar(50) DEFAULT NULL COMMENT 'context',
  `min_confirm` int(4) DEFAULT '1' COMMENT '���ȷ����',
  `task` varchar(50) DEFAULT NULL COMMENT '��ʱ����',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '�Ƿ����0������,1����',
  `rpc_ip_out` varchar(30) DEFAULT NULL,
  `rpc_port_out` varchar(20) DEFAULT NULL,
  `rpc_user_out` varchar(100) DEFAULT NULL,
  `rpc_pwd_out` varchar(200) DEFAULT NULL,
  `wallet_pass_out` varchar(200) DEFAULT NULL,
  `wallet_user_out` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_status_wallet_type` (`coin_type`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='����Ǯ������';

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
) ENGINE=InnoDB AUTO_INCREMENT=1058011340606312450 DEFAULT CHARSET=utf8mb4 COMMENT='���ֻ��ҳ�ֵ��¼';

DROP TABLE IF EXISTS  `coin_server`;
CREATE TABLE `coin_server` (
  `id` bigint(18) unsigned NOT NULL AUTO_INCREMENT COMMENT '����id',
  `rpc_ip` varchar(50) NOT NULL DEFAULT '' COMMENT 'Ǯ��������ip',
  `rpc_port` varchar(50) NOT NULL DEFAULT '' COMMENT 'Ǯ��������ip',
  `running` int(1) NOT NULL COMMENT '�����Ƿ����� 0:����,1:ֹͣ',
  `wallet_number` bigint(255) NOT NULL COMMENT 'Ǯ������������߶�',
  `coin_name` varchar(50) NOT NULL COMMENT 'Ǯ������',
  `mark` varchar(100) DEFAULT NULL COMMENT '��ע��Ϣ',
  `real_number` bigint(255) DEFAULT NULL COMMENT '��ʵ����߶�',
  `last_update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '�޸�ʱ��',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '����ʱ��',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1015894258013474819 DEFAULT CHARSET=utf8mb4 COMMENT='Ǯ�������������Ϣ';

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
) ENGINE=InnoDB AUTO_INCREMENT=245 DEFAULT CHARSET=utf8mb4 COMMENT='���ֻ������ּ�¼';

DROP TABLE IF EXISTS  `user_address`;
CREATE TABLE `user_address` (
  `id` bigint(18) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(18) NOT NULL COMMENT '�û�ID',
  `coin_id` bigint(18) NOT NULL COMMENT '����ID',
  `address` varchar(100) NOT NULL DEFAULT '' COMMENT '��ַ',
  `keystore` varchar(1024) DEFAULT NULL COMMENT 'keystore',
  `pwd` varchar(200) DEFAULT NULL COMMENT '����',
  `last_update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '����ʱ��',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '����ʱ��',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `USERETH_UID_COINID_INX` (`user_id`,`coin_id`) USING BTREE,
  KEY `USERETH_ADDRESS_INX` (`address`) USING BTREE,
  KEY `idx_coin_id` (`coin_id`) USING BTREE,
  KEY `idx_coin_id_address` (`coin_id`,`address`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1060417742729678851 DEFAULT CHARSET=utf8mb4 COMMENT='�û�Ǯ����ַ��Ϣ';

DROP TABLE IF EXISTS  `user_address_for_sgc`;
CREATE TABLE `user_address_for_sgc` (
  `id` bigint(18) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(18) NOT NULL COMMENT '�û�ID',
  `coin_id` bigint(18) NOT NULL COMMENT '����ID',
  `address` varchar(100) NOT NULL DEFAULT '' COMMENT '��ַ',
  `keystore` varchar(1024) DEFAULT NULL COMMENT 'keystore',
  `pwd` varchar(200) DEFAULT NULL COMMENT '����',
  `last_update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '����ʱ��',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '����ʱ��',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `USERETH_UID_COINID_INX` (`user_id`,`coin_id`) USING BTREE,
  KEY `USERETH_ADDRESS_INX` (`address`) USING BTREE,
  KEY `idx_coin_id` (`coin_id`) USING BTREE,
  KEY `idx_coin_id_address` (`coin_id`,`address`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1051834445762220035 DEFAULT CHARSET=utf8mb4 COMMENT='�û�Ǯ����ַ��Ϣ';

DROP TABLE IF EXISTS  `wallet_collect_task`;
CREATE TABLE `wallet_collect_task` (
  `id` bigint(18) NOT NULL AUTO_INCREMENT,
  `coin_id` bigint(18) NOT NULL COMMENT '����ID',
  `coin_type` varchar(11) NOT NULL DEFAULT '' COMMENT '��������',
  `coin_name` varchar(20) DEFAULT NULL COMMENT '��������',
  `user_id` bigint(18) DEFAULT NULL COMMENT '�����ĸ��û�',
  `txid` varchar(100) DEFAULT NULL COMMENT 'txid',
  `amount` decimal(20,8) DEFAULT NULL COMMENT '�鼯����',
  `chain_fee` decimal(20,8) DEFAULT NULL COMMENT '����������',
  `mark` varchar(200) DEFAULT '' COMMENT '��ע',
  `status` int(10) NOT NULL DEFAULT '0' COMMENT '�Ƿ���',
  `from_address` varchar(100) DEFAULT NULL COMMENT '�����ĸ���ַ',
  `to_address` varchar(80) DEFAULT NULL COMMENT 'ת������',
  `last_update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_status` (`status`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1058011340669227010 DEFAULT CHARSET=utf8mb4 COMMENT='Ǯ���鼯����';

DROP TABLE IF EXISTS  `wallet_info`;
CREATE TABLE `wallet_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '����',
  `coin_id` bigint(20) NOT NULL COMMENT '����ID',
  `name` varchar(100) NOT NULL COMMENT '��������',
  `balance_total` decimal(20,8) NOT NULL DEFAULT '0.00000000' COMMENT 'ϵͳ�ֱ��ܶ�',
  `wallet_user_count` int(11) DEFAULT '0' COMMENT 'Ǯ���ֱ��û�����',
  `user_count` int(11) DEFAULT '0' COMMENT 'ϵͳ�ֱ��û�����',
  `coin_recharge_amount` decimal(20,8) NOT NULL DEFAULT '0.00000000' COMMENT '�������',
  `coin_withdraw_amount` decimal(20,8) NOT NULL DEFAULT '0.00000000' COMMENT '�������',
  `balance_total_in` decimal(20,8) NOT NULL DEFAULT '0.00000000' COMMENT 'ת���ַǮ�����',
  `balance_total_out` decimal(20,8) NOT NULL DEFAULT '0.00000000' COMMENT 'ת����ַǮ�����',
  `created` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '��ʼͳ��ʱ��',
  `date` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '�������ݿ�ʱ��',
  `wallet_balance_total` decimal(20,8) NOT NULL DEFAULT '0.00000000' COMMENT 'Ǯ�����',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1052854138508103683 DEFAULT CHARSET=utf8mb4 COMMENT='Ǯ�������Ϣ��';

SET FOREIGN_KEY_CHECKS = 1;

