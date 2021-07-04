package com.ad.springboot.model.record;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.ad.springboot.model.ad.Ad;
import com.ad.springboot.model.user.User;

@Entity
@Table(name = "Ad_Record")
public class Record {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	
	@ManyToOne
	@JoinColumn(name="ad_id")
	private Ad ad;
	
	@ManyToOne
	@JoinColumn(name="user_id")
	private User user;
	
	
	@Column(name="url")
	private String url;
	
	@Column(name="ad_click")
	private Integer adClick;
	
	@Column(name="bonus")
	private Integer bonus;

	public Integer getBonus() {
		return bonus;
	}

	public void setBonus(Integer bonus) {
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

	

	public Integer getAdClick() {
		return adClick;
	}

	public void setAdClick(Integer adClick) {
		this.adClick = adClick;
	}

	public Record() {
		super();
	}
	
	
}
