package tw.secondgroup.model.johnny;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name = "Coupon")
//@Component("house03")
public class Coupon {
	@Id
	@Column(name = "id")
	private Integer id;

	@Column(name = "company")
	private String company;

	@Column(name = "name")
	private String name;

	@Column(name = "description")
	private String description;
	
	public Integer getId() {
		return id;
	}
	
	public void setId(Integer id) {
		this.id = id;
	}

	public String getCompany() {
		return company;
	}

	public void setCompany(String company) {
		this.company = company;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Coupon(Integer id, String company, String name, String description) {
		super();
		this.id = id;
		this.company = company;
		this.name = name;
		this.description = description;
	}

	

	public Coupon() {

	}

}
