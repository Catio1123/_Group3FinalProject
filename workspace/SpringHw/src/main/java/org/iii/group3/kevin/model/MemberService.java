package org.iii.group3.kevin.model;

import java.util.Arrays;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;

@Service
@SuppressWarnings("rawtypes")
public class MemberService {
	
	@Autowired
	private MemberDao memberDao;
	
	public int insert(Member insertBean) {
		return memberDao.insert(insertBean);
	}


	public Member select(String acct) {
		return memberDao.select(acct);
	}


	public List<Member> selectAll() {
		return memberDao.selectAll();
	}


	public Member update(Member updateBean) {
		return memberDao.update(updateBean);
	}


	public boolean delete(String acctno) {
		return memberDao.delete(acctno);
	}
	
	public List queryByHql(String hql, List params) {
		return memberDao.queryByHql(hql, params);
	}

	public boolean updateExitTarget(Member updateBean, String acctno) {
		Member target = memberDao.select(acctno);
		  if(target != null) {
			  updateBean.setAcctno(acctno);
			  memberDao.update(updateBean);
			  return true;
		  }
		  
		 return false;
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
