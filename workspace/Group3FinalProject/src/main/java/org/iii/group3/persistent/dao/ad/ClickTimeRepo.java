package org.iii.group3.persistent.dao.ad;

import java.util.List;

import org.iii.group3.persistent.model.ad.Ad;
import org.iii.group3.persistent.model.ad.ClickTime;
import org.iii.group3.persistent.model.ad.ClickTimeKey;
import org.iii.group3.persistent.model.member.Member;
import org.iii.group3.persistent.model.podcaster.Channel;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;



@Repository
public interface ClickTimeRepo extends JpaRepository<ClickTime, ClickTimeKey> {

	
	@Query(" SELECT c FROM ClickTime c where c.ad = ?1")
	public List<ClickTime> findByAd(Ad ad);
	
	@Modifying
	@Query("DELETE FROM ClickTime c where c.ad=?1")
	public void deleteByAd(Ad ad);
	
	public List<ClickTime> findByChannelId(Long cid);
	
	public List<ClickTime> findByAdId(Integer adId);
	

}
