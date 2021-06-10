package org.iii.group3.wayne.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.DynamicUpdate;


@Entity
@DynamicUpdate
@Table(name = "ad")
public class Ad implements Serializable {
	
	
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name = "number")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer number;

	@Column(name = "supplier")
	private String supplier;
	@Column(name = "text")
	private String text;
	@Column(name = "author")
	private String author;

	
	public Ad() {
		
	}
	
	public Ad(Integer number, String supplier, String text, String author) {
		super();
		this.number = number;
		this.supplier = supplier;
		this.text = text;
		this.author = author;
	}

	public Integer getNumber() {
		return number;
	}

	public void setNumber(Integer number) {
		this.number = number;
	}

	public String getSupplier() {
		return supplier;
	}

	public void setSupplier(String supplier) {
		this.supplier = supplier;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

}
