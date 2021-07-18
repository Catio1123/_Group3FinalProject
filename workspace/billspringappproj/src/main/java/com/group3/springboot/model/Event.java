package com.group3.springboot.model;

import java.sql.Blob;
import java.sql.Clob;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.group3.springboot.utils.SystemUtils;


@Entity
@Table(name = "Event")
public class Event {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	Integer eventId;
	String topic;
	
//	@JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
	String date;
	
	String type;
	String mimeType;
	String link;
	String address;
	String intro;
	double longitude;
	double latitude;
	
	@JsonIgnore
	Clob content;
	
	@JsonIgnore
	Blob coverPicture;
	
	@Transient
	String pictureString;
	
	@Transient
	MultipartFile eventImage;

	
	public Event() {
	}
	
	public Event(String topic, String date, String type, String mimeType, String link,
			     Clob content, Blob coverPicture, String address, String intro, double longitude, 
			     double latitude) {
		super();
		this.topic = topic;
		this.date = date;
		this.type = type;
		this.mimeType = mimeType;
		this.link = link;
		this.content = content;
		this.coverPicture = coverPicture;
		this.address = address;
		this.intro = intro;
		this.longitude = longitude;
		this.latitude = latitude;
	}
	
	

	public double getLongitude() {
		return longitude;
	}

	public void setLongitude(double longitude) {
		this.longitude = longitude;
	}

	public double getLatitude() {
		return latitude;
	}

	public void setLatitude(double latitude) {
		this.latitude = latitude;
	}

	public String getIntro() {
		return intro;
	}

	public void setIntro(String intro) {
		this.intro = intro;
	}
	
	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Integer getEventId() {
		return eventId;
	}

	public String getTopic() {
		return topic;
	}

	public String getDate() {
		return date;
	}

	public String getType() {
		return type;
	}

	public String getMimeType() {
		return mimeType;
	}

	public String getLink() {
		return link;
	}

	public Clob getContent() {
		return content;
	}

	public Blob getCoverPicture() {
		return coverPicture;
	}

	//注意
	public String getPictureString() {
		return SystemUtils.blobToDataProtocol(mimeType, coverPicture);
	}

	public MultipartFile getEventImage() {
		return eventImage;
	}

	public void setEventId(Integer eventId) {
		this.eventId = eventId;
	}

	public void setTopic(String topic) {
		this.topic = topic;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public void setType(String type) {
		this.type = type;
	}

	public void setMimeType(String mimeType) {
		this.mimeType = mimeType;
	}

	public void setLink(String link) {
		this.link = link;
	}

	public void setContent(Clob content) {
		this.content = content;
	}

	public void setCoverPicture(Blob coverPicture) {
		this.coverPicture = coverPicture;
	}

	public void setPictureString(String pictureString) {
		this.pictureString = pictureString;
	}

	public void setEventImage(MultipartFile eventImage) {
		this.eventImage = eventImage;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Event [eventId=");
		builder.append(eventId);
		builder.append(", topic=");
		builder.append(topic);
		builder.append(", date=");
		builder.append(date);
		builder.append(", type=");
		builder.append(type);
		builder.append(", mimeType=");
		builder.append(mimeType);
		builder.append(", link=");
		builder.append(link);
		builder.append(", address=");
		builder.append(address);
		builder.append(", intro=");
		builder.append(intro);
		builder.append(", longitude=");
		builder.append(longitude);
		builder.append(", latitude=");
		builder.append(latitude);
		builder.append(", content=");
		builder.append(content);
		builder.append(", coverPicture=");
		builder.append(coverPicture);
		builder.append(", pictureString=");
		builder.append(pictureString);
		builder.append(", eventImage=");
		builder.append(eventImage);
		builder.append("]");
		return builder.toString();
	}

}
