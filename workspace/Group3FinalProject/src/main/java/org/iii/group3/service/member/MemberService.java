package org.iii.group3.service.member;

import java.util.Arrays;
import java.util.List;
import java.util.Map;

import javax.transaction.Transactional;

import org.iii.group3.persistent.dao.member.MemberDao;
import org.iii.group3.persistent.model.member.Member;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;

@Service
@Transactional
@SuppressWarnings("rawtypes")
public class MemberService {
	
	@Autowired
	private MemberDao memberDao;

	

//================================= 查詢全部 =================================	boot

	public List<Member> findAll() {
		
		return memberDao.findAll();
	}
//================================= 查詢單筆 =================================boot
	
	public Member findByAcct(String acctno) {
		
		return memberDao.findByAcct(acctno);
	}
	
//================================= 查詢單筆(id) =================================boot
	
		public Member findById(int id) {
			return memberDao.findById(id);
		}
	
//================================= 模糊查詢 =================================	boot
	public List<Member> findByName(String name) {
		return memberDao.findByName(name);
	}
	
//================================= 新增 ====================================	boot
	
	public int save(Member member) {
		return memberDao.save(member);
	}

//================================= 修改 ====================================boot

	public void update(Member member) {
		 memberDao.update(member);
	}
	
	
	public void update(Member member,int id) {
			 memberDao.update(member);
	}

//================================= 刪除 =================================

	public void delete(Member member) {
		memberDao.delete(member);
	}
	
	public List queryByHql(String hql, List params) {
		return memberDao.queryByHql(hql, params);
	}

//	public boolean updateExitTarget(Member updateBean, String acctno) {
//		Member target = memberDao.select(acctno);
//		  if(target != null) {
//			  updateBean.setAcctno(acctno);
//			  memberDao.update(updateBean);
//			  return true;
//		  }
//		  
//		 return false;
//	}
//================================= 檢查帳號是否存在 =================================
	public String checkMemberAcctno(String memberAcctno) {
		return memberDao.checkMemberAcctno(memberAcctno);
	}
	
	public boolean checkIfExist(Map<String, String> jsonMap) throws JsonMappingException, JsonProcessingException {
		
		String hql = "from Member where "+ jsonMap.get("acctno") + " = ?0";
		List result = queryByHql(hql, Arrays.asList(jsonMap.get("field")));
		
		if(result.size() == 0) {
			return true;
		}
		return false;
	}


}
