package com.group2.springboot.restaurant.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Entity
@Table(name = "restaurant")
@Component("restaurant")
public class Restaurant {
	@Id @Column(name = "RID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int rid;
	
	public Restaurant() {
		super();
	}

	public Restaurant(int rid, String rname, String rdes, String rtel, String radr, String rsort) {
		this.rid = rid;
		this.rname = rname;
		this.rdes = rdes;
		this.rtel = rtel;
		this.radr = radr;
		this.rsort = rsort;
	}

	@Column(name = "RNAME")
	private String rname;
	
	@Column(name = "RDES")
	private String rdes;
	
	@Column(name = "RTEL")
	private String rtel;
	
	@Column(name = "RADR")
	private String radr;
	
	@Column(name = "RSORT")
	private String rsort;

	public int getRid() {
		return rid;
	}

	public void setRid(int rid) {
		this.rid = rid;
	}

	public String getRname() {
		return rname;
	}

	public void setRname(String rname) {
		this.rname = rname;
	}
	public String getRdes() {
		return rdes;
	}

	public void setRdes(String rdes) {
		this.rdes = rdes;
	}

	public String getRtel() {
		return rtel;
	}

	public void setRtel(String rtel) {
		this.rtel = rtel;
	}

	public String getRadr() {
		return radr;
	}

	public void setRadr(String radr) {
		this.radr = radr;
	}

	public String getRsort() {
		return rsort;
	}

	public void setRsort(String rsort) {
		this.rsort = rsort;
	}


}
