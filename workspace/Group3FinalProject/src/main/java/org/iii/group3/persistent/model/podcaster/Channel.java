package org.iii.group3.persistent.model.podcaster;

import java.sql.Timestamp;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.NotEmpty;

import org.iii.group3.persistent.model.ad.ClickTime;
import org.iii.group3.persistent.model.member.Member;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name = "channel")
public class Channel {

	// Field
	// ================================================================================================
	@Id 
	@Column(name = "id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@Column(name = "member_act", insertable = false, updatable = false)
	private String memeberAct;
	
	
	@Column(name = "channel_category_id", insertable = false, updatable = false)
	private Integer categoryid;
	@Column(name = "title", nullable = false)
	private String title;
	
	@Column(name = "description")
	private String description;
	
	@Column(name = "pubdate")
	private Timestamp pubdate;
	
	@Column(name = "image")
	private String image;
	
	
	@Column(name = "block")
	private boolean block = false;
	
	@Column(name = "enabled")
	private boolean enabled = true;
	
	@OneToMany(mappedBy = "channel", cascade = CascadeType.REMOVE)
	private Set<ClickTime>  clickTimes;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "member_act")
	private Member member;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "channel_category_id")
	private ChannelCategory category;
	
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "channel", cascade = CascadeType.ALL)
	private Set<Episode> episodes = new HashSet<Episode>();

	public Long getId() {
		return id;
	}

	public String getMemeberAct() {
		return memeberAct;
	}

	public Integer getCategoryid() {
		return categoryid;
	}

	public String getTitle() {
		return title;
	}

	public String getDescription() {
		return description;
	}

	public Timestamp getPubdate() {
		return pubdate;
	}

	public String getImage() {
		return image;
	}

	public boolean isBlock() {
		return block;
	}

	public boolean isEnabled() {
		return enabled;
	}

	public Set<ClickTime> getClickTimes() {
		return clickTimes;
	}

	public Member getMember() {
		return member;
	}

	public ChannelCategory getCategory() {
		return category;
	}

	public Set<Episode> getEpisodes() {
		return episodes;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public void setMemeberAct(String memeberAct) {
		this.memeberAct = memeberAct;
	}

	public void setCategoryid(Integer categoryid) {
		this.categoryid = categoryid;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public void setPubdate(Timestamp pubdate) {
		this.pubdate = pubdate;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public void setBlock(boolean block) {
		this.block = block;
	}

	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}

	public void setClickTimes(Set<ClickTime> clickTimes) {
		this.clickTimes = clickTimes;
	}

	public void setMember(Member member) {
		this.member = member;
	}

	public void setCategory(ChannelCategory category) {
		this.category = category;
	}

	public void setEpisodes(Set<Episode> episodes) {
		this.episodes = episodes;
	}

	
	
}
