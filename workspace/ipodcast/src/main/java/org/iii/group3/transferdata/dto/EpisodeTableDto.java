package org.iii.group3.transferdata.dto;

import java.sql.Timestamp;

import com.fasterxml.jackson.annotation.JsonFormat;

public class EpisodeTableDto {

	private Long id;
	
	private String title;
	
	@JsonFormat(pattern = "yyyy-MM-dd hh:mm:ss", timezone = "GMT+8")
	private Timestamp pubDate;

	public Long getId() {
		return id;
	}

	public String getTitle() {
		return title;
	}

	public Timestamp getPubDate() {
		return pubDate;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public void setPubDate(Timestamp pubDate) {
		this.pubDate = pubDate;
	}

	
	
}
