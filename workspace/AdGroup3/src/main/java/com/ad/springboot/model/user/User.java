package com.ad.springboot.model.user;

import javax.persistence.Column;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.ad.springboot.model.ad.Ad;
import com.ad.springboot.model.clicktime.ClickTime;

import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name = "Ad_User")
public class User {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="user_id")
	private Integer id;

	@Column(name = "username")
	private String userName;

	@Column(name = "password")
	private String password;

	
	@OneToMany(mappedBy = "user")
    private Set<ClickTime> clickTimes = new HashSet<>();
	
	
	public Set<ClickTime> getClickTimes() {
		return clickTimes;
	}


	public void setClickTimes(Set<ClickTime> clickTimes) {
		this.clickTimes = clickTimes;
	}





	public Integer getId() {
		return id;
	}


	public void setId(Integer id) {
		this.id = id;
	}


	public String getUserName() {
		return userName;
	}


	public void setUserName(String userName) {
		this.userName = userName;
	}


	public String getPassword() {
		return password;
	}


	public void setPassword(String password) {
		this.password = password;
	}




	public User() {
		super();
	}

	

}
