package com.blockeng.admin.entity;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import com.baomidou.mybatisplus.enums.IdType;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.fasterxml.jackson.databind.ser.std.ToStringSerializer;
import lombok.Data;
import lombok.experimental.Accessors;

import java.math.BigDecimal;

/**
 * <p>
 * 注册，推荐奖励规则
 * </p>
 *
 * @author shaodw
 * @since 2018-09-18
 */
@Data
@Accessors(chain = true)
@TableName(value = "reward_config")
public class RewardConfig {

    @TableId(value = "id", type = IdType.AUTO)
    @JsonSerialize(using = ToStringSerializer.class)
    private Long id;
    /**
     * 币种id
     */
    @TableField("coin_id")
    @JsonSerialize(using = ToStringSerializer.class)
    private Long coinId;

    /**
     * 币种name
     */
    @TableField("coin_name")
    private String coinName;

    /**
     * 奖励类型
     */
    @TableField("type")
    private String type;
    /**
     * 奖励开关
     */
    @TableField("status")
    private Integer status;
    /**
     * 奖励数量
     */
    @TableField("amount")
//    @JsonSerialize(using = ToStringSerializer.class)
    private BigDecimal amount;
    /**
     * 开始日期
     */
    @TableField("start_time")
    private String startTime;
    /**
     * 开始日期
     */
    @TableField("end_time")
    private String  endTime;
}
