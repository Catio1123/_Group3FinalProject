package com.infotran.springboot.model;

import java.io.CharArrayWriter;
import java.io.Reader;
import java.sql.Clob;
import java.sql.Date;
import java.sql.Timestamp;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonFormat;

@Entity
@Table(name = "RestaurantType_Spring")
public class RestaurantType {
	
	@OneToMany(mappedBy = "type")
	Set<Place> place = new HashSet<>();
	
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	Integer typeId;
	String typeName;
//	@JsonIgnore -> 註解之後下面的getComment要改(轉成字串)
	Clob comment;

//	@JsonFormat(pattern = "yyyy-MM-dd")
//	一定要加上下面這行，不然日期用json格式送回去時會少一天
	@JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
	Date createDate; // yyyy-MM-dd

	//下面這個一定要加上GMT+8
	@JsonFormat(pattern = "yyyy-MM-dd_HH:mm:ss", timezone = "GMT+8")
	Timestamp registerDate; // yyyy-MM-dd HH:mm:ss

	public RestaurantType() {
	}

	public RestaurantType(Integer typeId, String typeName, Clob comment, Date createDate, Timestamp registerDate) {
		super();
		this.typeId = typeId;
		this.typeName = typeName;
		this.comment = comment;
		this.createDate = createDate;
		this.registerDate = registerDate;
	}

	public RestaurantType(Integer typeId, String typeName, Clob comment, Date createDate) {
		super();
		this.typeId = typeId;
		this.typeName = typeName;
		this.comment = comment;
		this.createDate = createDate;
		this.registerDate = new Timestamp(System.currentTimeMillis());
	}

	public Integer getTypeId() {
		return typeId;
	}

	public void setTypeId(Integer typeId) {
		this.typeId = typeId;
	}

	public String getTypeName() {
		return typeName;
	}

	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}

	// 要把這些東西轉成字串傳回去
	public String getComment() {
		String result = "";
		try {
			Reader reader = comment.getCharacterStream();
			CharArrayWriter caw = new CharArrayWriter();
			char[] c = new char[8192];
			int len = 0;
			while ((len = reader.read(c)) != -1) {
				caw.write(c, 0, len);
			}
			result = new String(caw.toCharArray());

			System.out.println("result=" + result + "length()=" + comment.length());
		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}

	public void setComment(Clob comment) {
		this.comment = comment;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public Timestamp getRegisterDate() {
		return registerDate;
	}

	public void setRegisterDate(Timestamp registerDate) {
		this.registerDate = registerDate;
	}

}
