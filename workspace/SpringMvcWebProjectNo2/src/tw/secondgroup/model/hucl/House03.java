package tw.secondgroup.model.hucl;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Entity
@Table(name = "house")
@Component("house03")
public class House03 {
	@Id @Column(name = "HOUSEID")
	private int houseid;
	
	public House03() {
		super();
	}

	public House03(int houseid, String housename) {
		this.houseid = houseid;
		this.housename = housename;
	}

	@Column(name = "HOUSENAME")
	private String housename;

	public int getHouseid() {
		return houseid;
	}

	public void setHouseid(int houseid) {
		this.houseid = houseid;
	}

	public String getHousename() {
		return housename;
	}

	public void setHousename(String housename) {
		this.housename = housename;
	}

}
