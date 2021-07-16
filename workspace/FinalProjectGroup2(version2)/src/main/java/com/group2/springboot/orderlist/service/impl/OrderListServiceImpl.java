package com.group2.springboot.orderlist.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.transaction.annotation.Transactional;

import com.group2.springboot.orderlist.dao.OrderListDao;
import com.group2.springboot.orderlist.model.OrderList;
import com.group2.springboot.orderlist.service.OrderListService;

@Service
@Transactional
@EnableTransactionManagement
public class OrderListServiceImpl implements OrderListService{

	@Autowired
	OrderListDao orderListDao;
	
	@Override
	public List<OrderList> findAllOrderList() {
		return orderListDao.findAllOrderList();
	}

}
