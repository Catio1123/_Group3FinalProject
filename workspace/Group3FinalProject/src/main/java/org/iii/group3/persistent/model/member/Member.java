package org.iii.group3.persistent.model.member;

import java.io.Serializable;
import java.sql.Blob;

import javax.mail.Multipart;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.iii.group3.utils.member.memberUtils;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name = "memberdb")
public class Member implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Id
	@Column(name = "id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@Column(name = "acctno", unique = true)
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
	
	@Column(name = "role")
	private String  role;
	
    String mimeType;
	
	@JsonIgnore
	private Blob picture;
	
	@Transient  
	String  pictureString; 
	
	@Transient
	MultipartFile memberImage;
	
	
	public Member() {
	}
	
	public Member(String acctno, String pw) {
		this.acctno = acctno;
		this.pw = pw;
	}
	

	public MultipartFile getMemberImage() {
		return memberImage;
	}

	public void setMemberImage(MultipartFile memberImage) {
		this.memberImage = memberImage;
	}

	public String getPictureString() {
	 return memberUtils.blobToDataProtocol(mimeType, picture);
	}

	public void setPictureString(String pictureString) {
		this.pictureString = pictureString;
	}

	public String getMimeType() {
		return mimeType;
	}

	public void setMimeType(String mimeType) {
		this.mimeType = mimeType;
	}

	public int getId() {
		return id;
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
	
	
	public Blob getPicture() {
		return picture;
	}

	
	public void setId(int id) {
		this.id = id;
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

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}
	
	public void setPicture(Blob picture) {
		this.picture = picture;
	}

	public Member(
			int id,
			String acctno,
			String pw,
			String name,
			String nickname,
			String email,
			String celno,
			String dob,
			String gender,
			String role,
			String mimeType,
			Blob picture,
			String pictureString,
			MultipartFile memberImage
			){
		super();
		this.id = id;
		this.acctno = acctno;
		this.pw = pw;
		this.name = name;
		this.nickname = nickname;
		this.email = email;
		this.celno = celno;
		this.dob = dob;
		this.gender = gender;
		this.role = role;
		this.mimeType = mimeType;
		this.picture = picture;
		this.pictureString = pictureString;
		this.memberImage = memberImage;
	}
	

}
