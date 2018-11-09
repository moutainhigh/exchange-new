package com.blockeng.entity;

import java.util.Date;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import java.io.Serializable;

import com.baomidou.mybatisplus.annotation.Version;

import com.baomidou.mybatisplus.annotation.IdType;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.fasterxml.jackson.databind.ser.std.ToStringSerializer;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * <p>
 * 实名认证审核信息
 * </p>
 *
 * @author qiang
 * @since 2018-05-12
 */
@Data
@Accessors(chain = true)
@TableName("user_auth_audit_record")
public class UserAuthAuditRecord extends Model<UserAuthAuditRecord> {

    private static final long serialVersionUID = 1L;

    /**
     * 主键
     */
    @TableId(value = "id", type = IdType.ID_WORKER)
    @JsonSerialize(using = ToStringSerializer.class)
    private Long id;
    /**
     * 用户ID
     */
    @TableField("user_id")
    @JsonSerialize(using = ToStringSerializer.class)
    private Long userId;
    /**
     * 状态
     */
    private Integer status;
    /**
     * 备注
     */
    private String remark;
    /**
     * 当前审核级数
     */
    private Integer step;
    /**
     * 创建时间
     */
    private Date created;


    @Override
    protected Serializable pkVal() {
        return this.id;
    }

}
