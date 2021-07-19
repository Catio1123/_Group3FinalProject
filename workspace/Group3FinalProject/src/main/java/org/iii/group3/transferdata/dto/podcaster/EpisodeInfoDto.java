package org.iii.group3.transferdata.dto.podcaster;

import javax.validation.constraints.NotEmpty;

public class EpisodeInfoDto {
	@NotEmpty(message = "{valid.error.notempty}")
	private String title;
	private String description;
	
	@NotEmpty(message = "{valid.error.notempty}")
	private String epFile;

	public String getTitle() {
		return title;
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



	public void setDescription(String description) {
		this.description = description;
	}

	public void setEpFile(String epFile) {
		this.epFile = epFile;
	}
	
	
	

}
