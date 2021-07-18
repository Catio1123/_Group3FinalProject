package org.iii.group3.persistent.model.forum;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "ForumMessageArea")
public class ForumMessageBean {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "MID")
	private int MID;
	
	@Column(name = "FID")
	private int FID;
	
	@Column(name = "UID")
	private String UID;
	
	@Column(name = "UNAME")
	private String UNAME;
	
	@Column(name = "COMMENT")
	private String COMMENT;
	
	@Column(name = "Date",insertable = false)
	private String Date;
	
	
	public ForumMessageBean() {

	}
	
	
	public ForumMessageBean(int fID, String uID, String uNAME, String cOMMENT) {
		FID = fID;
		UID = uID;
		UNAME = uNAME;
		COMMENT = cOMMENT;
	}


	public int getMID() {
		return MID;
	}
	public void setMID(int mID) {
		MID = mID;
	}
	public int getFID() {
		return FID;
	}
	public void setFID(int fID) {
		FID = fID;
	}
	public String getUID() {
		return UID;
	}
	public void setUID(String uID) {
		UID = uID;
	}
	public String getUNAME() {
		return UNAME;
	}
	public void setUNAME(String uNAME) {
		UNAME = uNAME;
	}
	public String getCOMMENT() {
		return COMMENT;
	}
	public void setCOMMENT(String cOMMENT) {
		COMMENT = cOMMENT;
	}
	public String getDate() {
		return Date;
	}
	public void setDate(String date) {
		Date = date;
	}
	
	
	
}
