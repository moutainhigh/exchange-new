package com.blockeng.dto;

import com.alibaba.fastjson.JSONArray;
import com.google.gson.JsonArray;
import com.google.gson.JsonParser;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;
import org.joda.time.DateTime;

import java.math.BigDecimal;

/**
 * @Description:
 * @Author: Chen Long
 * @Date: Created in 2018/5/15 下午8:14
 * @Modified by: Chen Long
 */
@Data
@Accessors(chain = true)
public class Line {

    /**
     * 时间
     */
    private DateTime time;

    /**
     * 开盘价
     */
    private BigDecimal open;

    /**
     * 最高价
     */
    private BigDecimal high;

    /**
     * 最低价
     */
    private BigDecimal low;

    /**
     * 收盘价
     */
    private BigDecimal close;

    /**
     * 总交易量
     */
    private BigDecimal volume;

    public Line() {
    }

    /**
     * 通过价格构造
     *
     * @param time   时间
     * @param price  成交价
     * @param volume 成交量
     */
    public Line(DateTime time, BigDecimal price, BigDecimal volume) {
        this.time = time;
        this.open = price;
        this.high = price;
        this.low = price;
        this.close = price;
        this.volume = volume;
    }

    /**
     * 通过K线构造
     *
     * @param line k线
     */
    public Line(String line) {
        JsonParser parser = new JsonParser();
        JsonArray jsonArray = parser.parse(line).getAsJsonArray();
        this.time = new DateTime(jsonArray.get(0).getAsLong());
        this.open = jsonArray.get(1).getAsBigDecimal();
        this.high = jsonArray.get(2).getAsBigDecimal();
        this.low = jsonArray.get(3).getAsBigDecimal();
        this.close = jsonArray.get(4).getAsBigDecimal();
        this.volume = jsonArray.get(5).getAsBigDecimal();
    }

    /**
     * 格式化称kline
     *
     * @return
     */
    public String toKline() {
        // 时间，开，高，低，收，量
        JSONArray array = new JSONArray();
        array.add(time.getMillis());
        array.add(open);
        array.add(high);
        array.add(low);
        array.add(close);
        array.add(volume);
        return array.toJSONString();
    }
}
