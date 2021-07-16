package com.group2.springboot.member.service;

import java.util.List;

import com.group2.springboot.member.model.CustomerBean;


public interface AdminService {

	public void addUsers(CustomerBean accountBean);

	public CustomerBean selectUser(Integer customerID);

	public boolean deleteUser(Integer customerID);

	public void updateUser(CustomerBean accountBean);
	
	public List<CustomerBean> selectUserAll();
}
