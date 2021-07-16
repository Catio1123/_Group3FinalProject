package com.group2.springboot.orderlist.service;

import java.util.List;

import com.group2.springboot.orderlist.model.OrderList;

public interface OrderListService {
	List<OrderList> findAllOrderList();
}
