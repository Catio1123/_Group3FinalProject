package com.group2.springboot.dishtable.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;


import org.springframework.stereotype.Component;

@Entity
@Table
public class Dish {
	
	
	//@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Id
	String dishname;
		
	String protein;	
	
	String starch;	
	
	String lipid;	
	
	String carbohydrates;	
	
	String fiber;	
	
	String vitaminc;	
	
	String calcium;	
	
	String salt;
	
public  Dish() {
		
	}
	
	public Dish(String dishname, String protein, String starch, String lipid, String carbohydrates, String fiber, String vitaminc, String calcium, String salt) {
		super();
		this.dishname = dishname;
		this.protein = protein;
		this.starch = starch;
		this.lipid = lipid;
		this.carbohydrates = carbohydrates;
		this.fiber = fiber;
		this.vitaminc = vitaminc;
		this.calcium = calcium;
		this.salt = salt;
	}
	
	public Dish(String dishname) {

		this.dishname = dishname;
		
	}

	public String getDishname() {
		return dishname;
	}

	public void setDishname(String dishname) {
		this.dishname = dishname;
	}

	public String getProtein() {
		return protein;
	}

	public void setProtein(String protein) {
		this.protein = protein;
	}

	public String getStarch() {
		return starch;
	}

	public void setStarch(String starch) {
		this.starch = starch;
	}

	public String getLipid() {
		return lipid;
	}

	public void setLipid(String lipid) {
		this.lipid = lipid;
	}

	public String getCarbohydrates() {
		return carbohydrates;
	}

	public void setCarbohydrates(String carbohydrates) {
		this.carbohydrates = carbohydrates;
	}

	public String getFiber() {
		return fiber;
	}

	public void setFiber(String fiber) {
		this.fiber = fiber;
	}

	public String getVitaminc() {
		return vitaminc;
	}

	public void setVitaminc(String vitaminc) {
		this.vitaminc = vitaminc;
	}

	public String getCalcium() {
		return calcium;
	}

	public void setCalcium(String calcium) {
		this.calcium = calcium;
	}

	public String getSalt() {
		return salt;
	}

	public void setSalt(String salt) {
		this.salt = salt;
	}
	
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Dish [dishname=");
		builder.append(dishname);
		builder.append(", protein=");
		builder.append(protein);
		builder.append(", starch=");
		builder.append(starch);
		builder.append(", lipid=");
		builder.append(lipid);
		builder.append(", carbohydrates=");
		builder.append(carbohydrates);
		builder.append(", fiber=");
		builder.append(fiber);
		builder.append(", vitaminc=");
		builder.append(vitaminc);
		builder.append(", calcium=");
		builder.append(calcium);
		builder.append(", salt=");
		builder.append(salt);
		builder.append("]");
		return builder.toString();
	}
}

