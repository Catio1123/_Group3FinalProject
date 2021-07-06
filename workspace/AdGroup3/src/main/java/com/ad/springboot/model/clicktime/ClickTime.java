package com.ad.springboot.model.clicktime;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.MapsId;
import javax.persistence.Table;

import com.ad.springboot.model.ad.Ad;
import com.ad.springboot.model.user.User;

@Entity
@Table(name="Ad_Clicktime")
public class ClickTime {

	@EmbeddedId
	private ClickTimeKey id;
	
	@ManyToOne
	@MapsId("userId")
	@JoinColumn(name="user_id")
	private User user;
	
	
	@ManyToOne
	@MapsId("adId")
	@JoinColumn(name="ad_id")
	private Ad ad;
	
	@Column(name="click_time")
	private double clickTimeCount;

	public ClickTimeKey getId() {
		return id;
	}

	public void setId(ClickTimeKey id) {
		this.id = id;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Ad getAd() {
		return ad;
	}

	public void setAd(Ad ad) {
		this.ad = ad;
	}

	public double getClickTimeCount() {
		return clickTimeCount;
	}

	public void setClickTimeCount(double clickTimeCount) {
		this.clickTimeCount = clickTimeCount;
	}
	
	
}
