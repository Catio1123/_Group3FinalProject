package tw.secondgroup.model.hucl;

import java.sql.SQLException;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;


@Repository("houseDao03")
public class HouseDao03 {
	
	@Autowired @Qualifier("sessionFactory")

	private SessionFactory sessionFactory;
	
	public HouseDao03() {
	}
	
	public HouseDao03(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	public House03 select(int houseid) throws SQLException{
		Session session = sessionFactory.getCurrentSession();
		return session.get(House03.class, houseid);
		
	}
	
	public List<House03> selectAll() {
		Session session = sessionFactory.getCurrentSession();
		Query<House03> query = session.createQuery("From House03", House03.class);
		return query.list();
	}
	
	public House03 update(int houseid, String houseName) {
		Session session = sessionFactory.getCurrentSession();
		House03 result = session.get(House03.class, houseid);
		if (result != null) {
			result.setHousename(houseName);
		}
		return result;
	}
	
	public House03 insert(int houseid, String houseName) {
		Session session = sessionFactory.getCurrentSession();
//		House result = session.get(House.class, houseid);
//		House result = session.get(House.class, house.getHouseid());
		House03 result = new House03(houseid,houseName);
		session.save(result);
		
		System.out.println("DAO Insert測試:"+houseid +":"+houseName);
		if (result == null) {
			result.setHouseid(houseid);
			result.setHousename(houseName);
			
			System.out.println("不得為空格");
			return result;
		}
		return null;
	}
	
	public boolean delete(int houseid) {
		Session session = sessionFactory.getCurrentSession();
		House03 result = session.get(House03.class, houseid);
		System.out.println("getId:"+result.getHouseid()+"getName:"+ result.getHousename());
		
		if (result != null) {
			session.delete(result);
			return true;
		}
		
		return false;
	}
	
}
