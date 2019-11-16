package com.binov.mconval.business.models;

import java.io.Serializable;





import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;

@Entity
public class Role implements Serializable {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long idRole;

	private String roleName;

	@OneToOne(fetch=FetchType.LAZY)
	@JoinColumn(name = "idOperateur")
	private Operateur operateur ; 
	
	

	public Operateur getOperateur() {
		return operateur;
	}




	public void setOperateur(Operateur operateur) {
		this.operateur = operateur;
	}




	public Role() {
		super();
	}




	public Role(String roleName) {
		this.roleName = roleName;
	}



	
	public Long getIdRole() {
		return idRole;
	}

	public void setIdRole(Long idRole) {
		this.idRole = idRole;
	}

	public String getRoleName() {
		return roleName;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

	
	
	

}
