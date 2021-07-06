package com.example.demo;

public class AdDto {

	private boolean enabled = true;
	
	private String title;
	private Long id;
	
	
	public AdDto(Ad ad) {
		super();
		this.ad = ad;
	}

	public boolean isEnabled() {
		return enabled;
	}

	public Ad getAd() {
		return ad;
	}

	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}

	public void setAd(Ad ad) {
		this.ad = ad;
	}
	
	
}
