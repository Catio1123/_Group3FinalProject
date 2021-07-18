package org.iii.group3.transferdata.dto.podcaster;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class PodcastEpDto {

	private String title;
	
	@JsonFormat(pattern = "yyyy/MM/dd", timezone = "GMT+8")
	private Date pubDate;
	
	private String description;

	private String epFile;

	public String getTitle() {
		return title;
	}

	public Date getPubDate() {
		return pubDate;
	}

	public String getDescription() {
		return description;
	}

	public String getEpFile() {
		return epFile;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public void setPubDate(Date pubDate) {
		this.pubDate = pubDate;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public void setEpFile(String epFile) {
		this.epFile = epFile;
	}
	
	
	
}
