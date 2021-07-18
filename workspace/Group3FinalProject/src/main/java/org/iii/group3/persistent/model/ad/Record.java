package org.iii.group3.persistent.model.ad;

import java.math.BigDecimal;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.iii.group3.persistent.model.member.Member;



@Entity
@Table(name = "Ad_Record")
public class Record {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	
	@Column(name = "user_id", insertable = false, updatable = false)
	private String userId;
	
	@Column(name = "ad_id", insertable = false, updatable = false)
	private Integer adId;
	
	@Column(name="url")
	private String url;
	
	@Column(name="ad_click")
	private Long adClick = 0L;
	
	@Column(name="bonus")
	private double bonus;


	@OneToOne(mappedBy = "record", cascade = CascadeType.REMOVE)
	private ClickTime clickTime;
	
	@ManyToOne()
	@JoinColumn(name="ad_id")
	private Ad ad;
	
	@ManyToOne
	@JoinColumn(name="user_id")
	private Member user;

	public Integer getId() {
		return id;
	}

	public String getUserId() {
		return userId;
	}

	public Integer getAdId() {
		return adId;
	}

	public String getUrl() {
		return url;
	}

	public Long getAdClick() {
		return adClick;
	}

	public double getBonus() {
		return bonus;
	}

	public ClickTime getClickTime() {
		return clickTime;
	}

	public Ad getAd() {
		return ad;
	}

	public Member getUser() {
		return user;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public void setAdId(Integer adId) {
		this.adId = adId;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public void setAdClick(Long adClick) {
		this.adClick = adClick;
	}

	public void setBonus(double bonus) {
		this.bonus = bonus;
	}

	public void setClickTime(ClickTime clickTime) {
		this.clickTime = clickTime;
	}

	public void setAd(Ad ad) {
		this.ad = ad;
	}

	public void setUser(Member user) {
		this.user = user;
	}
	
	
}
