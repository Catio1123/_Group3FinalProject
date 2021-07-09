package org.iii.group3.persistent.model.ad;

import java.io.Serializable;
import java.math.BigDecimal;
import java.sql.Blob;
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
import javax.persistence.Transient;

import org.hibernate.annotations.DynamicUpdate;
import org.iii.group3.utils.ad.AdSystemUtils;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonIgnore;

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
	private double adTotalClick;

	@Column(name = "sponsorship_amount")
	private double sponsorshipAmount;

	@Column(name = "mime_type")
	String mimeType;

	@JsonIgnore
	@Column(name = "picture")
	Blob picture;

	@Transient // 短暫. 臨時 Persistence: 永續儲存
	String pictureString; // data:image/gif;base64,.....

	@Transient
	MultipartFile placeImage;
	
	
	public String getPictureString() {
		return AdSystemUtils.blobToDataProtocol(mimeType, picture);
	}

	public void setPictureString(String pictureString) {
		this.pictureString = pictureString;
	}

	public MultipartFile getPlaceImage() {
		return placeImage;
	}

	public void setPlaceImage(MultipartFile placeImage) {
		this.placeImage = placeImage;
	}

	public String getMimeType() {
		return mimeType;
	}

	public void setMimeType(String mimeType) {
		this.mimeType = mimeType;
	}

	public Blob getPicture() {
		return picture;
	}

	public void setPicture(Blob picture) {
		this.picture = picture;
	}

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

	public double getSponsorshipAmount() {
		return sponsorshipAmount;
	}

	public void setSponsorshipAmount(double sponsorshipAmount) {
		this.sponsorshipAmount = sponsorshipAmount;
	}

	public double getAdTotalClick() {
		return adTotalClick;
	}

	public void setAdTotalClick(double adTotalClick) {
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
