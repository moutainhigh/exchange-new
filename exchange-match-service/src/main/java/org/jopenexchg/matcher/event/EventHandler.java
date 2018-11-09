/* Java Open Exchange(jOpenExchg) Project
 *
 * Copyright (C) 2013  Alex Song
 *
 * This file is part of jOpenExchg.
 *
 * jOpenExchg is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * jOpenExchg is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General
 * Public License along with this library; if not, write to the
 * Free Software Foundation, Inc., 59 Temple Place, Suite 330,
 * Boston, MA 02111-1307, USA.
 */
package org.jopenexchg.matcher.event;

import com.blockeng.model.Order;

import java.math.BigDecimal;

/**
 * @author qiang
 */
public interface EventHandler {
    /**
     * 入队列的订单
     *
     * @param order
     */
    public void incomingOrder(Order order);

    /**
     * 将订单加入订单薄
     *
     * @param order
     */
    public void enterOrderBook(Order order);

    /**
     * 撮合成功
     *
     * @param newOrder
     * @param oldOrder
     * @param matchQty
     * @param matchPrice
     */
    public void match(Order newOrder, Order oldOrder, BigDecimal matchQty, BigDecimal matchPrice);

    /**
     * 撮合成功
     *
     * @param buyOrder
     * @param sellOrder
     * @param matchQty
     * @param matchPrice
     */
    public void callAuctionMatch(Order buyOrder, Order sellOrder, BigDecimal matchQty, BigDecimal matchPrice);

    /**
     * 将订单移出订单薄
     *
     * @param order
     */
    public void leaveOrderBook(Order order);

    /**
     * 匹配不成功的订单
     *
     * @param order
     */
    public void noMoreMatch(Order order);
}
