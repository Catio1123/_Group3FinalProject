package com.group2.springboot.orderlist.model;

import java.sql.Timestamp;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonFormat;

@Entity
@Table
public class OrderList {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	Integer id;
	String name;
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm:ss", timezone="Asia/Taipei")
	Date time;
	String resturant;
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm:ss", timezone="Asia/Taipei")
    Date date;
    Integer people;
    
    public OrderList() {
	}
    
	public OrderList(Integer id, String name, Date time, String resturant, Date date, Integer people) {
		super();
		this.id = id;
		this.name = name;
		this.time = time;
		this.resturant = resturant;
		this.date = date;
		this.people = people;
	}
	
	public OrderList(Integer id) {
		this.id = id;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Date getTime() {
		return time;
	}

	public void setTime(Timestamp time) {
		this.time = time;
	}

	public String getResturant() {
		return resturant;
	}

	public void setResturant(String resturant) {
		this.resturant = resturant;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Timestamp date) {
		this.date = date;
	}

	public Integer getPeople() {
		return people;
	}

	public void setPeople(Integer people) {
		this.people = people;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("OrderList [id=");
		builder.append(id);
		builder.append(", name=");
		builder.append(name);
		builder.append(", time=");
		builder.append(time);
		builder.append(", resturant=");
		builder.append(resturant);
		builder.append(", date=");
		builder.append(date);
		builder.append(", people=");
		builder.append(people);
		builder.append("]");
		return builder.toString();
	}
	
	
	
}
