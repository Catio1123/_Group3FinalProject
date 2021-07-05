package com.infotran.springboot.model;

import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.Clob;
import java.util.Base64;


import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.infotran.springboot.utils.SystemUtils;

@Entity
@Table(name = "Place_Spring")
public class Place {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long placeId;
	
	private Integer typeId;
	private String name;
	private String phone;
	private String address;
	private Double longitude;
	private Double latitude;
	private String link;
	private String mimeType;
	
	@JsonIgnore
	private Clob comment;
	@JsonIgnore
	private Blob picture;
	
	@Transient  // 短暫、臨時  告訴資料庫不用建立這個資料欄位
	private String pictureString; // data:image/gif;base64,......
	
	@Transient  
	private MultipartFile placeImage;
	
	public Place() {	
	}

	public Place(Integer typeId, String name, String phone, String address, Double longitude, Double latitude,
			String link, Clob comment, Blob picture, String mimeType) {
		this.typeId = typeId;
		this.name = name;
		this.phone = phone;
		this.address = address;
		this.longitude = longitude;
		this.latitude = latitude;
		this.link = link;
		this.comment = comment;
		this.picture = picture;
		this.mimeType = mimeType;
	}


	public String getMimeType() {
		return mimeType;
	}

	public void setMimeType(String mimeType) {
		this.mimeType = mimeType;
	}

	public String getPictureString() {
		return SystemUtils.blobToData(this.mimeType, this.picture);
////		data:[mimetype];base64,xxxxxxxxx
//		StringBuffer result = new StringBuffer("data:" + this.mimeType + ";base64,");
//		// StringBuffer比String常用的原因 => 因為string new完之後 會一直佔記憶體 
//		// 但StringBuffer只要一段時間沒使用了的話 會自行被清空
//		try (
//			InputStream is = this.picture.getBinaryStream();
//			ByteArrayOutputStream baos = new ByteArrayOutputStream();
//		){
//			int len = 0 ;
//			byte[] b = new byte[8192];
//			while((len = is.read(b)) != -1) {
//				baos.write(b, 0, len);
//			}
//			byte[] data = baos.toByteArray();
//			Base64.Encoder toEncode = Base64.getEncoder();	// Base64.encode == 編碼 Base64.decode == 解碼	
//			byte[] base64 = toEncode.encode(data); // 先編譯成base64 再轉成string
//			result.append(new String(base64, "UTF-8"));
////			result.append(Base64.getEncoder().encodeToString(data)); //直接編譯base64和轉成string 但是編碼不是utf-8
//			
//		}catch (Exception e) {
//			
//		}
//		return result.toString();
	}
	
	
	
	public MultipartFile getPlaceImage() {
		return placeImage;
	}

	public void setPlaceImage(MultipartFile placeImage) {
		this.placeImage = placeImage;
	}

	public void setPictureString(String pictureString) {
		this.pictureString = pictureString;
	}

	public Integer getTypeId() {
		return typeId;
	}

	public void setTypeId(Integer typeId) {
		this.typeId = typeId;
	}

	public Clob getComment() {
		return comment;
	}

	public void setComment(Clob comment) {
		this.comment = comment;
	}

	public Blob getPicture() {
		return picture;
	}

	public void setPicture(Blob picture) {
		this.picture = picture;
	}	
	
	public Long getPlaceId() {
		return placeId;
	}
	public void setPlaceId(Long placeId) {
		this.placeId = placeId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public Double getLongitude() {
		return longitude;
	}
	public void setLongitude(Double longitude) {
		this.longitude = longitude;
	}
	public Double getLatitude() {
		return latitude;
	}
	public void setLatitude(Double latitude) {
		this.latitude = latitude;
	}
	public String getLink() {
		return link;
	}
	public void setLink(String link) {
		this.link = link;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Place [placeId=");
		builder.append(placeId);
		builder.append(", name=");
		builder.append(name);
		builder.append(", phone=");
		builder.append(phone);
		builder.append(", address=");
		builder.append(address);
		builder.append(", longitude=");
		builder.append(longitude);
		builder.append(", latitude=");
		builder.append(latitude);
		builder.append(", link=");
		builder.append(link);
		builder.append("]");
		return builder.toString();
	}
	
	
}
