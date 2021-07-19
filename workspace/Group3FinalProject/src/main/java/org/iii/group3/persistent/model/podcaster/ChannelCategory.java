package org.iii.group3.persistent.model.podcaster;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;


@Entity
@Table(name = "channel_category")
public class ChannelCategory {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private Integer id;
	
	@Column(name = "en_name")
	private String enName;
	
	@Column(name = "zh_tw_name")
	private String cnName;
	
	@OneToMany(mappedBy = "category")
	private Set<Channel> channels = new HashSet<Channel>();

	public Integer getId() {
		return id;
	}

	public String getEnName() {
		return enName;
	}

	public String getCnName() {
		return cnName;
	}

	public Set<Channel> getChannels() {
		return channels;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public void setEnName(String enName) {
		this.enName = enName;
	}

	public void setCnName(String cnName) {
		this.cnName = cnName;
	}

	public void setChannels(Set<Channel> channels) {
		this.channels = channels;
	}
	
	
}
