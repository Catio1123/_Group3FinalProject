package com.group2.springboot.shopreview.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

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
	
	
}
