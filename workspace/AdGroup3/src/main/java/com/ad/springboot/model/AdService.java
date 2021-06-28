package com.ad.springboot.model;

import java.util.Arrays;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
@SuppressWarnings("rawtypes")
public class AdService {

	@Autowired
	AdRepo adRepo;

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

	public void save(Ad adUpdate) {

		adRepo.save(adUpdate);
	}

	public void delete(Integer id) {
		adRepo.deleteById(id);
	}
}
