package tw.secondgroup.model.song;

import java.sql.SQLException;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;


@Repository("houseDao")
public class HouseDao {
	
	@Autowired @Qualifier("sessionFactory")

	private SessionFactory sessionFactory;
	
	public HouseDao() {
	}
	
	public HouseDao(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	public House select(int houseid) throws SQLException{
		Session session = sessionFactory.getCurrentSession();
		return session.get(House.class, 1001);
		
	}
	
	public List<House> selectAll() {
		Session session = sessionFactory.getCurrentSession();
		Query<House> query = session.createQuery("From House", House.class);
		return query.list();
	}
	
	public House update(int houseid, String houseName) {
		Session session = sessionFactory.getCurrentSession();
		House result = session.get(House.class, houseid);
		if (result != null) {
			result.setHousename(houseName);
		}
		return result;
	}

}
