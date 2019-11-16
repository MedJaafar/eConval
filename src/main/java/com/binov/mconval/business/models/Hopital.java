package com.binov.mconval.business.models;

import java.io.Serializable;
import java.util.Collection;

import javax.persistence.*;

@Entity
public class Hopital implements Serializable{

@Id
@GeneratedValue(strategy = GenerationType.IDENTITY)	
private int idHopital ; 

@Column(unique=true)
private String nomHopital ; 

private String adresseHopital ; 

private long telHopital ; 

private long faxHopital ; 


@OneToMany (cascade = CascadeType.ALL , fetch=FetchType.LAZY)
@JoinColumn(name = "idHopital" )
private Collection<Operateur_hopital> Op_Ho ;

@OneToMany(cascade = CascadeType.ALL , fetch=FetchType.LAZY)
@JoinColumn(name="idHopital")
private Collection<Patient> patients;


@OneToMany(cascade = CascadeType.ALL , fetch=FetchType.LAZY)
@JoinColumn(name="idHopital")
private Collection<Reservation> reservation;

public Hopital() {
	super();
}


public Hopital(int idHopital, String nomHopital, String adresseHoital,
		long telHopital, long faxHopital) {
	super();
	this.idHopital = idHopital;
	this.nomHopital = nomHopital;
	this.adresseHopital = adresseHoital;
	this.telHopital = telHopital;
	this.faxHopital = faxHopital;
}


public int getIdHopital() {
	return idHopital;
}


public void setIdHopital(int idHopital) {
	this.idHopital = idHopital;
}


public String getNomHopital() {
	return nomHopital;
}


public void setNomHopital(String nomHopital) {
	this.nomHopital = nomHopital;
}


public String getAdresseHoital() {
	return adresseHopital;
}


public void setAdresseHoital(String adresseHoital) {
	this.adresseHopital = adresseHoital;
}


public long getTelHopital() {
	return telHopital;
}


public void setTelHopital(long telHopital) {
	this.telHopital = telHopital;
}


public long getFaxHopital() {
	return faxHopital;
}


public void setFaxHopital(long faxHopital) {
	this.faxHopital = faxHopital;
}


public Collection<Operateur_hopital> getOp_Ho() {
	return Op_Ho;
}


public void setOp_Ho(Collection<Operateur_hopital> op_Ho) {
	Op_Ho = op_Ho;
}


}
