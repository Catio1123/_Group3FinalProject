package org.iii.group3.persistence.model;

import java.sql.Timestamp;
import java.util.Calendar;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "email_verification")
public class EmailVerification {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private Long id;
	
	@Column(name = "token")
	private String token;
	
	@Column(name = "expiration")
	private Timestamp expiryDate;
	
	@Column(name = "email")
	private String email;
	
	
	public EmailVerification(String email, String token, int expiryTimeInMinutes) {
		this.email = email;
		this.token = token;
		this.expiryDate = calculateExpiryDate(expiryTimeInMinutes);
	}
	
	private Timestamp calculateExpiryDate(int expiryTimeInMinutes) {
		
		Calendar cal = Calendar.getInstance();
		cal.setTime(new Timestamp(cal.getTime().getTime()));
		cal.add(Calendar.MINUTE, expiryTimeInMinutes);
		
		return new Timestamp(cal.getTime().getTime());
	}

	public void extendExpirtyDate(int expiryTimeInMinutres) {
		this.expiryDate = calculateExpiryDate(expiryTimeInMinutres);
	}

	public Long getId() {
		return id;
	}


	public String getToken() {
		return token;
	}


	public Timestamp getExpiryDate() {
		return expiryDate;
	}

	

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public void setId(Long id) {
		this.id = id;
	}


	public void setToken(String token) {
		this.token = token;
	}


	public void setExpiryDate(Timestamp expiryDate) {
		this.expiryDate = expiryDate;
	}
	
	
	
}
