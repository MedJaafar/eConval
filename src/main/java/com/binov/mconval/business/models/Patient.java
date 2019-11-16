package com.binov.mconval.business.models;
import javax.persistence.CascadeType;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.format.annotation.NumberFormat;
import java.io.Serializable;
import java.util.Collection;

@Entity 
public class Patient implements Serializable  {  
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)	
	private int idpatient;
	
	
	
@NumberFormat()
@Max(120)
@Min(0)
private int age;


@NotEmpty
private String pathologie;


@NotEmpty
private String commentaire;


private Boolean publier  =false ; 


public int getIdpatient() {
	return idpatient;
}

public void setIdpatient(int idpatient) {
	this.idpatient = idpatient;
}

public int getAge() {
	return age;
}


public void setAge(int age) {
	this.age = age;
}

public String getPathologie() {
	return pathologie;
}
public void setNomPathologie(String pathologie) {
	this.pathologie = pathologie;
}

public String getCommentaire() {
	return commentaire;
}
public void setCommentaire(String commentaire) {
	this.commentaire = commentaire;
}


public Boolean getPublier() {
	return publier;
}

public void setPublier(Boolean publier) {
	this.publier = publier;
}

public Patient() {
	super();
}

@OneToMany(cascade = CascadeType.ALL , fetch=FetchType.LAZY)
@JoinColumn(name="idpatient")
private Collection<Reservation> reservations;

@ManyToOne
@JoinColumn(name="idOperateur")
private Operateur_hopital Operateur ;

@ManyToOne
@JoinColumn(name="idHopital")
private Hopital Hopital ;


public Hopital getHopital() {
	return Hopital;
}

public void setHopital(Hopital hopital) {
	Hopital = hopital;
}

public Operateur_hopital getOperateur() {
	return Operateur;
}

public void setOperateur(Operateur_hopital operateur) {
	Operateur = operateur;
}

public void setPathologie(String pathologie) {
	this.pathologie = pathologie;
}

}
