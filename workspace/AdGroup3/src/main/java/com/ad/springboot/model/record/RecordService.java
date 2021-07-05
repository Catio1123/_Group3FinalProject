package com.ad.springboot.model.record;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import javax.persistence.EntityManager;
import javax.transaction.Transactional;

import org.apache.jasper.tagplugins.jstl.core.When;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseCookie;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import com.ad.springboot.model.ad.Ad;
import com.ad.springboot.model.clicktime.ClickTime;
import com.ad.springboot.model.user.User;

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

	public List<Record> adListRecord(User user) {

		return recordRepo.findByAd(ad);
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

	public void delete(Integer id) {
		recordRepo.deleteById(id);
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
}
