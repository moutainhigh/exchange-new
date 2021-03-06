package com.blockeng.framework.enums;

import java.io.Serializable;

/**
 * 短信发送状态
 *
 * @author qiang
 */

public enum SendState {

    FAILED(0, "失败"),
    SUCCESS(1, "成功");

    private int value;
    private String desc;

    SendState(final int value, final String desc) {
        this.value = value;
        this.desc = desc;
    }

    public Serializable getValue() {
        return this.value;
    }

    public String getDesc() {
        return this.desc;
    }
}
