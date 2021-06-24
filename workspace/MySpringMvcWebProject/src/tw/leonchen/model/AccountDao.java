package tw.leonchen.model;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

@Repository("accountDao")
@Transactional
public class AccountDao {
	
	@Autowired @Qualifier("sessionFactory")
    private SessionFactory sessionFactory;
	
	public boolean checkLogin(Account users) {
		Session session = sessionFactory.getCurrentSession();
		
		String hqlstr = "from Account where username=:user and userpwd=:pwd";
		Query<Account> query = session.createQuery(hqlstr, Account.class);
		
		query.setParameter("user", users.getUsername());
		query.setParameter("pwd", users.getUserpwd());
		
		Account result = query.uniqueResult();
		
		if(result!=null) {
			return true;
		}
		
		return false;
		
	}
}
