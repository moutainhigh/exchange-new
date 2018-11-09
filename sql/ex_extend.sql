SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS  `points`;
CREATE TABLE `points` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '����',
  `user_id` bigint(20) NOT NULL COMMENT '�û�ID',
  `coin_id` bigint(20) NOT NULL COMMENT '����ID',
  `coin_name` varchar(20) NOT NULL COMMENT '��������',
  `count` decimal(20,8) NOT NULL COMMENT '���',
  `plus_or_minus` varchar(2) NOT NULL COMMENT '�Ӽ� 0ת�� 1ת��',
  `sign` varchar(255) DEFAULT NULL COMMENT 'ǩ��',
  `type` varchar(40) NOT NULL COMMENT '�������� 0 eth 1 usdt 2 btc 3 gtb',
  `status` int(4) NOT NULL COMMENT '1ͬ���ɹ���0�ȴ�ͬ��',
  `remark` varchar(50) NOT NULL COMMENT '0 �ȴ��һ� 1���� 2����ɹ� 3�һ�ϵͳ�쳣 4�ʽ�ۼ�(����)�쳣 5�һ��ɹ�\n6�ʽ�ⶳ�ɹ�',
  `message` varchar(50) NOT NULL COMMENT '������Ϣ',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '''��������',
  `returnurl` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS  `user_syn`;
CREATE TABLE `user_syn` (
  `id` bigint(18) NOT NULL COMMENT '�û�id',
  `parent_id` bigint(18) NOT NULL COMMENT '������id',
  `account` varchar(255) NOT NULL COMMENT '�˺�',
  `password` varchar(255) NOT NULL COMMENT '����',
  `mobile` varchar(255) DEFAULT NULL COMMENT '�ֻ���',
  `mail` varchar(255) DEFAULT NULL COMMENT '����',
  `user_name` varchar(255) DEFAULT NULL COMMENT '�û���',
  `real_name` varchar(255) NOT NULL COMMENT '��ʵ����',
  `status` int(11) DEFAULT NULL COMMENT '1ͬ���ɹ�,0ͬ��ʧ��',
  `token` varchar(255) DEFAULT NULL COMMENT 'token',
  `message` varchar(255) DEFAULT NULL COMMENT 'message',
  `ctime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '����ʱ��',
  `utime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '�޸�ʱ��',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_parent_id` (`parent_id`) USING BTREE,
  KEY `idx_ctime` (`ctime`) USING BTREE,
  KEY `idx_username` (`user_name`(191)) USING BTREE,
  KEY `idx_realname` (`real_name`(191)) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='�û���Ϣͬ����';

DROP TABLE IF EXISTS  `user_syn_exception`;
CREATE TABLE `user_syn_exception` (
  `id` bigint(18) NOT NULL AUTO_INCREMENT COMMENT '����id',
  `user_info` varchar(1000) NOT NULL COMMENT '�û���Ϣ',
  `type` varchar(20) NOT NULL COMMENT '���� register:ע���쳣��update�������쳣',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '����ʱ��',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1059781957727100931 DEFAULT CHARSET=utf8mb4 COMMENT='�û�ͬ���쳣��';

SET FOREIGN_KEY_CHECKS = 1;

