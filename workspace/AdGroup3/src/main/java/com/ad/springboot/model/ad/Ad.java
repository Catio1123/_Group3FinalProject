package com.ad.springboot.model.ad;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.DynamicUpdate;

import com.ad.springboot.model.clicktime.ClickTime;
import com.ad.springboot.model.user.User;

@Entity
@Table(name = "Ad")
public class Ad implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name = "ad_id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

	@Column(name = "company")
	private String company;
	@Column(name = "text")
	private String text;

	@Column(name = "company_id")
	private String companyId;

	@Column(name = "url")
	private String url;
	
	@Column(name = "ad_total_click")
	private Integer adTotalClick;

	@Column(name="sponsorship_amount")
	private Integer sponsorshipAmount;
	
	
	public Set<ClickTime> getClickTimes() {
		return clickTimes;
	}

	public void setClickTimes(Set<ClickTime> clickTimes) {
		this.clickTimes = clickTimes;
	}

	@OneToMany(mappedBy = "ad")
    private Set<ClickTime> clickTimes = new HashSet<>();
//	@Column(name = "url")
//	private String companyUrl;
	
//	public String getCompanyUrl() {
//		return companyUrl;
//	}
//
//	public void setCompanyUrl(String companyUrl) {
//		this.companyUrl = companyUrl;
//	}

	public Integer getSponsorshipAmount() {
		return sponsorshipAmount;
	}

	public void setSponsorshipAmount(Integer sponsorshipAmount) {
		this.sponsorshipAmount = sponsorshipAmount;
	}

	public Integer getAdTotalClick() {
		return adTotalClick;
	}

	public void setAdTotalClick(Integer adTotalClick) {
		this.adTotalClick = adTotalClick;
	}



	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getCompanyId() {
		return companyId;
	}

	public void setCompanyId(String companyId) {
		this.companyId = companyId;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getCompany() {
		return company;
	}

	public void setCompany(String company) {
		this.company = company;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public Ad(Integer id, String company, String text) {
		super();
		this.id = id;
		this.company = company;
		this.text = text;
	}

	public Ad() {
		super();
	}

	@Override
	public String toString() {
		return "Ad [id=" + id + ", supplier=" + company + ", text=" + text + "]";
	}

}
