package org.iii.group3.persistent.dao.podcaster;

import java.util.List;

import org.iii.group3.persistent.model.member.Member;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

public interface MemberJpaDao extends JpaRepository<Member, Integer>, JpaSpecificationExecutor<Member>{

	public Member findByAcctno(String act);
	
}
