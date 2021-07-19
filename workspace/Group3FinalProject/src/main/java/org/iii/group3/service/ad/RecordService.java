package org.iii.group3.service.ad;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import javax.persistence.EntityManager;
import javax.transaction.Transactional;

import org.apache.jasper.tagplugins.jstl.core.When;
import org.iii.group3.persistent.dao.ad.AdRepo;
import org.iii.group3.persistent.dao.ad.RecordRepo;
import org.iii.group3.persistent.model.ad.Ad;
import org.iii.group3.persistent.model.ad.ClickTime;
import org.iii.group3.persistent.model.ad.Record;
import org.iii.group3.persistent.model.member.Member;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseCookie;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;


@Service
@Transactional
public class RecordService {

	@Autowired
	private RecordRepo recordRepo;

	@Autowired
	private EntityManager entityManager;

	@Autowired
	private AdRepo adRepo;
	
	@Autowired
	private ClickTimeService clickTimeService;
	

	public Record findByUserIdAndAdId(String account, Integer aid) {
		return recordRepo.findByUserIdAndAdId(account, aid);
	}
	
	public void deleteByActAndAdId(String account, Integer aid) {
		recordRepo.deleteByUserIdAndAdId(account, aid);
	}
	
	public void updateBonus(Integer aid) {
		
		List<Record> records = recordRepo.findByAdId(aid);
		Ad ad = adRepo.getById(aid);
		double totalAmount = ad.getSponsorshipAmount();
		double totalClick = ad.getAdTotalClick();
		
		for(Record record : records) {
			
			double recordBonus = totalAmount * record.getAdClick() / totalClick;
			record.setBonus(recordBonus);
			
			recordRepo.save(record);
			
		}
		
		
	}
	
	public List<Record> listRecord(String account) {

		return recordRepo.findByUserId(account);
	}

	public boolean findByAd(Ad ad) {

		 List<Record> a = recordRepo.findByAd(ad);
		 
		 if (a.isEmpty()) {
			return false;
		}
		 return true;
	}

	public void addOne(Ad ad, Member user) {
		Ad ads = entityManager.find(Ad.class, ad.getId());
		Record record = new Record();

		record.setAd(ads);
		record.setUser(user);
		record.setUrl(ads.getUrl());
		record.setAdClick(0L);
		record.setBonus(0);
		recordRepo.save(record);

	}

	public void deleteByUserAndAd(Member user, Ad ad) {
		recordRepo.deleteByUserAndAd(user, ad);
	}

	public Record select(Member user, Ad ad) {
		Record findByUserAd = recordRepo.findByUserAndAd(user, ad);

		return findByUserAd;
	}

	public void increaseClicktime(Integer aid, Long cid, Integer count) {

		ClickTime clickTime = clickTimeService.findById(aid, cid).get();
		
		Record record = clickTime.getRecord();
		
		record.setAdClick(record.getAdClick() + count);
		
		
		recordRepo.save(record);
	}

	public Integer sumClickByAd(Ad ad) {

		Integer i = recordRepo.getSumAdClickFindByAd(ad);

		return i;
	}
	
	public void addBonus(Ad ad, Member user, double bonus) {

		select(user, ad).setBonus(bonus);

		recordRepo.save(select(user, ad));
	}
	
	public void deleteByAd(Ad ad) {
		recordRepo.deleteByAd(ad);
		
		
	}
}
