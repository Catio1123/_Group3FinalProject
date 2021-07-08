package org.iii.group3.service.ad;

import java.util.Arrays;

import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.hibernate.annotations.DynamicUpdate;
import org.iii.group3.persistent.dao.ad.AdRepo;
import org.iii.group3.persistent.dao.ad.ClickTimeRepo;
import org.iii.group3.persistent.dao.ad.RecordRepo;
import org.iii.group3.persistent.model.ad.Ad;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
@Transactional
public class AdService {

	@Autowired
	AdRepo adRepo;

	@Autowired
	ClickTimeRepo clickTimeRepo;
	
	@Autowired
	 RecordRepo recordRepo;


	public Ad select(Integer id) {
		Optional<Ad> ad = adRepo.findById(id);
		Ad selectAd = new Ad();

		if (ad.isPresent()) {
			selectAd = ad.get();
		}
		return selectAd;
	}

	public List<Ad> selectAll() {
		List<Ad> ad = adRepo.findAll();
		return ad;
	}

	public void save(Ad ad, String cid) {
		ad.setCompanyId(cid);
		ad.setAdTotalClick(0);
		adRepo.save(ad);
	}

	public void delete(Integer id) {
		
		adRepo.deleteById(id);
	}

	public List<Ad> selectByCompanyId(String cid) {
		List<Ad> findByCompanyId = adRepo.findByCompanyId(cid);
		return findByCompanyId;

	}

	public void update(Ad adupdate, Integer aid) {
		Optional<Ad> ad = adRepo.findById(aid);

		Ad ads = ad.get();
		ads.setText(adupdate.getText());
		ads.setUrl(adupdate.getUrl());
		ads.setSponsorshipAmount(adupdate.getSponsorshipAmount());

//		System.out.println(adDto.toString());
//		System.out.println(ads);
//		
		adRepo.save(ads);
	}

	public void updateClick(Integer aid, Integer totalClick) {
		Optional<Ad> ad = adRepo.findById(aid);

		Ad ads = ad.get();
		ads.setAdTotalClick(totalClick);
		adRepo.save(ads);
	}
}
