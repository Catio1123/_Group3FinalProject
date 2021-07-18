package org.iii.group3.transferdata.dto.podcaster;

public class ChannelCardDto {
	
	private Long id;
	private String title;
	private String image;
	private String category;
	private String description;
	private String podcaster;
	
	public Long getId() {
		return id;
	}
	public String getTitle() {
		return title;
	}
	public String getImage() {
		return image;
	}
	public String getCategory() {
		return category;
	}
	public String getDescription() {
		return description;
	}
	public String getPodcaster() {
		return podcaster;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public void setPodcaster(String podcaster) {
		this.podcaster = podcaster;
	}
	
	
}
