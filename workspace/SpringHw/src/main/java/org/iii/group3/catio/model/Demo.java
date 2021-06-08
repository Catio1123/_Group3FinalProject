package org.iii.group3.catio.model;

import java.io.Serializable;
import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.DynamicUpdate;

import com.fasterxml.jackson.annotation.JsonFormat;

@Entity
@DynamicUpdate
@Table(name = "demo")
public class Demo implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 8191583259431290904L;

	@Id
	@Column(name = "id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	
	@Column(name = "col1")
	private String col1;
	
	@Column(name = "col2")
	private String col2;
	
	@Column(name = "date")
	@JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
	private Date date;

	public Integer getId() {
		return id;
	}

	public String getCol1() {
		return col1;
	}

	public String getCol2() {
		return col2;
	}

	public Date getDate() {
		return date;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public void setCol1(String col1) {
		this.col1 = col1;
	}

	public void setCol2(String col2) {
		this.col2 = col2;
	}

	public void setDate(Date date) {
		this.date = date;
	}
	
	
}
