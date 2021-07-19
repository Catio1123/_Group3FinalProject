package org.iii.group3.persistent.model.ad;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.iii.group3.persistent.model.podcaster.Channel;


@Entity
@Table(name="Ad_Clicktime")
@IdClass(ClickTimeKey.class)
public class ClickTime {

	@Column(name = "channel_id", insertable = false, updatable =false)
	private Long channelId;
	
	@Column(name = "ad_id", insertable = false, updatable =false)
	private Integer adId;
	
	
	@Column(name = "record_id", insertable = false, updatable = false)
	private Integer recordId;
	
	@Column(name="click_time")
	private Long clickTimeCount = 0L;
	
	@Id
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name="channel_id", referencedColumnName = "id",  insertable = true, updatable = false)
	private Channel channel;
	
	@Id
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name="ad_id", referencedColumnName = "ad_id", insertable = true, updatable = false)
	private Ad ad;

	@OneToOne
	@JoinColumn(name = "record_id")
	private Record record;

	
	
	public Long getChannelId() {
		return channelId;
	}

	public Integer getAdId() {
		return adId;
	}

	public Integer getRecordId() {
		return recordId;
	}

	public Channel getChannel() {
		return channel;
	}

	public Ad getAd() {
		return ad;
	}

	public Long getClickTimeCount() {
		return clickTimeCount;
	}

	public Record getRecord() {
		return record;
	}

	public void setChannelId(Long channelId) {
		this.channelId = channelId;
	}

	public void setAdId(Integer adId) {
		this.adId = adId;
	}

	public void setRecordId(Integer recordId) {
		this.recordId = recordId;
	}

	public void setChannel(Channel channel) {
		this.channel = channel;
	}

	public void setAd(Ad ad) {
		this.ad = ad;
	}

	public void setClickTimeCount(Long clickTimeCount) {
		this.clickTimeCount = clickTimeCount;
	}

	public void setRecord(Record record) {
		this.record = record;
	}


}
