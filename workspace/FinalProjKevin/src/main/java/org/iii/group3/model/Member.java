package org.iii.group3.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "memberdb")
public class Member implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Id
	@Column(name = "acctno")
	private String  acctno;
	
	@Column(name = "pw")
	private String  pw;
	
	@Column(name = "name")
	private String  name;
	
	@Column(name = "nickname")
	private String  nickname;
	
	@Column(name = "email")
	private String  email;
	
	@Column(name = "celno")
	private String  celno;
	
	@Column(name = "dob")
	private String  dob;
	
	@Column(name = "gender")
	private String  gender;
	
	public Member() {
	}
	
	public Member(String acctno, String pw) {
		this.acctno = acctno;
		this.pw = pw;
	}

	public String getAcctno() {
		return acctno;
	}
	
	public String getPw() {
		return pw;
	}
	
	public String getName() {
		return name;
	}
	
	public String getNickname() {
		return nickname;
	}
	
	public String getEmail() {
		return email;
	}
	
	public String getCelno() {
		return celno;
	}
	
	public String getDob() {
		return dob;
	}
	
	public String getGender() {
		return gender;
	}
	
	public void setAcctno(String acctno) {
		this.acctno = acctno;
	}
	
	public void setPw(String pw) {
		this.pw = pw;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	
	public void setEmail(String email) {
		this.email = email;
	}
	
	public void setCelno(String celno) {
		this.celno = celno;
	}
	
	public void setDob(String dob) {
		this.dob = dob;
	}
	
	public void setGender(String gender) {
		this.gender = gender;
	}
	

}
