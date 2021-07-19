package org.iii.group3.persistent.dao.studio;

import java.util.List;
import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.iii.group3.persistent.model.studio.Booking;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.util.StringUtils;


@Repository
@Transactional
public class BookingDao {
	@Autowired
	private SessionFactory sessionFactory;

	public int insert(Booking insertBean) {
		Session session = sessionFactory.getCurrentSession();
		session.save(insertBean);
		return 1;
	}

	public Booking select(Integer id) {
		Session session = sessionFactory.getCurrentSession();
		Booking resultBean = session.get(Booking.class, id);
		return resultBean;

	}

	public List<Booking> selectAll() {
		Session session = sessionFactory.getCurrentSession();

		String hql = "from Booking";
		Query<Booking> query = session.createQuery(hql, Booking.class);
		List<Booking> result = query.list();
		return result;

	}

	public Booking update(Booking updateBean) {

		Session session = sessionFactory.getCurrentSession();
		return (Booking) session.merge(updateBean);

	}
	public boolean delete(Integer id) {
		Session session = sessionFactory.getCurrentSession();
		
		Booking target = session.get(Booking.class, id);
		if(target != null) {
			session.delete(target);
			return true;
		}
		
		return false;
		
	}
	@SuppressWarnings("rawtypes")
	public List queryByHql(String hql, List params) {
		Session session = sessionFactory.getCurrentSession();
		
		
		int occurance = StringUtils.countOccurrencesOf(hql, "?");
		int paramsNum = params.size();
		if(occurance != paramsNum) {
			throw new RuntimeException("'?'數量與輸入參數數量不符");
		}
		Query query = session.createQuery(hql);
		if(occurance >= 1) {
			for(int i = 0; i < occurance; i++) {
				query.setParameter(i, params.get(i));
			}
		}
		
		return query.list();
	}
}
