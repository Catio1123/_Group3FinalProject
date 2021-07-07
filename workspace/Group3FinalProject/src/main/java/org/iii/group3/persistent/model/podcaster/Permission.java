package org.iii.group3.persistent.model.podcaster;

import java.io.Serializable;
import java.util.Collection;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotEmpty;

@Entity
@Table(name = "permission")
public class Permission implements Serializable {

	private static final long serialVersionUID = -6896710674249145579L;

	// Field
	// ================================================================================================
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private Long id;

	@Column(name = "name", nullable = false)
	@NotEmpty(message = "{valid.error.notempty.name}")
	private String name;

	@Column(name = "resource_type")
	private String resourceType;

	@Column(name = "resource_id")
	private Long rsourceId;

	@Column(name = "privilege")
	private String privilege;

	@Column(name = "enabled")
	private boolean enabled = true;

	@ManyToMany(mappedBy = "permissions", fetch = FetchType.EAGER)
	private Set<Role> roles = new HashSet<Role>();

	// Getter
	// ================================================================================================

	public Long getId() {
		return id;
	}

	public String getName() {
		return name;
	}

	public String getResourceType() {
		return resourceType;
	}


	public Long getRsourceId() {
		return rsourceId;
	}

	public String getPrivilege() {
		return privilege;
	}

	public boolean isEnabled() {
		return enabled;
	}

	public Set<Role> getRoles() {
		return roles;
	}

	// Setter
	// ================================================================================================

	public void setId(Long id) {
		this.id = id;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setResourceType(String resourceType) {
		this.resourceType = resourceType;
	}

	public void setRsourceId(Long rsourceId) {
		this.rsourceId = rsourceId;
	}

	public void setPrivilege(String privilege) {
		this.privilege = privilege;
	}

	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}

	public void setRoles(Set<Role> roles) {
		this.roles = roles;
	}

}
