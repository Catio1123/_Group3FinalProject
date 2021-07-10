package com.group2.springboot.coupon.model;

import java.sql.SQLException;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class CouponService {

	@Autowired
	private CouponDao couponDao;

	public List<Coupon> selectAll() {
		return couponDao.selectAll();
	}

	public List<Coupon> selectByName(String name ){
		return couponDao.queryByName(name);
	}
	
	
	public Coupon findById(Integer id) {
		return couponDao.findById(id);
	}
	
	public void save(Coupon coupon) {
		couponDao.save(coupon);
	}
	public void update(Coupon coupon) {
		couponDao.update(coupon);
	}
	
	public void delete(Integer id) {
		couponDao.delete(id);
	}
}
