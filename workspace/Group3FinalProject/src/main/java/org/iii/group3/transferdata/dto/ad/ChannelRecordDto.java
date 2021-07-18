package org.iii.group3.transferdata.dto.ad;

public class ChannelRecordDto {
	
	private Integer id;
	private String company;
	private String text;
	private String url;
	private Long adClick;
	private double bonus;
	private String addAdToChannelUrl;
	private boolean enable = true;
	private String pictureString;
	public Integer getId() {
		return id;
	}
	public String getCompany() {
		return company;
	}
	public String getText() {
		return text;
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
	public String getAddAdToChannelUrl() {
		return addAdToChannelUrl;
	}
	public boolean isEnable() {
		return enable;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	public void setText(String text) {
		this.text = text;
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
	public void setAddAdToChannelUrl(String addAdToChannelUrl) {
		this.addAdToChannelUrl = addAdToChannelUrl;
	}
	public void setEnable(boolean enable) {
		this.enable = enable;
	}
	public String getPictureString() {
		return pictureString;
	}
	public void setPictureString(String pictureString) {
		this.pictureString = pictureString;
	}
	
	

}
