package org.iii.group3.catio.model;


import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
@Transactional
public class TestDao {
	
	@Autowired
	SessionFactory sessionFactory;
	
	
	public void insert() {
		Session session = sessionFactory.getCurrentSession();
		Test bean = new Test();
		bean.setCol1("aaa");
		bean.setCol2("bbb");
		
		session.save(bean);
		
	}

}
