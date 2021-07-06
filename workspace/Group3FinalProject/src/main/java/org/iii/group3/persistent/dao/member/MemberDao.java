package org.iii.group3.persistent.dao.member;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;

import org.hibernate.Session;
import org.hibernate.query.Query;
import org.iii.group3.persistent.model.member.Member;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.util.StringUtils;



@Repository("memberDao")
public class MemberDao {
	
	@Autowired 
	private EntityManager en;
	
//================================= 帳號登入 =================================
	
	public Member checkLogin(Member member) {
		Member login = null;
		
		String hqlstr = "from Member where acctno=:acctno and pw=:pw";
		try {
			login = en.createQuery(hqlstr, Member.class).
														setParameter("acctno",member.getAcctno()).
														setParameter("pw",member.getPw()).
														getSingleResult();
		} catch (Exception e) {
			return login;
		}
		
		
				
		return login;
		
	}	

//================================= 查詢全部 =================================	boot

	@SuppressWarnings("unchecked") //程式不確定你傳回的型別
	public List<Member> findAll() {
		String hql = "From Member";
		return en.createQuery(hql).getResultList();
	}
	
//================================= 查詢單筆 =================================boot
	
	public Member findByAcct(String acctno) {
		
		return en.find(Member.class, acctno);
	}

//================================= 模糊查詢 =================================boot
	
		@SuppressWarnings("unchecked")
		public List<Member> findByName(String name) {
			String hql = "From Member WHERE name = :name";	
			return en.createQuery(hql)
			         .setParameter("name", name)
			         .getResultList();
			
		}
		
//================================= 新增 ====================================boot
		
		public int save(Member member) {
			
			int n = 0;
			boolean exist = isMemberExist(member);
			if (exist) {
				return -1;
			}
			try {
				en.persist(member);

				n = 1;
			} catch (Exception e) {
				n = -2;
				System.out.println("有Exception");
			}
			return n;
		}
//================================= 新增時帳號重複 ====================================boot
		
		public boolean isMemberExist(Member member) {
			boolean exist = false;
			String hql = "FROM Member m WHERE m.acctno=:acctno";
			try {
				en.createQuery(hql).setParameter("acctno", member.getAcctno()).getSingleResult();
				exist = true;
			} catch (NoResultException ex) {
				;
			}
			return exist;
		}
	
//================================= 修改 =================================
			
	public void update(Member member) {
		en.merge(member);
	}
	
//================================= 刪除 =================================
			
	public void delete(Member member) {
		en.remove(member);
//		Session session = en.unwrap(Session.class);
//
//		Member member = session.get(Member.class, acctno);
//		if (member != null) {
//			session.delete(member);
//			return true;
//		}
//		return false;
	}
//================================= 帳號檢查 =================================
	
	public String checkMemberAcctno(String memberAcctno) {
		Session session = en.unwrap(Session.class);
		String hql = "FROM Member m WHERE acctno = :acctno";
		String acctno = "";
		try {
			Member m = (Member) session.createQuery(hql).setParameter("acctno", memberAcctno).getSingleResult();
			acctno = m.getAcctno();
		} catch (NoResultException ex) {
			;
		} catch (Exception ex) {
			ex.printStackTrace();
			System.out.println(ex.getMessage());
			acctno = "Error: 資料庫異常，請檢查資料庫";
		}
		return acctno;
	}

	
	@SuppressWarnings("rawtypes")
	public List queryByHql(String hql, List params) {
		Session session = en.unwrap(Session.class);
		
		
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
