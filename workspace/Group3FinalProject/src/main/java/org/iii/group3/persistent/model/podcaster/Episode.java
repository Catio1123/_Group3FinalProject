package org.iii.group3.persistent.model.podcaster;

import java.sql.Date;
import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.NotEmpty;

import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name = "episode")
public class Episode {


	// Field
	// ================================================================================================
	
	@Id
	@Column(name = "id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@Column(name = "channel_id", insertable = false, updatable = false)
	private Long channelId;
	
	@Column(name = "title")
	private String title;
	
	@Column(name = "ep_file")
	private String epFile;
	
	@Column(name = "description")
	private String description;
	
	@Column(name = "pubdate")
	private Timestamp pubdate;
	
	@Column(name = "free")
	private boolean free;
	
	@Column(name = "block")
	private boolean block = false;
	
	@Column(name = "enabled")
	private boolean enabled = true;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "channel_id")
	private Channel channel;

	public Long getId() {
		return id;
	}

	public Long getChannelId() {
		return channelId;
	}

	public String getTitle() {
		return title;
	}

	public String getEpFile() {
		return epFile;
	}

	public String getDescription() {
		return description;
	}

	public Timestamp getPubdate() {
		return pubdate;
	}

	public boolean isFree() {
		return free;
	}

	public boolean isBlock() {
		return block;
	}

	public boolean isEnabled() {
		return enabled;
	}

	public Channel getChannel() {
		return channel;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public void setChannelId(Long channelId) {
		this.channelId = channelId;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public void setEpFile(String epFile) {
		this.epFile = epFile;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public void setPubdate(Timestamp pubdate) {
		this.pubdate = pubdate;
	}

	public void setFree(boolean free) {
		this.free = free;
	}

	public void setBlock(boolean block) {
		this.block = block;
	}

	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}

	public void setChannel(Channel channel) {
		this.channel = channel;
	}

	
	
	
	
}
