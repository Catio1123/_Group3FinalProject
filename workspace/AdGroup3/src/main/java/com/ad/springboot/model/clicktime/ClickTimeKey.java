package com.ad.springboot.model.clicktime;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Embeddable;

@Embeddable
public class ClickTimeKey implements Serializable {

	@Column(name = "user_id")
	private int userId;
	@Column(name = "ad_id")
	private int adId;

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public int getAdId() {
		return adId;
	}

	public void setAdId(int adId) {
		this.adId = adId;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + adId;
		result = prime * result + userId;
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		ClickTimeKey other = (ClickTimeKey) obj;
		if (adId != other.adId)
			return false;
		if (userId != other.userId)
			return false;
		return true;
	}

	public ClickTimeKey(int userId, int adId) {
		super();
		this.userId = userId;
		this.adId = adId;
	}

	public ClickTimeKey() {
		super();
	}

}
