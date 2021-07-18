package org.iii.group3.persistent.model.ad;

import java.io.Serializable;

import javax.persistence.Column;

public class ClickTimeKey implements Serializable {

	private Long channel;
	
	private Integer ad;

	public ClickTimeKey() {
	}

	public ClickTimeKey(Long channel, Integer ad) {
		this.channel = channel;
		this.ad = ad;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((ad == null) ? 0 : ad.hashCode());
		result = prime * result + ((channel == null) ? 0 : channel.hashCode());
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
		if (ad == null) {
			if (other.ad != null)
				return false;
		} else if (!ad.equals(other.ad))
			return false;
		if (channel == null) {
			if (other.channel != null)
				return false;
		} else if (!channel.equals(other.channel))
			return false;
		return true;
	}

	public Long getChannel() {
		return channel;
	}

	public Integer getAd() {
		return ad;
	}

	public void setChannel(Long channel) {
		this.channel = channel;
	}

	public void setAd(Integer ad) {
		this.ad = ad;
	}

	
}
