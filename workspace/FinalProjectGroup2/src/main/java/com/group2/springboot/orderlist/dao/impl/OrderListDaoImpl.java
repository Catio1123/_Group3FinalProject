package com.group2.springboot.orderlist.dao.impl;

import java.util.List;

import javax.persistence.EntityManager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.group2.springboot.orderlist.dao.OrderListDao;
import com.group2.springboot.orderlist.model.OrderList;

@Repository
public class OrderListDaoImpl implements OrderListDao{

	@Autowired
	EntityManager em;

	@SuppressWarnings("unchecked")
	@Override
	public List<OrderList> findAllOrderList() {
		
		String hql = "From OrderList";
		
		List<OrderList> list = em.createQuery(hql).getResultList();
		
		return list;
	}

}
