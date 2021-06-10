package org.iii.group3.kevin.model;

import java.util.List;

import javax.transaction.Transactional;


import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;
import org.springframework.util.StringUtils;

@Repository("memberDao")
@Transactional
public class MemberDao {
	
	@Autowired @Qualifier("sessionFactory")
	private SessionFactory sessionFactory;
	
//================================= 新增 =================================

	public int insert(Member insertBean) {
		Session session = sessionFactory.getCurrentSession();
		session.save(insertBean);
		return 1;
		
	}
	
//================================= 查詢單筆 =================================

	public Member select(String acct) {
		Session session = sessionFactory.getCurrentSession();
		return session.get(Member.class, acct);
		 
	}
	
//================================= 查詢全部 =================================	
	
	public List<Member> selectAll() {
		Session session = sessionFactory.getCurrentSession();
		String hql = "from Member";
		Query<Member> query = session.createQuery(hql, Member.class);
		List<Member> result = query.list();
		return result;
	}
	
//================================= 修改 =================================
			
	public Member update(Member updateBean) {
		Session session = sessionFactory.getCurrentSession();
		return (Member)session.merge(updateBean);

	}
	
//================================= 刪除 =================================
			
	public boolean delete(String acctno) {
		Session session = sessionFactory.getCurrentSession();

		Member resultBean = session.get(Member.class, acctno);
		if (resultBean != null) {
			session.delete(resultBean);
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
