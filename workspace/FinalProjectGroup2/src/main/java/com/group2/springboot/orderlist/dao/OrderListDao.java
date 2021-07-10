package com.group2.springboot.orderlist.dao;

import java.util.List;

import com.group2.springboot.orderlist.model.OrderList;

public interface OrderListDao {
	List<OrderList> findAllOrderList();
}
