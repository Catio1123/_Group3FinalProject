package com.ad.springboot.model.ad;

import java.io.Serializable;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

import org.hibernate.annotations.DynamicUpdate;

import com.ad.springboot.model.user.User;

@Entity
@Table(name = "Ad")
public class Ad implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name = "id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

	@Column(name = "company")
	private String company;
	@Column(name = "text")
	private String text;

	@Column(name="company_id")
	private String companyId;
	
	@Column(name = "url")
	private String companyUrl;
	
@ManyToMany(mappedBy = "ads")
	private Set<User> users;

	public Set<User> getUsers() {
	return users;
}

public void setUsers(Set<User> users) {
	this.users = users;
}

	public String getCompanyUrl() {
		return companyUrl;
	}

	public void setCompanyUrl(String companyUrl) {
		this.companyUrl = companyUrl;
	}

	public String getCompanyId() {
		return companyId;
	}

	public void setCompanyId(String companyId) {
		this.companyId = companyId;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}



	public String getCompany() {
		return company;
	}

	public void setCompany(String company) {
		this.company = company;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public Ad(Integer id, String company, String text) {
		super();
		this.id = id;
		this.company = company;
		this.text = text;
	}

	public Ad() {
		super();
	}

	@Override
	public String toString() {
		return "Ad [id=" + id + ", supplier=" + company + ", text=" + text + "]";
	}

}
