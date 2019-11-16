package com.binov.mconval.business.models;
import java.io.Serializable;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.List;

import javax.persistence.*;
@Entity
public class Reservation implements Serializable{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)	
	private int idReservation  ;


@Temporal(TemporalType.DATE)
private Date dateaccueil;
@Temporal(TemporalType.DATE)
private Date datecreation;
@Temporal(TemporalType.DATE)
private Date datefin;
@Temporal(TemporalType.DATE)
private Date dateconfirm;

private Boolean statut ;
	
@ManyToOne
@JoinColumn(name="idHopital")
private Hopital Hopital ;

@ManyToOne
@JoinColumn(name="idMc")
private M_conval M_conval ;

@ManyToOne
@JoinColumn(name="idChambre")
private Chambre chambre ;



@OneToMany(cascade = CascadeType.ALL , fetch=FetchType.EAGER )
@JoinColumn(name="IdReservation")
private Collection<Proposition> proposition;


public Collection<Proposition> getProposition() {
	return proposition;
}

public List<Proposition>getListPropositions(){
	List<Proposition> list = new ArrayList<Proposition>(this.getProposition());
	
	return list ; 
}

public void setProposition(Collection<Proposition> proposition) {
	this.proposition = proposition;
}


public Boolean getStatut() {
	return statut;
}


public void setStatut(Boolean statut) {
	this.statut = statut;
}


public Hopital getHopital() {
	return Hopital;
}


public void setHopital(Hopital hopital) {
	Hopital = hopital;
}


public M_conval getM_conval() {
	return M_conval;
}


public void setM_conval(M_conval m_conval) {
	M_conval = m_conval;
}


public Chambre getChambre() {
	return chambre;
}


public void setChambre(Chambre chambre) {
	this.chambre = chambre;
}


public Operateur_hopital getOperateurHo() {
	return OperateurHo;
}


public void setOperateurHo(Operateur_hopital operateurHo) {
	OperateurHo = operateurHo;
}


public void setPatient(Patient patient) {
	this.patient = patient;
}


public Date getDateaccueil() {
	return dateaccueil;
}

public void setDateaccueil(Date dateaccueil) {
	this.dateaccueil = dateaccueil;
}


public Date getDatecreation() {
	return datecreation;
}
public void setDatecreation(Date datecreation) {
	this.datecreation = datecreation;
}
public Date getDatefin() {
	return datefin;
}
public void setDatefin(Date datefin) {
	this.datefin = datefin;
}
public Date getDateconfirm() {
	return dateconfirm;
}
public void setDateconfirm(Date dateconfirm) {
	this.dateconfirm = dateconfirm;
}

public Reservation() {
	super();
}
@ManyToOne
@JoinColumn(name="idOperateurHopital")
private Operateur_hopital OperateurHo ;

@ManyToOne
@JoinColumn(name="idOperateurMc")
private Operateur_mc OperateurMc ;

@OneToOne(fetch=FetchType.EAGER, mappedBy="reservation")
private NotificationHo notification ; 


public Operateur_mc getOperateurMc() {
	return OperateurMc;
}


public void setOperateurMc(Operateur_mc operateurMc) {
	OperateurMc = operateurMc;
}


public int getIdReservation() {
	return idReservation;
}
public void setIdReservation(int idReservation) {
	this.idReservation = idReservation;
}
public Operateur_hopital getOperateur() {
	return OperateurHo;
}
public void setOperateur(Operateur_hopital operateur) {
	OperateurHo = operateur;
}
public Patient getPatient() {
	return patient;
}
@ManyToOne
@JoinColumn(name="idpatient")
private Patient patient ; 

}
