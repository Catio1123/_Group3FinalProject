package org.iii.group3.catio.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "test")
public class Test {

	@Id
	@Column(name = "id")
	private int id;
	@Column(name = "col1")
	private String col1;
	@Column(name = "col2")
	private String col2;
	
	
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getCol1() {
		return col1;
	}
	public void setCol1(String col1) {
		this.col1 = col1;
	}
	public String getCol2() {
		return col2;
	}
	public void setCol2(String col2) {
		this.col2 = col2;
	}
	
	
}
