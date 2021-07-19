package org.iii.group3.transferdata.dto.ad;

public class PodcasterAdDto {

	private Integer id;
	
	private String company;
	
	private String text;
	
	private String url;
	
	private String recordUrl = "/ipodcast/logged/podcaster/record";

	private boolean enable = true;

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

	public String getRecordUrl() {
		return recordUrl;
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

	public void setRecordUrl(String recordUrl) {
		this.recordUrl = recordUrl;
	}

	public void setEnable(boolean enable) {
		this.enable = enable;
	}

	
	
}
