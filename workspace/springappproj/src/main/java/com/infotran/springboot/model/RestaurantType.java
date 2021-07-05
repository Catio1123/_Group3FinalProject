package com.infotran.springboot.model;

import java.sql.Clob;
import java.sql.Date;
import java.sql.Timestamp;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonFormat;

@Entity
@Table(name = "RestaurantType_Spring")
public class RestaurantType {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)	
	private Integer typeId;
	private String typeName;
	
	private Clob comment;
	
	
//	@JsonFormat(pattern = "yyyy-MM-dd")
	private Date date; //yyyy-MM-dd
	
//	@JsonFormat(pattern = "yyyy-mm-dd HH:mm:ss", timezone = "GMT+8")
	private Timestamp registerDate; // yyyy-MM-dd HH:mm:ss

	public RestaurantType() {
	}

	public RestaurantType(Integer typeId, String typeName, Clob comment, Date date, Timestamp registerDate) {
		this.typeId = typeId;
		this.typeName = typeName;
		this.comment = comment;
		this.date = date;
		this.registerDate = registerDate;
	}

	public Integer getTypeId() {
		return typeId;
	}

	public void setTypeId(Integer typeId) {
		this.typeId = typeId;
	}

	public String getTypeName() {
		return typeName;
	}

	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}

	public Clob getComment() {
		return comment;
	}

	public void setComment(Clob comment) {
		this.comment = comment;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public Timestamp getRegisterDate() {
		return registerDate;
	}

	public void setRegisterDate(Timestamp registerDate) {
		this.registerDate = registerDate;
	}
	
	
	
	
}
