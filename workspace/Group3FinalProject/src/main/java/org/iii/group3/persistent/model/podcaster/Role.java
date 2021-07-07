package org.iii.group3.persistent.model.podcaster;

import java.io.Serializable;
import java.util.Collection;
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
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotEmpty;



@Entity
@Table(name =  "role")
public class Role implements Serializable{



	private static final long serialVersionUID = 8943302822120438091L;
	
	// Field
	// ================================================================================================
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private Long id;
	
	@Column(name = "name", nullable = false)
	@NotEmpty(message = "{valid.error.notempty.name}")
	private String name;
	
	@Column(name = "description")
	private String description;
	
	@Column(name = "enabled")
	private boolean enabled = true;
	
	@ManyToMany(mappedBy = "roles", fetch = FetchType.EAGER)
	private Set<User> users = new HashSet<User>();
	
	/*
	 * 在特定資源上的角色，實現可以客製化角色，
	 */
	//private String resourceType;
	//private String resourceId;
	
	@ManyToMany(cascade = CascadeType.REFRESH, fetch = FetchType.EAGER)
	@JoinTable(
			name = "roles_permissions", 
			joinColumns = @JoinColumn(name = "role_id", referencedColumnName = "id"), 
			inverseJoinColumns = @JoinColumn(name = "permission_id", referencedColumnName = "id"))
	private Set<Permission> permissions = new HashSet<Permission>();

	// Getter
	// ================================================================================================
	public Long getId() {
		return id;
	}

	public String getName() {
		return name;
	}

	public String getDescription() {
		return description;
	}

	public boolean isEnabled() {
		return enabled;
	}

	public Set<User> getUsers() {
		return users;
	}


	public Set<Permission> getPermissions() {
		return permissions;
	}

	// Setter
	// ================================================================================================
	public void setId(Long id) {
		this.id = id;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}

	public void setUsers(Set<User> users) {
		this.users = users;
	}

	public void setPermissions(Set<Permission> permissions) {
		this.permissions = permissions;
	}


	
}
