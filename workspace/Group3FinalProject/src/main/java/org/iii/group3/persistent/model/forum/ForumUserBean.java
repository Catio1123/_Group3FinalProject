package org.iii.group3.persistent.model.forum;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "ForumUser")
public class ForumUserBean {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "UID")
	private Double UID;
	
	private String ACCOUNT;
	private String PSW;
	private String EMAIL;
	private String CEL;
	private String GENDER;
	private Integer ForumAuth;
	
	public ForumUserBean() {
	
	}

	public Double getUID() {
		return UID;
	}

	public void setUID(Double uID) {
		this.UID = uID;
	}

	public String getACCOUNT() {
		return ACCOUNT;
	}

	public void setACCOUNT(String aCCOUNT) {
		this.ACCOUNT = aCCOUNT;
	}

	public String getPSW() {
		return PSW;
	}

	public void setPSW(String pSW) {
		this.PSW = pSW;
	}

	public String getEMAIL() {
		return EMAIL;
	}

	public void setEMAIL(String eMAIL) {
		this.EMAIL = eMAIL;
	}

	public String getCEL() {
		return CEL;
	}

	public void setCEL(String cEL) {
		this.CEL = cEL;
	}

	public String getGENDER() {
		return GENDER;
	}

	public void setGENDER(String gENDER) {
		this.GENDER = gENDER;
	}

	public Integer getForumAuth() {
		return ForumAuth;
	}

	public void setForumAuth(Integer forumAuth) {
		this.ForumAuth = forumAuth;
	}
	
}
