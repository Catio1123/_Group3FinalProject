package org.iii.group3.transferdata.dto;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;


public class UserRegisgterDto {

	@NotEmpty(message = "{valid.error.notempty}")	
	private String account;
	
	@NotEmpty(message = "{valid.error.notempty}")
	private String password;
	
	@NotEmpty(message = "{valid.error.notempty}")
	private String passwordcheck;
	
	@NotEmpty(message = "{valid.error.notempty}")
	private String firstname;
	
	@NotEmpty(message = "{valid.error.notempty}")
	private String lastname;
	
	@Email(message = "{valid.error.email}")
	@NotEmpty(message = "{valid.error.notempty}")
	private String email;
	
	@NotEmpty(message = "{valid.error.notempty}")
	private String emailToken;
	

	public String getAccount() {
		return account;
	}

	public String getPassword() {
		return password;
	}

	public String getPasswordcheck() {
		return passwordcheck;
	}

	public String getFirstname() {
		return firstname;
	}

	public String getLastname() {
		return lastname;
	}

	public String getEmail() {
		return email;
	}

	
	public String getEmailToken() {
		return emailToken;
	}

	public void setEmailToken(String emailToken) {
		this.emailToken = emailToken;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public void setPasswordcheck(String passwordcheck) {
		this.passwordcheck = passwordcheck;
	}

	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}

	public void setLastname(String lastname) {
		this.lastname = lastname;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	
	
}
