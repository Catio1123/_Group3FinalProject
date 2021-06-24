package tw.secondgroup.model.johnny;

import java.sql.SQLException;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

@Repository("couponDao")
@Transactional
public class CouponDao {

	@Autowired
	@Qualifier("sessionFactory")
	private SessionFactory sessionFactory;

	public CouponDao() {
	}

	public CouponDao(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	public Coupon select(int id) throws SQLException {
		Session session = sessionFactory.getCurrentSession();
		return session.get(Coupon.class, id);

	}

	public List<Coupon> selectAll() {
		Session session = sessionFactory.getCurrentSession();
		Query<Coupon> query = session.createQuery("From Coupon", Coupon.class);
		return query.list();
	}

	public Coupon update(Integer id, String company, String name, String description) {
		Session session = sessionFactory.getCurrentSession();
		Coupon result = session.get(Coupon.class, id);
		if (result != null) {
			result.setCompany(company);
			result.setName(name);
			result.setDescription(description);
		}
		return result;
	}

	public Coupon insert(int id, String company, String name, String description) {
		Session session = sessionFactory.getCurrentSession();
//		House result = session.get(House.class, houseid);
//		House result = session.get(House.class, house.getHouseid());
		Coupon result = new Coupon(id, company, name, description);
		session.save(result);

		System.out.println("DAO Insert測試:" + id + ":" + company + ":" + name + ":" + description);
		if (result == null) {
			result.setId(id);
			result.setCompany(company);
			result.setName(name);
			result.setDescription(description);

			System.out.println("不得為空格");
			return result;
		}
		return null;
	}

	public boolean delete(int id) {
		Session session = sessionFactory.getCurrentSession();
		Coupon result = session.get(Coupon.class, id);
		System.out.println("getId:" + result.getId() + "getCompany:" + result.getCompany()+"getName:"+result.getName()+"getDescription"+result.getDescription());

		if (result != null) {
			session.delete(result);
			return true;
		}

		return false;
	}

}
