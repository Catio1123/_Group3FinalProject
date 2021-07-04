package com.ad.springboot.model.clicktime;

import java.util.List;

import org.springframework.data.jdbc.repository.query.Modifying;
import org.springframework.data.jdbc.repository.query.Query;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.ad.springboot.model.ad.Ad;
import com.ad.springboot.model.record.Record;
import com.ad.springboot.model.user.User;

@Repository
public interface ClickTimeRepo extends JpaRepository<ClickTime, ClickTimeKey> {

	
	
	
	@Query(" SELECT c FROM ClickTime c where c.user = ?1")
	public List<ClickTime> findByUser(User user);
	
	
	@Query(" SELECT c FROM ClickTime c where c.user =?1 and c.ad=?2")
	public ClickTime findByUserAndAd(User user, Ad ad );
}
