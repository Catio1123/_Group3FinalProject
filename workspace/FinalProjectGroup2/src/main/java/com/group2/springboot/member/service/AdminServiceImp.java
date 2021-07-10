package com.group2.springboot.member.service;

import java.util.List;

import javax.persistence.EntityManager;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.group2.springboot.member.dao.AdminDao;
import com.group2.springboot.member.model.CustomerBean;


@Service
@Transactional
public class AdminServiceImp implements AdminService {

	@Autowired
	AdminDao adminDao;

	@Autowired
	EntityManager em;

	@Override
	public void addUsers(CustomerBean accountBean) {
		adminDao.addUsers(accountBean);

	}

	@Override
	public CustomerBean selectUser(Integer customerID) {
		return adminDao.selectUser(customerID);
	}

	@Override
	public boolean deleteUser(Integer customerID) {
		adminDao.deleteUser(customerID);
		return false;
	}

	@Override
	public void updateUser(CustomerBean accountBean) {
		adminDao.updateUser(accountBean);
	}

	@Override
	public List<CustomerBean> selectUserAll() {
		return adminDao.selectUserAll();
	}

}
