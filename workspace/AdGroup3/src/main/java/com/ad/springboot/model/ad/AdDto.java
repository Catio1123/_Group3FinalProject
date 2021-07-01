package com.ad.springboot.model.ad;

public class AdDto {
	private boolean enable = true;
	private Ad ad;

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
