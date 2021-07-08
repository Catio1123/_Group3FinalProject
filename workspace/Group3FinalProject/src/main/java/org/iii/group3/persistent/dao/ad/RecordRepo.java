package org.iii.group3.persistent.dao.ad;

import java.util.List;
import java.util.Map;

import javax.transaction.Transactional;

import org.iii.group3.persistent.model.ad.Ad;
import org.iii.group3.persistent.model.ad.Record;
import org.iii.group3.persistent.model.ad.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface RecordRepo extends JpaRepository<Record, Integer>{

	
	public List<Record> findByUser(User user);
	
	public List<Record> findByAd(Ad ad);
	

	
	@Query(" SELECT r FROM Record r where r.user =?1 and r.ad=?2")
	public Record findByUserAndAd(User user, Ad ad );
	
	
	@Query(" SELECT SUM(r.adClick)   FROM Record r where r.ad=?1")
	public Integer getSumAdClickFindByAd(Ad ad);
	
	@Modifying
	@Query("DELETE FROM Record r where r.ad=?1 ")
	public void deleteByAd(Ad ad);
	
	@Modifying
	@Query("DELETE FROM Record r where r.user=?1 and r.ad=?2")
	public void deleteByUserAndAd(User user , Ad ad);
}
