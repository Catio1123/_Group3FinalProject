package org.iii.group3.service.ad;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import javax.persistence.EntityManager;
import javax.transaction.Transactional;

import org.apache.jasper.tagplugins.jstl.core.When;
import org.iii.group3.persistent.dao.ad.RecordRepo;
import org.iii.group3.persistent.model.ad.Ad;
import org.iii.group3.persistent.model.ad.Record;
import org.iii.group3.persistent.model.ad.User;
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

	private Ad ad;

	public List<Record> listRecord(User user) {

		return recordRepo.findByUser(user);
	}

	public boolean findByAd(Ad ad) {

		 List<Record> a = recordRepo.findByAd(ad);
		 
		 if (a.isEmpty()) {
			return false;
		}
		 return true;
	}

	public void addOne(Ad ad, User user) {
		Ad ads = entityManager.find(Ad.class, ad.getId());
		User users = entityManager.find(User.class, user.getId());
		Record record = new Record();

		record.setAd(ads);
		record.setUser(users);
		record.setUrl(ads.getUrl());
		record.setAdClick(0);
		record.setBonus(0);
		recordRepo.save(record);

	}

	public void deleteByUserAndAd(User user, Ad ad) {
		recordRepo.deleteByUserAndAd(user, ad);
	}

	public Record select(User user, Ad ad) {
		Record findByUserAd = recordRepo.findByUserAndAd(user, ad);

		return findByUserAd;
	}

	public void addClicktime(Ad ad, User user, double clickTime) {

		select(user, ad).setAdClick(clickTime);

		recordRepo.save(select(user, ad));
	}

	public Integer sumClickByAd(Ad ad) {

		Integer i = recordRepo.getSumAdClickFindByAd(ad);

		return i;
	}
	
	public void addBonus(Ad ad, User user, double bonus) {

		select(user, ad).setBonus(bonus);

		recordRepo.save(select(user, ad));
	}
	
	public void deleteByAd(Ad ad) {
		recordRepo.deleteByAd(ad);
		
		
	}
}
