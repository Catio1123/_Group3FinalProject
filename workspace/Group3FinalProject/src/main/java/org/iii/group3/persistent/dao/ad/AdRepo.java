package org.iii.group3.persistent.dao.ad;

import java.util.List;

import org.iii.group3.persistent.model.ad.Ad;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;


@Repository
public interface AdRepo extends JpaRepository<Ad, Integer>{
	
	
	@Query(" SELECT a FROM Ad a where a.companyId = ?1")
	public List<Ad> findByCompanyId(String cid);

}
