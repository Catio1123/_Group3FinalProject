package org.iii.group3.persistent.model.podcaster;

import java.sql.Timestamp;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GeneratorType;

@Entity
@Table(name = "userfile")
public class PodcasterFile {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	private String filename;
	private String publisher;
	private String purpose;
	private Timestamp pubdate;
	private String mime;
	private String ext;
	private String url;
	
	public PodcasterFile() {
	}
	
	
	public PodcasterFile( String publisher, String purpose, Timestamp pubdate, String mime, String ext) {
		this.publisher = publisher;
		this.purpose = purpose;
		this.pubdate = pubdate;
		this.mime = mime;
		this.ext = ext;
	
	}


	public Long getId() {
		return id;
	}


	public String getFilename() {
		return filename;
	}


	public String getPublisher() {
		return publisher;
	}


	public String getPurpose() {
		return purpose;
	}


	public Timestamp getPubdate() {
		return pubdate;
	}


	public String getMime() {
		return mime;
	}


	public String getExt() {
		return ext;
	}


	public String getUrl() {
		return url;
	}


	public void setId(Long id) {
		this.id = id;
	}


	public void setFilename(String filename) {
		this.filename = filename;
	}


	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}


	public void setPurpose(String purpose) {
		this.purpose = purpose;
	}


	public void setPubdate(Timestamp pubdate) {
		this.pubdate = pubdate;
	}


	public void setMime(String mime) {
		this.mime = mime;
	}


	public void setExt(String ext) {
		this.ext = ext;
	}


	public void setUrl(String url) {
		this.url = url;
	}


	
	
}
