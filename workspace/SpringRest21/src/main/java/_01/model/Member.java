package _01.model;

import java.sql.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonFormat;

@Entity
@Table(name="MemberRest")
public class Member {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	Integer pk;
	String id;
	String name;
	Double balance;
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd", timezone="Asia/Taipei")
//	@JsonFormat(pattern="yyyy-MM-dd")
	Date birthday;
	String extra;
	
	public Member() {
	}

	public Member(Integer pk, String id, String name, Double balance, Date birthday, String extra) {
		super();
		this.pk = pk;
		this.id = id;
		this.name = name;
		this.balance = balance;
		this.birthday = birthday;
		this.extra = extra;
	}

	public Member(Integer ipk) {
		this.pk = ipk;
	}

	public Integer getPk() {
		return pk;
	}

	public void setPk(Integer pk) {
		this.pk = pk;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Double getBalance() {
		return balance;
	}

	public void setBalance(Double balance) {
		this.balance = balance;
	}

	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	public String getExtra() {
		return extra;
	}

	public void setExtra(String extra) {
		this.extra = extra;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Member [pk=");
		builder.append(pk);
		builder.append(", id=");
		builder.append(id);
		builder.append(", name=");
		builder.append(name);
		builder.append(", balance=");
		builder.append(balance);
		builder.append(", birthday=");
		builder.append(birthday);
		builder.append(", extra=");
		builder.append(extra);
		builder.append("]");
		return builder.toString();
	}
}
