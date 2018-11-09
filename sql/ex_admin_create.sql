SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS  `sys_menu`;
CREATE TABLE `sys_menu` (
  `id` bigint(18) NOT NULL AUTO_INCREMENT COMMENT '����',
  `parent_id` bigint(18) DEFAULT NULL COMMENT '�ϼ��˵�ID',
  `parent_key` varchar(255) DEFAULT NULL COMMENT '�ϼ��˵�ΨһKEYֵ',
  `type` tinyint(4) NOT NULL DEFAULT '2' COMMENT '���� 1-���� 2-�ڵ�',
  `name` varchar(64) NOT NULL COMMENT '����',
  `desc` varchar(256) DEFAULT NULL COMMENT '����',
  `target_url` varchar(128) DEFAULT NULL COMMENT 'Ŀ���ַ',
  `sort` int(11) DEFAULT NULL COMMENT '��������',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '״̬ 0-��Ч�� 1-��Ч��',
  `create_by` bigint(18) DEFAULT NULL COMMENT '������',
  `modify_by` bigint(18) DEFAULT NULL COMMENT '�޸���',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '����ʱ��',
  `last_update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '�޸�ʱ��',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8mb4 COMMENT='ϵͳ�˵�';

DROP TABLE IF EXISTS  `sys_privilege`;
CREATE TABLE `sys_privilege` (
  `id` bigint(18) NOT NULL AUTO_INCREMENT COMMENT '����',
  `menu_id` bigint(18) DEFAULT NULL COMMENT '�����˵�Id',
  `name` varchar(255) DEFAULT NULL COMMENT '���ܵ�����',
  `description` varchar(255) DEFAULT NULL COMMENT '��������',
  `url` varchar(255) DEFAULT NULL,
  `method` varchar(255) DEFAULT NULL,
  `create_by` bigint(18) DEFAULT NULL COMMENT '������',
  `modify_by` bigint(18) DEFAULT NULL COMMENT '�޸���',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '����ʱ��',
  `last_update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '�޸�ʱ��',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `unq_name` (`name`(191)) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1010101010101010435 DEFAULT CHARSET=utf8mb4 COMMENT='Ȩ������';

DROP TABLE IF EXISTS  `sys_role`;
CREATE TABLE `sys_role` (
  `id` bigint(18) NOT NULL AUTO_INCREMENT COMMENT '����',
  `name` varchar(32) NOT NULL COMMENT '����',
  `code` varchar(32) NOT NULL COMMENT '����',
  `description` varchar(128) DEFAULT NULL COMMENT '����',
  `create_by` bigint(18) DEFAULT NULL COMMENT '������',
  `modify_by` bigint(18) DEFAULT NULL COMMENT '�޸���',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '״̬0:���� 1:����',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '����ʱ��',
  `last_update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '�޸�ʱ��',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1059423709228285955 DEFAULT CHARSET=utf8mb4 COMMENT='��ɫ';

DROP TABLE IF EXISTS  `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `id` bigint(18) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(18) DEFAULT NULL,
  `menu_id` bigint(18) DEFAULT NULL,
  `create_by` bigint(18) DEFAULT NULL COMMENT '������',
  `modify_by` bigint(18) DEFAULT NULL COMMENT '�޸���',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '����ʱ��',
  `last_update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '�޸�ʱ��',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1060459680640077826 DEFAULT CHARSET=utf8mb4 COMMENT='��ɫ�˵�';

DROP TABLE IF EXISTS  `sys_role_privilege`;
CREATE TABLE `sys_role_privilege` (
  `id` bigint(18) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(18) NOT NULL,
  `privilege_id` bigint(18) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1060459680531025923 DEFAULT CHARSET=utf8mb4 COMMENT='��ɫȨ������';

DROP TABLE IF EXISTS  `sys_role_privilege_user`;
CREATE TABLE `sys_role_privilege_user` (
  `id` bigint(18) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(18) NOT NULL COMMENT '��ɫId',
  `user_id` bigint(18) NOT NULL COMMENT '�û�Id',
  `privilege_id` bigint(18) NOT NULL COMMENT 'Ȩ��Id',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `pk_role_id_user_id_privilege_id` (`role_id`,`user_id`,`privilege_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1010101010101010196 DEFAULT CHARSET=utf8mb4 COMMENT='�û�Ȩ������';

DROP TABLE IF EXISTS  `sys_user`;
CREATE TABLE `sys_user` (
  `id` bigint(18) NOT NULL AUTO_INCREMENT COMMENT '����',
  `username` varchar(32) NOT NULL COMMENT '�˺�',
  `password` varchar(256) NOT NULL COMMENT '����',
  `fullname` varchar(32) DEFAULT NULL COMMENT '����',
  `mobile` varchar(16) DEFAULT NULL COMMENT '�ֻ���',
  `email` varchar(128) DEFAULT NULL COMMENT '����',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '״̬ 0-��Ч�� 1-��Ч��',
  `create_by` bigint(18) DEFAULT NULL COMMENT '������',
  `modify_by` bigint(18) DEFAULT NULL COMMENT '�޸���',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '����ʱ��',
  `last_update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '�޸�ʱ��',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1059423651665657858 DEFAULT CHARSET=utf8mb4 COMMENT='ƽ̨�û�';

DROP TABLE IF EXISTS  `sys_user_log`;
CREATE TABLE `sys_user_log` (
  `id` bigint(18) NOT NULL COMMENT '����',
  `group` varchar(255) DEFAULT NULL COMMENT '��',
  `user_id` bigint(18) DEFAULT NULL COMMENT '�û�Id',
  `type` smallint(4) DEFAULT NULL COMMENT '��־���� 1��ѯ 2�޸� 3���� 4ɾ�� 5���� 6���',
  `method` varchar(255) DEFAULT NULL COMMENT '����',
  `params` text COMMENT '����',
  `time` bigint(20) DEFAULT NULL COMMENT 'ʱ��',
  `ip` varchar(64) DEFAULT NULL COMMENT 'IP��ַ',
  `description` varchar(255) DEFAULT NULL COMMENT '����',
  `remark` varchar(255) DEFAULT NULL COMMENT '��ע',
  `created` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '����ʱ��',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='ϵͳ��־';

DROP TABLE IF EXISTS  `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `id` bigint(18) NOT NULL AUTO_INCREMENT COMMENT '����',
  `role_id` bigint(18) DEFAULT NULL COMMENT '��ɫID',
  `user_id` bigint(18) DEFAULT NULL COMMENT '�û�ID',
  `create_by` bigint(18) DEFAULT NULL COMMENT '������',
  `modify_by` bigint(18) DEFAULT NULL COMMENT '�޸���',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '����ʱ��',
  `last_update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '�޸�ʱ��',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1059425917734862851 DEFAULT CHARSET=utf8mb4 COMMENT='�û���ɫ����';

SET FOREIGN_KEY_CHECKS = 1;

