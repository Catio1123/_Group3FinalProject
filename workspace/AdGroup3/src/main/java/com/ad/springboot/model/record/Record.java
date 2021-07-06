package com.ad.springboot.model.record;

import java.math.BigDecimal;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import com.ad.springboot.model.ad.Ad;
import com.ad.springboot.model.user.User;

@Entity
@Table(name = "Ad_Record")
public class Record {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	
	@ManyToOne(cascade =  CascadeType.REMOVE)
	@JoinColumn(name="ad_id")
	private Ad ad;
	
	@ManyToOne
	@JoinColumn(name="user_id")
	private User user;
	
	
	@Column(name="url")
	private String url;
	
	@Column(name="ad_click")
	private double adClick;
	
	@Column(name="bonus")
	private double bonus;

	@Transient
	private boolean enable = true;
	
	public boolean isEnable() {
		return enable;
	}

	public void setEnable(boolean enable) {
		this.enable = enable;
	}

	public double getBonus() {
		return bonus;
	}

	public void setBonus(double bonus) {
		this.bonus = bonus;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Ad getAd() {
		return ad;
	}

	public void setAd(Ad ad) {
		this.ad = ad;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}



	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	

	public double getAdClick() {
		return adClick;
	}

	public void setAdClick(double adClick) {
		this.adClick = adClick;
	}

	public Record() {
		super();
	}
	
	
}
