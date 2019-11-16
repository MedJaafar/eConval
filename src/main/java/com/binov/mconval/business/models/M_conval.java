package com.binov.mconval.business.models;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collection;

import javax.persistence.*;

@Entity 
public class M_conval implements Serializable{

@Id
@GeneratedValue(strategy = GenerationType.IDENTITY)
private int idMc ; 

@Column(unique=true)
private String nomMc ; 

private String adrMc ; 

private long telMc ; 

private long faxMc ; 

private String emailMc ; 

@OneToMany(cascade = CascadeType.ALL , fetch=FetchType.LAZY)
@JoinColumn(name = "idMc" )
private Collection<Operateur_mc> Op_mc =  new ArrayList<Operateur_mc>();

@OneToMany(cascade = CascadeType.ALL , fetch=FetchType.LAZY)
@JoinColumn(name = "idMc" )
private Collection<Reservation> reservation ;




public M_conval(int idMc, String nomMc, String adrMc, long telMc, long faxMc,
		String emailMc) {
	super();
	this.idMc = idMc;
	this.nomMc = nomMc;
	this.adrMc = adrMc;
	this.telMc = telMc;
	this.faxMc = faxMc;
	this.emailMc = emailMc;
	
}

public M_conval() {
	super();
}

public int getIdMc() {
	return idMc;
}

public void setIdMc(int idMc) {
	this.idMc = idMc;
}

public String getNomMc() {
	return nomMc;
}

public void setNomMc(String nomMc) {
	this.nomMc = nomMc;
}

public String getAdrMc() {
	return adrMc;
}

public void setAdrMc(String adrMc) {
	this.adrMc = adrMc;
}

public long getTelMc() {
	return telMc;
}

public void setTelMc(long telMc) {
	this.telMc = telMc;
}

public long getFaxMc() {
	return faxMc;
}

public void setFaxMc(long faxMc) {
	this.faxMc = faxMc;
}

public String getEmailMc() {
	return emailMc;
}

public void setEmailMc(String emailMc) {
	this.emailMc = emailMc;
}

public Collection<Operateur_mc> getOp_mc() {
	return Op_mc;
}

public void setOp_mc(Collection<Operateur_mc> op_mc) {
	Op_mc = op_mc;
}


}
