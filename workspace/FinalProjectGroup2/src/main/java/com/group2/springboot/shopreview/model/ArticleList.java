package com.group2.springboot.shopreview.model;

import java.sql.Blob;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.group2.springboot.utils.SystemUtils;

@Entity
@Table(name="myTable02")
@Component("articleList")
public class ArticleList {

	@Id @Column(name="id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@Column(name="rate")
	private float rate;
	
	@Column(name="foodtype")
	private String foodtype;
	
	@Column(name="url")
	private String url;
	
	@Column(name="genre")
	private String genre;
	
	@Column(name="city")
	private String city;
	
	@Column(name="name")
	private String name;
	
	@Column(name="mimeType")
	String  mimeType;
	
	// 圖片
	@JsonIgnore
	@Column(name="blogPhoto")
	Blob blogPhoto;
	
	// 不要將下面這個作成資料庫欄位
	@Transient
	String pictureString;
	
	// 拿來取前端input file
	@Transient
	MultipartFile blogImage;
	
	
	public ArticleList(float rate, String foodtype, String url, String genre, String city, String name) {
		super();
		this.rate = rate;
		this.foodtype = foodtype;
		this.url = url;
		this.genre = genre;
		this.city = city;
		this.name = name;
	}

	public ArticleList() {
		
	}
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public float getRate() {
		return rate;
	}

	public void setRate(float rate) {
		this.rate = rate;
	}

	public String getFoodtype() {
		return foodtype;
	}

	public void setFoodtype(String foodtype) {
		this.foodtype = foodtype;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getGenre() {
		return genre;
	}

	public void setGenre(String genre) {
		this.genre = genre;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getMimeType() {
		return mimeType;
	}

	public void setMimeType(String mimeType) {
		this.mimeType = mimeType;
	}

	public Blob getBlogPhoto() {
		return blogPhoto;
	}

	public void setBlogPhoto(Blob blogPhoto) {
		this.blogPhoto = blogPhoto;
	}

	public String getPictureString() {
		return SystemUtils.blobToDataProtocol(mimeType, blogPhoto);
	}

	public void setPictureString(String pictureString) {
		this.pictureString = pictureString;
	}

	public MultipartFile getBlogImage() {
		return blogImage;
	}

	public void setBlogImage(MultipartFile blogImage) {
		this.blogImage = blogImage;
	}
	
	
}
