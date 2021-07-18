package org.iii.group3.transferdata.dto.podcaster;

import javax.validation.constraints.NotEmpty;

public class ChannelInfoDto {

	@NotEmpty(message = "{valid.error.notempty}")
	private String title;
	private String category;
	private String image;
	private String description;
	public String getTitle() {
		return title;
	}
	public String getCategory() {
		return category;
	}
	public String getImage() {
		return image;
	}
	public String getDescription() {
		return description;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	
	
}
