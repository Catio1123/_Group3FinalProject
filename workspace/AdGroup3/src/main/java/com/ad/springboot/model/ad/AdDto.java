package com.ad.springboot.model.ad;

public class AdDto {
	private boolean enable = true;
	private Ad ad;
//	private String company;
//	private String text;
//	private String url;
//	private Integer sponsorshipAmount;

//	public String getCompany() {
//		return company;
//	}
//
//	public void setCompany(String company) {
//		this.company = company;
//	}
//
//	public String getText() {
//		return text;
//	}
//
//	public void setText(String text) {
//		this.text = text;
//	}
//
//	public String getUrl() {
//		return url;
//	}
//
//	public void setUrl(String url) {
//		this.url = url;
//	}

//	public Integer getSponsorshipAmount() {
//		return sponsorshipAmount;
//	}
//
//	public void setSponsorshipAmount(Integer sponsorshipAmount) {
//		this.sponsorshipAmount = sponsorshipAmount;
//	}

	public AdDto(Ad ad) {
		super();
		this.ad = ad;
	}

	public boolean isEnable() {
		return enable;
	}

	public void setEnable(boolean enable) {
		this.enable = enable;
	}

	public Ad getAd() {
		return ad;
	}

	public void setAd(Ad ad) {
		this.ad = ad;
	}


	
}
