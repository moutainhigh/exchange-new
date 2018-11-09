CREATE TABLE `${tableName}`  (
  `id` bigint(18) NOT NULL AUTO_INCREMENT COMMENT '订单ID',
  `user_id` bigint(18) NOT NULL COMMENT '用户ID',
  `market_id` bigint(18) NOT NULL COMMENT '市场ID',
  `market_type` tinyint(4) NULL DEFAULT NULL COMMENT '市场类型（1：币币交易，2：创新交易）',
  `symbol` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '交易对标识符',
  `market_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '交易市场',
  `price` decimal(40, 20) NOT NULL COMMENT '委托价格',
  `merge_low_price` decimal(40, 20) NULL DEFAULT NULL COMMENT '合并深度价格1',
  `merge_high_price` decimal(40, 20) NULL DEFAULT NULL COMMENT '合并深度价格2',
  `volume` decimal(40, 20) NOT NULL COMMENT '委托数量',
  `amount` decimal(40, 20) NOT NULL COMMENT '委托总额',
  `fee_rate` decimal(40, 20) NOT NULL COMMENT '手续费比率',
  `fee` decimal(40, 20) NOT NULL COMMENT '交易手续费',
  `contract_unit` int(11) NULL DEFAULT NULL COMMENT '合约单位',
  `deal` decimal(40, 20) NOT NULL COMMENT '成交数量',
  `freeze` decimal(40, 20) NOT NULL COMMENT '冻结量',
  `margin_rate` decimal(40, 20) NULL DEFAULT NULL COMMENT '保证金比例',
  `base_coin_rate` decimal(40, 20) NULL DEFAULT NULL COMMENT '基础货币对（USDT/BTC）兑换率',
  `price_coin_rate` decimal(40, 20) NULL DEFAULT NULL COMMENT '报价货币对（USDT/BTC)兑换率',
  `lock_margin` decimal(40, 20) NULL DEFAULT NULL COMMENT '占用保证金',
  `price_type` tinyint(4) NOT NULL DEFAULT 2 COMMENT '价格类型：1-市价；2-限价',
  `trade_type` tinyint(4) NULL DEFAULT NULL COMMENT '交易类型：1-开仓；2-平仓',
  `type` tinyint(4) NOT NULL COMMENT '买卖类型：1-买入；2-卖出',
  `open_order_id` bigint(18) NULL DEFAULT NULL COMMENT '平仓委托关联单号',
  `status` tinyint(4) NOT NULL COMMENT 'status：0-未成交；1-已成交；2-已取消；3-异常单',
  `last_update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `created` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idnex_price`(`price`, `market_id`, `volume`, `deal`, `type`, `status`, `user_id`) USING BTREE,
  INDEX `idx_create_time`(`created`) USING BTREE,
  INDEX `idx_market_id`(`market_id`) USING BTREE,
  INDEX `idx_user_id`(`user_id`) USING BTREE,
  INDEX `idx_status`(`status`) USING BTREE,
  INDEX `idx_symbol`(`symbol`) USING BTREE,
  INDEX `idx_all`(`symbol`, `user_id`, `status`, `created`) USING BTREE,
  INDEX `idx_id`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1036646037536153602 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '委托订单信息' ROW_FORMAT = Dynamic;

