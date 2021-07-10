package org.iii.group3.persistent.dao.ad;

public class ClickTimeDto {
	private Integer aid;
	private Integer uid;
	private String text;
	private String url;
	private String pictureString;
	private String clickControUrl;
	private String recordControUrl;
	private String adControUrl;

	public String getClickControUrl() {
		return clickControUrl;
	}

	public void setClickControUrl(String clickControUrl) {
		this.clickControUrl = clickControUrl;
	}

	public String getRecordControUrl() {
		return recordControUrl;
	}

	public void setRecordControUrl(String recordControUrl) {
		this.recordControUrl = recordControUrl;
	}

	public String getAdControUrl() {
		return adControUrl;
	}

	public void setAdControUrl(String adControUrl) {
		this.adControUrl = adControUrl;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getPictureString() {
		return pictureString;
	}

	public void setPictureString(String pictureString) {
		this.pictureString = pictureString;
	}

	public Integer getAid() {
		return aid;
	}

	public void setAid(Integer aid) {
		this.aid = aid;
	}

	public Integer getUid() {
		return uid;
	}

	public void setUid(Integer uid) {
		this.uid = uid;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	
}
