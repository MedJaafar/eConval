package com.binov.mconval.business.models;

import java.io.Serializable;
import java.util.Collection;
import java.util.Date;
import javax.persistence.* ; 

@Entity
@Table(uniqueConstraints={@UniqueConstraint(columnNames={"username"})})
@Inheritance(strategy=InheritanceType.SINGLE_TABLE)
@DiscriminatorColumn(name="Type_Op",discriminatorType = DiscriminatorType.STRING , length = 2)
public class Operateur implements Serializable {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int idOperateur  ; 
	
	@Column(unique=true)
	private String username ; 
	
	
	private String password ;
	
	private String nomOp ; 
	
	private  String prenomOp ; 

	
	private String emailOp  ;
	
	
	private Long telOp ;
	
	@Temporal(TemporalType.TIMESTAMP)
	private Date lastconnection ;
	
	
 

	public Date getLastconnection() {
		return lastconnection;
	}

	public void setLastconnection(Date lastconnection) {
		this.lastconnection = lastconnection;
	}

	private boolean activated  ;
	
	@OneToOne(fetch=FetchType.LAZY, mappedBy="operateur")
	private Role role ; 
	
	@OneToMany(cascade = CascadeType.ALL , fetch=FetchType.LAZY)
	@JoinColumn(name="idpatient")
	private Collection<Patient> patients;
	
	
	
	public Collection<Patient> getPatients() {
		return patients;
	}

	public void setPatients(Collection<Patient> patients) {
		this.patients = patients;
	}

	public int getIdOperateur() {
		return idOperateur;
	}

	public void setIdOperateur(int idOperateur) {
		this.idOperateur = idOperateur;
	}

	public String getNomOp() {
		return nomOp;
	}

	public void setNomOp(String nomOp) {
		this.nomOp = nomOp;
	}

	public String getPrenomOp() {
		return prenomOp;
	}

	public void setPrenomOp(String prenomOp) {
		this.prenomOp = prenomOp;
	}

	public String getEmailOp() {
		return emailOp;
	}

	public void setEmailOp(String emailOp) {
		this.emailOp = emailOp;
	}

	public Long getTelOp() {
		return telOp;
	}

	public void setTelOp(Long telOp) {
		this.telOp = telOp;
	}


	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	

	public boolean isActivated() {
		return activated;
	}

	public void setActivated(boolean activated) {
		this.activated = activated;
	}

	public Role getRole() {
		return role;
	}

	public void setRole(Role role) {
		this.role = role;
	}

	public Operateur() {
		super();
	}
}
