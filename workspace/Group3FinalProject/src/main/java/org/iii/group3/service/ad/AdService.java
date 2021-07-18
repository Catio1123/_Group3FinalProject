package org.iii.group3.service.ad;

import java.io.File;
import java.io.InputStream;

import java.sql.Blob;
import java.util.Arrays;

import java.util.List;
import java.util.Optional;

import javax.servlet.ServletContext;
import javax.transaction.Transactional;

import org.hibernate.annotations.DynamicUpdate;
import org.hibernate.internal.build.AllowSysOut;
import org.iii.group3.persistent.dao.ad.AdRepo;
import org.iii.group3.persistent.dao.ad.ClickTimeRepo;
import org.iii.group3.persistent.dao.ad.RecordRepo;
import org.iii.group3.persistent.model.ad.Ad;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import org.iii.group3.utils.ad.AdSystemUtils;

@Service
@Transactional
public class AdService {

	@Autowired
	AdRepo adRepo;

	@Autowired
	ClickTimeRepo clickTimeRepo;

	@Autowired
	RecordService recordService;

	@Autowired
	ServletContext context;

	
	public void updateClickTime(Integer aid) {
		
		Ad ad = adRepo.getById(aid);
		Integer totalClick = recordService.sumClickByAd(ad);
		updateClick(aid, totalClick);
		
	}
	
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
		Blob blob = null;
		String mimeType = "";
		String name = "";
		MultipartFile placeImage = ad.getPlaceImage();
		try {
			InputStream is = placeImage.getInputStream();
			name = placeImage.getOriginalFilename();
			blob = AdSystemUtils.inputStreamToBlob(is);
			mimeType = context.getMimeType(name);
			ad.setPicture(blob);
			ad.setMimeType(mimeType);
		} catch (Exception e) {
			e.printStackTrace();
		}
		ad.setCompanyId(cid);
		ad.setAdTotalClick(0);
		String ext = AdSystemUtils.getExtFilename(name);
		// 將上傳的檔案移到指定的資料夾, 目前註解此功能
		try {
			File imageFolder = new File(AdSystemUtils.PLACE_IMAGE_FOLDER);
			if (!imageFolder.exists())
				imageFolder.mkdirs();
			File file = new File(imageFolder, "MemberImage_" + ad.getId() + ext);
			placeImage.transferTo(file);
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
		}

		adRepo.save(ad);
	}

	public void delete(Integer id) {

		adRepo.deleteById(id);
	}

	public List<Ad> selectByCompanyId(String cid) {
		List<Ad> findByCompanyId = adRepo.findByCompanyId(cid);
		return findByCompanyId;

	}

	public void update(Ad ad, String cid) {
//		Optional<Ad> ad = adRepo.findById(aid);
//
//		Ad ads = ad.get();
		
		Optional<Ad> aa = adRepo.findById(ad.getId());
		Ad ad2 = aa.get();
		Blob blob = null;
		String mimeType = "";
		String name = "";
		MultipartFile placeImage = ad.getPlaceImage();
		if (placeImage != null && placeImage.getSize() > 0) {
			try {
				InputStream is = placeImage.getInputStream();
				name = placeImage.getOriginalFilename();
				blob = AdSystemUtils.inputStreamToBlob(is);
				mimeType = context.getMimeType(name);
				ad.setPicture(blob);
				ad.setMimeType(mimeType);

				String ext = AdSystemUtils.getExtFilename(name);
				// 將上傳的檔案移到指定的資料夾, 目前註解此功能
				try {
					File imageFolder = new File(AdSystemUtils.PLACE_IMAGE_FOLDER);
					if (!imageFolder.exists())
						imageFolder.mkdirs();
					File file = new File(imageFolder, "MemberImage_" + ad.getId() + ext);
					placeImage.transferTo(file);
				} catch (Exception e) {
					e.printStackTrace();
					throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
				}

			} catch (Exception e) {
				e.printStackTrace();
			}

		}else {
			ad.setPicture(ad2.getPicture());
			ad.setMimeType(ad2.getMimeType());
		}
		ad.setCompanyId(cid);
		ad.setText(ad.getText());
		ad.setUrl(ad.getUrl());
		ad.setSponsorshipAmount(ad.getSponsorshipAmount());

//		System.out.println(adDto.toString());
//		System.out.println(ads);
//		
		adRepo.save(ad);
	}

	public void updateClick(Integer aid, Integer totalClick) {
		Optional<Ad> ad = adRepo.findById(aid);

		Ad ads = ad.get();
		ads.setAdTotalClick(totalClick);
		adRepo.save(ads);
	}
}
