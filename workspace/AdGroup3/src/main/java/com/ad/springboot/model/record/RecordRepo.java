package com.ad.springboot.model.record;

import java.util.List;

import org.springframework.data.jdbc.repository.query.Query;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.ad.springboot.model.ad.Ad;
import com.ad.springboot.model.clicktime.ClickTime;
import com.ad.springboot.model.user.User;

@Repository
public interface RecordRepo extends JpaRepository<Record, Integer>{

	
	public List<Record> findByUser(User user);
	
	public List<Record> findByAd(Ad ad);
	

	
	@Query(" SELECT r FROM Record r where r.user =?1 and r.ad=?2")
	public Record findByUserAndAd(User user, Ad ad );
	
}
