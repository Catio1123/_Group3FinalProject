package com.ad.springboot.model.ad;

import java.util.List;

import org.springframework.data.jdbc.repository.query.Query;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.ad.springboot.model.clicktime.ClickTime;
import com.ad.springboot.model.user.User;

@Repository
public interface AdRepo extends JpaRepository<Ad, Integer>{
	
	
	@Query(" SELECT a FROM Ad a where a.companyId = ?1")
	public List<Ad> findByCompanyId(Integer cid);

}
