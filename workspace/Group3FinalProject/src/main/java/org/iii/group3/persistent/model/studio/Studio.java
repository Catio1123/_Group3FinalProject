package org.iii.group3.persistent.model.studio;

import java.sql.Blob;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.iii.group3.utils.studio.SystemUtils;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name = "Studio_Springboot")
public class Studio {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)

	Integer id;
	String name;
	String location;
	String fee;
	
	
	
	String mimeType;

	@JsonIgnore
	Blob picture;
	@Transient
	String pictureString;
	
	@Transient
	MultipartFile studioImage;
	
	public Studio(){
		
	}


	public Studio(String name, String location, String fee, Blob blob, String mimeType) {
		super();
		
		this.name = name;
		this.location = location;
		this.fee = fee;
		this.picture = blob;
		this.mimeType = mimeType;
	}


	public Integer getId() {
		return id;
	}


	public String getName() {
		return name;
	}


	public String getLocation() {
		return location;
	}


	public String getFee() {
		return fee;
	}


	public String getMimeType() {
		return mimeType;
	}


	public Blob getPicture() {
		return picture;
	}


	public String getPictureString() {
		return SystemUtils.blobToDataProtocol(mimeType, picture);
	}


	public MultipartFile getStudioImage() {
		return studioImage;
	}


	public void setId(Integer id) {
		this.id = id;
	}


	public void setName(String name) {
		this.name = name;
	}


	public void setLocation(String location) {
		this.location = location;
	}


	public void setFee(String fee) {
		this.fee = fee;
	}


	public void setMimeType(String mimeType) {
		this.mimeType = mimeType;
	}


	public void setPicture(Blob picture) {
		this.picture = picture;
	}


	public void setPictureString(String pictureString) {
		this.pictureString = pictureString;
	}


	public void setStudioImage(MultipartFile studioImage) {
		this.studioImage = studioImage;
	}

	
	
}
