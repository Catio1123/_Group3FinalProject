package org.iii.group3.service.ad;

import java.util.List;
import java.util.Optional;

import javax.persistence.EntityManager;
import javax.transaction.Transactional;

import org.iii.group3.persistent.dao.ad.AdRepo;
import org.iii.group3.persistent.dao.ad.ClickTimeRepo;
import org.iii.group3.persistent.model.ad.Ad;
import org.iii.group3.persistent.model.ad.ClickTime;
import org.iii.group3.persistent.model.ad.ClickTimeKey;
import org.iii.group3.persistent.model.ad.Record;
import org.iii.group3.persistent.model.member.Member;
import org.iii.group3.persistent.model.podcaster.Channel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
@Transactional
public class ClickTimeService {

	@Autowired
	ClickTimeRepo clickTimeRepo;

	@Autowired
	AdRepo adRepo;
	
	
	public boolean isExistById(Long cid, Integer aid) {
		return findById(aid, cid).isPresent();
	}
	
	public List<ClickTime> findByAdId(Integer adId){
		return clickTimeRepo.findByAdId(adId);
	}
	
	public void addOne(Ad ad, Channel channel, Record record) {
		Ad ads = adRepo.getById(ad.getId());
		ClickTime clickTime = new ClickTime();
		clickTime.setAd(ad);
		clickTime.setChannel(channel);;
		clickTime.setRecord(record);
		clickTimeRepo.save(clickTime);

	}

	public List<ClickTime> seletAllClickTimes(){
		List<ClickTime> findAll = clickTimeRepo.findAll();
		return findAll;
	}
	
	public List<ClickTime> findByChannelId(Long channelId) {

		return clickTimeRepo.findByChannelId(channelId);
	}
	
	public void  increaseClickTime(Integer aid, Long cid, Integer count) {
		
		Optional<ClickTime> optionalClickTime = findById(aid, cid);
		if(optionalClickTime.isPresent()) {
			ClickTime clickTime = optionalClickTime.get();
			clickTime.setClickTimeCount(clickTime.getClickTimeCount() + count);
			clickTimeRepo.save(clickTime);
		}
	}
	
	public Optional<ClickTime> findById(Integer aid, Long cid) {
		
		Optional<ClickTime> findByUserAd = clickTimeRepo.findById(new ClickTimeKey(cid, aid));
		
		return findByUserAd;
	}
	
	public void deleteByAd(Ad ad) {
		
		clickTimeRepo.deleteByAd(ad);
	}
	
	public boolean findByAd(Ad ad) {

		 List<ClickTime> a = clickTimeRepo.findByAd(ad);
		 
		 if (a.isEmpty()) {
			return false;
		}
		 return true;
	}
	
	public void deleteById(int aid, Long cid) {
		
		clickTimeRepo.deleteById(new ClickTimeKey(cid, aid));
	}
	
	
}
